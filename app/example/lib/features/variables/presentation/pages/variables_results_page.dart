import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/variables/presentation/cubit/variables_cubit.dart';
import 'package:stadata_example/features/variables/presentation/widgets/variable_card.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class VariablesResultsPage extends StatelessWidget {
  const VariablesResultsPage({
    required this.domain,
    required this.language,
    super.key,
  });

  final String domain;
  final DataLanguage language;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return BlocProvider(
      create:
          (context) =>
              getIt<VariablesCubit>()
                ..setDomain(domain)
                ..changeLanguage(language)
                ..loadData(),
      child: BlocBuilder<VariablesCubit, BaseState>(
        builder: (context, state) {
          final cubit = context.read<VariablesCubit>();

          return Scaffold(
            appBar: AppBar(
              title: Text(t.variables.title),
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

  Widget _buildParametersInfo(BuildContext context, VariablesCubit cubit) {
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
            t.variables.parameters.title,
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
                avatar: const Icon(Icons.domain, size: 16),
                label: Text(
                  '${t.variables.parameters.domain.replaceAll(' *', '')}: $domain',
                ),
                padding: EdgeInsets.zero,
              ),
              Chip(
                avatar: const Icon(Icons.language, size: 16),
                label: Text(
                  '${t.variables.parameters.language}: ${language == DataLanguage.id ? t.instructions.languageLabels.indonesian : t.instructions.languageLabels.english}',
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
    VariablesCubit cubit,
  ) {
    final t = Translations.of(context);

    if (state is LoadingState) {
      return const LoadingWidget();
    }

    if (state is ErrorState) {
      return ErrorStateWidget(message: state.message, onRetry: cubit.loadData);
    }

    if (state is LoadedState<List<Variable>>) {
      final variables = state.data;

      if (variables.isEmpty) {
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
                t.variables.noDataFound,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        );
      }

      return Column(
        children: [
          // Results info with pagination
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
                  t.variables.found(n: variables.length),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const Spacer(),
                // Pagination controls
                if (cubit.totalPages > 1) ...[
                  IconButton(
                    onPressed:
                        cubit.hasPreviousPage ? cubit.previousPage : null,
                    icon: const Icon(Icons.chevron_left),
                    iconSize: 20,
                  ),
                  Text(
                    '${cubit.currentPage} / ${cubit.totalPages}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  IconButton(
                    onPressed: cubit.hasNextPage ? cubit.nextPage : null,
                    icon: const Icon(Icons.chevron_right),
                    iconSize: 20,
                  ),
                ],
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: cubit.refresh,
              child: ListView.separated(
                padding: const EdgeInsets.all(AppSizes.spaceMd),
                itemCount: variables.length,
                separatorBuilder:
                    (context, index) => const Gap(AppSizes.spaceMd),
                itemBuilder: (context, index) {
                  final variable = variables[index];
                  return VariableCard(variable: variable);
                },
              ),
            ),
          ),
        ],
      );
    }

    return Center(child: Text(t.instructions.enterParametersAndLoad));
  }
}
