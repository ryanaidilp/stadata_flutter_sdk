import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/navigation/app_router.dart';
import 'package:stadata_example/features/dynamic_tables/presentation/cubit/dynamic_tables_cubit.dart';
import 'package:stadata_example/features/dynamic_tables/presentation/widgets/dynamic_tables_parameters_panel.dart';
import 'package:stadata_example/features/dynamic_tables/presentation/widgets/dynamic_tables_request_details_panel.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/core/generated/strings.g.dart';

@RoutePage()
class DynamicTablesPage extends StatelessWidget {
  const DynamicTablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DynamicTablesCubit>()..initialize(),
      child: const DynamicTablesView(),
    );
  }
}

class DynamicTablesView extends StatefulWidget {
  const DynamicTablesView({super.key});

  @override
  State<DynamicTablesView> createState() => _DynamicTablesViewState();
}

class _DynamicTablesViewState extends State<DynamicTablesView> {
  bool _showRequestDetails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.dynamicTables.title),
        actions: [
          IconButton(
            icon: Icon(_showRequestDetails ? Icons.code_off : Icons.code),
            onPressed: () {
              setState(() {
                _showRequestDetails = !_showRequestDetails;
              });
            },
            tooltip:
                _showRequestDetails
                    ? context.t.dynamicTables.requestDetails.hideDetails
                    : context.t.dynamicTables.requestDetails.showDetails,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.spaceMd),
          child: Column(
            children: [
              // Parameters Panel
              const DynamicTablesParametersPanel(),

              // Request Details Panel (if enabled)
              if (_showRequestDetails)
                const Padding(
                  padding: EdgeInsets.only(top: AppSizes.spaceMd),
                  child: DynamicTablesRequestDetailsPanel(),
                ),

              const Gap(AppSizes.spaceLg),

              // Action Buttons
              _buildActionButtons(context),

              const Gap(AppSizes.spaceLg),

              // Educational Information
              _buildEducationalInfo(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return BlocBuilder<DynamicTablesCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<DynamicTablesCubit>();

        return Column(
          children: [
            // Load Periods Button
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed:
                    cubit.canLoadPeriods
                        ? () => cubit.loadAvailablePeriods()
                        : null,
                icon: const Icon(Icons.date_range),
                label: Text(context.t.dynamicTables.parameters.loadPeriods),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.spaceLg,
                    vertical: AppSizes.spaceMd,
                  ),
                ),
              ),
            ),
            const Gap(AppSizes.spaceSm),
            // Generate Table Button
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed:
                    cubit.canGenerateTable
                        ? () => _navigateToResults(context, cubit)
                        : null,
                icon: const Icon(Icons.table_chart),
                label: Text(context.t.dynamicTables.parameters.generateTable),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.spaceLg,
                    vertical: AppSizes.spaceMd,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildEducationalInfo(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSizes.spaceMd),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
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
                Icons.lightbulb_outline,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
              const Gap(AppSizes.spaceXs),
              Text(
                context.t.dynamicTables.workflow.title,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const Gap(AppSizes.spaceSm),
          Text(
            context.t.dynamicTables.workflow.description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap(AppSizes.spaceSm),
          _buildEducationPoint(
            context,
            context.t.dynamicTables.workflow.step1,
            context.t.dynamicTables.workflow.step1Description,
          ),
          _buildEducationPoint(
            context,
            context.t.dynamicTables.workflow.step2,
            context.t.dynamicTables.workflow.step2Description,
          ),
          _buildEducationPoint(
            context,
            context.t.dynamicTables.workflow.step3,
            context.t.dynamicTables.workflow.step3Description,
          ),
        ],
      ),
    );
  }

  Widget _buildEducationPoint(
    BuildContext context,
    String title,
    String description,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.spaceXs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(top: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              shape: BoxShape.circle,
            ),
          ),
          const Gap(AppSizes.spaceXs),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                children: [
                  TextSpan(
                    text: '$title: ',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  TextSpan(text: description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToResults(BuildContext context, DynamicTablesCubit cubit) {
    if (cubit.selectedVariable != null && cubit.selectedYearId != null) {
      context.router.push(
        DynamicTablesResultsRoute(
          domain: cubit.domain,
          language: cubit.currentLanguage,
          variable: cubit.selectedVariable!,
          yearId: cubit.selectedYearId!,
        ),
      );
    }
  }
}
