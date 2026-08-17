import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/glossary/presentation/cubit/glossary_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/parameters_panel.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class GlossaryParametersPanel extends StatelessWidget {
  const GlossaryParametersPanel({
    required this.domainController,
    required this.keywordController,
    required this.pageController,
    super.key,
  });

  final TextEditingController domainController;
  final TextEditingController keywordController;
  final TextEditingController pageController;

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return BlocBuilder<GlossaryCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<GlossaryCubit>();

        return ParametersPanel(
          title: t.glossary.parameters.title,
          children: [
            // Domain Input
            ParameterField(
              label: '${t.glossary.parameters.domain} *',
              child: TextFormField(
                controller: domainController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: t.glossary.parameters.domainHint,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.spaceSm,
                    vertical: AppSizes.spaceSm,
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: cubit.changeDomain,
              ),
            ),
            const Gap(AppSizes.spaceMd),
            // Keyword Input
            ParameterField(
              label: t.glossary.parameters.keyword,
              child: TextFormField(
                controller: keywordController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: t.glossary.parameters.keywordHint,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.spaceSm,
                    vertical: AppSizes.spaceSm,
                  ),
                ),
                onChanged: cubit.setKeyword,
              ),
            ),
            const Gap(AppSizes.spaceMd),
            // Prefix Dropdown
            ParameterField(
              label: t.glossary.parameters.prefix,
              child: DropdownButtonFormField<String>(
                initialValue: cubit.prefix,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: AppSizes.spaceSm,
                    vertical: AppSizes.spaceSm,
                  ),
                ),
                hint: Text(t.glossary.parameters.prefixHint),
                menuMaxHeight: 300,
                isExpanded: true,
                items: [
                  ...List.generate(26, (i) {
                    final letter = String.fromCharCode(65 + i);
                    return DropdownMenuItem<String>(
                      value: letter,
                      child: Text(letter),
                    );
                  }),
                ],
                onChanged: cubit.setPrefix,
              ),
            ),
            const Gap(AppSizes.spaceMd),
            // Page Input
            ParameterField(
              label: t.glossary.parameters.page,
              child: TextFormField(
                controller: pageController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter page number',
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: AppSizes.spaceSm,
                    vertical: AppSizes.spaceSm,
                  ),
                ),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  final p = int.tryParse(value);
                  if (p != null && p > 0) {
                    cubit.page = p;
                  }
                },
              ),
            ),
            const Gap(AppSizes.spaceMd),
            // Language Selector
            ParameterField(
              label: t.glossary.parameters.language,
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
                    DataLanguage.values.map((language) {
                      return DropdownMenuItem<DataLanguage>(
                        value: language,
                        child: Text(
                          language == DataLanguage.id
                              ? 'Indonesian'
                              : 'English',
                        ),
                      );
                    }).toList(),
                onChanged: (value) {
                  if (value != null) cubit.changeLanguage(value);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
