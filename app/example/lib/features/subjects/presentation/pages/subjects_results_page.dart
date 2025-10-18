import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/features/subjects/presentation/cubit/subjects_results_cubit.dart';
import 'package:stadata_example/features/subjects/presentation/widgets/subjects_results_list_widget.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class SubjectsResultsPage extends StatelessWidget {
  const SubjectsResultsPage({
    required this.domain,
    required this.language,
    this.subjectCategoryID,
    super.key,
  });

  final String domain;
  final DataLanguage language;
  final int? subjectCategoryID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              getIt<SubjectsResultsCubit>()..initialize(
                domain: domain,
                language: language,
                subjectCategoryID: subjectCategoryID,
              ),
      child: BlocBuilder<SubjectsResultsCubit, BaseState>(
        builder: (context, state) {
          final cubit = context.read<SubjectsResultsCubit>();

          if (state is InitialState && cubit.canLoadData) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              cubit.loadData();
            });
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text('Subjects Results'),
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

                    if (state is LoadedState<List<Subject>> &&
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
    SubjectsResultsCubit cubit,
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
          if (cubit.subjectCategoryID != null)
            _buildParameterRow(
              context,
              'Subject Category ID',
              cubit.subjectCategoryID.toString(),
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
            width: 150,
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
    SubjectsResultsCubit cubit,
  ) {
    return switch (state) {
      LoadingState() => const LoadingWidget(),
      LoadedState<List<Subject>>() =>
        state.data.isNotEmpty
            ? SubjectsResultsListWidget(
              subjects: state.data,
              domain: cubit.domain ?? '7200',
              language: cubit.currentLanguage,
            )
            : const EmptyStateWidget(
              message: 'No subjects found',
              icon: Icons.subject_outlined,
            ),
      ErrorState() => ErrorStateWidget(
        message: state.message,
        onRetry: () => cubit.refresh(),
      ),
      _ => const EmptyStateWidget(
        message: 'Press search button to load data',
        icon: Icons.subject_outlined,
      ),
    };
  }
}
