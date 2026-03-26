import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/core/navigation/app_router.dart';
import 'package:stadata_example/features/news/presentation/cubit/news_cubit.dart';
import 'package:stadata_example/features/news/presentation/widgets/news_parameters_panel.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';

@RoutePage()
class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NewsCubit>()..initialize(),
      child: const NewsView(),
    );
  }
}

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  final TextEditingController _domainController = TextEditingController(
    text: '7200',
  );
  final TextEditingController _keywordController = TextEditingController();
  final TextEditingController _pageController = TextEditingController(
    text: '1',
  );

  @override
  void initState() {
    super.initState();

    // Listen to cubit changes to update page controller
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<NewsCubit>();
      _pageController.text = cubit.currentPage.toString();

      // Update page controller when cubit page changes
      _pageController.addListener(() {
        if (_pageController.text != cubit.currentPage.toString()) {
          _pageController.text = cubit.currentPage.toString();
        }
      });
    });
  }

  @override
  void dispose() {
    _domainController.dispose();
    _keywordController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return Scaffold(
      appBar: AppBar(title: Text(t.news.title), actions: const [AliceButton()]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.spaceMd),
          child: Column(
            children: [
              // Parameters Panel
              NewsParametersPanel(
                domainController: _domainController,
                keywordController: _keywordController,
                pageController: _pageController,
              ),

              const Gap(AppSizes.spaceLg),

              // Search Button
              const _NewsSearchButton(),

              const Gap(AppSizes.spaceLg),

              // Educational Information
              const _NewsEducationalInfo(),
            ],
          ),
        ),
      ),
    );
  }
}

class _NewsSearchButton extends StatelessWidget {
  const _NewsSearchButton();

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return BlocBuilder<NewsCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<NewsCubit>();

        return SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            onPressed:
                cubit.canLoadData
                    ? () {
                      unawaited(
                        context.router.push(
                          NewsResultsRoute(
                            domain: cubit.currentDomain,
                            language: cubit.currentLanguage,
                            keyword: cubit.keyword,
                            newsCategoryID: cubit.newsCategoryID,
                            month: cubit.month,
                            year: cubit.year,
                          ),
                        ),
                      );
                    }
                    : null,
            icon: const Icon(Icons.search),
            label: Text(t.news.parameters.searchNews),
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

class _NewsEducationalInfo extends StatelessWidget {
  const _NewsEducationalInfo();

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
                t.news.education.title,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const Gap(AppSizes.spaceSm),
          Text(
            t.news.education.description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap(AppSizes.spaceSm),
          _NewsEducationPoint(
            title: t.news.education.parameters,
            description: t.news.education.parametersDescription,
          ),
          _NewsEducationPoint(
            title: t.news.education.results,
            description: t.news.education.resultsDescription,
          ),
          _NewsEducationPoint(
            title: t.news.education.detail,
            description: t.news.education.detailDescription,
          ),
        ],
      ),
    );
  }
}

class _NewsEducationPoint extends StatelessWidget {
  const _NewsEducationPoint({required this.title, required this.description});

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
