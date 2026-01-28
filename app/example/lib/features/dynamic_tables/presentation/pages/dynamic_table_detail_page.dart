import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/navigation/app_router.dart';
import 'package:stadata_example/features/dynamic_tables/presentation/cubit/dynamic_table_detail_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class DynamicTableDetailPage extends StatelessWidget {
  const DynamicTableDetailPage({
    required this.variableID,
    required this.domain,
    required this.language,
    this.period,
    super.key,
  });

  final int variableID;
  final String domain;
  final DataLanguage language;
  final String? period;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = getIt<DynamicTableDetailCubit>();
        unawaited(
          cubit.loadDetail(
            variableID: variableID,
            domain: domain,
            lang: language,
            period: period,
          ),
        );
        return cubit;
      },
      child: const DynamicTableDetailView(),
    );
  }
}

class DynamicTableDetailView extends StatefulWidget {
  const DynamicTableDetailView({super.key});

  @override
  State<DynamicTableDetailView> createState() => _DynamicTableDetailViewState();
}

class _DynamicTableDetailViewState extends State<DynamicTableDetailView> {
  double _webViewHeight = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DynamicTableDetailCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<DynamicTableDetailCubit>();

        return Scaffold(
          appBar: AppBar(
            title: const Text('Dynamic Table Detail'),
            actions: [
              // Fullscreen button
              if (state is LoadedState<DynamicTable>)
                IconButton(
                  icon: const Icon(Icons.fullscreen),
                  tooltip: 'Fullscreen',
                  onPressed:
                      () => _openFullscreen(
                        context,
                        state.data,
                      ),
                ),
              // Alice inspector button
              const AliceButton(),
              // Refresh button
              IconButton(
                icon: const Icon(Icons.refresh),
                tooltip: 'Refresh',
                onPressed: () {
                  if (state is LoadedState<DynamicTable>) {
                    unawaited(
                      cubit.refresh(
                        variableID: state.data.variableID,
                        domain: state.data.domain,
                        lang:
                            context.router.current.queryParams
                                        .get('language')
                                        .toString() ==
                                    'en'
                                ? DataLanguage.en
                                : DataLanguage.id,
                        period:
                            context.router.current.queryParams
                                .get('period')
                                ?.toString(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
          body: _buildBody(context, state, cubit),
          // FloatingActionButton to open query builder (all_stats pattern)
          floatingActionButton:
              state is LoadedState<DynamicTable>
                  ? FloatingActionButton.extended(
                    onPressed: () {
                      unawaited(
                        context.router.push(
                          DynamicTablesParametersRoute(
                            domain: state.data.domain,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.tune),
                    label: const Text('Dynamic Table'),
                    tooltip: 'Customize table parameters',
                  )
                  : null,
        );
      },
    );
  }

  Widget _buildBody(
    BuildContext context,
    BaseState state,
    DynamicTableDetailCubit cubit,
  ) {
    return switch (state) {
      LoadingState() => const LoadingWidget(),
      LoadedState<DynamicTable>() => _buildContent(context, state.data),
      ErrorState() => ErrorStateWidget(
        message: state.message,
        onRetry: () {
          // Cannot retry without the parameters
        },
      ),
      _ => const Center(child: Text('No data available')),
    };
  }

  Widget _buildContent(BuildContext context, DynamicTable table) {
    // Generate HTML table using DynamicTableHtmlGenerator
    final htmlTable = DynamicTableHtmlGenerator.generate(table);
    final wrappedHtml = DynamicTableHtmlGenerator.wrapWithStyling(htmlTable);

    return Column(
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
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Gap(AppSizes.spaceSm),
              if (table.subjectName.isNotEmpty) ...[
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
                        'Subject: ${table.subjectName}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
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
                    Icons.tag,
                    size: 16,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const Gap(AppSizes.spaceXs / 2),
                  Text(
                    'Variable ID: ${table.variableID}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const Gap(AppSizes.spaceSm),
                  Icon(
                    Icons.location_on,
                    size: 16,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const Gap(AppSizes.spaceXs / 2),
                  Text(
                    'Domain: ${table.domain}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              if (table.unit.isNotEmpty) ...[
                const Gap(AppSizes.spaceXs),
                Row(
                  children: [
                    Icon(
                      Icons.straighten,
                      size: 16,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const Gap(AppSizes.spaceXs / 2),
                    Text(
                      'Unit: ${table.unit}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),

        // HTML table content rendered in WebView
        if (table.dataContent.isNotEmpty)
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSizes.spaceMd),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: _webViewHeight == 0 ? 50 : _webViewHeight,
                child: InAppWebView(
                  initialData: InAppWebViewInitialData(
                    data: wrappedHtml,
                  ),
                  initialSettings: InAppWebViewSettings(
                    supportZoom: false,
                    disableVerticalScroll: true,
                  ),
                  onConsoleMessage: (controller, consoleMessage) {
                    final height = double.tryParse(consoleMessage.message);
                    if (height != null && height > 0) {
                      setState(() {
                        _webViewHeight = height;
                      });
                    }
                  },
                ),
              ),
            ),
          )
        else
          Expanded(
            child: Padding(
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
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }

  void _openFullscreen(BuildContext context, DynamicTable table) {
    unawaited(
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (context) => _FullscreenTableView(table: table),
        ),
      ),
    );
  }
}

class _FullscreenTableView extends StatefulWidget {
  const _FullscreenTableView({required this.table});

  final DynamicTable table;

  @override
  State<_FullscreenTableView> createState() => _FullscreenTableViewState();
}

class _FullscreenTableViewState extends State<_FullscreenTableView> {
  @override
  void initState() {
    super.initState();

    // Force landscape orientation for fullscreen
    unawaited(
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]),
    );
  }

  @override
  void dispose() {
    // Restore all orientations when leaving fullscreen
    unawaited(
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Generate HTML table
    final htmlTable = DynamicTableHtmlGenerator.generate(widget.table);
    final wrappedHtml = DynamicTableHtmlGenerator.wrapWithStyling(htmlTable);

    return Scaffold(
      body: Stack(
        children: [
          InAppWebView(
            initialData: InAppWebViewInitialData(
              data: wrappedHtml,
            ),
            initialSettings: InAppWebViewSettings(),
          ),
          // Floating close button in top-right corner
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Material(
                  color: Colors.black54,
                  shape: const CircleBorder(),
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    tooltip: 'Close',
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
