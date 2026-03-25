import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/variables/presentation/cubit/variables_cubit.dart';
import 'package:stadata_example/features/variables/presentation/widgets/variable_card.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_example/shared/widgets/results_common_widgets.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class VariablesResultsPage extends StatelessWidget {
  const VariablesResultsPage({
    required this.domain,
    required this.language,
    this.year,
    this.subjectID,
    this.showExistingVariables = false,
    super.key,
  });

  final String domain;
  final DataLanguage language;
  final int? year;
  final int? subjectID;
  final bool showExistingVariables;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return BlocProvider(
      create: (context) {
        final cubit =
            getIt<VariablesCubit>()
              ..setDomain(domain)
              ..changeLanguage(language)
              ..setYear(year)
              ..setSubjectID(subjectID)
              ..setShowExistingVariables(value: showExistingVariables);
        unawaited(cubit.loadData());
        return cubit;
      },
      child: BlocBuilder<VariablesCubit, BaseState>(
        builder: (context, state) {
          final cubit = context.read<VariablesCubit>();

          return Scaffold(
            appBar: AppBar(
              title: Text(t.variables.title),
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
                    _VariablesParametersInfo(
                      domain: domain,
                      language: language,
                      year: year,
                      subjectID: subjectID,
                      showExistingVariables: showExistingVariables,
                    ),
                    const Gap(AppSizes.spaceLg),
                    _VariablesContent(state: state, cubit: cubit),
                    if (state is LoadedState<List<Variable>> &&
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

class _VariablesParametersInfo extends StatelessWidget {
  const _VariablesParametersInfo({
    required this.domain,
    required this.language,
    required this.year,
    required this.subjectID,
    required this.showExistingVariables,
  });

  final String domain;
  final DataLanguage language;
  final int? year;
  final int? subjectID;
  final bool showExistingVariables;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return ResultsParametersPanel(
      title: t.variables.parameters.title,
      chips: [
        ResultsParameterChip(
          icon: Icons.domain,
          text:
              '${t.variables.parameters.domain.replaceAll(' *', '')}: $domain',
        ),
        ResultsParameterChip(
          icon: Icons.language,
          text:
              '${t.variables.parameters.language}: ${language == DataLanguage.id ? t.instructions.languageLabels.indonesian : t.instructions.languageLabels.english}',
        ),
        if (year != null)
          ResultsParameterChip(
            icon: Icons.calendar_today,
            text: '${t.variables.parameters.year}: $year',
          ),
        if (subjectID != null)
          ResultsParameterChip(
            icon: Icons.subject,
            text: '${t.variables.parameters.subject} ID: $subjectID',
          ),
        if (showExistingVariables)
          ResultsParameterChip(
            icon: Icons.check_circle,
            text: t.variables.parameters.showExistingVariables,
          ),
      ],
    );
  }
}

class _VariablesContent extends StatelessWidget {
  const _VariablesContent({required this.state, required this.cubit});

  final BaseState state;
  final VariablesCubit cubit;

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

    if (currentState is LoadedState<List<Variable>>) {
      final variables = currentState.data;

      if (variables.isEmpty) {
        return ResultsEmptyState(message: t.variables.noDataFound);
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Results info header
          Row(
            children: [
              Icon(
                Icons.bar_chart,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
              const Gap(AppSizes.spaceXs),
              Text(
                'Variables Results',
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
              t.variables.found(n: variables.length),
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          const Gap(AppSizes.spaceMd),
          // Variables list
          ...variables.asMap().entries.map((entry) {
            final index = entry.key;
            final variable = entry.value;

            return Column(
              children: [
                VariableCard(variable: variable),
                if (index < variables.length - 1) const Gap(AppSizes.spaceMd),
              ],
            );
          }),
        ],
      );
    }

    return Center(child: Text(t.instructions.enterParametersAndLoad));
  }
}
