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

    // Period selection is optional - if empty, show all periods
    // Navigate with formatted period string (null = all periods)
    // Also pass optional dimension filters if selected
    unawaited(
      context.router.push(
        DynamicTableDetailRoute(
          variableID: cubit.variableID!,
          domain: cubit.domain!,
          period: cubit.getFormattedPeriodString(),
          verticalVarID: cubit.verticalVariableID,
          derivedVarID: cubit.derivedVariableID,
          derivedPeriodID: cubit.derivedPeriodID,
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

// Step 4: Dimensions Selection (Vertical Variables, Derived Variables, Derived Periods)
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

        if (state.baseState is LoadingState) {
          return const _DimensionsLoadingView();
        }

        if (cubit.variableID == null) {
          return const Center(
            child: Text('Please select a variable first'),
          );
        }

        if (state.verticalVariables.isEmpty &&
            state.derivedVariables.isEmpty &&
            state.periods.isEmpty &&
            state.derivedPeriods.isEmpty) {
          return _DimensionsEmptyView(onRetry: cubit.loadDimensions);
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            final effectiveWidth =
                constraints.maxWidth.isFinite
                    ? constraints.maxWidth
                    : MediaQuery.of(context).size.width;

            return SizedBox(
              width: effectiveWidth,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _DimensionsHeader(width: effectiveWidth),
                    Padding(
                      padding: const EdgeInsets.all(AppSizes.spaceMd),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (state.verticalVariables.isNotEmpty)
                            const _VerticalVariablesSection(),
                          if (state.derivedVariables.isNotEmpty &&
                              _hasMeaningfulDerivedVariables(
                                state.derivedVariables,
                              ))
                            const _DerivedVariablesSection(),
                          if (state.derivedPeriods.isNotEmpty &&
                              _hasMeaningfulDerivedPeriods(
                                state.derivedPeriods,
                              ))
                            const _DerivedPeriodsSection(),
                        ],
                      ),
                    ),
                    const _DimensionsContinueButton(),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  bool _hasMeaningfulDerivedVariables(List<DerivedVariable> items) {
    return items.any((v) => v.id != 0 && v.name.toLowerCase() != 'tidak ada');
  }

  bool _hasMeaningfulDerivedPeriods(List<DerivedPeriod> items) {
    return items.any((p) => p.id != 0 && p.name.toLowerCase() != 'tidak ada');
  }
}

class _DimensionsLoadingView extends StatelessWidget {
  const _DimensionsLoadingView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Gap(AppSizes.spaceMd),
          Text('Loading dimensions...'),
        ],
      ),
    );
  }
}

class _DimensionsEmptyView extends StatelessWidget {
  const _DimensionsEmptyView({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.info_outline, size: 48, color: Colors.grey),
          const Gap(AppSizes.spaceMd),
          const Text(
            'No dimensions available for this variable',
            style: TextStyle(fontSize: 16),
          ),
          const Gap(AppSizes.spaceLg),
          FilledButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh),
            label: const Text('Retry Loading Dimensions'),
          ),
        ],
      ),
    );
  }
}

class _DimensionsHeader extends StatelessWidget {
  const _DimensionsHeader({required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DynamicTablesParametersCubit>();

    return Container(
      width: width,
      padding: const EdgeInsets.all(AppSizes.spaceMd),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLowest,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
          ),
        ),
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: AppSizes.spaceSm,
        runSpacing: AppSizes.spaceXs,
        children: [
          Text(
            'Select dimension filters (optional)',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          TextButton.icon(
            onPressed: () {
              cubit
                ..setVerticalVariableID(null)
                ..setDerivedVariableID(null)
                ..setDerivedPeriodID(null);
            },
            icon: const Icon(Icons.clear_all, size: 18),
            label: const Text('Clear All'),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.count,
    required this.hasSelection,
  });

  final String title;
  final int count;
  final bool hasSelection;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          hasSelection ? Icons.check_circle : Icons.circle_outlined,
          size: 18,
          color:
              hasSelection
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).colorScheme.outline,
        ),
        const Gap(AppSizes.spaceXs),
        Text(
          '$title ($count)',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _VerticalVariablesSection extends StatelessWidget {
  const _VerticalVariablesSection();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DynamicTablesParametersCubit>();
    final state = context.watch<DynamicTablesParametersCubit>().state;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(
          title: 'Vertical Variable',
          count: state.verticalVariables.length,
          hasSelection: cubit.verticalVariableID != null,
        ),
        const Gap(AppSizes.spaceSm),
        Card(
          color:
              cubit.verticalVariableID == null
                  ? Theme.of(context).primaryColor.withValues(alpha: 0.1)
                  : null,
          child: RadioListTile<int?>(
            title: const Text('All (no filter)'),
            value: null,
            groupValue: cubit.verticalVariableID,
            onChanged: (_) => cubit.setVerticalVariableID(null),
          ),
        ),
        ...state.verticalVariables.map(
          (v) => Card(
            color:
                cubit.verticalVariableID == v.id
                    ? Theme.of(context).primaryColor.withValues(alpha: 0.1)
                    : null,
            child: RadioListTile<int?>(
              title: Text(v.title),
              subtitle: Text('ID: ${v.id}'),
              value: v.id,
              groupValue: cubit.verticalVariableID,
              onChanged: cubit.setVerticalVariableID,
            ),
          ),
        ),
        const Gap(AppSizes.spaceLg),
      ],
    );
  }
}

