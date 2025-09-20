import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/domains/presentation/cubit/domains_results_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/custom_card.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';

/// Results list widget for domains results page
class DomainsResultsListWidget extends StatelessWidget {
  const DomainsResultsListWidget({
    required this.state,
    required this.onShowDomainDetails,
    super.key,
  });

  final BaseState state;
  final void Function(BuildContext context, DomainEntity domain)
  onShowDomainDetails;

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    if (state is LoadingState) {
      return const LoadingListWidget(itemHeight: AppSizes.listItemHeight);
    }

    if (state is ErrorState) {
      return ErrorStateWidget(
        message: (state as ErrorState).message,
        onRetry: () => context.read<DomainsResultsCubit>().refresh(),
      );
    }

    if (state is LoadedState<List<DomainEntity>>) {
      final domains = (state as LoadedState<List<DomainEntity>>).data;

      if (domains.isEmpty) {
        return EmptyStateWidget(
          message: t.domains.results.empty,
          icon: Icons.location_off,
          actionButton: FilledButton.icon(
            onPressed: () => context.read<DomainsResultsCubit>().refresh(),
            icon: const Icon(Icons.refresh),
            label: Text(t.common.refresh),
          ),
        );
      }

      return RefreshIndicator(
        onRefresh: () => context.read<DomainsResultsCubit>().refresh(),
        child: Column(
          children: [
            // Results Header
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.spaceMd,
                vertical: AppSizes.spaceSm,
              ),
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const Gap(AppSizes.spaceXs),
                  Expanded(
                    child: Text(
                      t.domains.results.found.replaceAll(
                        '{count}',
                        domains.length.toString(),
                      ),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Domains List
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(AppSizes.spaceMd),
                itemCount: domains.length,
                separatorBuilder:
                    (context, index) => const Gap(AppSizes.spaceSm),
                itemBuilder: (context, index) {
                  final domain = domains[index];
                  return _buildDomainCard(context, domain);
                },
              ),
            ),
          ],
        ),
      );
    }

    return Center(
      child: Text(
        t.domains.results.initial,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDomainCard(BuildContext context, DomainEntity domain) {
    final t = LocaleSettings.instance.currentTranslations;

    return DataCard(
      title: domain.name,
      subtitle: '${t.domains.fields.id}: ${domain.id}',
      description: domain.url,
      onTap: () => onShowDomainDetails(context, domain),
    );
  }
}
