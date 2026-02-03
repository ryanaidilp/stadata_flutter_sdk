import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/core/navigation/app_router.dart';
import 'package:stadata_example/features/vertical_variables/presentation/cubit/vertical_variables_cubit.dart';
import 'package:stadata_example/features/vertical_variables/presentation/widgets/vertical_variables_parameters_panel.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';

@RoutePage()
class VerticalVariablesParametersPage extends StatelessWidget {
  const VerticalVariablesParametersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return BlocProvider(
      create: (context) => getIt<VerticalVariablesCubit>(),
      child: BlocBuilder<VerticalVariablesCubit, BaseState>(
        builder: (context, state) {
          final cubit = context.read<VerticalVariablesCubit>();

          return Scaffold(
            appBar: AppBar(title: const Text('Vertical Variables')),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSizes.spaceMd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalVariablesParametersPanel(),
                  const Gap(AppSizes.spaceLg),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed:
                          cubit.canLoadData
                              ? () {
                                unawaited(
                                  context.router.push(
                                    VerticalVariablesResultsRoute(
                                      domain: cubit.domain!,
                                      language: cubit.currentLanguage,
                                      variableID: cubit.variableID,
                                    ),
                                  ),
                                );
                              }
                              : null,
                      icon: const Icon(Icons.search),
                      label: const Text('Load Data'),
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
