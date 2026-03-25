import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/census_topics/presentation/cubit/census_topics_results_cubit.dart';
import 'package:stadata_example/features/census_topics/presentation/widgets/census_topics_results_list_widget.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_example/shared/widgets/results_common_widgets.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class CensusTopicsResultsPage extends StatelessWidget {
  const CensusTopicsResultsPage({required this.censusID, super.key});

  final String censusID;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return BlocProvider(
      create:
          (context) =>
              getIt<CensusTopicsResultsCubit>()..initialize(censusID: censusID),
      child: BlocBuilder<CensusTopicsResultsCubit, BaseState>(
        builder: (context, state) {
          final cubit = context.read<CensusTopicsResultsCubit>();

          if (state is InitialState && cubit.canLoadData) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              unawaited(cubit.loadData());
            });
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(t.censusTopics.results.title),
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
                    _CensusTopicsParametersPanel(cubit: cubit),

                    const Gap(AppSizes.spaceLg),

                    _CensusTopicsMainContent(state: state, cubit: cubit),

                    if (state is LoadedState<List<CensusTopic>> &&
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

class _CensusTopicsParametersPanel extends StatelessWidget {
  const _CensusTopicsParametersPanel({required this.cubit});

  final CensusTopicsResultsCubit cubit;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return ResultsParametersPanel(
      title: t.censusTopics.results.searchParameters,
      chips: [
        ResultsParameterChip(
          icon: Icons.event,
          text:
              '${t.censusTopics.parameters.censusEvent.replaceAll(' *', '')}: ${cubit.censusID}',
        ),
      ],
    );
  }
}

class _CensusTopicsMainContent extends StatelessWidget {
  const _CensusTopicsMainContent({required this.state, required this.cubit});

  final BaseState state;
  final CensusTopicsResultsCubit cubit;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final currentState = state;

    return switch (currentState) {
      InitialState() => Center(
        child: Text(t.censusTopics.results.initializing),
      ),
      LoadingState() => const LoadingWidget(),
      LoadedState<List<CensusTopic>>() => CensusTopicsResultsListWidget(
        censusTopics: currentState.data,
      ),
      ErrorState() => ErrorStateWidget(
        message: currentState.message,
        onRetry: cubit.refresh,
      ),
      _ => Center(child: Text(t.common.unknownState)),
    };
  }
}
