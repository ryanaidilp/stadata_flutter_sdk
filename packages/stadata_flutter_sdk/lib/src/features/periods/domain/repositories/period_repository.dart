import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

/// Repository interface for Period data access.
///
/// Defines the contract for retrieving time period information from the BPS API.
/// This abstraction allows for different implementations (remote, local cache, etc.)
/// while maintaining a consistent interface for the domain layer.
abstract class PeriodRepository {
  /// Retrieves a list of periods from the BPS API.
  ///
  /// Parameters:
  ///   - [domain]: The area code for which to fetch periods (e.g., '0000' for national)
  ///   - [page]: Page number for pagination (default: 1)
  ///   - [lang]: Language preference (default: Indonesian)
  ///   - [variableID]: Optional variable ID to filter periods for specific variable
  ///
  /// Returns a [Result] containing either:
  ///   - Success: [ApiResponse] with list of [Period] objects
  ///   - Failure: [Failure] object with error details
  Future<Result<Failure, ApiResponse<List<Period>>>> get({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    int? variableID,
  });
}
