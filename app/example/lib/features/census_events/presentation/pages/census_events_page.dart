import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/census_events/presentation/cubit/census_events_cubit.dart';
import 'package:stadata_example/features/census_events/presentation/widgets/census_event_card.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class CensusEventsPage extends StatelessWidget {
  const CensusEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CensusEventsCubit>()..loadData(),
      child: const CensusEventsView(),
    );
  }
}

class CensusEventsView extends StatelessWidget {
  const CensusEventsView({super.key});

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.censusEvents.title),
        actions: [
          const AliceButton(),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<CensusEventsCubit>().refresh(),
            tooltip: t.common.refresh,
          ),
        ],
      ),
      body: BlocBuilder<CensusEventsCubit, BaseState>(
        builder: (context, state) {
          if (state is InitialState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const Gap(AppSizes.spaceMd),
                  Text(
                    t.censusEvents.initializing,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            );
          }

          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ErrorState) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.spaceMd),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64,
                      color: theme.colorScheme.error,
                    ),
                    const Gap(AppSizes.spaceMd),
                    Text(
                      t.common.error,
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.colorScheme.error,
                      ),
                    ),
                    const Gap(AppSizes.spaceXs),
                    Text(
                      state.message,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const Gap(AppSizes.spaceMd),
                    FilledButton.icon(
                      onPressed:
                          () => context.read<CensusEventsCubit>().loadData(),
                      icon: const Icon(Icons.refresh),
                      label: Text(t.common.retry),
                    ),
                  ],
                ),
              ),
            );
          }

          if (state is LoadedState<List<CensusEvent>>) {
            final events = state.data;

            if (events.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.event_busy,
                      size: 64,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    const Gap(AppSizes.spaceMd),
                    Text(
                      t.common.noData,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () => context.read<CensusEventsCubit>().refresh(),
              child: Column(
                children: [
                  // Header with count
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(AppSizes.spaceMd),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      border: Border(
                        bottom: BorderSide(
                          color: theme.colorScheme.outline.withValues(
                            alpha: 0.2,
                          ),
                        ),
                      ),
                    ),
                    child: Text(
                      t.censusEvents.found(n: events.length),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),

                  // List of census events
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(AppSizes.spaceMd),
                      itemCount: events.length,
                      separatorBuilder:
                          (context, index) => const Gap(AppSizes.spaceMd),
                      itemBuilder: (context, index) {
                        final event = events[index];
                        return CensusEventCard(event: event);
                      },
                    ),
                  ),
                ],
              ),
            );
          }

          return Center(
            child: Text(
              t.common.unknownState,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          );
        },
      ),
    );
  }
}
