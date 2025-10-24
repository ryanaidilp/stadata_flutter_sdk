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
                          context.read<DomainsResultsCubit>().refresh();
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
          SliverToBoxAdapter(child: _buildParametersSummary()),

          // Results Section
          BlocBuilder<DomainsResultsCubit, BaseState>(
            builder: _buildContentSliver,
          ),
        ],
      ),
    );
  }

  Widget _buildParametersSummary() {
    return BlocBuilder<DomainsResultsCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<DomainsResultsCubit>();
        final t = LocaleSettings.instance.currentTranslations;

        return Container(
          width: double.infinity,
          margin: const EdgeInsets.all(AppSizes.spaceMd),
          padding: const EdgeInsets.all(AppSizes.spaceMd),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
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
                    Icons.search,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    t.domains.results.searchParameters,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const Gap(AppSizes.spaceSm),
              Wrap(
                spacing: AppSizes.spaceXs,
                runSpacing: AppSizes.spaceXs,
                children: [
                  _buildParameterChip(context, 'Type', cubit.currentType.value),
                  _buildParameterChip(
                    context,
                    'Language',
                    cubit.currentLanguage == DataLanguage.id ? 'ID' : 'EN',
                  ),
                  if (cubit.provinceCode != null)
                    _buildParameterChip(
                      context,
                      'Province Code',
                      cubit.provinceCode!,
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildParameterChip(BuildContext context, String label, String value) {
    return Chip(
      label: Text('$label: $value'),
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
        color: Theme.of(context).colorScheme.onSecondaryContainer,
      ),
      visualDensity: VisualDensity.compact,
    );
  }

  Widget _buildContentSliver(BuildContext context, BaseState state) {
    return switch (state) {
      InitialState() => const SliverToBoxAdapter(
        child: Center(child: Text('Initializing...')),
      ),
      LoadingState() => const SliverToBoxAdapter(child: LoadingWidget()),
      final LoadedState<List<DomainEntity>> state => SliverToBoxAdapter(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: DomainsResultsListWidget(
            state: state,
            onShowDomainDetails: _showDomainDetails,
          ),
        ),
      ),
      final ErrorState state => SliverToBoxAdapter(
        child: ErrorStateWidget(
          message: state.message,
          onRetry: () {
            context.read<DomainsResultsCubit>().refresh();
          },
        ),
      ),
      _ => SliverToBoxAdapter(
        child: Center(child: Text(t.common.unknownState)),
      ),
    };
  }

  void _showDomainDetails(BuildContext context, DomainEntity domain) {
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
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(AppSizes.spaceMd),
                _buildDetailRow(context, 'ID', domain.id),
                _buildDetailRow(context, 'Name', domain.name),
                _buildDetailRow(context, 'URL', domain.url),
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
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
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
