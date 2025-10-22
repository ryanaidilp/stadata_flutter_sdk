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
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';

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
      appBar: AppBar(title: Text(t.news.title), actions: [const AliceButton()]),
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
              _buildSearchButton(context),

              const Gap(AppSizes.spaceLg),

              // Educational Information
              _buildEducationalInfo(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchButton(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return BlocBuilder<NewsCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<NewsCubit>();
        final canSearch = cubit.canLoadData;

        return SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            onPressed:
                canSearch ? () => _navigateToResults(context, cubit) : null,
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

  Widget _buildEducationalInfo(BuildContext context) {
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
          _buildEducationPoint(
            context,
            t.news.education.parameters,
            t.news.education.parametersDescription,
          ),
          _buildEducationPoint(
            context,
            t.news.education.results,
            t.news.education.resultsDescription,
          ),
          _buildEducationPoint(
            context,
            t.news.education.detail,
            t.news.education.detailDescription,
          ),
        ],
      ),
    );
  }

  Widget _buildEducationPoint(
    BuildContext context,
    String title,
    String description,
  ) {
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

  void _navigateToResults(BuildContext context, NewsCubit cubit) {
    context.router.push(
      NewsResultsRoute(
        domain: cubit.currentDomain,
        language: cubit.currentLanguage,
        keyword: cubit.keyword,
        newsCategoryID: cubit.newsCategoryID,
        month: cubit.month,
        year: cubit.year,
      ),
    );
  }
}
