import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/core/navigation/app_router.dart';
import 'package:stadata_example/features/sdg_indicators/presentation/cubit/sdg_indicators_cubit.dart';
import 'package:stadata_example/features/sdg_indicators/presentation/widgets/sdg_indicators_parameters_panel.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';

@RoutePage()
class SdgIndicatorsPage extends StatelessWidget {
  const SdgIndicatorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SdgIndicatorsCubit>(),
      child: const _SdgIndicatorsView(),
    );
  }
}

class _SdgIndicatorsView extends StatefulWidget {
  const _SdgIndicatorsView();

  @override
  State<_SdgIndicatorsView> createState() => _SdgIndicatorsViewState();
}

class _SdgIndicatorsViewState extends State<_SdgIndicatorsView> {
  final TextEditingController _domainController = TextEditingController(
    text: '0000',
  );
  final TextEditingController _pageController = TextEditingController(
    text: '1',
  );

  @override
  void dispose() {
    _domainController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.sdgIndicators.title),
        actions: const [AliceButton()],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.spaceMd),
          child: Column(
            children: [
              SdgIndicatorsParametersPanel(
                domainController: _domainController,
                pageController: _pageController,
              ),
              const Gap(AppSizes.spaceLg),
              const _SearchButton(),
              const Gap(AppSizes.spaceLg),
              const _EducationalInfo(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchButton extends StatelessWidget {
  const _SearchButton();

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return BlocBuilder<SdgIndicatorsCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<SdgIndicatorsCubit>();

        return SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            onPressed:
                cubit.canLoadData
                    ? () {
                      unawaited(
                        context.router.push(
                          SdgIndicatorsResultsRoute(
                            domain: cubit.currentDomain,
                            language: cubit.currentLanguage,
                            goal: cubit.currentGoal,
                          ),
                        ),
                      );
                    }
                    : null,
            icon: const Icon(Icons.search),
            label: Text(t.sdgIndicators.parameters.searchIndicators),
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.spaceLg,
                vertical: AppSizes.spaceMd,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _EducationalInfo extends StatelessWidget {
  const _EducationalInfo();

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSizes.spaceMd),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
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
                Icons.lightbulb_outline,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
              const Gap(AppSizes.spaceXs),
              Text(
                t.sdgIndicators.education.title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Gap(AppSizes.spaceSm),
          Text(
            t.sdgIndicators.education.description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap(AppSizes.spaceSm),
          _EducationPoint(
            title: t.sdgIndicators.education.parameters,
            description: t.sdgIndicators.education.parametersDescription,
          ),
          _EducationPoint(
            title: t.sdgIndicators.education.results,
            description: t.sdgIndicators.education.resultsDescription,
          ),
        ],
      ),
    );
  }
}

class _EducationPoint extends StatelessWidget {
  const _EducationPoint({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.spaceXs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(top: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              shape: BoxShape.circle,
            ),
          ),
          const Gap(AppSizes.spaceXs),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                children: [
                  TextSpan(
                    text: '$title: ',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  TextSpan(text: description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
