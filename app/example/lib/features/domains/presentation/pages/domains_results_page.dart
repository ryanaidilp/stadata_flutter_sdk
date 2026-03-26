import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/domains/presentation/cubit/domains_results_cubit.dart';
import 'package:stadata_example/features/domains/presentation/widgets/domains_results_list_widget.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_example/shared/widgets/results_common_widgets.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class DomainsResultsPage extends StatelessWidget {
  const DomainsResultsPage({
    required this.type,
    required this.language,
    super.key,
    this.provinceCode,
  });

  final DomainType type;
  final DataLanguage language;
  final String? provinceCode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              getIt<DomainsResultsCubit>()..initialize(
                type: type,
                language: language,
                provinceCode: provinceCode,
              ),
      child: const DomainsResultsView(),
    );
  }
}

class DomainsResultsView extends StatefulWidget {
  const DomainsResultsView({super.key});

  @override
  State<DomainsResultsView> createState() => _DomainsResultsViewState();
}

class _DomainsResultsViewState extends State<DomainsResultsView> {
  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.domains.results.title),
        actions: [
          // Language display
          BlocBuilder<DomainsResultsCubit, BaseState>(
            builder: (context, state) {
              final cubit = context.read<DomainsResultsCubit>();
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
          // Alice button
          const AliceButton(),
          // Refresh button
          BlocBuilder<DomainsResultsCubit, BaseState>(
            builder: (context, state) {
              return IconButton(
                icon: const Icon(Icons.refresh),
                onPressed:
                    state is LoadingState
                        ? null
                        : () {
                          unawaited(
                            context.read<DomainsResultsCubit>().refresh(),
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
          // Search Parameters Summary
          const SliverToBoxAdapter(child: _DomainsParametersSummary()),

          // Results Section
          BlocBuilder<DomainsResultsCubit, BaseState>(
            builder:
                (context, state) => _DomainsContentSliver(
                  state: state,
                  onShowDomainDetails: _showDomainDetails,
                ),
          ),
        ],
      ),
    );
  }

  void _showDomainDetails(BuildContext context, DomainEntity domain) {
    unawaited(
      showModalBottomSheet<void>(
        context: context,
        builder:
            (context) => Container(
              padding: const EdgeInsets.all(AppSizes.spaceLg),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const Gap(AppSizes.spaceXs),
                      Expanded(
                        child: Text(
                          domain.name,
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(AppSizes.spaceMd),
                  _DomainDetailRow(label: 'ID', value: domain.id),
                  _DomainDetailRow(label: 'Name', value: domain.name),
                  _DomainDetailRow(label: 'URL', value: domain.url),
                  const Gap(AppSizes.spaceMd),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Close'),
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}

class _DomainsParametersSummary extends StatelessWidget {
  const _DomainsParametersSummary();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DomainsResultsCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<DomainsResultsCubit>();
        final t = LocaleSettings.instance.currentTranslations;
        final theme = Theme.of(context);

        return ResultsParametersPanel(
          title: t.domains.results.searchParameters,
          margin: const EdgeInsets.all(AppSizes.spaceMd),
          backgroundColor: theme.colorScheme.surfaceContainerHighest,
          headerBottomSpacing: AppSizes.spaceSm,
          chipSpacing: AppSizes.spaceXs,
          chips: [
            ResultsParameterChip(
              text: 'Type: ${cubit.currentType.value}',
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
            if (cubit.provinceCode != null)
              ResultsParameterChip(
                text: 'Province Code: ${cubit.provinceCode!}',
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

class _DomainsContentSliver extends StatelessWidget {
  const _DomainsContentSliver({
    required this.state,
    required this.onShowDomainDetails,
  });

  final BaseState state;
  final void Function(BuildContext context, DomainEntity domain)
  onShowDomainDetails;

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return switch (state) {
      InitialState() => const SliverToBoxAdapter(
        child: Center(child: Text('Initializing...')),
      ),
      LoadingState() => const SliverToBoxAdapter(child: LoadingWidget()),
      final LoadedState<List<DomainEntity>> loadedState => SliverToBoxAdapter(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: DomainsResultsListWidget(
            state: loadedState,
            onShowDomainDetails: onShowDomainDetails,
          ),
        ),
      ),
      final ErrorState errorState => SliverToBoxAdapter(
        child: ErrorStateWidget(
          message: errorState.message,
          onRetry: () {
            unawaited(context.read<DomainsResultsCubit>().refresh());
          },
        ),
      ),
      _ => SliverToBoxAdapter(
        child: Center(child: Text(t.common.unknownState)),
      ),
    };
  }
}

class _DomainDetailRow extends StatelessWidget {
  const _DomainDetailRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.spaceXs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const Gap(AppSizes.spaceXs),
          Expanded(
            child: Text(value, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
