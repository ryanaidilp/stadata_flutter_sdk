import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/navigation/app_router.dart';
import 'package:stadata_example/features/static_tables/presentation/cubit/static_tables_cubit.dart';
import 'package:stadata_example/features/static_tables/presentation/widgets/static_tables_parameters_panel.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';

@RoutePage()
class StaticTablesParametersPage extends StatelessWidget {
  const StaticTablesParametersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<StaticTablesCubit>()..initialize(),
      child: const StaticTablesParametersView(),
    );
  }
}

class StaticTablesParametersView extends StatefulWidget {
  const StaticTablesParametersView({super.key});

  @override
  State<StaticTablesParametersView> createState() =>
      _StaticTablesParametersViewState();
}

class _StaticTablesParametersViewState
    extends State<StaticTablesParametersView> {
  final _domainController = TextEditingController();
  final _keywordController = TextEditingController();

  @override
  void dispose() {
    _domainController.dispose();
    _keywordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Static Tables'),
        actions: const [AliceButton()],
      ),
      body: BlocBuilder<StaticTablesCubit, BaseState>(
        builder: (context, state) {
          final cubit = context.read<StaticTablesCubit>();

          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.spaceMd),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Info box
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppSizes.spaceMd),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      const Gap(AppSizes.spaceSm),
                      Expanded(
                        child: Text(
                          'Enter a domain code to fetch static tables. '
                          'You can filter by keyword, month, and year.',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(
                            color:
                                Theme.of(
                                  context,
                                ).colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const Gap(AppSizes.spaceLg),

                // Parameters panel
                StaticTablesParametersPanel(
                  domainController: _domainController,
                  keywordController: _keywordController,
                ),

                const Gap(AppSizes.spaceLg),

                // Load button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed:
                        cubit.canLoadData
                            ? () {
                              context.router.push(
                                StaticTablesResultsRoute(
                                  domain: cubit.domain!,
                                  language: cubit.currentLanguage,
                                  keyword: cubit.keyword,
                                  month: cubit.month,
                                  year: cubit.year,
                                ),
                              );
                            }
                            : null,
                    icon: const Icon(Icons.table_chart),
                    label: const Text('Load Static Tables'),
                  ),
                ),

                // Validation error message
                if (!cubit.canLoadData && cubit.validationError != null) ...[
                  const Gap(AppSizes.spaceSm),
                  Container(
                    padding: const EdgeInsets.all(AppSizes.spaceSm),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.errorContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 16,
                          color: Theme.of(context).colorScheme.onErrorContainer,
                        ),
                        const Gap(AppSizes.spaceXs),
                        Expanded(
                          child: Text(
                            cubit.validationError!,
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(
                              color:
                                  Theme.of(
                                    context,
                                  ).colorScheme.onErrorContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
