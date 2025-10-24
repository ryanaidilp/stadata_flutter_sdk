import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/core/navigation/app_router.dart';
import 'package:stadata_example/features/statistical_classifications/presentation/cubit/statistical_classification_detail_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class StatisticalClassificationDetailPage extends StatelessWidget {
  const StatisticalClassificationDetailPage({
    required this.classification,
    super.key,
    this.language = DataLanguage.id,
  });

  final StatisticClassification classification;
  final DataLanguage language;

  @override
  Widget build(BuildContext context) {
    if (classification.type == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Classification type is required'),
        ),
      );
    }

    final id = classification.type!.urlParamGenerator(classification.id);

    return BlocProvider(
      create:
          (context) =>
              getIt<StatisticalClassificationDetailCubit>()
                ..initialize(
                  id: id,
                  type: classification.type!,
                  language: language,
                )
                ..loadData(),
      child: StatisticalClassificationDetailView(
        classification: classification,
      ),
    );
  }
}

class StatisticalClassificationDetailView extends StatefulWidget {
  const StatisticalClassificationDetailView({
    required this.classification,
    super.key,
  });

  final StatisticClassification classification;

  @override
  State<StatisticalClassificationDetailView> createState() =>
      _StatisticalClassificationDetailViewState();
}

class _StatisticalClassificationDetailViewState
    extends State<StatisticalClassificationDetailView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<StatisticalClassificationDetailCubit>().loadMore();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.statisticalClassifications.detail.title),
        actions: [
          // Language toggle
          BlocBuilder<StatisticalClassificationDetailCubit, BaseState>(
            builder: (context, state) {
              final cubit =
                  context.read<StatisticalClassificationDetailCubit>();
              return PopupMenuButton<DataLanguage>(
                icon: const Icon(Icons.language),
                tooltip: t.common.language,
                onSelected: (language) {
                  cubit.currentLanguage = language;
                  cubit.refresh();
                },
                itemBuilder:
                    (context) => [
                      PopupMenuItem(
                        value: DataLanguage.id,
                        child: Row(
                          children: [
                            if (cubit.currentLanguage == DataLanguage.id)
                              const Icon(Icons.check, size: 16),
                            if (cubit.currentLanguage == DataLanguage.id)
                              const Gap(AppSizes.spaceXs),
                            const Text('Bahasa Indonesia'),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: DataLanguage.en,
                        child: Row(
                          children: [
                            if (cubit.currentLanguage == DataLanguage.en)
                              const Icon(Icons.check, size: 16),
                            if (cubit.currentLanguage == DataLanguage.en)
                              const Gap(AppSizes.spaceXs),
                            const Text('English'),
                          ],
                        ),
                      ),
                    ],
              );
            },
          ),
          // Alice button
          const AliceButton(),
          // Refresh button
          BlocBuilder<StatisticalClassificationDetailCubit, BaseState>(
            builder: (context, state) {
              return IconButton(
                icon: const Icon(Icons.refresh),
                onPressed:
                    state is LoadingState
                        ? null
                        : () {
                          context
                              .read<StatisticalClassificationDetailCubit>()
                              .refresh();
                        },
                tooltip: t.common.refresh,
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Header with parent classification info
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSizes.spaceMd),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withOpacity(0.3),
              border: Border(
                bottom: BorderSide(
                  color: theme.colorScheme.outline.withOpacity(0.2),
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.spaceSm,
                        vertical: AppSizes.spaceXs,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                      ),
                      child: Text(
                        widget.classification.id,
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: theme.colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Gap(AppSizes.spaceSm),
                    Expanded(
                      child: Text(
                        widget.classification.title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                if (widget.classification.description.isNotEmpty) ...[
                  const Gap(AppSizes.spaceSm),
                  Text(
                    widget.classification.description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),

          // Children list
          Expanded(
            child: BlocBuilder<StatisticalClassificationDetailCubit, BaseState>(
              builder: _buildContent,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, BaseState state) {
    final t = LocaleSettings.instance.currentTranslations;

    return switch (state) {
      InitialState() => const Center(child: Text('Initializing...')),
      LoadingState() => const LoadingWidget(),
      final PaginatedState<StatisticClassification> state => _buildChildrenList(
        context,
        state,
      ),
      final ErrorState state => ErrorStateWidget(
        message: state.message,
        onRetry: () {
          context.read<StatisticalClassificationDetailCubit>().refresh();
        },
      ),
      _ => Center(child: Text(t.common.unknownState)),
    };
  }

  Widget _buildChildrenList(
    BuildContext context,
    PaginatedState<StatisticClassification> state,
  ) {
    final t = LocaleSettings.instance.currentTranslations;

    if (state.items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.category_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.outline,
            ),
            const Gap(AppSizes.spaceMd),
            Text(
              t.statisticalClassifications.detail.noChildren,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        await context.read<StatisticalClassificationDetailCubit>().refresh();
      },
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.all(AppSizes.spaceMd),
        itemCount: state.items.length + (state.isLoadingMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index >= state.items.length) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(AppSizes.spaceMd),
                child: CircularProgressIndicator(),
              ),
            );
          }

          final child = state.items[index];
          return _buildChildCard(context, child);
        },
      ),
    );
  }

  Widget _buildChildCard(
    BuildContext context,
    StatisticClassification child,
  ) {
    final theme = Theme.of(context);
    final t = LocaleSettings.instance.currentTranslations;

    String getLevelLabel(ClassificationLevel? level) {
      if (level == null) return '-';
      if (level is KBLILevel) {
        return switch (level) {
          KBLILevel.category => t.statisticalClassifications.levels.category,
          KBLILevel.primaryGroup =>
            t.statisticalClassifications.levels.primaryGroup,
          KBLILevel.group => t.statisticalClassifications.levels.group,
          KBLILevel.subGroup => t.statisticalClassifications.levels.subGroup,
          KBLILevel.cluster => t.statisticalClassifications.levels.cluster,
        };
      }
      return level.value;
    }

    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: AppSizes.spaceSm),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        side: BorderSide(
          color: theme.colorScheme.outline.withOpacity(0.3),
        ),
      ),
      child: InkWell(
        onTap: () {
          // Navigate to child's detail page if it has children
          if (child.type != null) {
            context.router.push(
              StatisticalClassificationDetailRoute(
                classification: child,
                language:
                    context
                        .read<StatisticalClassificationDetailCubit>()
                        .currentLanguage,
              ),
            );
          }
        },
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.spaceMd),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.spaceXs,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                    ),
                    child: Text(
                      child.id,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSecondaryContainer,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Gap(AppSizes.spaceXs),
                  Expanded(
                    child: Text(
                      child.title,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (child.type != null)
                    Icon(
                      Icons.chevron_right,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                ],
              ),
              if (child.level != null) ...[
                const Gap(AppSizes.spaceXs),
                Chip(
                  label: Text(
                    getLevelLabel(child.level),
                    style: theme.textTheme.labelSmall,
                  ),
                  backgroundColor: Colors.purple.shade50,
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ],
              if (child.description.isNotEmpty) ...[
                const Gap(AppSizes.spaceSm),
                Text(
                  child.description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
