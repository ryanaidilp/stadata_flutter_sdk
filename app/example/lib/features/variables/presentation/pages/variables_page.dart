import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
class VariablesPage extends StatelessWidget {
  const VariablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return BlocProvider(
      create: (context) => getIt<VariablesCubit>()..initialize(),
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
                _buildParametersPanel(context, cubit),
                const Gap(AppSizes.spaceMd),
                Expanded(child: _buildContent(context, state, cubit)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildParametersPanel(BuildContext context, VariablesCubit cubit) {
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
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const Gap(AppSizes.spaceSm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Domain field
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t.variables.parameters.domain,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Gap(AppSizes.spaceXs),
                    TextFormField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: t.variables.parameters.domainHint,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.spaceSm,
                          vertical: AppSizes.spaceSm,
                        ),
                        errorText: cubit.validationError,
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: cubit.setDomain,
                    ),
                  ],
                ),
              ),
              const Gap(AppSizes.spaceSm),
              // Language dropdown
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t.variables.parameters.language,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Gap(AppSizes.spaceXs),
                    DropdownButtonFormField<DataLanguage>(
                      initialValue: cubit.currentLanguage,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: AppSizes.spaceSm,
                          vertical: AppSizes.spaceSm,
                        ),
                      ),
                      items:
                          DataLanguage.values.map((lang) {
                            return DropdownMenuItem(
                              value: lang,
                              child: Text(
                                lang == DataLanguage.id
                                    ? t.instructions.languageLabels.indonesian
                                    : t.instructions.languageLabels.english,
                              ),
                            );
                          }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          cubit.changeLanguage(value);
                        }
                      },
                    ),
                  ],
                ),
              ),
              const Gap(AppSizes.spaceSm),
              // Load button
              Padding(
                padding: const EdgeInsets.only(top: 22),
                child: FilledButton.icon(
                  onPressed: cubit.canLoadData ? cubit.loadData : null,
                  icon: const Icon(Icons.search, size: 18),
                  label: Text(t.variables.parameters.loadButton),
                ),
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
