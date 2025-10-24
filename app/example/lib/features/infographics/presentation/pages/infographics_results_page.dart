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
                          context.read<InfographicsResultsCubit>().refresh();
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
            SliverToBoxAdapter(child: _buildParametersSummary()),

            // Results Section
            BlocBuilder<InfographicsResultsCubit, BaseState>(
              builder: _buildContentSliver,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildParametersSummary() {
    return BlocBuilder<InfographicsResultsCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<InfographicsResultsCubit>();
        final t = LocaleSettings.instance.currentTranslations;

        return Container(
          width: double.infinity,
          margin: const EdgeInsets.all(AppSizes.spaceMd),
          padding: const EdgeInsets.all(AppSizes.spaceMd),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
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
              Row(
                children: [
                  Icon(
                    Icons.search,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    t.infographics.results.searchParameters,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const Gap(AppSizes.spaceSm),
              Wrap(
                spacing: AppSizes.spaceXs,
                runSpacing: AppSizes.spaceXs,
                children: [
                  _buildParameterChip(context, 'Domain', cubit.currentDomain),
                  _buildParameterChip(
                    context,
                    'Language',
                    cubit.currentLanguage == DataLanguage.id ? 'ID' : 'EN',
                  ),
                  if (cubit.keyword != null)
                    _buildParameterChip(context, 'Keyword', cubit.keyword!),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildParameterChip(BuildContext context, String label, String value) {
    return Chip(
      label: Text('$label: $value'),
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
        color: Theme.of(context).colorScheme.onSecondaryContainer,
      ),
      visualDensity: VisualDensity.compact,
    );
  }

  Widget _buildContentSliver(BuildContext context, BaseState state) {
    return switch (state) {
      InitialState() => const SliverToBoxAdapter(
        child: Center(child: Text('Initializing...')),
      ),
      LoadingState() => const SliverToBoxAdapter(child: LoadingWidget()),
      final LoadedState<List<Infographic>> state => SliverToBoxAdapter(
        child: InfographicsResultsSection(
          state: state,
          pageController: _pageController,
          onShowInfographicDetails: _showInfographicDetails,
        ),
      ),
      final ErrorState state => SliverToBoxAdapter(
        child: ErrorStateWidget(
          message: state.message,
          onRetry: () {
            context.read<InfographicsResultsCubit>().refresh();
          },
        ),
      ),
      _ => SliverToBoxAdapter(
        child: Center(child: Text(t.common.unknownState)),
      ),
    };
  }

  void _showInfographicDetails(BuildContext context, Infographic infographic) {
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
                        _buildDetailRow(
                          context,
                          'ID',
                          infographic.id.toString(),
                        ),
                        _buildDetailRow(context, 'Title', infographic.title),
                        _buildDetailRow(
                          context,
                          'Category',
                          infographic.category.toString(),
                        ),
                        if (infographic.description != null)
                          _buildDetailRowWithHtml(
                            context,
                            'Description',
                            infographic.description!,
                          ),
                        _buildDetailRow(
                          context,
                          'Download URL',
                          infographic.downloadUrl,
                        ),
                        _buildDetailRow(
                          context,
                          'Image URL',
                          infographic.image,
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
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
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

  Widget _buildDetailRowWithHtml(
    BuildContext context,
    String label,
    String value,
  ) {
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
