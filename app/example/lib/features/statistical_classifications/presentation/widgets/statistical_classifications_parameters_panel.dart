import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/statistical_classifications/presentation/cubit/statistical_classifications_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class StatisticalClassificationsParametersPanel extends StatefulWidget {
  const StatisticalClassificationsParametersPanel({super.key});

  @override
  State<StatisticalClassificationsParametersPanel> createState() =>
      _StatisticalClassificationsParametersPanelState();
}

class _StatisticalClassificationsParametersPanelState
    extends State<StatisticalClassificationsParametersPanel> {
  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return BlocBuilder<StatisticalClassificationsCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<StatisticalClassificationsCubit>();

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSizes.spaceMd),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(
                context,
              ).colorScheme.outline.withValues(alpha: 0.3),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    t.statisticalClassifications.parameters.title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const Gap(AppSizes.spaceMd),

              // Category dropdown (KBLI/KBKI)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.statisticalClassifications.parameters.category,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(AppSizes.spaceXs),
                  DropdownButtonFormField<ClassificationCategory>(
                    initialValue: cubit.category,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText:
                          t.statisticalClassifications.parameters.categoryHint,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.spaceSm,
                        vertical: AppSizes.spaceSm,
                      ),
                    ),
                    items:
                        ClassificationCategory.values.map((category) {
                          final label = switch (category) {
                            ClassificationCategory.kbli => 'KBLI',
                            ClassificationCategory.kbki => 'KBKI',
                          };
                          return DropdownMenuItem(
                            value: category,
                            child: Text(label),
                          );
                        }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        context
                            .read<StatisticalClassificationsCubit>()
                            .setCategory(value);
                      }
                    },
                  ),
                ],
              ),

              const Gap(AppSizes.spaceMd),

              // Type dropdown (dynamic based on category)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.statisticalClassifications.parameters.type,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(AppSizes.spaceXs),
                  if (cubit.category == ClassificationCategory.kbli)
                    DropdownButtonFormField<KBLIType>(
                      initialValue: cubit.type as KBLIType,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText:
                            t.statisticalClassifications.parameters.typeHint,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.spaceSm,
                          vertical: AppSizes.spaceSm,
                        ),
                      ),
                      items:
                          KBLIType.values.map((type) {
                            final label = switch (type) {
                              KBLIType.y2009 => 'KBLI 2009',
                              KBLIType.y2015 => 'KBLI 2015',
                              KBLIType.y2017 => 'KBLI 2017',
                              KBLIType.y2020 => 'KBLI 2020',
                            };
                            return DropdownMenuItem(
                              value: type,
                              child: Text(label),
                            );
                          }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          context
                              .read<StatisticalClassificationsCubit>()
                              .setType(value);
                        }
                      },
                    )
                  else
                    DropdownButtonFormField<KBKIType>(
                      initialValue: cubit.type as KBKIType,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText:
                            t.statisticalClassifications.parameters.typeHint,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.spaceSm,
                          vertical: AppSizes.spaceSm,
                        ),
                      ),
                      items:
                          KBKIType.values.map((type) {
                            final label = switch (type) {
                              KBKIType.y2015 => 'KBKI 2015',
                            };
                            return DropdownMenuItem(
                              value: type,
                              child: Text(label),
                            );
                          }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          context
                              .read<StatisticalClassificationsCubit>()
                              .setType(value);
                        }
                      },
                    ),
                ],
              ),

              const Gap(AppSizes.spaceMd),

              // Level dropdown (optional, dynamic based on category)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.statisticalClassifications.parameters.level,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(AppSizes.spaceXs),
                  if (cubit.category == ClassificationCategory.kbli)
                    DropdownButtonFormField<KBLILevel?>(
                      initialValue: cubit.level as KBLILevel?,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText:
                            t.statisticalClassifications.parameters.levelHint,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.spaceSm,
                          vertical: AppSizes.spaceSm,
                        ),
                      ),
                      items: [
                        DropdownMenuItem<KBLILevel?>(
                          child: Text(
                            t.statisticalClassifications.parameters.allLevels,
                          ),
                        ),
                        ...KBLILevel.values.map((level) {
                          final label = switch (level) {
                            KBLILevel.category =>
                              t.statisticalClassifications.levels.category,
                            KBLILevel.primaryGroup =>
                              t.statisticalClassifications.levels.primaryGroup,
                            KBLILevel.group =>
                              t.statisticalClassifications.levels.group,
                            KBLILevel.subGroup =>
                              t.statisticalClassifications.levels.subGroup,
                            KBLILevel.cluster =>
                              t.statisticalClassifications.levels.cluster,
                          };
                          return DropdownMenuItem(
                            value: level,
                            child: Text(label),
                          );
                        }),
                      ],
                      onChanged: (value) {
                        context
                            .read<StatisticalClassificationsCubit>()
                            .setLevel(value);
                      },
                    )
                  else
                    DropdownButtonFormField<KBKILevel?>(
                      initialValue: cubit.level as KBKILevel?,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText:
                            t.statisticalClassifications.parameters.levelHint,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.spaceSm,
                          vertical: AppSizes.spaceSm,
                        ),
                      ),
                      items: [
                        DropdownMenuItem<KBKILevel?>(
                          child: Text(
                            t.statisticalClassifications.parameters.allLevels,
                          ),
                        ),
                        ...KBKILevel.values.map((level) {
                          final label = switch (level) {
                            KBKILevel.section =>
                              t.statisticalClassifications.kbkiLevels.section,
                            KBKILevel.division =>
                              t.statisticalClassifications.kbkiLevels.division,
                            KBKILevel.group =>
                              t.statisticalClassifications.kbkiLevels.group,
                            KBKILevel.classes =>
                              t.statisticalClassifications.kbkiLevels.classes,
                            KBKILevel.subClass =>
                              t.statisticalClassifications.kbkiLevels.subClass,
                            KBKILevel.commodityGroup =>
                              t
                                  .statisticalClassifications
                                  .kbkiLevels
                                  .commodityGroup,
                            KBKILevel.commodity =>
                              t.statisticalClassifications.kbkiLevels.commodity,
                          };
                          return DropdownMenuItem(
                            value: level,
                            child: Text(label),
                          );
                        }),
                      ],
                      onChanged: (value) {
                        context
                            .read<StatisticalClassificationsCubit>()
                            .setLevel(value);
                      },
                    ),
                ],
              ),

              const Gap(AppSizes.spaceMd),

              // Language dropdown
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.statisticalClassifications.parameters.language,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(AppSizes.spaceXs),
                  DropdownButtonFormField<DataLanguage>(
                    initialValue: cubit.currentLanguage,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: AppSizes.spaceSm,
                        vertical: AppSizes.spaceSm,
                      ),
                    ),
                    items:
                        DataLanguage.values.map((lang) {
                          return DropdownMenuItem(
                            value: lang,
                            child: Text(
                              lang == DataLanguage.id
                                  ? t.instructions.languageLabels.indonesian
                                  : t.instructions.languageLabels.english,
                            ),
                          );
                        }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        context
                            .read<StatisticalClassificationsCubit>()
                            .changeLanguage(value);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
