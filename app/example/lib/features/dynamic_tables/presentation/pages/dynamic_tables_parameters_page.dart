import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/navigation/app_router.dart';
import 'package:stadata_example/features/dynamic_tables/presentation/cubit/dynamic_tables_parameters_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class DynamicTablesParametersPage extends StatelessWidget {
  const DynamicTablesParametersPage({
    required this.domain,
    super.key,
  });

  final String domain;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = getIt<DynamicTablesParametersCubit>();
        unawaited(cubit.initialize(domain));
        return cubit;
      },
      child: const DynamicTablesParametersView(),
    );
  }
}

class DynamicTablesParametersView extends StatefulWidget {
  const DynamicTablesParametersView({super.key});

  @override
  State<DynamicTablesParametersView> createState() =>
      _DynamicTablesParametersViewState();
}

class _DynamicTablesParametersViewState
    extends State<DynamicTablesParametersView> {
  int _activeStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Table Builder'),
        leading: const BackButton(),
      ),
      body: BlocConsumer<
        DynamicTablesParametersCubit,
        DynamicTablesParametersState
      >(
        listener: (context, state) {
          // Auto-advance to next step when data loads successfully
          if (state.baseState is LoadedState) {
            _autoAdvanceStep(context);
          }
        },
        builder: (context, state) {
          final steps = _buildSteps(context);

          return Column(
            children: [
              ColoredBox(
                color: Colors.white,
                child: EasyStepper(
                  activeStep: _activeStep,
                  steps:
                      steps.map((step) {
                        return EasyStep(
                          customStep: CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.white,
                            child: Text(
                              '${steps.indexOf(step) + 1}',
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                          title: step.title,
                        );
                      }).toList(),
                  onStepReached: (index) {
                    // Only allow navigation to previously completed steps
                    if (_canNavigateToStep(index, context)) {
                      setState(() {
                        _activeStep = index;
                      });
                    }
                  },
                  stepRadius: 16,
                  padding: const EdgeInsets.all(8),
                  lineStyle: const LineStyle(),
                  borderThickness: 2,
                  internalPadding: 1,
                  activeStepBorderColor: Theme.of(context).primaryColor,
                  unreachedStepBorderColor: Colors.grey,
                  finishedStepBorderColor: Colors.green,
                  textDirection: TextDirection.ltr,
                ),
              ),
              Expanded(
                child: _buildStepContent(steps[_activeStep]),
              ),
            ],
          );
        },
      ),
    );
  }

  bool _canNavigateToStep(int index, BuildContext context) {
    final cubit = context.read<DynamicTablesParametersCubit>();

    switch (index) {
      case 0:
        return true; // Subject Category - always accessible
      case 1:
        return cubit.subjectCategoryID != null; // Subject
      case 2:
        return cubit.subjectID != null; // Variable
      case 3:
        return cubit.variableID != null; // Dimensions loaded
      case 4:
        return cubit.variableID != null; // Period selection
      default:
        return false;
    }
  }

  void _autoAdvanceStep(BuildContext context) {
    final cubit = context.read<DynamicTablesParametersCubit>();

    // Determine next appropriate step based on loaded data
    final nextStep = _determineNextStep(cubit);

    if (nextStep != _activeStep && nextStep <= 4) {
      setState(() {
        _activeStep = nextStep;
      });
    }
  }

  int _determineNextStep(DynamicTablesParametersCubit cubit) {
    // Step 0: Subject Category - if data loaded, move to step 1
    if (_activeStep == 0 && cubit.subjects.isNotEmpty) {
      return 1;
    }

    // Step 1: Subject - if data loaded, move to step 2
    if (_activeStep == 1 && cubit.variables.isNotEmpty) {
      return 2;
    }

    // Step 2: Variable - if dimensions loaded, check if we should skip
    // Check if any dimension data is loaded (including empty lists mean data was fetched)
    if (_activeStep == 2 && cubit.variableID != null) {
      // If any dimensions exist OR if we've attempted to load (periods exist)
      final hasDimensions =
          cubit.verticalVariables.isNotEmpty ||
          cubit.derivedVariables.isNotEmpty ||
          cubit.periods.isNotEmpty ||
          cubit.derivedPeriods.isNotEmpty;

      if (hasDimensions) {
        // Check if dimensions are meaningful (not just placeholder values)
        final hasVerticalVars = cubit.verticalVariables.length > 1;
        final hasDerivedVars =
            cubit.derivedVariables.length > 1 ||
            (cubit.derivedVariables.isNotEmpty &&
                cubit.derivedVariables.first.id != 0);

        // If no meaningful dimensions, skip directly to period selection (step 4)
        if (!hasVerticalVars && !hasDerivedVars && cubit.periods.isNotEmpty) {
          return 4;
        }

        // Otherwise, show dimensions step (step 3)
        return 3;
      }
    }

    // Stay at current step
    return _activeStep;
  }

  List<_StepConfig> _buildSteps(BuildContext context) {
    return [
      _StepConfig(
        title: 'Subject\nCategory',
        builder: (context) => const _SubjectCategoryStep(),
      ),
      _StepConfig(
        title: 'Subject',
        builder: (context) => const _SubjectStep(),
      ),
      _StepConfig(
        title: 'Variable',
        builder: (context) => const _VariableStep(),
      ),
      _StepConfig(
        title: 'Dimen-\nsions',
        builder: (context) => const _DimensionsStep(),
      ),
      _StepConfig(
        title: 'Period',
        builder:
            (context) => _PeriodStep(
              onComplete: () => _handleComplete(context),
            ),
      ),
    ];
  }

  Widget _buildStepContent(_StepConfig step) {
    return step.builder(context);
  }

  void _handleComplete(BuildContext context) {
    final cubit = context.read<DynamicTablesParametersCubit>();

    // Validate that we have minimum required selections
    if (cubit.variableID == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a variable'),
        ),
      );
      return;
    }

    // Validate that at least one period is selected
    if (cubit.selectedPeriodIDs.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select at least one period'),
        ),
      );
      return;
    }

    // Navigate with 1-2 periods using comma separator
    unawaited(
      context.router.push(
        DynamicTableDetailRoute(
          variableID: cubit.variableID!,
          domain: cubit.domain!,
          period: cubit.selectedPeriodIDs.join(';'),
          language: DataLanguage.id,
        ),
      ),
    );
  }
}

