import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/glossary/presentation/cubit/glossary_results_cubit.dart';
import 'package:stadata_example/features/glossary/presentation/widgets/glossary_results_section.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_example/shared/widgets/results_common_widgets.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class GlossaryResultsPage extends StatelessWidget {
  const GlossaryResultsPage({
    required this.domain,
    required this.language,
    super.key,
    this.keyword,
    this.prefix,
  });

  final String domain;
  final DataLanguage language;
  final String? keyword;
  final String? prefix;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              getIt<GlossaryResultsCubit>()..initialize(
                domain: domain,
                language: language,
                keyword: keyword,
                prefix: prefix,
              ),
      child: const _GlossaryResultsView(),
    );
  }
}

class _GlossaryResultsView extends StatefulWidget {
  const _GlossaryResultsView();

  @override
  State<_GlossaryResultsView> createState() => _GlossaryResultsViewState();
}

class _GlossaryResultsViewState extends State<_GlossaryResultsView> {
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
        title: Text(t.glossary.results.title),
        actions: [
          BlocBuilder<GlossaryResultsCubit, BaseState>(
            builder: (context, state) {
              final cubit = context.read<GlossaryResultsCubit>();
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
          BlocBuilder<GlossaryResultsCubit, BaseState>(
            builder: (context, state) {
              return IconButton(
                icon: const Icon(Icons.refresh),
                onPressed:
                    state is LoadingState
                        ? null
                        : () {
                          unawaited(
                            context.read<GlossaryResultsCubit>().refresh(),
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
          BlocBuilder<GlossaryResultsCubit, BaseState>(
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
    return BlocBuilder<GlossaryResultsCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<GlossaryResultsCubit>();
        final t = LocaleSettings.instance.currentTranslations;
        final theme = Theme.of(context);

        return ResultsParametersPanel(
          title: t.glossary.results.searchParameters,
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
              text:
                  'Language: ${cubit.currentLanguage == DataLanguage.id ? 'ID' : 'EN'}',
              backgroundColor: theme.colorScheme.secondaryContainer,
              labelStyle: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSecondaryContainer,
              ),
              visualDensity: VisualDensity.compact,
            ),
            if (cubit.keyword != null)
              ResultsParameterChip(
                text: 'Keyword: ${cubit.keyword!}',
                backgroundColor: theme.colorScheme.secondaryContainer,
                labelStyle: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSecondaryContainer,
                ),
                visualDensity: VisualDensity.compact,
              ),
            if (cubit.prefix != null)
              ResultsParameterChip(
                text: 'Prefix: ${cubit.prefix!}',
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
      final LoadedState<List<Glossary>> loadedState => SliverToBoxAdapter(
        child: GlossaryResultsSection(
          state: loadedState,
          pageController: pageController,
        ),
      ),
      final ErrorState errorState => SliverToBoxAdapter(
        child: ErrorStateWidget(
          message: errorState.message,
          onRetry: () {
            unawaited(context.read<GlossaryResultsCubit>().refresh());
          },
        ),
      ),
      _ => SliverToBoxAdapter(
        child: Center(child: Text(t.common.unknownState)),
      ),
    };
  }
}
