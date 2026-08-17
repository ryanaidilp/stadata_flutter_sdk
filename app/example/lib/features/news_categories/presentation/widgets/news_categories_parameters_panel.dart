import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/news_categories/presentation/cubit/news_categories_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/parameters_panel.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class NewsCategoriesParametersPanel extends StatelessWidget {
  const NewsCategoriesParametersPanel({
    required this.domainController,
    super.key,
  });

  final TextEditingController domainController;

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return BlocBuilder<NewsCategoriesCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<NewsCategoriesCubit>();

        return ParametersPanel(
          title: t.newsCategories.parameters.title,
          children: [
            // Domain Input
            ParameterField(
              label: t.newsCategories.parameters.domain,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: domainController,
                    decoration: InputDecoration(
                      hintText: t.newsCategories.parameters.domainHint,
                      border: const OutlineInputBorder(),
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.spaceSm,
                        vertical: AppSizes.spaceSm,
                      ),
                    ),
                    onChanged: cubit.changeDomain,
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    t.newsCategories.parameters.domainDescription,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(AppSizes.spaceMd),
            // Language Selection
            ParameterField(
              label: t.newsCategories.parameters.language,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                        DataLanguage.values.map((language) {
                          return DropdownMenuItem<DataLanguage>(
                            value: language,
                            child: Text(
                              language == DataLanguage.id
                                  ? t
                                      .newsCategories
                                      .parameters
                                      .languageIndonesian
                                  : t.newsCategories.parameters.languageEnglish,
                            ),
                          );
                        }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        cubit.changeLanguage(value);
                      }
                    },
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    t.newsCategories.parameters.languageDescription,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
