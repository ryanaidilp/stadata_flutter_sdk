import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/sdg_indicators/presentation/cubit/sdg_indicators_results_cubit.dart';
import 'package:stadata_example/features/sdg_indicators/presentation/widgets/sdg_indicators_results_section.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_example/shared/widgets/results_common_widgets.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class SdgIndicatorsResultsPage extends StatelessWidget {
  const SdgIndicatorsResultsPage({
    required this.domain,
    required this.language,
    required this.goal,
    super.key,
  });

  final String domain;
  final DataLanguage language;
  final SdgGoalNumber goal;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              getIt<SdgIndicatorsResultsCubit>()..initialize(
                domain: domain,
                language: language,
                goal: goal,
              ),
      child: const _SdgIndicatorsResultsView(),
    );
  }
}

class _SdgIndicatorsResultsView extends StatefulWidget {
  const _SdgIndicatorsResultsView();

  @override
  State<_SdgIndicatorsResultsView> createState() =>
      _SdgIndicatorsResultsViewState();
}

class _SdgIndicatorsResultsViewState extends State<_SdgIndicatorsResultsView> {
  final TextEditingController _pageController = TextEditingController(
    text: '1',
  );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.sdgIndicators.results.title),
        actions: [
          BlocBuilder<SdgIndicatorsResultsCubit, BaseState>(
            builder: (context, state) {
              final cubit = context.read<SdgIndicatorsResultsCubit>();
              return Chip(
                avatar: const Icon(Icons.language, size: 16),
                label: Text(
                  cubit.currentLanguage == DataLanguage.id ? 'ID' : 'EN',
                ),
                backgroundColor:
                    Theme.of(context).colorScheme.secondaryContainer,
              );
            },
          ),
          const Gap(AppSizes.spaceXs),
          const AliceButton(),
          BlocBuilder<SdgIndicatorsResultsCubit, BaseState>(
            builder: (context, state) {
              return IconButton(
                icon: const Icon(Icons.refresh),
                onPressed:
                    state is LoadingState
                        ? null
                        : () {
                          unawaited(
                            context.read<SdgIndicatorsResultsCubit>().refresh(),
                          );
                        },
                tooltip: t.common.refresh,
              );
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: _ParametersSummary()),
          BlocBuilder<SdgIndicatorsResultsCubit, BaseState>(
            builder:
                (context, state) => _ContentSliver(
                  state: state,
                  pageController: _pageController,
                ),
          ),
        ],
      ),
    );
  }
}

class _ParametersSummary extends StatelessWidget {
  const _ParametersSummary();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SdgIndicatorsResultsCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<SdgIndicatorsResultsCubit>();
        final t = LocaleSettings.instance.currentTranslations;
        final theme = Theme.of(context);

        return ResultsParametersPanel(
          title: t.sdgIndicators.results.searchParameters,
          margin: const EdgeInsets.all(AppSizes.spaceMd),
          backgroundColor: theme.colorScheme.surfaceContainerHighest,
          headerBottomSpacing: AppSizes.spaceSm,
          chipSpacing: AppSizes.spaceXs,
          chips: [
            ResultsParameterChip(
              text: 'Domain: ${cubit.currentDomain}',
              backgroundColor: theme.colorScheme.secondaryContainer,
              labelStyle: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSecondaryContainer,
              ),
              visualDensity: VisualDensity.compact,
            ),
            ResultsParameterChip(
              text: 'Goal: ${cubit.currentGoal.value}',
              backgroundColor: theme.colorScheme.secondaryContainer,
              labelStyle: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSecondaryContainer,
              ),
              visualDensity: VisualDensity.compact,
            ),
            ResultsParameterChip(
              text:
                  'Language: ${cubit.currentLanguage == DataLanguage.id ? 'ID' : 'EN'}',
              backgroundColor: theme.colorScheme.secondaryContainer,
              labelStyle: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSecondaryContainer,
              ),
              visualDensity: VisualDensity.compact,
            ),
          ],
        );
      },
    );
  }
}

class _ContentSliver extends StatelessWidget {
  const _ContentSliver({
    required this.state,
    required this.pageController,
  });

  final BaseState state;
  final TextEditingController pageController;

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return switch (state) {
      InitialState() => const SliverToBoxAdapter(
        child: Center(child: Text('Initializing...')),
      ),
      LoadingState() => const SliverToBoxAdapter(child: LoadingWidget()),
      final LoadedState<List<SdgIndicator>> loadedState => SliverToBoxAdapter(
        child: SdgIndicatorsResultsSection(
          state: loadedState,
          pageController: pageController,
        ),
      ),
      final ErrorState errorState => SliverToBoxAdapter(
        child: ErrorStateWidget(
          message: errorState.message,
          onRetry: () {
            unawaited(context.read<SdgIndicatorsResultsCubit>().refresh());
          },
        ),
      ),
      _ => SliverToBoxAdapter(
        child: Center(child: Text(t.common.unknownState)),
      ),
    };
  }
}
