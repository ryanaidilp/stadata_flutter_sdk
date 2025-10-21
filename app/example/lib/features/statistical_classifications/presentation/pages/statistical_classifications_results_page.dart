import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/statistical_classifications/presentation/cubit/statistical_classifications_results_cubit.dart';
import 'package:stadata_example/features/statistical_classifications/presentation/widgets/statistical_classifications_results_list_widget.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
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
              cubit.loadData();
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
                    _buildSearchParametersPanel(context, cubit),

                    const Gap(AppSizes.spaceLg),

                    _buildMainContent(context, state, cubit),

                    if (state is LoadedState<List<StatisticClassification>> &&
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
                                label: Text(
                                  t.common.previous,
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                            Text(
                              '${t.common.page} ${cubit.currentPage}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            SizedBox(
                              width: 100,
                              child: TextButton.icon(
                                onPressed: () => cubit.loadNextPage(),
                                icon: const Icon(Icons.chevron_right, size: 16),
                                label: Text(
                                  t.common.next,
                                  style: const TextStyle(fontSize: 12),
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
    StatisticalClassificationsResultsCubit cubit,
  ) {
    final t = Translations.of(context);

    String getTypeLabel(ClassificationType type) {
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

    String getLevelLabel(ClassificationLevel level) {
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
          KBKILevel.division =>
            t.statisticalClassifications.kbkiLevels.division,
          KBKILevel.group => t.statisticalClassifications.kbkiLevels.group,
          KBKILevel.classes => t.statisticalClassifications.kbkiLevels.classes,
          KBKILevel.subClass =>
            t.statisticalClassifications.kbkiLevels.subClass,
          KBKILevel.commodityGroup =>
            t.statisticalClassifications.kbkiLevels.commodityGroup,
          KBKILevel.commodity =>
            t.statisticalClassifications.kbkiLevels.commodity,
        };
      }
      return level.value;
    }

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
                t.statisticalClassifications.results.searchParameters,
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
                avatar: const Icon(Icons.account_tree, size: 16),
                label: Text(
                  '${t.statisticalClassifications.parameters.category.replaceAll(' *', '')}: ${cubit.type is KBLIType ? 'KBLI' : 'KBKI'}',
                ),
                padding: EdgeInsets.zero,
              ),
              Chip(
                avatar: const Icon(Icons.category, size: 16),
                label: Text(
                  '${t.statisticalClassifications.parameters.type.replaceAll(' *', '')}: ${getTypeLabel(cubit.type)}',
                ),
                padding: EdgeInsets.zero,
              ),
              if (cubit.level != null)
                Chip(
                  avatar: const Icon(Icons.layers, size: 16),
                  label: Text(
                    '${t.statisticalClassifications.parameters.level.replaceAll(' (Optional)', '').replaceAll(' (Opsional)', '')}: ${getLevelLabel(cubit.level!)}',
                  ),
                  padding: EdgeInsets.zero,
                ),
              Chip(
                avatar: const Icon(Icons.language, size: 16),
                label: Text(
                  '${t.common.language}: ${cubit.currentLanguage == DataLanguage.id ? 'ID' : 'EN'}',
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
    StatisticalClassificationsResultsCubit cubit,
  ) {
    final t = Translations.of(context);

    return switch (state) {
      InitialState() => Center(
        child: Text(t.statisticalClassifications.results.initializing),
      ),
      LoadingState() => const LoadingWidget(),
      LoadedState<List<StatisticClassification>>() =>
        StatisticalClassificationsResultsListWidget(
          classifications: state.data,
        ),
      ErrorState() => ErrorStateWidget(
        message: state.message,
        onRetry: cubit.refresh,
      ),
      _ => Center(child: Text(t.common.unknownState)),
    };
  }
}
