import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/infographics/presentation/cubit/infographics_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/parameters_panel.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

/// A reusable parameters panel widget for infographics configuration
class InfographicsParametersPanel extends StatelessWidget {
  const InfographicsParametersPanel({
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

    return BlocBuilder<InfographicsCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<InfographicsCubit>();

        return ParametersPanel(
          title: t.infographics.parameters.title,
          children: [
            // Domain Input
            ParameterField(
              label: '${t.infographics.parameters.domain} *',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: domainController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: t.infographics.parameters.domainHint,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.spaceSm,
                        vertical: AppSizes.spaceSm,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      context.read<InfographicsCubit>().changeDomain(value);
                    },
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    'Enter the domain code for the infographic category',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(AppSizes.spaceMd),
            // Keyword Input (optional)
            ParameterField(
              label: t.infographics.parameters.keyword,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: keywordController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: t.infographics.parameters.keywordHint,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.spaceSm,
                        vertical: AppSizes.spaceSm,
                      ),
                    ),
                    onChanged: (value) {
                      context.read<InfographicsCubit>().setKeyword(value);
                    },
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    'Optional keyword to filter infographics',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(AppSizes.spaceMd),
            // Language Selector
            ParameterField(
              label: t.infographics.parameters.language,
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
                        DataLanguage.values.map((lang) {
                          return DropdownMenuItem(
                            value: lang,
                            child: Text(
                              lang == DataLanguage.id
                                  ? 'Indonesian'
                                  : 'English',
                            ),
                          );
                        }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        context.read<InfographicsCubit>().changeLanguage(value);
                      }
                    },
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    t.infographics.parameters.languageNote,
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
