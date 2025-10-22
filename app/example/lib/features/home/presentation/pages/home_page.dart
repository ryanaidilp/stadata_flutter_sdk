import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/core/localization/widgets/app_bar_language_switcher.dart';
import 'package:stadata_example/core/navigation/app_router.dart';
import 'package:stadata_example/features/home/presentation/cubit/home_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/custom_card.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..initialize(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.app.title),
        centerTitle: true,
        actions: const [AliceButton(), AppBarLanguageSwitcher()],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.spaceMd),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppSizes.spaceLg),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        theme.colorScheme.primaryContainer,
                        theme.colorScheme.primaryContainer.withValues(
                          alpha: 0.8,
                        ),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t.home.title,
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                      ),
                      const Gap(AppSizes.spaceXs),
                      Text(
                        t.home.subtitle,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                      ),
                      const Gap(AppSizes.spaceMd),
                      Text(
                        t.home.description,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),

                const Gap(AppSizes.spaceLg),

                // Features Section
                Text(
                  t.home.features.title,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(AppSizes.spaceMd),

                // List API Features
                _buildFeatureSection(
                  context,
                  title: t.listApi.title,
                  subtitle: t.listApi.subtitle,
                  features: [
                    _FeatureItem(
                      title: t.listApi.sections.censusEvents.title,
                      description: t.listApi.sections.censusEvents.description,
                      icon: Icons.event_note,
                      color: Colors.cyan,
                      onTap:
                          () => context.router.push(const CensusEventsRoute()),
                    ),
                    _FeatureItem(
                      title: t.listApi.sections.censusTopics.title,
                      description: t.listApi.sections.censusTopics.description,
                      icon: Icons.topic_outlined,
                      color: Colors.teal,
                      onTap:
                          () => context.router.push(
                            const CensusTopicsParametersRoute(),
                          ),
                    ),
                    _FeatureItem(
                      title: t.listApi.sections.censusDatasets.title,
                      description:
                          t.listApi.sections.censusDatasets.description,
                      icon: Icons.dataset_outlined,
                      color: Colors.deepPurple,
                      onTap:
                          () => context.router.push(
                            const CensusDatasetsParametersRoute(),
                          ),
                    ),
                    _FeatureItem(
                      title: t.listApi.sections.censusData.title,
                      description: t.listApi.sections.censusData.description,
                      icon: Icons.storage_outlined,
                      color: Colors.indigo,
                      onTap:
                          () => context.router.push(
                            const CensusDataParametersRoute(),
                          ),
                    ),
                    _FeatureItem(
                      title: t.listApi.sections.censusAreas.title,
                      description: t.listApi.sections.censusAreas.description,
                      icon: Icons.map_outlined,
                      color: Colors.teal,
                      onTap:
                          () => context.router.push(
                            const CensusAreasParametersRoute(),
                          ),
                    ),
                    _FeatureItem(
                      title: t.listApi.sections.domains.title,
                      description: t.listApi.sections.domains.description,
                      icon: Icons.location_on,
                      color: Colors.blue,
                      onTap: () => context.router.push(const DomainsRoute()),
                    ),
                    _FeatureItem(
                      title: t.listApi.sections.infographics.title,
                      description: t.listApi.sections.infographics.description,
                      icon: Icons.photo_library,
                      color: Colors.purple,
                      onTap:
                          () => context.router.push(const InfographicsRoute()),
                    ),
                    _FeatureItem(
                      title: t.listApi.sections.news.title,
                      description: t.listApi.sections.news.description,
                      icon: Icons.article,
                      color: Colors.orange,
                      onTap: () => context.router.push(const NewsRoute()),
                    ),
                    _FeatureItem(
                      title: t.listApi.sections.newsCategories.title,
                      description:
                          t.listApi.sections.newsCategories.description,
                      icon: Icons.category,
                      color: Colors.teal,
                      onTap:
                          () =>
                              context.router.push(const NewsCategoriesRoute()),
                    ),
                    _FeatureItem(
                      title: t.listApi.sections.pressReleases.title,
                      description: t.listApi.sections.pressReleases.description,
                      icon: Icons.announcement,
                      color: Colors.red,
                      onTap:
                          () => context.router.push(const PressReleasesRoute()),
                    ),
                    _FeatureItem(
                      title: t.listApi.sections.publications.title,
                      description: t.listApi.sections.publications.description,
                      icon: Icons.book,
                      color: Colors.green,
                      onTap:
                          () => context.router.push(const PublicationsRoute()),
                    ),
                    _FeatureItem(
                      title:
                          t.listApi.sections.statisticalClassifications.title,
                      description:
                          t
                              .listApi
                              .sections
                              .statisticalClassifications
                              .description,
                      icon: Icons.business,
                      color: Colors.indigo,
                      onTap:
                          () => context.router.push(
                            const StatisticalClassificationsRoute(),
                          ),
                    ),
                    _FeatureItem(
                      title: t.listApi.sections.strategicIndicators.title,
                      description:
                          t.listApi.sections.strategicIndicators.description,
                      icon: Icons.trending_up,
                      color: Colors.amber,
                      onTap:
                          () => context.router.push(
                            const StrategicIndicatorsRoute(),
                          ),
                    ),
                    _FeatureItem(
                      title: t.listApi.sections.subjectCategories.title,
                      description:
                          t.listApi.sections.subjectCategories.description,
                      icon: Icons.category,
                      color: Colors.deepPurple,
                      onTap:
                          () => context.router.push(
                            const SubjectCategoriesRoute(),
                          ),
                    ),
                    _FeatureItem(
                      title: t.listApi.sections.subjects.title,
                      description: t.listApi.sections.subjects.description,
                      icon: Icons.topic,
                      color: Colors.purple,
                      onTap: () => context.router.push(const SubjectsRoute()),
                    ),
                    _FeatureItem(
                      title: t.listApi.sections.variables.title,
                      description: t.listApi.sections.variables.description,
                      icon: Icons.bar_chart,
                      color: Colors.deepOrange,
                      onTap: () => context.router.push(const VariablesRoute()),
                    ),
                    _FeatureItem(
                      title: t.listApi.sections.verticalVariables.title,
                      description:
                          t.listApi.sections.verticalVariables.description,
                      icon: Icons.view_column,
                      color: Colors.teal,
                      onTap:
                          () => context.router.push(
                            const VerticalVariablesRoute(),
                          ),
                    ),
                    _FeatureItem(
                      title: t.listApi.sections.units.title,
                      description: t.listApi.sections.units.description,
                      icon: Icons.straighten,
                      color: Colors.cyan,
                      onTap: () => context.router.push(const UnitsRoute()),
                    ),
                    // Dynamic tables feature temporarily disabled
                    // _FeatureItem(
                    //   title: t.listApi.sections.dynamicTables.title,
                    //   description: t.listApi.sections.dynamicTables.description,
                    //   icon: Icons.table_chart,
                    //   color: Colors.green,
                    //   onTap: () => context.router.pushPath('/dynamic-tables'),
                    // ),
                  ]..sort((a, b) => a.title.compareTo(b.title)),
                ),

                const Gap(AppSizes.spaceLg),

                // Quick Info Section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppSizes.spaceMd),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                    border: Border.all(
                      color: theme.colorScheme.outline.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: theme.colorScheme.onSurfaceVariant,
                            size: AppSizes.iconMd,
                          ),
                          const Gap(AppSizes.spaceXs),
                          Text(
                            t.home.aboutDemo.title,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                      const Gap(AppSizes.spaceXs),
                      Text(
                        t.home.aboutDemo.description,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),

                const Gap(AppSizes.spaceXl),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFeatureSection(
    BuildContext context, {
    required String title,
    required String subtitle,
    required List<_FeatureItem> features,
  }) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const Gap(AppSizes.spaceXs),
        Text(
          subtitle,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const Gap(AppSizes.spaceMd),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
            childAspectRatio:
                MediaQuery.of(context).size.width > 600 ? 1.0 : 1.0,
            crossAxisSpacing: AppSizes.spaceMd,
            mainAxisSpacing: AppSizes.spaceMd,
          ),
          itemCount: features.length,
          itemBuilder: (context, index) {
            final feature = features[index];
            return FeatureCard(
              title: feature.title,
              description: feature.description,
              icon: feature.icon,
              color: feature.color,
              onTap: feature.onTap,
            );
          },
        ),
      ],
    );
  }
}

class _FeatureItem {
  const _FeatureItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    this.onTap,
  });

  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;
}
