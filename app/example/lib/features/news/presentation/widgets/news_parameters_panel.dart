import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/news/presentation/cubit/news_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/searchable_dropdown.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

/// A reusable parameters panel widget for news configuration
class NewsParametersPanel extends StatelessWidget {
  const NewsParametersPanel({
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

    return BlocBuilder<NewsCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<NewsCubit>();

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
                    t.news.parameters.title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const Gap(AppSizes.spaceMd),

              // Domain Input
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${t.news.parameters.domain} *',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(AppSizes.spaceXs),
                  TextFormField(
                    controller: domainController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: t.news.parameters.domainHint,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.spaceSm,
                        vertical: AppSizes.spaceSm,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      context.read<NewsCubit>().changeDomain(value);
                    },
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    'Enter the domain code for news filtering',
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
                    t.news.parameters.keyword,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(AppSizes.spaceXs),
                  TextFormField(
                    controller: keywordController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: t.news.parameters.keywordHint,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.spaceSm,
                        vertical: AppSizes.spaceSm,
                      ),
                    ),
                    onChanged: (value) {
                      context.read<NewsCubit>().setKeyword(value);
                    },
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    'Optional keyword to filter news articles',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),

              const Gap(AppSizes.spaceMd),

              // News Category Dropdown (optional)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.news.parameters.category,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(AppSizes.spaceXs),
                  SearchableDropdown<NewsCategory>(
                    items: cubit.newsCategories,
                    value: cubit.newsCategories
                        .cast<NewsCategory?>()
                        .firstWhere(
                          (category) => category?.id == cubit.newsCategoryID,
                          orElse: () => null,
                        ),
                    onChanged: (category) {
                      context.read<NewsCubit>().setNewsCategoryID(category?.id);
                    },
                    displayText: (category) => category.name,
                    valueText: (category) => category.id,
                    hint: t.news.parameters.categoryHint,
                    searchHint: 'Search categories...',
                    isLoading: cubit.categoriesLoading,
                    errorText: cubit.categoriesError,
                    enabled:
                        cubit.newsCategories.isNotEmpty ||
                        cubit.categoriesLoading,
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    'Optional news category filter',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),

              const Gap(AppSizes.spaceMd),

              // Date Filters Row
              Row(
                children: [
                  // Month Selector
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          t.news.parameters.month,
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
                          hint: Text(t.news.parameters.monthHint),
                          menuMaxHeight: 300,
                          isExpanded: true,
                          items: List.generate(12, (index) {
                            final month = index + 1;
                            return DropdownMenuItem(
                              value: month,
                              child: Text(
                                month.toString().padLeft(2, '0'),
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          }),
                          onChanged: (month) {
                            context.read<NewsCubit>().setMonth(month);
                          },
                        ),
                      ],
                    ),
                  ),
                  const Gap(AppSizes.spaceMd),
                  // Year Selector
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          t.news.parameters.year,
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
                          hint: Text(t.news.parameters.yearHint),
                          menuMaxHeight: 300,
                          isExpanded: true,
                          items: List.generate(10, (index) {
                            final year = DateTime.now().year - index;
                            return DropdownMenuItem(
                              value: year,
                              child: Text(
                                year.toString(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          }),
                          onChanged: (year) {
                            context.read<NewsCubit>().setYear(year);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const Gap(AppSizes.spaceMd),

              // Page Input
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.news.parameters.page,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(AppSizes.spaceXs),
                  TextFormField(
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
                      final page = int.tryParse(value);
                      if (page != null && page > 0) {
                        context.read<NewsCubit>().setPage(page);
                      }
                    },
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    'Page number for pagination',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),

              const Gap(AppSizes.spaceMd),

              // Language Selector
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.news.parameters.language,
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
                    onChanged: (DataLanguage? value) {
                      if (value != null) {
                        context.read<NewsCubit>().changeLanguage(value);
                      }
                    },
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    t.news.parameters.languageNote,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
