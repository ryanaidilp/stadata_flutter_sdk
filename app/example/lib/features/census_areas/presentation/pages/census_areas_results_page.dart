import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/census_areas/presentation/cubit/census_areas_results_cubit.dart';
import 'package:stadata_example/features/census_areas/presentation/widgets/census_area_card.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class CensusAreasResultsPage extends StatelessWidget {
  const CensusAreasResultsPage({required this.censusID, super.key});

  final String censusID;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return BlocProvider(
      create:
          (context) =>
              getIt<CensusAreasResultsCubit>()..initialize(censusID: censusID),
      child: BlocBuilder<CensusAreasResultsCubit, BaseState>(
        builder: (context, state) {
          final cubit = context.read<CensusAreasResultsCubit>();

          if (state is InitialState && cubit.canLoadData) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              cubit.loadData();
            });
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(t.censusAreas.results.title),
              actions: const [AliceButton()],
            ),
            body: Column(
              children: [
                _buildParametersInfo(context, cubit),
                const Gap(AppSizes.spaceMd),
                Expanded(child: _buildContent(context, state, cubit)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildParametersInfo(
    BuildContext context,
    CensusAreasResultsCubit cubit,
  ) {
    final t = Translations.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSizes.spaceMd),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLowest,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.censusAreas.results.searchParameters,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap(AppSizes.spaceXs),
          Wrap(
            spacing: AppSizes.spaceSm,
            runSpacing: AppSizes.spaceXs,
            children: [
              Chip(
                avatar: const Icon(Icons.event, size: 16),
                label: Text(
                  '${t.censusAreas.parameters.censusEvent.replaceAll(' *', '')}: ${cubit.censusID}',
                ),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    BaseState state,
    CensusAreasResultsCubit cubit,
  ) {
    final t = Translations.of(context);

    if (state is LoadingState) {
      return const LoadingWidget();
    }

    if (state is ErrorState) {
      return ErrorStateWidget(message: state.message, onRetry: cubit.loadData);
    }

    if (state is LoadedState<List<CensusArea>>) {
      final areas = state.data;

      if (areas.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.inbox_outlined,
                size: 64,
                color: Theme.of(context).colorScheme.outline,
              ),
              const Gap(AppSizes.spaceMd),
              Text(
                'No census areas found',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        );
      }

      return RefreshIndicator(
        onRefresh: cubit.refresh,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.spaceMd,
                vertical: AppSizes.spaceSm,
              ),
              color: Theme.of(context).colorScheme.surfaceContainerLowest,
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    t.censusAreas.results.found(n: areas.length),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(AppSizes.spaceMd),
                itemCount: areas.length,
                separatorBuilder:
                    (context, index) => const Gap(AppSizes.spaceMd),
                itemBuilder: (context, index) {
                  final area = areas[index];
                  return CensusAreaCard(area: area);
                },
              ),
            ),
          ],
        ),
      );
    }

    return Center(child: Text(t.censusAreas.results.initializing));
  }
}
