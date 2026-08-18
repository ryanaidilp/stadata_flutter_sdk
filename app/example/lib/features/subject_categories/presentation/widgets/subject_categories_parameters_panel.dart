import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/subject_categories/presentation/cubit/subject_categories_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/parameters_panel.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class SubjectCategoriesParametersPanel extends StatefulWidget {
  const SubjectCategoriesParametersPanel({
    required this.domainController,
    super.key,
  });

  final TextEditingController domainController;

  @override
  State<SubjectCategoriesParametersPanel> createState() =>
      _SubjectCategoriesParametersPanelState();
}

class _SubjectCategoriesParametersPanelState
    extends State<SubjectCategoriesParametersPanel> {
  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return BlocBuilder<SubjectCategoriesCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<SubjectCategoriesCubit>();

        return ParametersPanel(
          title: t.subjectCategories.parameters.title,
          children: [
            // Domain field
            ParameterField(
              label: t.subjectCategories.parameters.domain,
              child: TextFormField(
                controller: widget.domainController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: t.subjectCategories.parameters.domainHint,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.spaceSm,
                    vertical: AppSizes.spaceSm,
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 4,
                onChanged: (value) {
                  context.read<SubjectCategoriesCubit>().setDomain(
                    value.isEmpty ? null : value,
                  );
                },
              ),
            ),
            const Gap(AppSizes.spaceMd),
            // Language dropdown
            ParameterField(
              label: t.subjectCategories.parameters.language,
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
                    context.read<SubjectCategoriesCubit>().changeLanguage(
                      value,
                    );
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
