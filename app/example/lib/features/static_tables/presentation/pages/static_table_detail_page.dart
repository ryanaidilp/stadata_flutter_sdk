import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/features/static_tables/presentation/cubit/static_table_detail_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class StaticTableDetailPage extends StatelessWidget {
  const StaticTableDetailPage({
    required this.id,
    required this.domain,
    required this.language,
    super.key,
  });

  final int id;
  final String domain;
  final DataLanguage language;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              getIt<StaticTableDetailCubit>()
                ..loadDetail(id: id, domain: domain, lang: language),
      child: const StaticTableDetailView(),
    );
  }
}

class StaticTableDetailView extends StatelessWidget {
  const StaticTableDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StaticTableDetailCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<StaticTableDetailCubit>();

        return Scaffold(
          appBar: AppBar(
            title: const Text('Static Table Detail'),
            actions: [
              // Download Excel button in app bar
              if (state is LoadedState<StaticTable>)
                IconButton(
                  icon: const Icon(Icons.download),
                  tooltip: 'Download Excel',
                  onPressed: () => _launchExcelUrl(context, state.data.excel),
                ),
              // Alice inspector button
              const AliceButton(),
              // Refresh button
              IconButton(
                icon: const Icon(Icons.refresh),
                tooltip: 'Refresh',
                onPressed: () {
                  if (state is LoadedState<StaticTable>) {
                    final table = state.data;
                    cubit.refresh(
                      id: table.id,
                      domain:
                          context.router.current.queryParams
                              .get('domain')
                              .toString(),
                      lang:
                          context.router.current.queryParams
                                      .get('language')
                                      .toString() ==
                                  'en'
                              ? DataLanguage.en
                              : DataLanguage.id,
                    );
                  }
                },
              ),
            ],
          ),
          body: _buildBody(context, state, cubit),
        );
      },
    );
  }

  Widget _buildBody(
    BuildContext context,
    BaseState state,
    StaticTableDetailCubit cubit,
  ) {
    return switch (state) {
      LoadingState() => const LoadingWidget(),
      LoadedState<StaticTable>() => _buildContent(context, state.data),
      ErrorState() => ErrorStateWidget(
        message: state.message,
        onRetry: () {
          // Cannot retry without the parameters, show error message
        },
      ),
      _ => const Center(child: Text('No data available')),
    };
  }

  Widget _buildContent(BuildContext context, StaticTable table) {
    return RefreshIndicator(
      onRefresh: () async {
        // Refresh logic would go here
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Table info header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSizes.spaceMd),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerLowest,
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.outline.withValues(alpha: 0.3),
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    table.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(AppSizes.spaceSm),
                  if (table.subject != null) ...[
                    Row(
                      children: [
                        Icon(
                          Icons.topic,
                          size: 16,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        const Gap(AppSizes.spaceXs / 2),
                        Expanded(
                          child: Text(
                            'Subject: ${table.subject}',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(
                              color:
                                  Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(AppSizes.spaceXs),
                  ],
                  Row(
                    children: [
                      Icon(
                        Icons.update,
                        size: 16,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      const Gap(AppSizes.spaceXs / 2),
                      Text(
                        'Updated: ${_formatDate(table.updatedAt)}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const Gap(AppSizes.spaceSm),
                      Icon(
                        Icons.insert_drive_file,
                        size: 16,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      const Gap(AppSizes.spaceXs / 2),
                      Text(
                        'Size: ${table.size}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // HTML table content
            if (table.table != null && table.table!.isNotEmpty)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(AppSizes.spaceMd),
                child: HtmlWidget(
                  table.table!,
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  customStylesBuilder: (element) {
                    // Add custom styles for better table rendering
                    if (element.localName == 'table') {
                      return {
                        'border-collapse': 'collapse',
                        'border': '1px solid #ddd',
                      };
                    }
                    if (element.localName == 'th' ||
                        element.localName == 'td') {
                      return {'border': '1px solid #ddd', 'padding': '8px'};
                    }
                    if (element.localName == 'th') {
                      return {
                        'background-color': '#f2f2f2',
                        'font-weight': 'bold',
                        'text-align': 'left',
                      };
                    }
                    return null;
                  },
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.all(AppSizes.spaceMd),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.table_chart_outlined,
                        size: 64,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      const Gap(AppSizes.spaceMd),
                      Text(
                        'No table data available',
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const Gap(AppSizes.spaceSm),
                      ElevatedButton.icon(
                        onPressed: () => _launchExcelUrl(context, table.excel),
                        icon: const Icon(Icons.download),
                        label: const Text('Download Excel'),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  Future<void> _launchExcelUrl(BuildContext context, String excelUrl) async {
    final url = Uri.parse(excelUrl);

    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Cannot open URL'),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
      }
    } on Exception catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Download failed'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }
}
