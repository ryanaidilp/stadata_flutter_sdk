import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/infographics/presentation/cubit/infographics_results_cubit.dart';
import 'package:stadata_example/features/infographics/presentation/widgets/infographics_results_section.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/html_text_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_example/shared/widgets/results_common_widgets.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class InfographicsResultsPage extends StatelessWidget {
  const InfographicsResultsPage({
    required this.domain,
    required this.language,
    super.key,
    this.keyword,
  });

  final String domain;
  final DataLanguage language;
  final String? keyword;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              getIt<InfographicsResultsCubit>()..initialize(
                domain: domain,
                language: language,
                keyword: keyword,
              ),
      child: const InfographicsResultsView(),
    );
  }
}

class InfographicsResultsView extends StatefulWidget {
  const InfographicsResultsView({super.key});

  @override
  State<InfographicsResultsView> createState() =>
      _InfographicsResultsViewState();
}

class _InfographicsResultsViewState extends State<InfographicsResultsView> {
  final TextEditingController _pageController = TextEditingController(
    text: '1',
  );

  @override
  void initState() {
    super.initState();

    // Listen to cubit changes to update page controller
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<InfographicsResultsCubit>();
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
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.infographics.results.title),
        actions: [
          // Language display
          BlocBuilder<InfographicsResultsCubit, BaseState>(
            builder: (context, state) {
              final cubit = context.read<InfographicsResultsCubit>();
              return Chip(
                avatar: const Icon(Icons.language, size: 16),
                label: Text(
                  cubit.currentLanguage == DataLanguage.id ? 'ID' : 'EN',
                ),
                backgroundColor:
                    Theme.of(context).colorScheme.secondaryContainer,
              );
            },
          ),
          const Gap(AppSizes.spaceXs),
          // Alice button
          const AliceButton(),
          // Refresh button
          BlocBuilder<InfographicsResultsCubit, BaseState>(
            builder: (context, state) {
              return IconButton(
                icon: const Icon(Icons.refresh),
                onPressed:
                    state is LoadingState
                        ? null
                        : () {
                          unawaited(
                            context.read<InfographicsResultsCubit>().refresh(),
                          );
                        },
                tooltip: t.common.refresh,
              );
            },
          ),
        ],
      ),
      body: BlocListener<InfographicsResultsCubit, BaseState>(
        listener: (context, state) {
          // Update page controller when cubit page changes
          final cubit = context.read<InfographicsResultsCubit>();
          if (_pageController.text != cubit.currentPage.toString()) {
            _pageController.text = cubit.currentPage.toString();
          }
        },
        child: CustomScrollView(
          slivers: [
            // Search Parameters Summary
            const SliverToBoxAdapter(child: _InfographicsParametersSummary()),

            // Results Section
            BlocBuilder<InfographicsResultsCubit, BaseState>(
              builder:
                  (context, state) => _InfographicsContentSliver(
                    state: state,
                    pageController: _pageController,
                    onShowInfographicDetails: _showInfographicDetails,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  void _showInfographicDetails(BuildContext context, Infographic infographic) {
    unawaited(
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder:
            (context) => DraggableScrollableSheet(
              initialChildSize: 0.9,
              minChildSize: 0.5,
              maxChildSize: 0.95,
              builder:
                  (context, scrollController) => Container(
                    padding: const EdgeInsets.all(AppSizes.spaceLg),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header
                          Row(
                            children: [
                              Icon(
                                Icons.photo,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              const Gap(AppSizes.spaceXs),
                              Expanded(
                                child: Text(
                                  infographic.title,
                                  style: Theme.of(context).textTheme.titleLarge
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          const Gap(AppSizes.spaceLg),

                          // Image preview
                          if (infographic.image.isNotEmpty) ...[
                            Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.surfaceContainerHighest,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  infographic.image,
                                  fit: BoxFit.cover,
                                  errorBuilder:
                                      (context, error, stackTrace) => Center(
                                        child: Icon(
                                          Icons.broken_image,
                                          size: 48,
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.onSurfaceVariant,
                                        ),
                                      ),
                                  loadingBuilder: (
                                    context,
                                    child,
                                    loadingProgress,
                                  ) {
                                    if (loadingProgress == null) return child;
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const Gap(AppSizes.spaceLg),
                          ],

                          // Details
                          _InfographicDetailRow(
                            label: 'ID',
                            value: infographic.id.toString(),
                          ),
                          _InfographicDetailRow(
                            label: 'Title',
                            value: infographic.title,
                          ),
                          _InfographicDetailRow(
                            label: 'Category',
                            value: infographic.category.toString(),
                          ),
                          if (infographic.description != null)
                            _InfographicDetailRowWithHtml(
                              label: 'Description',
                              value: infographic.description!,
                            ),
                          _InfographicDetailRow(
                            label: 'Download URL',
                            value: infographic.downloadUrl,
                          ),
                          _InfographicDetailRow(
                            label: 'Image URL',
                            value: infographic.image,
                          ),

                          const Gap(AppSizes.spaceLg),

                          // Action buttons
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed:
                                      () => _launchUrl(infographic.downloadUrl),
                                  icon: const Icon(Icons.download),
                                  label: const Text('Download'),
                                ),
                              ),
                              const Gap(AppSizes.spaceMd),
                              Expanded(
                                child: FilledButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('Close'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
            ),
      ),
    );
  }

  void _launchUrl(String url) {
    // In a real app, you would use url_launcher package
    // For now, we'll just show a message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Would open: $url'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

class _InfographicsParametersSummary extends StatelessWidget {
  const _InfographicsParametersSummary();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfographicsResultsCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<InfographicsResultsCubit>();
        final t = LocaleSettings.instance.currentTranslations;
        final theme = Theme.of(context);

        return ResultsParametersPanel(
          title: t.infographics.results.searchParameters,
          margin: const EdgeInsets.all(AppSizes.spaceMd),
          backgroundColor: theme.colorScheme.surfaceContainerHighest,
          headerBottomSpacing: AppSizes.spaceSm,
          chipSpacing: AppSizes.spaceXs,
          chips: [
            ResultsParameterChip(
              text: 'Domain: ${cubit.currentDomain}',
              backgroundColor: theme.colorScheme.secondaryContainer,
              labelStyle: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSecondaryContainer,
              ),
              visualDensity: VisualDensity.compact,
            ),
            ResultsParameterChip(
              text:
                  'Language: ${cubit.currentLanguage == DataLanguage.id ? 'ID' : 'EN'}',
              backgroundColor: theme.colorScheme.secondaryContainer,
              labelStyle: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSecondaryContainer,
              ),
              visualDensity: VisualDensity.compact,
            ),
            if (cubit.keyword != null)
              ResultsParameterChip(
                text: 'Keyword: ${cubit.keyword!}',
                backgroundColor: theme.colorScheme.secondaryContainer,
                labelStyle: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSecondaryContainer,
                ),
                visualDensity: VisualDensity.compact,
              ),
          ],
        );
      },
    );
  }
}

class _InfographicsContentSliver extends StatelessWidget {
  const _InfographicsContentSliver({
    required this.state,
    required this.pageController,
    required this.onShowInfographicDetails,
  });

  final BaseState state;
  final TextEditingController pageController;
  final void Function(BuildContext context, Infographic infographic)
  onShowInfographicDetails;

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return switch (state) {
      InitialState() => const SliverToBoxAdapter(
        child: Center(child: Text('Initializing...')),
      ),
      LoadingState() => const SliverToBoxAdapter(child: LoadingWidget()),
      final LoadedState<List<Infographic>> loadedState => SliverToBoxAdapter(
        child: InfographicsResultsSection(
          state: loadedState,
          pageController: pageController,
          onShowInfographicDetails: onShowInfographicDetails,
        ),
      ),
      final ErrorState errorState => SliverToBoxAdapter(
        child: ErrorStateWidget(
          message: errorState.message,
          onRetry: () {
            unawaited(context.read<InfographicsResultsCubit>().refresh());
          },
        ),
      ),
      _ => SliverToBoxAdapter(
        child: Center(child: Text(t.common.unknownState)),
      ),
    };
  }
}

class _InfographicDetailRow extends StatelessWidget {
  const _InfographicDetailRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.spaceSm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const Gap(AppSizes.spaceXs),
          Expanded(
            child: Text(value, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}

class _InfographicDetailRowWithHtml extends StatelessWidget {
  const _InfographicDetailRowWithHtml({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.spaceSm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const Gap(AppSizes.spaceXs),
          Expanded(
            child: HtmlTextWidget(
              data: value,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
