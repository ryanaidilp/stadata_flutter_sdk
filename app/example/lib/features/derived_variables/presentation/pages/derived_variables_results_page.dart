import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/derived_variables/presentation/cubit/derived_variables_cubit.dart';
import 'package:stadata_example/features/derived_variables/presentation/widgets/derived_variable_card.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_example/shared/widgets/results_common_widgets.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class DerivedVariablesResultsPage extends StatelessWidget {
  const DerivedVariablesResultsPage({
    required this.domain,
    required this.language,
    this.variableID,
    this.verticalGroup,
    super.key,
  });

  final String domain;
  final DataLanguage language;
  final int? variableID;
  final int? verticalGroup;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit =
            getIt<DerivedVariablesCubit>()
              ..setDomain(domain)
              ..changeLanguage(language)
              ..setVariableID(variableID)
              ..setVerticalGroup(verticalGroup);
        unawaited(cubit.loadData());
        return cubit;
      },
      child: BlocBuilder<DerivedVariablesCubit, BaseState>(
        builder: (context, state) {
          final cubit = context.read<DerivedVariablesCubit>();

          return Scaffold(
            appBar: AppBar(
              title: const Text('Derived Variables'),
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
                    _DerivedVariablesParametersInfo(
                      domain: domain,
                      language: language,
                      variableID: variableID,
                      verticalGroup: verticalGroup,
                    ),
                    const Gap(AppSizes.spaceLg),
                    _DerivedVariablesContent(state: state, cubit: cubit),
                    if (state is LoadedState<List<DerivedVariable>> &&
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

class _DerivedVariablesParametersInfo extends StatelessWidget {
  const _DerivedVariablesParametersInfo({
    required this.domain,
    required this.language,
    required this.variableID,
    required this.verticalGroup,
  });

  final String domain;
  final DataLanguage language;
  final int? variableID;
  final int? verticalGroup;

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
        if (verticalGroup != null)
          ResultsParameterChip(
            icon: Icons.account_tree,
            text: 'Vertical Group: $verticalGroup',
          ),
      ],
    );
  }
}

class _DerivedVariablesContent extends StatelessWidget {
  const _DerivedVariablesContent({required this.state, required this.cubit});

  final BaseState state;
  final DerivedVariablesCubit cubit;

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

    if (currentState is LoadedState<List<DerivedVariable>>) {
      final derivedVariables = currentState.data;

      if (derivedVariables.isEmpty) {
        return const ResultsEmptyState(message: 'No derived variables found');
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Results info header
          Row(
            children: [
              Icon(
                Icons.functions,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
              const Gap(AppSizes.spaceXs),
              Text(
                'Derived Variables Results',
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
              'Found ${derivedVariables.length} derived variable(s)',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          const Gap(AppSizes.spaceMd),
          // Derived variables list
          ...derivedVariables.asMap().entries.map((entry) {
            final index = entry.key;
            final derivedVariable = entry.value;

            return Column(
              children: [
                DerivedVariableCard(derivedVariable: derivedVariable),
                if (index < derivedVariables.length - 1)
                  const Gap(AppSizes.spaceMd),
              ],
            );
          }),
        ],
      );
    }

    return Center(child: Text(t.instructions.enterParametersAndLoad));
  }
}
