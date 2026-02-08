// Repository implementations use generic catch for comprehensive error handling
// ignore_for_file: avoid_catches_without_on_clauses
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class SubjectRepositoryImpl implements SubjectRepository {
  final SubjectRemoteDataSource _remoteDataSource =
      injector.get<SubjectRemoteDataSource>();
  final Log _log = injector.get<Log>();

  @override
  Future<Result<Failure, ApiResponse<List<Subject>>>> get({
    required String domain,
    int? subjectCategoryID,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
  }) async {
    try {
      final result = await _remoteDataSource.get(
        lang: lang,
        page: page,
        domain: domain,
        subjectCategoryID: subjectCategoryID,
      );

      if (result.data == null) {
        throw const SubjectNotAvailableException();
      }

      final data = result.data;

      return Result.success(
        ApiResponse<List<Subject>>(
          data: data,
          status: result.status,
          message: result.message,
          pagination: result.pagination,
          dataAvailability: result.dataAvailability,
        ),
      );
    } catch (e, s) {
      _log.console(
        e.toString(),
        error: e,
        stackTrace: s,
        type: LogType.error,
      );
      return Result.failure(SubjectFailure(message: e.toString()));
    }
  }
}
