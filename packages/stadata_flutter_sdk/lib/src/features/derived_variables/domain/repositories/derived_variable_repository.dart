import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

/// Repository interface for DerivedVariable data access.
///
/// Defines the contract for retrieving derived variable information from the BPS API.
abstract class DerivedVariableRepository {
  /// Retrieves a list of derived variables from the BPS API.
  ///
  /// Parameters:
  ///   - [domain]: The area code for which to fetch derived variables
  ///   - [page]: Page number for pagination (default: 1)
  ///   - [lang]: Language preference (default: Indonesian)
  ///   - [variableID]: Optional variable ID to filter derived variables
  ///   - [verticalGroup]: Optional vertical group filter
  ///
  /// Returns a [Result] containing either:
  ///   - Success: [ApiResponse] with list of [DerivedVariable] objects
  ///   - Failure: [Failure] object with error details
  Future<Result<Failure, ApiResponse<List<DerivedVariable>>>> get({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    int? variableID,
    int? verticalGroup,
  });
}
