import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

/// Repository interface for DerivedPeriod data access.
///
/// Defines the contract for retrieving derived period information from the BPS API.
abstract class DerivedPeriodRepository {
  /// Retrieves a list of derived periods from the BPS API.
  ///
  /// Parameters:
  ///   - [domain]: The area code for which to fetch derived periods
  ///   - [page]: Page number for pagination (default: 1)
  ///   - [lang]: Language preference (default: Indonesian)
  ///   - [variableID]: Optional variable ID to filter derived periods
  ///
  /// Returns a [Result] containing either:
  ///   - Success: [ApiResponse] with list of [DerivedPeriod] objects
  ///   - Failure: [Failure] object with error details
  Future<Result<Failure, ApiResponse<List<DerivedPeriod>>>> get({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    int? variableID,
  });
}
