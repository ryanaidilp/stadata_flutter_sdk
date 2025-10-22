import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/core/navigation/app_router.dart';
import 'package:stadata_example/features/variables/presentation/cubit/variables_cubit.dart';
import 'package:stadata_example/features/variables/presentation/widgets/variables_parameters_panel.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';

@RoutePage()
class VariablesParametersPage extends StatelessWidget {
  const VariablesParametersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return BlocProvider(
      create: (context) => getIt<VariablesCubit>()..initialize(),
      child: BlocBuilder<VariablesCubit, BaseState>(
        builder: (context, state) {
          final cubit = context.read<VariablesCubit>();

          return Scaffold(
            appBar: AppBar(title: Text(t.variables.title)),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSizes.spaceMd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VariablesParametersPanel(),
                  const Gap(AppSizes.spaceLg),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed:
                          cubit.canLoadData
                              ? () {
                                unawaited(
                                  context.router.push(
                                    VariablesResultsRoute(
                                      domain: cubit.domain!,
                                      language: cubit.currentLanguage,
                                      year: cubit.year,
                                      subjectID: cubit.subjectID,
                                      showExistingVariables:
                                          cubit.showExistingVariables,
                                    ),
                                  ),
                                );
                              }
                              : null,
                      icon: const Icon(Icons.search),
                      label: Text(t.variables.parameters.loadButton),
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.spaceLg,
                          vertical: AppSizes.spaceMd,
                        ),
                      ),
                    ),
                  ),
                  const Gap(AppSizes.spaceMd),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(AppSizes.spaceMd),
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).colorScheme.surfaceContainerLowest,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Theme.of(
                          context,
                        ).colorScheme.outline.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              size: 16,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const Gap(AppSizes.spaceXs),
                            Text(
                              t.instructions.requestDetailsWillShow,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
