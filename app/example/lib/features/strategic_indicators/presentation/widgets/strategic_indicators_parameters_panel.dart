import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:searchable_paginated_dropdown/searchable_paginated_dropdown.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/strategic_indicators/presentation/cubit/strategic_indicators_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class StrategicIndicatorsParametersPanel extends StatefulWidget {
  const StrategicIndicatorsParametersPanel({
    required this.domainController,
    super.key,
  });

  final TextEditingController domainController;

  @override
  State<StrategicIndicatorsParametersPanel> createState() =>
      _StrategicIndicatorsParametersPanelState();
}

class _StrategicIndicatorsParametersPanelState
    extends State<StrategicIndicatorsParametersPanel> {
  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return BlocBuilder<StrategicIndicatorsCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<StrategicIndicatorsCubit>();

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSizes.spaceMd),
          decoration: BoxDecoration(
            color: Colors.white,
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
                    Icons.settings,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    t.strategicIndicators.parameters.title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const Gap(AppSizes.spaceMd),

              // Domain field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.strategicIndicators.parameters.domain,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(AppSizes.spaceXs),
                  TextFormField(
                    controller: widget.domainController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: t.strategicIndicators.parameters.domainHint,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.spaceSm,
                        vertical: AppSizes.spaceSm,
                      ),
                      errorText: cubit.validationError,
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) {
                      context.read<StrategicIndicatorsCubit>().setDomain(
                        value.isEmpty ? null : value,
                      );
                    },
                  ),
                ],
              ),

              const Gap(AppSizes.spaceMd),

              // Variable ID dropdown with search and pagination
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.strategicIndicators.parameters.variableID,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(AppSizes.spaceXs),
                  SearchableDropdown<Variable>.paginated(
                    requestItemCount: 10,
                    hintText: Text(
                      cubit.canLoadVariables
                          ? t.strategicIndicators.parameters.variableIDHint
                          : 'Enter domain first (4 digits)',
                    ),
                    isEnabled: cubit.canLoadVariables,
                    paginatedRequest: (page, searchKey) async {
                      if (!cubit.canLoadVariables) {
                        return [];
                      }
                      final variables = await cubit.fetchVariables(
                        page: page,
                        searchText: searchKey,
                      );
                      return variables
                          .map(
                            (variable) => SearchableDropdownMenuItem<Variable>(
                              value: variable,
                              label: '${variable.id} - ${variable.title}',
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  '${variable.id} - ${variable.title}',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                subtitle:
                                    variable.unit.isNotEmpty
                                        ? Text(
                                          'Unit: ${variable.unit}',
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodySmall?.copyWith(
                                            color:
                                                Theme.of(
                                                  context,
                                                ).colorScheme.onSurfaceVariant,
                                          ),
                                        )
                                        : null,
                              ),
                            ),
                          )
                          .toList();
                    },
                    onChanged: (Variable? variable) {
                      context.read<StrategicIndicatorsCubit>().setVariableID(
                        variable?.id,
                      );
                    },
                    backgroundDecoration:
                        (child) => Card(
                          margin: EdgeInsets.zero,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSizes.spaceSm,
                              vertical: AppSizes.spaceXs,
                            ),
                            child: child,
                          ),
                        ),
                    margin: EdgeInsets.zero,
                  ),
                ],
              ),

              const Gap(AppSizes.spaceMd),

              // Language dropdown
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.strategicIndicators.parameters.language,
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
                        context.read<StrategicIndicatorsCubit>().changeLanguage(
                          value,
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
