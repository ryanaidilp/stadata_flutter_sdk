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
      create:
          (context) =>
              getIt<DerivedVariablesCubit>()
                ..setDomain(domain)
                ..changeLanguage(language)
                ..setVariableID(variableID)
                ..setVerticalGroup(verticalGroup)
                ..loadData(),
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
                    _buildParametersInfo(context, cubit),
                    const Gap(AppSizes.spaceLg),
                    _buildContent(context, state, cubit),
                    if (state is LoadedState<List<DerivedVariable>> &&
                        state.data.isNotEmpty &&
                        cubit.totalPages > 1) ...[
                      const Gap(AppSizes.spaceLg),
                      NumberPaginator(
                        key: ValueKey(cubit.currentPage),
                        numberPages: cubit.totalPages,
                        initialPage: cubit.currentPage - 1,
                        onPageChange: (index) {
                          cubit.loadData(page: index + 1);
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

  Widget _buildParametersInfo(
    BuildContext context,
    DerivedVariablesCubit cubit,
  ) {
    final t = Translations.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSizes.spaceMd),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
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
                'Request Parameters',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const Gap(AppSizes.spaceMd),
          Wrap(
            spacing: AppSizes.spaceSm,
            runSpacing: AppSizes.spaceXs,
            children: [
              Chip(
                avatar: const Icon(Icons.domain, size: 16),
                label: Text('Domain: $domain'),
                padding: EdgeInsets.zero,
              ),
              Chip(
                avatar: const Icon(Icons.language, size: 16),
                label: Text(
                  'Language: ${language == DataLanguage.id ? t.instructions.languageLabels.indonesian : t.instructions.languageLabels.english}',
                ),
                padding: EdgeInsets.zero,
              ),
              if (variableID != null)
                Chip(
                  avatar: const Icon(Icons.filter_alt, size: 16),
                  label: Text('Variable ID: $variableID'),
                  padding: EdgeInsets.zero,
                ),
              if (verticalGroup != null)
                Chip(
                  avatar: const Icon(Icons.account_tree, size: 16),
                  label: Text('Vertical Group: $verticalGroup'),
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
    DerivedVariablesCubit cubit,
  ) {
    final t = Translations.of(context);

    if (state is LoadingState) {
      return const LoadingWidget();
    }

    if (state is ErrorState) {
      return ErrorStateWidget(message: state.message, onRetry: cubit.loadData);
    }

    if (state is LoadedState<List<DerivedVariable>>) {
      final derivedVariables = state.data;

      if (derivedVariables.isEmpty) {
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
                'No derived variables found',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        );
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
