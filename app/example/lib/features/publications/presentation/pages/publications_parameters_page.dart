import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/core/navigation/app_router.dart';
import 'package:stadata_example/core/validators/validators.dart';
import 'package:stadata_example/features/publications/presentation/cubit/publications_cubit.dart';
import 'package:stadata_example/features/publications/presentation/widgets/publications_parameters_panel.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';

@RoutePage()
class PublicationsParametersPage extends StatefulWidget {
  const PublicationsParametersPage({super.key});

  @override
  State<PublicationsParametersPage> createState() =>
      _PublicationsParametersPageState();
}

class _PublicationsParametersPageState
    extends State<PublicationsParametersPage> {
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
    final t = LocaleSettings.instance.currentTranslations;

    return BlocProvider(
      create: (context) => getIt<PublicationsCubit>()..initialize(),
      child: BlocBuilder<PublicationsCubit, BaseState>(
        builder: (context, state) {
          final cubit = context.read<PublicationsCubit>();

          return Scaffold(
            appBar: AppBar(title: Text(t.publications.title)),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSizes.spaceMd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Parameters panel
                  PublicationsParametersPanel(
                    domainController: _domainController,
                    keywordController: _keywordController,
                  ),

                  const Gap(AppSizes.spaceLg),

                  // Search button
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed:
                          cubit.canLoadData
                              ? () {
                                unawaited(
                                  context.router.push(
                                    PublicationsResultsRoute(
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
                      label: Text(t.publications.parameters.loadButton),
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.spaceLg,
                          vertical: AppSizes.spaceMd,
                        ),
                      ),
                    ),
                  ),

                  const Gap(AppSizes.spaceMd),

                  // Help text
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
