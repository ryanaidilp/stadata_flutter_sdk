import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/statistical_classifications/presentation/cubit/statistical_classifications_results_cubit.dart';
import 'package:stadata_example/features/statistical_classifications/presentation/widgets/statistical_classifications_results_list_widget.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_example/shared/widgets/results_common_widgets.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class StatisticalClassificationsResultsPage extends StatelessWidget {
  const StatisticalClassificationsResultsPage({
    required this.type,
    required this.language,
    this.level,
    super.key,
  });

  final ClassificationType type;
  final ClassificationLevel? level;
  final DataLanguage language;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return BlocProvider(
      create:
          (context) =>
              getIt<StatisticalClassificationsResultsCubit>()
                ..initialize(type: type, level: level, language: language),
      child: BlocBuilder<StatisticalClassificationsResultsCubit, BaseState>(
        builder: (context, state) {
          final cubit = context.read<StatisticalClassificationsResultsCubit>();

          if (state is InitialState && cubit.canLoadData) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              unawaited(cubit.loadData());
            });
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(t.statisticalClassifications.results.title),
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
                    _StatisticalClassificationsParametersPanel(cubit: cubit),

                    const Gap(AppSizes.spaceLg),

                    _StatisticalClassificationsMainContent(
                      state: state,
                      cubit: cubit,
                    ),

                    if (state is LoadedState<List<StatisticClassification>> &&
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

class _StatisticalClassificationsParametersPanel extends StatelessWidget {
  const _StatisticalClassificationsParametersPanel({required this.cubit});

  final StatisticalClassificationsResultsCubit cubit;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return ResultsParametersPanel(
      title: t.statisticalClassifications.results.searchParameters,
      chips: [
        ResultsParameterChip(
          icon: Icons.account_tree,
          text:
              '${t.statisticalClassifications.parameters.category.replaceAll(' *', '')}: ${cubit.type is KBLIType ? 'KBLI' : 'KBKI'}',
        ),
        ResultsParameterChip(
          icon: Icons.category,
          text:
              '${t.statisticalClassifications.parameters.type.replaceAll(' *', '')}: ${_getTypeLabel(cubit.type)}',
        ),
        if (cubit.level != null)
          ResultsParameterChip(
            icon: Icons.layers,
            text:
                '${t.statisticalClassifications.parameters.level.replaceAll(' (Optional)', '').replaceAll(' (Opsional)', '')}: ${_getLevelLabel(cubit.level!, t)}',
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

class _StatisticalClassificationsMainContent extends StatelessWidget {
  const _StatisticalClassificationsMainContent({
    required this.state,
    required this.cubit,
  });

  final BaseState state;
  final StatisticalClassificationsResultsCubit cubit;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final currentState = state;

    return switch (currentState) {
      InitialState() => Center(
        child: Text(t.statisticalClassifications.results.initializing),
      ),
      LoadingState() => const LoadingWidget(),
      LoadedState<List<StatisticClassification>>() =>
        StatisticalClassificationsResultsListWidget(
          classifications: currentState.data,
        ),
      ErrorState() => ErrorStateWidget(
        message: currentState.message,
        onRetry: cubit.refresh,
      ),
      _ => Center(child: Text(t.common.unknownState)),
    };
  }
}

String _getTypeLabel(ClassificationType type) {
  if (type is KBLIType) {
    return switch (type) {
      KBLIType.y2009 => 'KBLI 2009',
      KBLIType.y2015 => 'KBLI 2015',
      KBLIType.y2017 => 'KBLI 2017',
      KBLIType.y2020 => 'KBLI 2020',
    };
  } else if (type is KBKIType) {
    return switch (type) {
      KBKIType.y2015 => 'KBKI 2015',
    };
  }
  return type.value;
}

String _getLevelLabel(ClassificationLevel level, Translations t) {
  if (level is KBLILevel) {
    return switch (level) {
      KBLILevel.category => t.statisticalClassifications.levels.category,
      KBLILevel.primaryGroup =>
        t.statisticalClassifications.levels.primaryGroup,
      KBLILevel.group => t.statisticalClassifications.levels.group,
      KBLILevel.subGroup => t.statisticalClassifications.levels.subGroup,
      KBLILevel.cluster => t.statisticalClassifications.levels.cluster,
    };
  } else if (level is KBKILevel) {
    return switch (level) {
      KBKILevel.section => t.statisticalClassifications.kbkiLevels.section,
      KBKILevel.division => t.statisticalClassifications.kbkiLevels.division,
      KBKILevel.group => t.statisticalClassifications.kbkiLevels.group,
      KBKILevel.classes => t.statisticalClassifications.kbkiLevels.classes,
      KBKILevel.subClass => t.statisticalClassifications.kbkiLevels.subClass,
      KBKILevel.commodityGroup =>
        t.statisticalClassifications.kbkiLevels.commodityGroup,
      KBKILevel.commodity => t.statisticalClassifications.kbkiLevels.commodity,
    };
  }
  return level.value;
}
