import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/domains/presentation/cubit/domains_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/parameters_panel.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

/// A reusable parameters panel widget for domains configuration
class DomainsParametersPanel extends StatelessWidget {
  const DomainsParametersPanel({
    required this.provinceCodeController,
    super.key,
  });

  final TextEditingController provinceCodeController;

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return BlocBuilder<DomainsCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<DomainsCubit>();

        return ParametersPanel(
          title: t.domains.parameters.title,
          children: [
            // Domain Type Selector
            ParameterField(
              label: t.domains.parameters.domainType,
              child: DropdownButtonFormField<DomainType>(
                initialValue: cubit.currentType,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: AppSizes.spaceSm,
                    vertical: AppSizes.spaceSm,
                  ),
                ),
                items:
                    DomainType.values.map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(_getTypeDisplayName(context, type)),
                      );
                    }).toList(),
                onChanged: (type) {
                  if (type != null) {
                    context.read<DomainsCubit>().changeType(type);
                  }
                },
              ),
            ),
            const Gap(AppSizes.spaceMd),
            // Province Code Input (conditional)
            if (cubit.requiresProvinceCode) ...[
              ParameterField(
                label: '${t.domains.parameters.provinceCode} *',
                child: TextFormField(
                  controller: provinceCodeController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: t.domains.parameters.provinceCodeHint,
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
                    context.read<DomainsCubit>().setProvinceCode(
                      value.isEmpty ? null : value,
                    );
                  },
                ),
              ),
              const Gap(AppSizes.spaceMd),
            ],
            // Language Selector
            ParameterField(
              label: t.domains.parameters.language,
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
                                  ? context
                                      .t
                                      .instructions
                                      .languageLabels
                                      .indonesian
                                  : context
                                      .t
                                      .instructions
                                      .languageLabels
                                      .english,
                            ),
                          );
                        }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        context.read<DomainsCubit>().changeLanguage(value);
                      }
                    },
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    t.domains.parameters.languageNote,
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

  String _getTypeDisplayName(BuildContext context, DomainType type) {
    final t = LocaleSettings.instance.currentTranslations;
    switch (type) {
      case DomainType.all:
        return t.domains.types.all;
      case DomainType.province:
        return t.domains.types.province;
      case DomainType.regency:
        return t.domains.types.regency;
      case DomainType.regencyByProvince:
        return t.domains.types.regencyByProvince;
    }
  }
}
