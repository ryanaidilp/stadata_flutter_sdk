import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:searchable_paginated_dropdown/searchable_paginated_dropdown.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/derived_periods/presentation/cubit/derived_periods_cubit.dart';
import 'package:stadata_example/shared/widgets/parameters_panel.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class DerivedPeriodsParametersPanel extends StatefulWidget {
  const DerivedPeriodsParametersPanel({super.key});

  @override
  State<DerivedPeriodsParametersPanel> createState() =>
      _DerivedPeriodsParametersPanelState();
}

class _DerivedPeriodsParametersPanelState
    extends State<DerivedPeriodsParametersPanel> {
  late final TextEditingController _domainController;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<DerivedPeriodsCubit>();
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
    final cubit = context.read<DerivedPeriodsCubit>();

    return ParametersPanel(
      icon: Icons.tune,
      title: 'Parameters',
      children: [
        // Domain field
        ParameterField(
          label: 'Domain *',
          child: TextFormField(
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
        ),
        const Gap(AppSizes.spaceMd),
        // Language dropdown
        ParameterField(
          label: 'Language',
          child: DropdownButtonFormField<DataLanguage>(
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
        ),
        const Gap(AppSizes.spaceMd),
        // Variable dropdown (optional, paginated)
        ParameterField(
          label: 'Variable ID (Optional)',
          child: SearchableDropdown<Variable>.paginated(
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
            onChanged: (variable) {
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
        ),
      ],
    );
  }
}
