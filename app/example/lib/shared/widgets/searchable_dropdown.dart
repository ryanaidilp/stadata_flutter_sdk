import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';

/// A searchable dropdown widget with pagination support
/// Specifically designed for selecting items from large lists like news categories
class SearchableDropdown<T> extends StatefulWidget {
  const SearchableDropdown({
    required this.items,
    required this.onChanged,
    required this.displayText,
    required this.valueText,
    this.value,
    this.hint,
    this.searchHint,
    this.isLoading = false,
    this.errorText,
    this.maxHeight = 300,
    this.enabled = true,
    super.key,
  });

  /// List of items to display in dropdown
  final List<T> items;

  /// Callback when an item is selected
  final ValueChanged<T?> onChanged;

  /// Function to get display text for an item
  final String Function(T item) displayText;

  /// Function to get value text for an item (used for search)
  final String Function(T item) valueText;

  /// Currently selected value
  final T? value;

  /// Hint text when no item is selected
  final String? hint;

  /// Hint text for search field
  final String? searchHint;

  /// Whether the dropdown is in loading state
  final bool isLoading;

  /// Error text to display
  final String? errorText;

  /// Maximum height of the dropdown menu
  final double maxHeight;

  /// Whether the dropdown is enabled
  final bool enabled;

  @override
  State<SearchableDropdown<T>> createState() => _SearchableDropdownState<T>();
}

class _SearchableDropdownState<T> extends State<SearchableDropdown<T>> {
  late TextEditingController _searchController;
  List<T> _filteredItems = [];
  bool _isOpen = false;
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _filteredItems = widget.items;
  }

  @override
  void didUpdateWidget(SearchableDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.items != widget.items) {
      _filterItems('');
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _removeOverlay();
    super.dispose();
  }

  void _filterItems(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredItems = widget.items;
      } else {
        _filteredItems =
            widget.items
                .where(
                  (item) =>
                      widget
                          .displayText(item)
                          .toLowerCase()
                          .contains(query.toLowerCase()) ||
                      widget
                          .valueText(item)
                          .toLowerCase()
                          .contains(query.toLowerCase()),
                )
                .toList();
      }
    });
  }

  void _toggleDropdown() {
    if (_isOpen) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void _openDropdown() {
    if (!widget.enabled || widget.isLoading) return;

    setState(() {
      _isOpen = true;
    });

    _searchController.clear();
    _filterItems('');

    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _closeDropdown() {
    setState(() {
      _isOpen = false;
    });
    _removeOverlay();
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry() {
    final renderBox = context.findRenderObject()! as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder:
          (context) => Positioned(
            left: offset.dx,
            top: offset.dy + size.height + 5,
            width: size.width,
            child: CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(0.0, size.height + 5.0),
              child: Material(
                elevation: 4.0,
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: widget.maxHeight,
                    minHeight: 100,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Theme.of(
                        context,
                      ).colorScheme.outline.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Search field
                      Padding(
                        padding: const EdgeInsets.all(AppSizes.spaceSm),
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: widget.searchHint ?? 'Search...',
                            prefixIcon: const Icon(Icons.search),
                            border: const OutlineInputBorder(),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: AppSizes.spaceSm,
                              vertical: AppSizes.spaceSm,
                            ),
                          ),
                          onChanged: _filterItems,
                        ),
                      ),
                      const Divider(height: 1),
                      // Items list
                      Flexible(
                        child:
                            _filteredItems.isEmpty
                                ? Padding(
                                  padding: const EdgeInsets.all(
                                    AppSizes.spaceMd,
                                  ),
                                  child: Text(
                                    context
                                        .t
                                        .shared
                                        .searchableDropdown
                                        .noItemsFound,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium?.copyWith(
                                      color:
                                          Theme.of(
                                            context,
                                          ).colorScheme.onSurfaceVariant,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                                : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: _filteredItems.length,
                                  itemBuilder: (context, index) {
                                    final item = _filteredItems[index];
                                    final isSelected = widget.value == item;

                                    return ListTile(
                                      title: Text(
                                        widget.displayText(item),
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodyMedium?.copyWith(
                                          fontWeight:
                                              isSelected
                                                  ? FontWeight.w600
                                                  : FontWeight.normal,
                                        ),
                                      ),
                                      subtitle:
                                          widget.displayText(item) !=
                                                  widget.valueText(item)
                                              ? Text(
                                                'ID: ${widget.valueText(item)}',
                                                style: Theme.of(
                                                  context,
                                                ).textTheme.bodySmall?.copyWith(
                                                  color:
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .onSurfaceVariant,
                                                ),
                                              )
                                              : null,
                                      selected: isSelected,
                                      selectedTileColor: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withValues(alpha: 0.1),
                                      onTap: () {
                                        widget.onChanged(item);
                                        _closeDropdown();
                                      },
                                    );
                                  },
                                ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }

  String get _displayValue {
    if (widget.value != null) {
      return widget.displayText(widget.value as T);
    }
    return widget.hint ?? context.t.shared.searchableDropdown.selectItem;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: _toggleDropdown,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.spaceSm,
                vertical: AppSizes.spaceSm,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      widget.errorText != null
                          ? Theme.of(context).colorScheme.error
                          : Theme.of(context).colorScheme.outline,
                ),
                borderRadius: BorderRadius.circular(8.0),
                color:
                    widget.enabled
                        ? Theme.of(context).colorScheme.surface
                        : Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child:
                        widget.isLoading
                            ? Row(
                              children: [
                                const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                                const Gap(AppSizes.spaceSm),
                                Text(
                                  'Loading...',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium?.copyWith(
                                    color:
                                        Theme.of(
                                          context,
                                        ).colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            )
                            : Text(
                              _displayValue,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium?.copyWith(
                                color:
                                    widget.value != null
                                        ? Theme.of(
                                          context,
                                        ).colorScheme.onSurface
                                        : Theme.of(
                                          context,
                                        ).colorScheme.onSurfaceVariant,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                  ),
                  Icon(
                    _isOpen
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color:
                        widget.enabled
                            ? Theme.of(context).colorScheme.onSurfaceVariant
                            : Theme.of(
                              context,
                            ).colorScheme.onSurface.withValues(alpha: 0.38),
                  ),
                ],
              ),
            ),
          ),
          if (widget.errorText != null) ...[
            const Gap(AppSizes.spaceXs),
            Text(
              widget.errorText!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
