import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/publications/presentation/cubit/publications_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

/// A reusable parameters panel widget for publications configuration
class PublicationsParametersPanel extends StatelessWidget {
  const PublicationsParametersPanel({
    required this.domainController,
    required this.keywordController,
    super.key,
  });

  final TextEditingController domainController;
  final TextEditingController keywordController;

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return BlocBuilder<PublicationsCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<PublicationsCubit>();

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSizes.spaceMd),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(
                context,
              ).colorScheme.outline.withValues(alpha: 0.3),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    t.publications.parameters.title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const Gap(AppSizes.spaceMd),

              // Domain Input (required)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${t.publications.parameters.domain} *',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(AppSizes.spaceXs),
                  TextFormField(
                    controller: domainController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: t.publications.parameters.domainHint,
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
                      context.read<PublicationsCubit>().setDomain(
                        value.isEmpty ? null : value,
                      );
                    },
                  ),
                ],
              ),

              const Gap(AppSizes.spaceMd),

              // Language Selector
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.publications.parameters.language,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
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
                    onChanged: (DataLanguage? value) {
                      if (value != null) {
                        context.read<PublicationsCubit>().changeLanguage(value);
                      }
                    },
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    t.publications.parameters.languageNote,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),

              const Gap(AppSizes.spaceMd),

              // Keyword Input (optional)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.publications.parameters.keyword,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(AppSizes.spaceXs),
                  TextFormField(
                    controller: keywordController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: t.publications.parameters.keywordHint,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.spaceSm,
                        vertical: AppSizes.spaceSm,
                      ),
                    ),
                    onChanged: (value) {
                      context.read<PublicationsCubit>().setKeyword(
                        value.isEmpty ? null : value,
                      );
                    },
                  ),
                ],
              ),

              const Gap(AppSizes.spaceMd),

              // Month and Year filters
              Row(
                children: [
                  // Month selector
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          t.publications.parameters.month,
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        const Gap(AppSizes.spaceXs),
                        DropdownButtonFormField<int>(
                          initialValue: cubit.month,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: AppSizes.spaceSm,
                              vertical: AppSizes.spaceSm,
                            ),
                          ),
                          hint: Text(t.publications.parameters.monthHint),
                          items: List.generate(12, (index) {
                            final month = index + 1;
                            return DropdownMenuItem(
                              value: month,
                              child: Text(_getMonthName(context, month)),
                            );
                          }),
                          onChanged: (int? value) {
                            context.read<PublicationsCubit>().setMonth(value);
                          },
                        ),
                      ],
                    ),
                  ),
                  const Gap(AppSizes.spaceSm),
                  // Year selector
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          t.publications.parameters.year,
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        const Gap(AppSizes.spaceXs),
                        DropdownButtonFormField<int>(
                          initialValue: cubit.year,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: AppSizes.spaceSm,
                              vertical: AppSizes.spaceSm,
                            ),
                          ),
                          hint: Text(t.publications.parameters.yearHint),
                          items: _generateYearItems(),
                          onChanged: (int? value) {
                            context.read<PublicationsCubit>().setYear(value);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Clear filters button
              if (cubit.keyword != null ||
                  cubit.month != null ||
                  cubit.year != null) ...[
                const Gap(AppSizes.spaceMd),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      keywordController.clear();
                      context.read<PublicationsCubit>().clearFilters();
                    },
                    icon: const Icon(Icons.clear, size: 16),
                    label: Text(t.publications.parameters.clearButton),
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  String _getMonthName(BuildContext context, int month) {
    final monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return monthNames[month - 1];
  }

  List<DropdownMenuItem<int>> _generateYearItems() {
    final currentYear = DateTime.now().year;
    final years = <DropdownMenuItem<int>>[];

    // Generate years from current year back to 10 years ago
    for (var year = currentYear; year >= currentYear - 10; year--) {
      years.add(DropdownMenuItem(value: year, child: Text(year.toString())));
    }

    return years;
  }
}
