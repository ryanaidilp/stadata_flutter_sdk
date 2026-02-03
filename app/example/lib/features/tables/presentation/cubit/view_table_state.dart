import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

/// Base state for unified table view routing.
///
/// States represent the routing decisions made after determining
/// table type at runtime. The ViewTable widget reacts to these
/// states to navigate to appropriate table display implementations.
sealed class ViewTableState extends BaseState {
  const ViewTableState();

  @override
  List<Object?> get props => [];
}

/// Initial state before any table metadata is loaded.
class ViewTableInitial extends ViewTableState {
  const ViewTableInitial();
}

/// Loading state while fetching table metadata.
class ViewTableLoading extends ViewTableState {
  const ViewTableLoading();
}

/// Route to static table detail page.
///
/// Emitted when metadata indicates the table is a static table.
/// Contains all necessary information to display the static table.
class ViewTableShowStatic extends ViewTableState {
  const ViewTableShowStatic({
    required this.tableId,
    required this.domain,
    required this.lang,
    required this.metadata,
  });

  final int tableId;
  final String domain;
  final DataLanguage lang;
  final TableMetadata metadata;

  @override
  List<Object?> get props => [tableId, domain, lang, metadata];
}

/// Route to dynamic table parameters page.
///
/// Emitted when metadata indicates the table is a dynamic table.
/// Dynamic tables require parameter selection before displaying data.
class ViewTableShowDynamic extends ViewTableState {
  const ViewTableShowDynamic({
    required this.tableId,
    required this.domain,
    required this.lang,
    required this.metadata,
  });

  final int tableId;
  final String domain;
  final DataLanguage lang;
  final TableMetadata metadata;

  @override
  List<Object?> get props => [tableId, domain, lang, metadata];
}

/// Route to simdasi table page.
///
/// Emitted when metadata indicates the table is a simdasi table.
/// Simdasi tables have specialized display requirements.
class ViewTableShowSimdasi extends ViewTableState {
  const ViewTableShowSimdasi({
    required this.tableId,
    required this.domain,
    required this.lang,
    required this.metadata,
  });

  final String tableId;
  final String domain;
  final DataLanguage lang;
  final TableMetadata metadata;

  @override
  List<Object?> get props => [tableId, domain, lang, metadata];
}

/// Error state when table metadata cannot be loaded or determined.
class ViewTableError extends ViewTableState {
  const ViewTableError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
