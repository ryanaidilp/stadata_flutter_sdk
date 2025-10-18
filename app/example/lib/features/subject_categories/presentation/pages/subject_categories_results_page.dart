import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/features/subject_categories/presentation/cubit/subject_categories_results_cubit.dart';
import 'package:stadata_example/features/subject_categories/presentation/widgets/subject_categories_results_list_widget.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class SubjectCategoriesResultsPage extends StatelessWidget {
  const SubjectCategoriesResultsPage({
    required this.domain,
    required this.language,
    super.key,
  });

  final String domain;
  final DataLanguage language;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              getIt<SubjectCategoriesResultsCubit>()
                ..initialize(domain: domain, language: language),
      child: BlocBuilder<SubjectCategoriesResultsCubit, BaseState>(
        builder: (context, state) {
          final cubit = context.read<SubjectCategoriesResultsCubit>();

          if (state is InitialState && cubit.canLoadData) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              cubit.loadData();
            });
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text('Subject Categories Results'),
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

                    if (state is LoadedState<List<SubjectCategory>> &&
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
    SubjectCategoriesResultsCubit cubit,
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
          const Gap(AppSizes.spaceMd),

          Wrap(
            spacing: AppSizes.spaceSm,
            runSpacing: AppSizes.spaceXs,
            children: [
              Chip(
                avatar: const Icon(Icons.domain, size: 16),
                label: Text('Domain: ${cubit.domain}'),
                padding: EdgeInsets.zero,
              ),
              Chip(
                avatar: const Icon(Icons.language, size: 16),
                label: Text(
                  'Language: ${cubit.currentLanguage == DataLanguage.id ? 'ID' : 'EN'}',
                ),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent(
    BuildContext context,
    BaseState state,
    SubjectCategoriesResultsCubit cubit,
  ) {
    return switch (state) {
      InitialState() => const Center(child: Text('Initializing...')),
      LoadingState() => const LoadingWidget(),
      LoadedState<List<SubjectCategory>>() =>
        SubjectCategoriesResultsListWidget(
          subjectCategories: state.data,
          domain: cubit.domain!,
          language: cubit.currentLanguage,
        ),
      ErrorState() => ErrorStateWidget(
        message: state.message,
        onRetry: cubit.refresh,
      ),
      _ => const Center(child: Text('Unknown state')),
    };
  }
}
