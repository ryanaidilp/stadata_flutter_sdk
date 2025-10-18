import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/features/press_releases/presentation/cubit/press_releases_results_cubit.dart';
import 'package:stadata_example/features/press_releases/presentation/widgets/press_releases_results_list_widget.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class PressReleasesResultsPage extends StatelessWidget {
  const PressReleasesResultsPage({
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
    return BlocProvider(
      create:
          (context) =>
              getIt<PressReleasesResultsCubit>()..initialize(
                domain: domain,
                language: language,
                keyword: keyword,
                month: month,
                year: year,
              ),
      child: BlocBuilder<PressReleasesResultsCubit, BaseState>(
        builder: (context, state) {
          final cubit = context.read<PressReleasesResultsCubit>();

          if (state is InitialState && cubit.canLoadData) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              cubit.loadData();
            });
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text('Press Releases Results'),
              actions: [
                const AliceButton(),
                IconButton(
                  onPressed: cubit.refresh,
                  icon: const Icon(Icons.refresh),
                  tooltip: 'Refresh',
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
                    _buildSearchParametersPanel(context, cubit),

                    const Gap(AppSizes.spaceLg),

                    _buildMainContent(context, state, cubit),

                    if (state is LoadedState<List<PressRelease>> &&
                        state.data.isNotEmpty) ...[
                      const Gap(AppSizes.spaceLg),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.spaceMd,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 100,
                              child: TextButton.icon(
                                onPressed:
                                    cubit.currentPage > 1
                                        ? () => cubit.loadPreviousPage()
                                        : null,
                                icon: const Icon(Icons.chevron_left, size: 16),
                                label: const Text(
                                  'Previous',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                            Text(
                              'Page ${cubit.currentPage}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            SizedBox(
                              width: 100,
                              child: TextButton.icon(
                                onPressed: () => cubit.loadNextPage(),
                                icon: const Icon(Icons.chevron_right, size: 16),
                                label: const Text(
                                  'Next',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
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
    PressReleasesResultsCubit cubit,
  ) {
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
                'Search Parameters',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const Gap(AppSizes.spaceSm),
          _buildParameterRow(context, 'Domain', cubit.domain ?? '-'),
          _buildParameterRow(
            context,
            'Language',
            cubit.currentLanguage == DataLanguage.id ? 'Indonesian' : 'English',
          ),
          if (cubit.keyword != null)
            _buildParameterRow(context, 'Keyword', cubit.keyword!),
          if (cubit.month != null)
            _buildParameterRow(
              context,
              'Month',
              _getMonthName(context, cubit.month!),
            ),
          if (cubit.year != null)
            _buildParameterRow(context, 'Year', cubit.year.toString()),
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
    PressReleasesResultsCubit cubit,
  ) {
    return switch (state) {
      LoadingState() => const LoadingWidget(),
      LoadedState<List<PressRelease>>() =>
        state.data.isNotEmpty
            ? PressReleasesResultsListWidget(
              pressReleases: state.data,
              domain: cubit.domain ?? '7200',
              language: cubit.currentLanguage,
            )
            : EmptyStateWidget(
              message: 'No press releases found',
              icon: Icons.article_outlined,
            ),
      ErrorState() => ErrorStateWidget(
        message: state.message,
        onRetry: () => cubit.refresh(),
      ),
      _ => EmptyStateWidget(
        message: 'Press search button to load data',
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