class _DerivedVariablesSection extends StatelessWidget {
  const _DerivedVariablesSection();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DynamicTablesParametersCubit>();
    final state = context.watch<DynamicTablesParametersCubit>().state;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(
          title: 'Derived Variable',
          count: state.derivedVariables.length,
          hasSelection: cubit.derivedVariableID != null,
        ),
        const Gap(AppSizes.spaceSm),
        Card(
          color:
              cubit.derivedVariableID == null
                  ? Theme.of(context).primaryColor.withValues(alpha: 0.1)
                  : null,
          child: RadioListTile<int?>(
            title: const Text('All (no filter)'),
            value: null,
            groupValue: cubit.derivedVariableID,
            onChanged: (_) => cubit.setDerivedVariableID(null),
          ),
        ),
        ...state.derivedVariables
            .where((v) => v.id != 0)
            .map(
              (v) => Card(
                color:
                    cubit.derivedVariableID == v.id
                        ? Theme.of(context).primaryColor.withValues(alpha: 0.1)
                        : null,
                child: RadioListTile<int?>(
                  title: Text(v.name),
                  subtitle: Text('ID: ${v.id}'),
                  value: v.id,
                  groupValue: cubit.derivedVariableID,
                  onChanged: cubit.setDerivedVariableID,
                ),
              ),
            ),
        const Gap(AppSizes.spaceLg),
      ],
    );
  }
}

class _DerivedPeriodsSection extends StatelessWidget {
  const _DerivedPeriodsSection();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DynamicTablesParametersCubit>();
    final state = context.watch<DynamicTablesParametersCubit>().state;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(
          title: 'Derived Period',
          count: state.derivedPeriods.length,
          hasSelection: cubit.derivedPeriodID != null,
        ),
        const Gap(AppSizes.spaceSm),
        Card(
          color:
              cubit.derivedPeriodID == null
                  ? Theme.of(context).primaryColor.withValues(alpha: 0.1)
                  : null,
          child: RadioListTile<int?>(
            title: const Text('All (no filter)'),
            value: null,
            groupValue: cubit.derivedPeriodID,
            onChanged: (_) => cubit.setDerivedPeriodID(null),
          ),
        ),
        ...state.derivedPeriods
            .where((p) => p.id != 0)
            .map(
              (p) => Card(
                color:
                    cubit.derivedPeriodID == p.id
                        ? Theme.of(context).primaryColor.withValues(alpha: 0.1)
                        : null,
                child: RadioListTile<int?>(
                  title: Text(p.name),
                  subtitle: Text('ID: ${p.id}'),
                  value: p.id,
                  groupValue: cubit.derivedPeriodID,
                  onChanged: cubit.setDerivedPeriodID,
                ),
              ),
            ),
        const Gap(AppSizes.spaceLg),
      ],
    );
  }
}

class _DimensionsContinueButton extends StatelessWidget {
  const _DimensionsContinueButton();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DynamicTablesParametersCubit>();

    return Padding(
      padding: const EdgeInsets.all(AppSizes.spaceMd),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _getSelectionSummary(cubit),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
            textAlign: TextAlign.center,
          ),
          const Gap(AppSizes.spaceSm),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                final viewState =
                    context
                        .findAncestorStateOfType<
                          _DynamicTablesParametersViewState
                        >();
                if (viewState != null) {
                  // Need to access protected setState to update parent step.
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
  }

  String _getSelectionSummary(DynamicTablesParametersCubit cubit) {
    final parts = <String>[];

    if (cubit.verticalVariableID != null) {
      parts.add('Vertical Var: ${cubit.verticalVariableID}');
    }
    if (cubit.derivedVariableID != null) {
      parts.add('Derived Var: ${cubit.derivedVariableID}');
    }
    if (cubit.derivedPeriodID != null) {
      parts.add('Derived Period: ${cubit.derivedPeriodID}');
    }

    if (parts.isEmpty) {
      return 'No dimension filters selected - will show all data';
    }

    return 'Filters: ${parts.join(', ')}';
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
                            : 'Select at least 2 periods',
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
                    if (selectedCount < 2)
                      Text(
                        'Please select at least 2 periods '
                        '(${2 - selectedCount} more needed)',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    const Gap(AppSizes.spaceSm),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: selectedCount >= 2 ? onComplete : null,
                        child: Text(
                          selectedCount >= 2
                              ? 'Load Dynamic Table ($selectedCount periods)'
                              : 'Select at least 2 periods',
                        ),
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
