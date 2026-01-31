import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/navigation/app_router.dart';
import 'package:stadata_example/features/domains/presentation/cubit/domains_results_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

/// Landing page for Dynamic Tables feature with domain selection
@RoutePage()
class DynamicTablesPage extends StatelessWidget {
  const DynamicTablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              getIt<DomainsResultsCubit>()..initialize(
                type: DomainType.all,
                language: DataLanguage.id,
              ),
      child: const DynamicTablesView(),
    );
  }
}

class DynamicTablesView extends StatelessWidget {
  const DynamicTablesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Tables'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              unawaited(context.read<DomainsResultsCubit>().refresh());
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Header with instructions
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSizes.spaceMd),
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.table_view,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                    const Gap(AppSizes.spaceXs),
                    Text(
                      'Build Custom Dynamic Tables',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Gap(AppSizes.spaceSm),
                Text(
                  'Select a domain (region) to begin '
                  'building your custom table',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ],
            ),
          ),

          // Domains list
          Expanded(
            child: BlocBuilder<DomainsResultsCubit, BaseState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is ErrorState) {
                  return ErrorStateWidget(
                    message: state.message,
                    onRetry: () {
                      unawaited(
                        context.read<DomainsResultsCubit>().refresh(),
                      );
                    },
                  );
                }

                if (state is LoadedState<List<DomainEntity>>) {
                  final domains = state.data;

                  if (domains.isEmpty) {
                    return const Center(
                      child: Text('No domains available'),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.all(AppSizes.spaceMd),
                    itemCount: domains.length,
                    itemBuilder: (context, index) {
                      final domain = domains[index];
                      return Card(
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () {
                            // Show feedback to confirm selection
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Loading parameters for ${domain.name}...',
                                ),
                                duration: const Duration(seconds: 1),
                              ),
                            );

                            // Navigate to parameters page with selected domain
                            unawaited(
                              context.router.push(
                                DynamicTablesParametersRoute(
                                  domain: domain.id,
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(AppSizes.spaceMd),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      Theme.of(
                                        context,
                                      ).colorScheme.primaryContainer,
                                  child: Icon(
                                    Icons.location_on,
                                    color:
                                        Theme.of(
                                          context,
                                        ).colorScheme.onPrimaryContainer,
                                  ),
                                ),
                                const Gap(AppSizes.spaceMd),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        domain.name,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.titleMedium?.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Gap(AppSizes.spaceXs),
                                      Text(
                                        'Domain ID: ${domain.id}',
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodySmall?.copyWith(
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.onSurfaceVariant,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                  color:
                                      Theme.of(
                                        context,
                                      ).colorScheme.onSurfaceVariant,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }

                return const Center(
                  child: Text('Select a domain to continue'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
