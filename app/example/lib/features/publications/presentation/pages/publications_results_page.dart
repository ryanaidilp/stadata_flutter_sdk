import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/publications/presentation/cubit/publications_results_cubit.dart';
import 'package:stadata_example/features/publications/presentation/widgets/publications_results_list_widget.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class PublicationsResultsPage extends StatelessWidget {
  const PublicationsResultsPage({
    required this.domain,
    required this.language,
    this.keyword,
    this.month,
    this.year,
    super.key,
  });

  final String domain;
  final DataLanguage language;
  final String? keyword;
  final int? month;
  final int? year;

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return BlocProvider(
      create:
          (context) =>
              getIt<PublicationsResultsCubit>()..initialize(
                domain: domain,
                language: language,
                keyword: keyword,
                month: month,
                year: year,
              ),
      child: BlocBuilder<PublicationsResultsCubit, BaseState>(
        builder: (context, state) {
          final cubit = context.read<PublicationsResultsCubit>();

          // Auto-load data when widget is first built and in initial state
          if (state is InitialState && cubit.canLoadData) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              cubit.loadData();
            });
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(t.publications.results.title),
              actions: [
                // Alice inspector button (debug only)
                const AliceButton(),
                IconButton(
                  onPressed: cubit.refresh,
                  icon: const Icon(Icons.refresh),
                  tooltip: t.common.refresh,
                ),
              ],
            ),
            body: RefreshIndicator(
              onRefresh: cubit.refresh,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(AppSizes.spaceMd),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search parameters summary
                    _buildSearchParametersPanel(context, cubit),

                    const Gap(AppSizes.spaceLg),

                    // Main content based on state
                    _buildMainContent(context, state, cubit),

                    // Pagination controls - only show when we have data
                    if (state is LoadedState<List<Publication>> &&
                        state.data.isNotEmpty &&
                        cubit.totalPages > 1) ...[
                      const Gap(AppSizes.spaceLg),
                      NumberPaginator(
                        key: ValueKey(cubit.currentPage),
                        numberPages: cubit.totalPages,
                        initialPage: cubit.currentPage - 1,
                        onPageChange: (index) {
                          cubit.loadData(page: index + 1);
                        },
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchParametersPanel(
    BuildContext context,
    PublicationsResultsCubit cubit,
  ) {
    final t = LocaleSettings.instance.currentTranslations;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSizes.spaceMd),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.search,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
              const Gap(AppSizes.spaceXs),
              Text(
                t.publications.results.searchParameters,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const Gap(AppSizes.spaceSm),
          _buildParameterRow(
            context,
            t.publications.parameters.domain,
            cubit.domain ?? '-',
          ),
          _buildParameterRow(
            context,
            t.publications.parameters.language,
            cubit.currentLanguage == DataLanguage.id
                ? t.instructions.languageLabels.indonesian
                : t.instructions.languageLabels.english,
          ),
          if (cubit.keyword != null)
            _buildParameterRow(
              context,
              t.publications.parameters.keyword,
              cubit.keyword!,
            ),
          if (cubit.month != null)
            _buildParameterRow(
              context,
              t.publications.parameters.month,
              _getMonthName(context, cubit.month!),
            ),
          if (cubit.year != null)
            _buildParameterRow(
              context,
              t.publications.parameters.year,
              cubit.year.toString(),
            ),
        ],
      ),
    );
  }

  Widget _buildParameterRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.spaceXs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            child: Text(value, style: Theme.of(context).textTheme.bodySmall),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent(
    BuildContext context,
    BaseState state,
    PublicationsResultsCubit cubit,
  ) {
    final t = LocaleSettings.instance.currentTranslations;

    return switch (state) {
      LoadingState() => const LoadingWidget(),
      LoadedState<List<Publication>>() =>
        state.data.isNotEmpty
            ? PublicationsResultsListWidget(
              publications: state.data,
              domain: cubit.domain ?? '7200',
              language: cubit.currentLanguage,
            )
            : EmptyStateWidget(
              message: t.publications.results.empty,
              icon: Icons.article_outlined,
            ),
      ErrorState() => ErrorStateWidget(
        message: state.message,
        onRetry: () => cubit.refresh(),
      ),
      _ => EmptyStateWidget(
        message: t.publications.results.initial,
        icon: Icons.article_outlined,
      ),
    };
  }

  String _getMonthName(BuildContext context, int month) {
    final monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return monthNames[month - 1];
  }
}
