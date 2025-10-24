import 'package:flutter/material.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';

class PaginationInfo extends StatelessWidget {
  const PaginationInfo({
    required this.currentPage,
    required this.totalPages,
    required this.totalItems,
    required this.itemsPerPage,
    super.key,
  });

  final int currentPage;
  final int totalPages;
  final int totalItems;
  final int itemsPerPage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final startItem = (currentPage - 1) * itemsPerPage + 1;
    final endItem =
        (currentPage * itemsPerPage > totalItems)
            ? totalItems
            : currentPage * itemsPerPage;

    return Container(
      padding: const EdgeInsets.all(AppSizes.spaceMd),
      child: Column(
        children: [
          Text(
            'Showing $startItem-$endItem of $totalItems items',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSizes.spaceXs),
          Text(
            'Page $currentPage of $totalPages',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class PaginationControls extends StatelessWidget {
  const PaginationControls({
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
    super.key,
    this.hasNextPage = false,
    this.hasPreviousPage = false,
  });

  final int currentPage;
  final int totalPages;
  final void Function(int) onPageChanged;
  final bool hasNextPage;
  final bool hasPreviousPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.spaceMd),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FilledButton.icon(
            onPressed:
                hasPreviousPage ? () => onPageChanged(currentPage - 1) : null,
            icon: const Icon(Icons.chevron_left),
            label: Text(context.t.shared.pagination.previous),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.spaceMd,
              vertical: AppSizes.spaceXs,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(AppSizes.radiusSm),
            ),
            child: Text(
              '$currentPage / $totalPages',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          FilledButton.icon(
            onPressed:
                hasNextPage ? () => onPageChanged(currentPage + 1) : null,
            iconAlignment: IconAlignment.end,
            icon: const Icon(Icons.chevron_right),
            label: Text(context.t.shared.pagination.next),
          ),
        ],
      ),
    );
  }
}

class SimplePaginationControls extends StatelessWidget {
  const SimplePaginationControls({
    required this.hasMore,
    required this.onLoadMore,
    super.key,
    this.isLoading = false,
    this.loadMoreText,
  });

  final bool hasMore;
  final VoidCallback onLoadMore;
  final bool isLoading;
  final String? loadMoreText;

  @override
  Widget build(BuildContext context) {
    if (!hasMore && !isLoading) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(AppSizes.spaceMd),
      child: Center(
        child:
            isLoading
                ? const CircularProgressIndicator()
                : FilledButton(
                  onPressed: hasMore ? onLoadMore : null,
                  child: Text(
                    loadMoreText ?? context.t.shared.pagination.loadMore,
                  ),
                ),
      ),
    );
  }
}

class RefreshIndicatorWrapper extends StatelessWidget {
  const RefreshIndicatorWrapper({
    required this.child,
    required this.onRefresh,
    super.key,
    this.color,
  });

  final Widget child;
  final Future<void> Function() onRefresh;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(onRefresh: onRefresh, color: color, child: child);
  }
}
