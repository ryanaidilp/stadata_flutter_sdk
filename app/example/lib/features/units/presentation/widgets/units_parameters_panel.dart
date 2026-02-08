import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:searchable_paginated_dropdown/searchable_paginated_dropdown.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/units/presentation/cubit/units_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class UnitsParametersPanel extends StatefulWidget {
  const UnitsParametersPanel({super.key});

  @override
  State<UnitsParametersPanel> createState() => _UnitsParametersPanelState();
}

class _UnitsParametersPanelState extends State<UnitsParametersPanel> {
  late final TextEditingController _domainController;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<UnitsCubit>();
    _domainController = TextEditingController(text: cubit.domain);
  }

  @override
  void dispose() {
    _domainController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final cubit = context.read<UnitsCubit>();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSizes.spaceMd),
      decoration: BoxDecoration(
        color: Colors.white,
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
                Icons.tune,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
              const Gap(AppSizes.spaceXs),
              Text(
                'Parameters',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const Gap(AppSizes.spaceMd),
          // Domain field
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Domain *',
                style: Theme.of(
                  context,
                ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500),
              ),
              const Gap(AppSizes.spaceXs),
              TextFormField(
                controller: _domainController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'e.g., 7200 (4 digits)',
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: AppSizes.spaceSm,
                    vertical: AppSizes.spaceSm,
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 4,
                onChanged: cubit.setDomain,
              ),
            ],
          ),
          const Gap(AppSizes.spaceMd),
          // Language dropdown
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Language',
                style: Theme.of(
                  context,
                ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500),
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
          const Gap(AppSizes.spaceMd),
          // Variable dropdown (optional, paginated)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Variable ID (Optional)',
                style: Theme.of(
                  context,
                ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500),
              ),
              const Gap(AppSizes.spaceXs),
              SearchableDropdown<Variable>.paginated(
                requestItemCount: 10,
                hintText: Text(
                  cubit.canLoadData
                      ? 'Select a variable (optional)'
                      : 'Enter domain first (4 digits)',
                ),
                isEnabled: cubit.canLoadData,
                paginatedRequest: (page, searchKey) async {
                  if (!cubit.canLoadData) {
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
                          label: variable.title,
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              variable.title,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            subtitle: Text(
                              variable.subjectName,
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall?.copyWith(
                                color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList();
                },
                onChanged: (Variable? variable) {
                  cubit.setVariableID(variable?.id);
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
                      child: child,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
