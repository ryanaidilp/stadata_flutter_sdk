import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/units/presentation/cubit/units_cubit.dart';
import 'package:stadata_example/features/units/presentation/widgets/unit_card.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_example/shared/widgets/results_common_widgets.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class UnitsResultsPage extends StatelessWidget {
  const UnitsResultsPage({
    required this.domain,
    required this.language,
    this.variableID,
    super.key,
  });

  final String domain;
  final DataLanguage language;
  final int? variableID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit =
            getIt<UnitsCubit>()
              ..setDomain(domain)
              ..changeLanguage(language)
              ..setVariableID(variableID);
        unawaited(cubit.loadData());
        return cubit;
      },
      child: BlocBuilder<UnitsCubit, BaseState>(
        builder: (context, state) {
          final cubit = context.read<UnitsCubit>();

          return Scaffold(
            appBar: AppBar(
              title: const Text('Units'),
              actions: [
                const AliceButton(),
                IconButton(
                  onPressed: cubit.refresh,
                  icon: const Icon(Icons.refresh),
                  tooltip: 'Refresh',
                ),
              ],
            ),
            body: RefreshIndicator(
              onRefresh: cubit.refresh,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(AppSizes.spaceMd),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _UnitsParametersInfo(
                      domain: domain,
                      language: language,
                      variableID: variableID,
                    ),
                    const Gap(AppSizes.spaceLg),
                    _UnitsContent(state: state, cubit: cubit),
                    if (state is LoadedState<List<UnitData>> &&
                        state.data.isNotEmpty &&
                        cubit.totalPages > 1) ...[
                      const Gap(AppSizes.spaceLg),
                      NumberPaginator(
                        key: ValueKey(cubit.currentPage),
                        numberPages: cubit.totalPages,
                        initialPage: cubit.currentPage - 1,
                        onPageChange: (index) {
                          unawaited(cubit.loadData(page: index + 1));
                        },
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _UnitsParametersInfo extends StatelessWidget {
  const _UnitsParametersInfo({
    required this.domain,
    required this.language,
    required this.variableID,
  });

  final String domain;
  final DataLanguage language;
  final int? variableID;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return ResultsParametersPanel(
      title: 'Request Parameters',
      chips: [
        ResultsParameterChip(icon: Icons.domain, text: 'Domain: $domain'),
        ResultsParameterChip(
          icon: Icons.language,
          text:
              'Language: ${language == DataLanguage.id ? t.instructions.languageLabels.indonesian : t.instructions.languageLabels.english}',
        ),
        if (variableID != null)
          ResultsParameterChip(
            icon: Icons.filter_alt,
            text: 'Variable ID: $variableID',
          ),
      ],
    );
  }
}

class _UnitsContent extends StatelessWidget {
  const _UnitsContent({required this.state, required this.cubit});

  final BaseState state;
  final UnitsCubit cubit;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final currentState = state;

    if (currentState is LoadingState) {
      return const LoadingWidget();
    }

    if (currentState is ErrorState) {
      return ErrorStateWidget(
        message: currentState.message,
        onRetry: cubit.loadData,
      );
    }

    if (currentState is LoadedState<List<UnitData>>) {
      final units = currentState.data;

      if (units.isEmpty) {
        return const ResultsEmptyState(message: 'No units found');
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Results info header
          Row(
            children: [
              Icon(
                Icons.straighten,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
              const Gap(AppSizes.spaceXs),
              Text(
                'Units Results',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const Gap(AppSizes.spaceSm),
          // Results count
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSizes.spaceSm),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Found ${units.length} unit(s)',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          const Gap(AppSizes.spaceMd),
          // Units list
          ...units.asMap().entries.map((entry) {
            final index = entry.key;
            final unit = entry.value;

            return Column(
              children: [
                UnitCard(unit: unit),
                if (index < units.length - 1) const Gap(AppSizes.spaceMd),
              ],
            );
          }),
        ],
      );
    }

    return Center(child: Text(t.instructions.enterParametersAndLoad));
  }
}
