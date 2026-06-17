import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/sdg_indicators/presentation/cubit/sdg_indicators_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class SdgIndicatorsParametersPanel extends StatelessWidget {
  const SdgIndicatorsParametersPanel({
    required this.domainController,
    required this.pageController,
    super.key,
  });

  final TextEditingController domainController;
  final TextEditingController pageController;

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return BlocBuilder<SdgIndicatorsCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<SdgIndicatorsCubit>();

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
                    t.sdgIndicators.parameters.title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const Gap(AppSizes.spaceMd),

              // Domain Input
              _ParameterField(
                label: '${t.sdgIndicators.parameters.domain} *',
                child: TextFormField(
                  controller: domainController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: t.sdgIndicators.parameters.domainHint,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.spaceSm,
                      vertical: AppSizes.spaceSm,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: cubit.changeDomain,
                ),
              ),

              const Gap(AppSizes.spaceMd),

              // Goal Dropdown
              _ParameterField(
                label: t.sdgIndicators.parameters.goal,
                child: DropdownButtonFormField<SdgGoalNumber>(
                  initialValue: cubit.currentGoal,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: AppSizes.spaceSm,
                      vertical: AppSizes.spaceSm,
                    ),
                  ),
                  hint: Text(t.sdgIndicators.parameters.goalHint),
                  menuMaxHeight: 300,
                  isExpanded: true,
                  items:
                      SdgGoalNumber.values.map((goal) {
                        return DropdownMenuItem<SdgGoalNumber>(
                          value: goal,
                          child: Text('Goal ${goal.value}'),
                        );
                      }).toList(),
                  onChanged: (value) {
                    if (value != null) cubit.setGoal(value);
                  },
                ),
              ),

              const Gap(AppSizes.spaceMd),

              // Page Input
              _ParameterField(
                label: t.sdgIndicators.parameters.page,
                child: TextFormField(
                  controller: pageController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter page number',
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: AppSizes.spaceSm,
                      vertical: AppSizes.spaceSm,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    final p = int.tryParse(value);
                    if (p != null && p > 0) cubit.page = p;
                  },
                ),
              ),

              const Gap(AppSizes.spaceMd),

              // Language Selector
              _ParameterField(
                label: t.sdgIndicators.parameters.language,
                child: DropdownButtonFormField<DataLanguage>(
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
                      DataLanguage.values.map((language) {
                        return DropdownMenuItem<DataLanguage>(
                          value: language,
                          child: Text(
                            language == DataLanguage.id
                                ? 'Indonesian'
                                : 'English',
                          ),
                        );
                      }).toList(),
                  onChanged: (value) {
                    if (value != null) cubit.changeLanguage(value);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ParameterField extends StatelessWidget {
  const _ParameterField({required this.label, required this.child});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const Gap(AppSizes.spaceXs),
        child,
      ],
    );
  }
}