class _StepConfig {
  const _StepConfig({
    required this.title,
    required this.builder,
  });

  final String title;
  final Widget Function(BuildContext) builder;
}

// Step 1: Subject Category Selection
class _SubjectCategoryStep extends StatelessWidget {
  const _SubjectCategoryStep();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      DynamicTablesParametersCubit,
      DynamicTablesParametersState
    >(
      builder: (context, state) {
        if (state.baseState is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.baseState is ErrorState) {
          return Center(
            child: Text('Error: ${(state.baseState as ErrorState).message}'),
          );
        }

        if (state.subjectCategories.isEmpty) {
          return const Center(
            child: Text('No subject categories available'),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(AppSizes.spaceMd),
          itemCount: state.subjectCategories.length,
          itemBuilder: (context, index) {
            final category = state.subjectCategories[index];
            final isSelected =
                context
                    .read<DynamicTablesParametersCubit>()
                    .subjectCategoryID ==
                category.id;

            return Card(
              color:
                  isSelected
                      ? Theme.of(context).primaryColor.withValues(alpha: 0.1)
                      : null,
              child: ListTile(
                title: Text(category.name),
                trailing:
                    isSelected
                        ? Icon(
                          Icons.check_circle,
                          color: Theme.of(context).primaryColor,
                        )
                        : null,
                onTap: () {
                  context
                      .read<DynamicTablesParametersCubit>()
                      .setSubjectCategoryID(category.id);
                },
              ),
            );
          },
        );
      },
    );
  }
}

