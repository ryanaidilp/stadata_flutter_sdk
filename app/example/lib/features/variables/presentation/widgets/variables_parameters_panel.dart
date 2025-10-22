import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/variables/presentation/cubit/variables_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class VariablesParametersPanel extends StatelessWidget {
  const VariablesParametersPanel({super.key});

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
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: t.variables.parameters.domainHint,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.spaceSm,
                    vertical: AppSizes.spaceSm,
                  ),
                  errorText: cubit.validationError,
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
        ],
      ),
    );
  }
}
