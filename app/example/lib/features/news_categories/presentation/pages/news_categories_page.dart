import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/core/navigation/app_router.dart';
import 'package:stadata_example/features/news_categories/presentation/cubit/news_categories_cubit.dart';
import 'package:stadata_example/features/news_categories/presentation/widgets/news_categories_parameters_panel.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';

@RoutePage()
class NewsCategoriesPage extends StatelessWidget {
  const NewsCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NewsCategoriesCubit>()..initialize(),
      child: const NewsCategoriesView(),
    );
  }
}

class NewsCategoriesView extends StatefulWidget {
  const NewsCategoriesView({super.key});

  @override
  State<NewsCategoriesView> createState() => _NewsCategoriesViewState();
}

class _NewsCategoriesViewState extends State<NewsCategoriesView> {
  final TextEditingController _domainController = TextEditingController(
    text: '7200',
  );

  @override
  void dispose() {
    _domainController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.newsCategories.title),
        actions: const [AliceButton()],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.spaceMd),
          child: Column(
            children: [
              // Parameters Panel
              NewsCategoriesParametersPanel(
                domainController: _domainController,
              ),

              const Gap(AppSizes.spaceLg),

              // Search Button
              const _NewsCategoriesSearchButton(),

              const Gap(AppSizes.spaceLg),

              // Educational Information
              const _NewsCategoriesEducationalInfo(),
            ],
          ),
        ),
      ),
    );
  }
}

class _NewsCategoriesSearchButton extends StatelessWidget {
  const _NewsCategoriesSearchButton();

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return BlocBuilder<NewsCategoriesCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<NewsCategoriesCubit>();

        return SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            onPressed:
                cubit.canLoadData
                    ? () {
                      unawaited(
                        context.router.push(
                          NewsCategoriesResultsRoute(
                            domain: cubit.currentDomain,
                            language: cubit.currentLanguage,
                          ),
                        ),
                      );
                    }
                    : null,
            icon: const Icon(Icons.search),
            label: Text(t.newsCategories.parameters.searchNewsCategories),
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.spaceLg,
                vertical: AppSizes.spaceMd,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _NewsCategoriesEducationalInfo extends StatelessWidget {
  const _NewsCategoriesEducationalInfo();

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSizes.spaceMd),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
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
                Icons.lightbulb_outline,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
              const Gap(AppSizes.spaceXs),
              Text(
                t.newsCategories.education.title,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const Gap(AppSizes.spaceSm),
          Text(
            t.newsCategories.education.description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap(AppSizes.spaceSm),
          _NewsCategoriesEducationPoint(
            title: t.newsCategories.education.parameters,
            description: t.newsCategories.education.parametersDescription,
          ),
          _NewsCategoriesEducationPoint(
            title: t.newsCategories.education.results,
            description: t.newsCategories.education.resultsDescription,
          ),
          _NewsCategoriesEducationPoint(
            title: t.newsCategories.education.categories,
            description: t.newsCategories.education.categoriesDescription,
          ),
        ],
      ),
    );
  }
}

class _NewsCategoriesEducationPoint extends StatelessWidget {
  const _NewsCategoriesEducationPoint({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.spaceXs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(top: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              shape: BoxShape.circle,
            ),
          ),
          const Gap(AppSizes.spaceXs),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                children: [
                  TextSpan(
                    text: '$title: ',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  TextSpan(text: description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