// Step 2: Subject Selection
class _SubjectStep extends StatelessWidget {
  const _SubjectStep();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      DynamicTablesParametersCubit,
      DynamicTablesParametersState
    >(
      builder: (context, state) {
        if (state.baseState is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.subjects.isEmpty) {
          return const Center(
            child: Text('Please select a subject category first'),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(AppSizes.spaceMd),
          itemCount: state.subjects.length,
          itemBuilder: (context, index) {
            final subject = state.subjects[index];
            final isSelected =
                context.read<DynamicTablesParametersCubit>().subjectID ==
                subject.id;

            return Card(
              color:
                  isSelected
                      ? Theme.of(context).primaryColor.withValues(alpha: 0.1)
                      : null,
              child: ListTile(
                title: Text(subject.name),
                trailing:
                    isSelected
                        ? Icon(
                          Icons.check_circle,
                          color: Theme.of(context).primaryColor,
                        )
                        : null,
                onTap: () {
                  context.read<DynamicTablesParametersCubit>().setSubjectID(
                    subject.id,
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}

// Step 3: Variable Selection
class _VariableStep extends StatelessWidget {
  const _VariableStep();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      DynamicTablesParametersCubit,
      DynamicTablesParametersState
    >(
      builder: (context, state) {
        if (state.baseState is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.variables.isEmpty) {
          return const Center(
            child: Text('Please select a subject first'),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(AppSizes.spaceMd),
          itemCount: state.variables.length,
          itemBuilder: (context, index) {
            final variable = state.variables[index];
            final isSelected =
                context.read<DynamicTablesParametersCubit>().variableID ==
                variable.id;

            return Card(
              color:
                  isSelected
                      ? Theme.of(context).primaryColor.withValues(alpha: 0.1)
                      : null,
              child: ListTile(
                title: Text(variable.title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (variable.notes.isNotEmpty)
                      Text(
                        variable.notes,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    const Gap(AppSizes.spaceXs),
                    Text(
                      'Unit: ${variable.unit}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                isThreeLine: true,
                trailing:
                    isSelected
                        ? Icon(
                          Icons.check_circle,
                          color: Theme.of(context).primaryColor,
                        )
                        : null,
                onTap: () {
                  context.read<DynamicTablesParametersCubit>().setVariableID(
                    variable.id,
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}

// Step 4: Dimensions Display (Vertical Variables, Derived Variables)
class _DimensionsStep extends StatelessWidget {
  const _DimensionsStep();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      DynamicTablesParametersCubit,
      DynamicTablesParametersState
    >(
      builder: (context, state) {
        final cubit = context.read<DynamicTablesParametersCubit>();

        // Show loading indicator while dimensions are being loaded
        if (state.baseState is LoadingState) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Gap(AppSizes.spaceMd),
                Text('Loading dimensions...'),
              ],
            ),
          );
        }

        // Check if variable is selected
        if (cubit.variableID == null) {
          return const Center(
            child: Text('Please select a variable first'),
          );
        }

        // Variable is selected but dimensions are empty
        if (state.verticalVariables.isEmpty &&
            state.derivedVariables.isEmpty &&
            state.periods.isEmpty &&
            state.derivedPeriods.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.info_outline,
                  size: 48,
                  color: Colors.grey,
                ),
                const Gap(AppSizes.spaceMd),
                const Text(
                  'No dimensions available for this variable',
                  style: TextStyle(fontSize: 16),
                ),
                const Gap(AppSizes.spaceLg),
                FilledButton.icon(
                  onPressed: cubit.loadDimensions,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Retry Loading Dimensions'),
                ),
              ],
            ),
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.spaceMd),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dimensions loaded for selected variable',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const Gap(AppSizes.spaceMd),
              if (state.verticalVariables.isNotEmpty) ...[
                Text(
                  'Vertical Variables (${state.verticalVariables.length})',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Gap(AppSizes.spaceSm),
                ...state.verticalVariables
                    .take(5)
                    .map(
                      (v) => ListTile(
                        dense: true,
                        leading: const Icon(Icons.view_column, size: 16),
                        title: Text(
                          v.title,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                if (state.verticalVariables.length > 5)
                  Text(
                    '... and ${state.verticalVariables.length - 5} more',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
              ],
              const Gap(AppSizes.spaceLg),
              if (state.derivedVariables.isNotEmpty) ...[
                Text(
                  'Derived Variables (${state.derivedVariables.length})',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Gap(AppSizes.spaceSm),
                ...state.derivedVariables
                    .take(5)
                    .map(
                      (v) => ListTile(
                        dense: true,
                        leading: const Icon(Icons.functions, size: 16),
                        title: Text(
                          v.name,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                if (state.derivedVariables.length > 5)
                  Text(
                    '... and ${state.derivedVariables.length - 5} more',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
              ],
              const Gap(AppSizes.spaceLg),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    // Continue to period selection
                    final viewState =
                        context
                            .findAncestorStateOfType<
                              _DynamicTablesParametersViewState
                            >();
                    if (viewState != null) {
                      // Need to call setState on ancestor to update step
                      // ignore: invalid_use_of_protected_member
                      viewState.setState(() {
                        viewState._activeStep = 4;
                      });
                    }
                  },
                  child: const Text('Continue to Period Selection'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Step 5: Period Selection (Multi-select)
class _PeriodStep extends StatelessWidget {
  const _PeriodStep({
    required this.onComplete,
  });

  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      DynamicTablesParametersCubit,
      DynamicTablesParametersState
    >(
      builder: (context, state) {
        final cubit = context.read<DynamicTablesParametersCubit>();

        if (state.baseState is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.periods.isEmpty) {
          return const Center(
            child: Text('No periods available for this variable'),
          );
        }

        final selectedCount = cubit.selectedPeriodIDs.length;

        return SizedBox.expand(
          child: Column(
            children: [
              // Header with selection info and clear button
              Container(
                padding: const EdgeInsets.all(AppSizes.spaceMd),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerLowest,
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(
                        context,
                      ).colorScheme.outline.withValues(alpha: 0.3),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        selectedCount > 0
                            ? '$selectedCount period(s) selected'
                            : 'Select periods (multi-select)',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    if (selectedCount > 0)
                      TextButton.icon(
                        onPressed: cubit.clearSelectedPeriods,
                        icon: const Icon(Icons.clear_all, size: 18),
                        label: const Text('Clear'),
                      ),
                  ],
                ),
              ),
              // Period list with checkboxes
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(AppSizes.spaceMd),
                  itemCount: state.periods.length,
                  itemBuilder: (context, index) {
                    final period = state.periods[index];
                    final isSelected = cubit.isPeriodSelected(period.id);

                    return Card(
                      color:
                          isSelected
                              ? Theme.of(
                                context,
                              ).primaryColor.withValues(alpha: 0.1)
                              : null,
                      child: CheckboxListTile(
                        title: Text(period.year.toString()),
                        value: isSelected,
                        onChanged: (_) {
                          // Schedule state change after current frame
                          // to avoid layout assertion
                          unawaited(
                            Future.microtask(
                              () => cubit.togglePeriodID(period.id),
                            ),
                          );
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    );
                  },
                ),
              ),
              // Action buttons
              Padding(
                padding: const EdgeInsets.all(AppSizes.spaceMd),
                child: Column(
                  children: [
                    if (selectedCount == 0)
                      Text(
                        'Please select at least one period',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    const Gap(AppSizes.spaceSm),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: selectedCount > 0 ? onComplete : null,
                        child: const Text('Load Dynamic Table'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
