import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
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
          // Subject dropdown (optional)
          BlocBuilder<VariablesCubit, BaseState>(
            builder: (context, state) {
              // ignore: avoid_print
              print('>>> Dropdown BlocBuilder rebuilt <<<');
              // ignore: avoid_print
              print('Subjects count: ${cubit.subjects.length}');
              // ignore: avoid_print
              print(
                'Subjects: ${cubit.subjects.map((s) => s.name).take(5).toList()}',
              );

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.variables.parameters.subject,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(AppSizes.spaceXs),
                  DropdownButtonFormField<int?>(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: t.variables.parameters.subjectHint,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.spaceSm,
                        vertical: AppSizes.spaceSm,
                      ),
                      helperText:
                          cubit.subjects.isEmpty && cubit.domain != null
                              ? 'Loading subjects...'
                              : null,
                      helperMaxLines: 1,
                    ),
                    items: [
                      DropdownMenuItem<int?>(
                        value: null,
                        child: Text(t.variables.parameters.allSubjects),
                      ),
                      ...cubit.subjects.map((subject) {
                        return DropdownMenuItem<int?>(
                          value: subject.id,
                          child: Text(subject.name),
                        );
                      }),
                    ],
                    onChanged: (value) {
                      cubit.setSubjectID(value);
                    },
                  ),
                ],
              );
            },
          ),
          const Gap(AppSizes.spaceMd),
          // Show Existing Variables switch
          Row(
            children: [
              Expanded(
                child: Text(
                  t.variables.parameters.showExistingVariables,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              BlocBuilder<VariablesCubit, BaseState>(
                builder: (context, state) {
                  return Switch(
                    value: cubit.showExistingVariables,
                    onChanged: cubit.setShowExistingVariables,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
