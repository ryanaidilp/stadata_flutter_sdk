import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:searchable_paginated_dropdown/searchable_paginated_dropdown.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/variables/presentation/cubit/variables_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class VariablesParametersPanel extends StatefulWidget {
  const VariablesParametersPanel({super.key});

  @override
  State<VariablesParametersPanel> createState() =>
      _VariablesParametersPanelState();
}

class _VariablesParametersPanelState extends State<VariablesParametersPanel> {
  late final TextEditingController _domainController;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<VariablesCubit>();
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
    final cubit = context.read<VariablesCubit>();

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
                t.variables.parameters.title,
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
                t.variables.parameters.domain,
                style: Theme.of(
                  context,
                ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500),
              ),
              const Gap(AppSizes.spaceXs),
              TextFormField(
                controller: _domainController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: t.variables.parameters.domainHint,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
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
                t.variables.parameters.language,
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
          // Year field (optional)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t.variables.parameters.year,
                style: Theme.of(
                  context,
                ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500),
              ),
              const Gap(AppSizes.spaceXs),
              TextFormField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: t.variables.parameters.yearHint,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.spaceSm,
                    vertical: AppSizes.spaceSm,
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  if (value.isEmpty) {
                    cubit.setYear(null);
                  } else {
                    cubit.setYear(int.tryParse(value));
                  }
                },
              ),
            ],
          ),
          const Gap(AppSizes.spaceMd),
          // Subject dropdown (optional, paginated)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t.variables.parameters.subject,
                style: Theme.of(
                  context,
                ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500),
              ),
              const Gap(AppSizes.spaceXs),
              SearchableDropdown<Subject>.paginated(
                requestItemCount: 10,
                hintText: Text(
                  cubit.canLoadData
                      ? t.variables.parameters.subjectHint
                      : 'Enter domain first (4 digits)',
                ),
                isEnabled: cubit.canLoadData,
                paginatedRequest: (page, searchKey) async {
                  if (!cubit.canLoadData) {
                    return [];
                  }
                  final subjects = await cubit.fetchSubjects(
                    page: page,
                    searchText: searchKey,
                  );
                  return subjects
                      .map(
                        (subject) => SearchableDropdownMenuItem<Subject>(
                          value: subject,
                          label: subject.name,
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              subject.name,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            subtitle:
                                subject.category != null
                                    ? Text(
                                      subject.category!.name,
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
                onChanged: (Subject? subject) {
                  cubit.setSubjectID(subject?.id);
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
          const Gap(AppSizes.spaceMd),
          // Show Existing Variables switch
          BlocBuilder<VariablesCubit, BaseState>(
            builder: (context, state) {
              final cubit = context.read<VariablesCubit>();
              return Row(
                children: [
                  Expanded(
                    child: Text(
                      t.variables.parameters.showExistingVariables,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Switch(
                    value: cubit.showExistingVariables,
                    onChanged: cubit.setShowExistingVariables,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
