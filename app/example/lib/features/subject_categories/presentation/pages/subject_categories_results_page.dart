import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/subject_categories/presentation/cubit/subject_categories_results_cubit.dart';
import 'package:stadata_example/features/subject_categories/presentation/widgets/subject_categories_results_list_widget.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_example/shared/widgets/results_common_widgets.dart';
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
    final t = Translations.of(context);

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
              unawaited(cubit.loadData());
            });
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(t.subjectCategories.results.title),
              actions: [
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
                    _SubjectCategoriesParametersPanel(cubit: cubit),

                    const Gap(AppSizes.spaceLg),

                    _SubjectCategoriesMainContent(state: state, cubit: cubit),

                    if (state is LoadedState<List<SubjectCategory>> &&
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

class _SubjectCategoriesParametersPanel extends StatelessWidget {
  const _SubjectCategoriesParametersPanel({required this.cubit});

  final SubjectCategoriesResultsCubit cubit;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return ResultsParametersPanel(
      title: t.subjectCategories.results.searchParameters,
      chips: [
        ResultsParameterChip(
          icon: Icons.domain,
          text:
              '${t.subjectCategories.parameters.domain.replaceAll(' *', '')}: ${cubit.domain}',
        ),
        ResultsParameterChip(
          icon: Icons.language,
          text:
              '${t.common.language}: ${cubit.currentLanguage == DataLanguage.id ? 'ID' : 'EN'}',
        ),
      ],
    );
  }
}

class _SubjectCategoriesMainContent extends StatelessWidget {
  const _SubjectCategoriesMainContent({
    required this.state,
    required this.cubit,
  });

  final BaseState state;
  final SubjectCategoriesResultsCubit cubit;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final currentState = state;

    return switch (currentState) {
      InitialState() => Center(
        child: Text(t.subjectCategories.results.initializing),
      ),
      LoadingState() => const LoadingWidget(),
      LoadedState<List<SubjectCategory>>() =>
        SubjectCategoriesResultsListWidget(
          subjectCategories: currentState.data,
          domain: cubit.domain!,
          language: cubit.currentLanguage,
        ),
      ErrorState() => ErrorStateWidget(
        message: currentState.message,
        onRetry: cubit.refresh,
      ),
      _ => Center(child: Text(t.common.unknownState)),
    };
  }
}
