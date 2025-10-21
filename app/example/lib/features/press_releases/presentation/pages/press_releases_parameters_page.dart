import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/navigation/app_router.dart';
import 'package:stadata_example/core/validators/validators.dart';
import 'package:stadata_example/features/press_releases/presentation/cubit/press_releases_cubit.dart';
import 'package:stadata_example/features/press_releases/presentation/widgets/press_releases_parameters_panel.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';

@RoutePage()
class PressReleasesParametersPage extends StatefulWidget {
  const PressReleasesParametersPage({super.key});

  @override
  State<PressReleasesParametersPage> createState() =>
      _PressReleasesParametersPageState();
}

class _PressReleasesParametersPageState
    extends State<PressReleasesParametersPage> {
  late TextEditingController _domainController;
  late TextEditingController _keywordController;

  @override
  void initState() {
    super.initState();
    _domainController = TextEditingController(
      text: DomainValidator.defaultDomain,
    );
    _keywordController = TextEditingController();
  }

  @override
  void dispose() {
    _domainController.dispose();
    _keywordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PressReleasesCubit>()..initialize(),
      child: BlocBuilder<PressReleasesCubit, BaseState>(
        builder: (context, state) {
          final cubit = context.read<PressReleasesCubit>();

          return Scaffold(
            appBar: AppBar(title: const Text('Press Releases')),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSizes.spaceMd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PressReleasesParametersPanel(
                    domainController: _domainController,
                    keywordController: _keywordController,
                  ),

                  const Gap(AppSizes.spaceLg),

                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed:
                          cubit.canLoadData
                              ? () {
                                unawaited(
                                  context.router.push(
                                    PressReleasesResultsRoute(
                                      domain: cubit.domain!,
                                      language: cubit.currentLanguage,
                                      keyword: cubit.keyword,
                                      month: cubit.month,
                                      year: cubit.year,
                                    ),
                                  ),
                                );
                              }
                              : null,
                      icon: const Icon(Icons.search),
                      label: const Text('Load Press Releases'),
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
                              'Request details will be shown in the results page',
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
