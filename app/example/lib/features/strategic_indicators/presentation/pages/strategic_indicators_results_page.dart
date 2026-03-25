import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/strategic_indicators/presentation/cubit/strategic_indicators_results_cubit.dart';
import 'package:stadata_example/features/strategic_indicators/presentation/widgets/strategic_indicators_results_list_widget.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_example/shared/widgets/results_common_widgets.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class StrategicIndicatorsResultsPage extends StatelessWidget {
  const StrategicIndicatorsResultsPage({
    required this.domain,
    required this.language,
    this.variableID,
    super.key,
  });

  final String domain;
  final DataLanguage language;
  final int? variableID;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return BlocProvider(
      create:
          (context) =>
              getIt<StrategicIndicatorsResultsCubit>()..initialize(
                domain: domain,
                language: language,
                variableID: variableID,
              ),
      child: BlocBuilder<StrategicIndicatorsResultsCubit, BaseState>(
        builder: (context, state) {
          final cubit = context.read<StrategicIndicatorsResultsCubit>();

          if (state is InitialState && cubit.canLoadData) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              unawaited(cubit.loadData());
            });
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(t.strategicIndicators.results.title),
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
                    _StrategicIndicatorsParametersPanel(cubit: cubit),

                    const Gap(AppSizes.spaceLg),

                    _StrategicIndicatorsMainContent(
                      state: state,
                      cubit: cubit,
                    ),

                    if (state is LoadedState<List<StrategicIndicator>> &&
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

class _StrategicIndicatorsParametersPanel extends StatelessWidget {
  const _StrategicIndicatorsParametersPanel({required this.cubit});

  final StrategicIndicatorsResultsCubit cubit;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return ResultsParametersPanel(
      title: t.strategicIndicators.results.searchParameters,
      chips: [
        ResultsParameterChip(
          icon: Icons.domain,
          text:
              '${t.strategicIndicators.parameters.domain.replaceAll(' *', '')}: ${cubit.domain}',
        ),
        ResultsParameterChip(
          icon: Icons.language,
          text:
              '${t.common.language}: ${cubit.currentLanguage == DataLanguage.id ? 'ID' : 'EN'}',
        ),
        if (cubit.variableID != null)
          ResultsParameterChip(
            icon: Icons.analytics,
            text:
                '${t.strategicIndicators.parameters.variableID}: ${cubit.variableID}',
          ),
      ],
    );
  }
}

class _StrategicIndicatorsMainContent extends StatelessWidget {
  const _StrategicIndicatorsMainContent({
    required this.state,
    required this.cubit,
  });

  final BaseState state;
  final StrategicIndicatorsResultsCubit cubit;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final currentState = state;

    return switch (currentState) {
      InitialState() => Center(
        child: Text(t.strategicIndicators.results.initializing),
      ),
      LoadingState() => const LoadingWidget(),
      LoadedState<List<StrategicIndicator>>() =>
        StrategicIndicatorsResultsListWidget(
          strategicIndicators: currentState.data,
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
