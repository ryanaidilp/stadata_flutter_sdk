import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/press_releases/presentation/cubit/press_releases_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/parameters_panel.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class PressReleasesParametersPanel extends StatelessWidget {
  const PressReleasesParametersPanel({
    required this.domainController,
    required this.keywordController,
    super.key,
  });

  final TextEditingController domainController;
  final TextEditingController keywordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PressReleasesCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<PressReleasesCubit>();

        return ParametersPanel(
          title: 'Parameters',
          children: [
            ParameterField(
              label: 'Domain *',
              child: TextFormField(
                controller: domainController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'e.g., 7200',
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: AppSizes.spaceSm,
                    vertical: AppSizes.spaceSm,
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 4,
                onChanged: (value) {
                  context.read<PressReleasesCubit>().setDomain(
                    value.isEmpty ? null : value,
                  );
                },
              ),
            ),
            const Gap(AppSizes.spaceMd),
            ParameterField(
              label: 'Language',
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
                        context.read<PressReleasesCubit>().changeLanguage(
                          value,
                        );
                      }
                    },
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    'Select the language for press release data',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(AppSizes.spaceMd),
            ParameterField(
              label: 'Keyword',
              child: TextFormField(
                controller: keywordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search by keyword',
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: AppSizes.spaceSm,
                    vertical: AppSizes.spaceSm,
                  ),
                ),
                onChanged: (value) {
                  context.read<PressReleasesCubit>().setKeyword(
                    value.isEmpty ? null : value,
                  );
                },
              ),
            ),
            const Gap(AppSizes.spaceMd),
            Row(
              children: [
                Expanded(
                  child: ParameterField(
                    label: 'Month',
                    child: DropdownButtonFormField<int>(
                      initialValue: cubit.month,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: AppSizes.spaceSm,
                          vertical: AppSizes.spaceSm,
                        ),
                      ),
                      hint: const Text('Select month'),
                      items: List.generate(12, (index) {
                        final month = index + 1;
                        return DropdownMenuItem(
                          value: month,
                          child: Text(_getMonthName(context, month)),
                        );
                      }),
                      onChanged: (value) {
                        context.read<PressReleasesCubit>().setMonth(value);
                      },
                    ),
                  ),
                ),
                const Gap(AppSizes.spaceSm),
                Expanded(
                  child: ParameterField(
                    label: 'Year',
                    child: DropdownButtonFormField<int>(
                      initialValue: cubit.year,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: AppSizes.spaceSm,
                          vertical: AppSizes.spaceSm,
                        ),
                      ),
                      hint: const Text('Select year'),
                      items: _generateYearItems(),
                      onChanged: (value) {
                        context.read<PressReleasesCubit>().setYear(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
            if (cubit.keyword != null ||
                cubit.month != null ||
                cubit.year != null) ...[
              const Gap(AppSizes.spaceMd),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    keywordController.clear();
                    context.read<PressReleasesCubit>().clearFilters();
                  },
                  icon: const Icon(Icons.clear, size: 16),
                  label: const Text('Clear Filters'),
                ),
              ),
            ],
          ],
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

    for (var year = currentYear; year >= currentYear - 10; year--) {
      years.add(DropdownMenuItem(value: year, child: Text(year.toString())));
    }

    return years;
  }
}
