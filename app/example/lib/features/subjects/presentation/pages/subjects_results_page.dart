import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/features/subjects/presentation/cubit/subjects_results_cubit.dart';
import 'package:stadata_example/features/subjects/presentation/widgets/subjects_results_list_widget.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_example/shared/widgets/results_common_widgets.dart';
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
              unawaited(cubit.loadData());
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
                    _SubjectsParametersPanel(cubit: cubit),

                    const Gap(AppSizes.spaceLg),

                    _SubjectsMainContent(state: state, cubit: cubit),

                    if (state is LoadedState<List<Subject>> &&
                        state.data.isNotEmpty &&
                        cubit.totalPages > 1) ...[
                      const Gap(AppSizes.spaceLg),
                      NumberPaginator(
                        key: ValueKey(cubit.currentPage),
                        numberPages: cubit.totalPages,
                        initialPage: cubit.currentPage - 1,
                        onPageChange: (index) {
                          unawaited(cubit.loadData(page: index + 1));
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
}

class _SubjectsParametersPanel extends StatelessWidget {
  const _SubjectsParametersPanel({required this.cubit});

  final SubjectsResultsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ResultsParametersPanel(
      title: 'Search Parameters',
      headerBottomSpacing: AppSizes.spaceSm,
      chips: [
        ResultsParameterChip(
          icon: Icons.domain,
          text: 'Domain: ${cubit.domain ?? '-'}',
        ),
        ResultsParameterChip(
          icon: Icons.language,
          text:
              'Language: ${cubit.currentLanguage == DataLanguage.id ? 'Indonesian' : 'English'}',
        ),
        if (cubit.subjectCategoryID != null)
          ResultsParameterChip(
            icon: Icons.category,
            text: 'Subject Category ID: ${cubit.subjectCategoryID}',
          ),
      ],
    );
  }
}

class _SubjectsMainContent extends StatelessWidget {
  const _SubjectsMainContent({required this.state, required this.cubit});

  final BaseState state;
  final SubjectsResultsCubit cubit;

  @override
  Widget build(BuildContext context) {
    final currentState = state;

    return switch (currentState) {
      LoadingState() => const LoadingWidget(),
      LoadedState<List<Subject>>() =>
        currentState.data.isNotEmpty
            ? SubjectsResultsListWidget(
              subjects: currentState.data,
              domain: cubit.domain ?? '7200',
              language: cubit.currentLanguage,
            )
            : const EmptyStateWidget(
              message: 'No subjects found',
              icon: Icons.subject_outlined,
            ),
      ErrorState() => ErrorStateWidget(
        message: currentState.message,
        onRetry: cubit.refresh,
      ),
      _ => const EmptyStateWidget(
        message: 'Press search button to load data',
        icon: Icons.subject_outlined,
      ),
    };
  }
}
