import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/vertical_variables/presentation/cubit/vertical_variables_cubit.dart';
import 'package:stadata_example/features/vertical_variables/presentation/widgets/vertical_variable_card.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_example/shared/widgets/results_common_widgets.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class VerticalVariablesResultsPage extends StatelessWidget {
  const VerticalVariablesResultsPage({
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
            getIt<VerticalVariablesCubit>()
              ..setDomain(domain)
              ..changeLanguage(language)
              ..setVariableID(variableID);
        unawaited(cubit.loadData());
        return cubit;
      },
      child: BlocBuilder<VerticalVariablesCubit, BaseState>(
        builder: (context, state) {
          final cubit = context.read<VerticalVariablesCubit>();

          return Scaffold(
            appBar: AppBar(
              title: const Text('Vertical Variables'),
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
                    _VerticalVariablesParametersInfo(
                      domain: domain,
                      language: language,
                      variableID: variableID,
                    ),
                    const Gap(AppSizes.spaceLg),
                    _VerticalVariablesContent(state: state, cubit: cubit),
                    if (state is LoadedState<List<VerticalVariable>> &&
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

class _VerticalVariablesParametersInfo extends StatelessWidget {
  const _VerticalVariablesParametersInfo({
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

class _VerticalVariablesContent extends StatelessWidget {
  const _VerticalVariablesContent({required this.state, required this.cubit});

  final BaseState state;
  final VerticalVariablesCubit cubit;

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

    if (currentState is LoadedState<List<VerticalVariable>>) {
      final verticalVariables = currentState.data;

      if (verticalVariables.isEmpty) {
        return const ResultsEmptyState(message: 'No vertical variables found');
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Results info header
          Row(
            children: [
              Icon(
                Icons.vertical_distribute,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
              const Gap(AppSizes.spaceXs),
              Text(
                'Vertical Variables Results',
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
              'Found ${verticalVariables.length} vertical variable(s)',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          const Gap(AppSizes.spaceMd),
          // Vertical variables list
          ...verticalVariables.asMap().entries.map((entry) {
            final index = entry.key;
            final verticalVariable = entry.value;

            return Column(
              children: [
                VerticalVariableCard(verticalVariable: verticalVariable),
                if (index < verticalVariables.length - 1)
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
