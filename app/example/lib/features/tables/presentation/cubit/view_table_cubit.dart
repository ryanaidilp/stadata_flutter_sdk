import 'package:injectable/injectable.dart';
import 'package:stadata_example/features/tables/presentation/cubit/view_table_state.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

/// Cubit for managing unified table view routing logic.
///
/// Determines table type at runtime and manages routing to appropriate
/// display implementations (Static/Dynamic/Simdasi). Follows the all_stats
/// pattern where a single ViewTable widget routes based on metadata.
@injectable
class ViewTableCubit extends BaseCubit<ViewTableState> {
  ViewTableCubit(this._stadataFlutter) : super(const ViewTableInitial());

  final StadataFlutter _stadataFlutter;

  /// Loads table metadata and determines routing destination.
  ///
  /// Queries the unified table metadata API to determine the table type
  /// at runtime, then emits the appropriate state to trigger navigation.
  ///
  /// Flow:
  /// 1. Emit loading state
  /// 2. Fetch table metadata from SDK
  /// 3. Based on metadata.type, emit:
  ///    - ViewTableShowStatic for static tables
  ///    - ViewTableShowDynamic for dynamic tables
  ///    - ViewTableShowSimdasi for simdasi tables
  /// 4. On error, emit ViewTableError
  Future<void> loadTableMetadata({
    required String tableId,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    emit(const ViewTableLoading());

    try {
      // Fetch metadata using SDK's unified table API
      final result = await _stadataFlutter.list.getTableMetadata(
        id: tableId,
        domain: domain,
        lang: lang,
      );

      result.when(
        success: (metadata) {
          // Route based on determined table type
          if (metadata.isStatic) {
            emit(
              ViewTableShowStatic(
                tableId: int.tryParse(tableId) ?? 0,
                domain: domain,
                lang: lang,
                metadata: metadata,
              ),
            );
          } else if (metadata.isDynamic) {
            emit(
              ViewTableShowDynamic(
                tableId: int.tryParse(tableId) ?? 0,
                domain: domain,
                lang: lang,
                metadata: metadata,
              ),
            );
          } else if (metadata.isSimdasi) {
            emit(
              ViewTableShowSimdasi(
                tableId: tableId,
                domain: domain,
                lang: lang,
                metadata: metadata,
              ),
            );
          } else {
            emit(
              const ViewTableError(
                'Unknown table type - cannot determine display route',
              ),
            );
          }
        },
        failure: (error) {
          emit(ViewTableError(error.message));
        },
      );
    } on Exception catch (error) {
      emit(ViewTableError(error.toString()));
    }
  }

  /// Resets the cubit to initial state.
  void reset() {
    emit(const ViewTableInitial());
  }
}
