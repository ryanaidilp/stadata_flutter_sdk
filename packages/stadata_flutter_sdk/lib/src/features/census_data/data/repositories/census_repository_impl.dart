import 'package:meta/meta.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class CensusRepositoryImpl implements CensusRepository {
  @internal
  final Log logger;
  @internal
  final CensusRemoteDataSource remoteDataSource;

  const CensusRepositoryImpl({
    required this.logger,
    required this.remoteDataSource,
  });

  @override
  Future<Result<Failure, ApiResponse<List<Census>>>> get() async {
    try {
      final result = await remoteDataSource.get();

      if (result.data == null) {
        throw const CensusDataNotAvailableException();
      }

      final data = result.data;

      return Result.success(
        ApiResponse(
          status: result.status,
          data: data,
          dataAvailability: result.dataAvailability,
          message: result.message,
          pagination: result.pagination,
        ),
      );
    } catch (e, s) {
      await logger.console(
        e.toString(),
        error: e,
        stackTrace: s,
        type: LogType.error,
      );

      return Result.failure(CensusDataFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<Failure, ApiResponse<List<CensusTopic>>>> getCensusTopics({
    required String censusID,
  }) async {
    try {
      final result = await remoteDataSource.getCensusTopics(censusID: censusID);

      if (result.data == null) {
        throw const CensusTopicNotAvailableException();
      }

      final data = result.data;

      return Result.success(
        ApiResponse(
          status: result.status,
          data: data,
          dataAvailability: result.dataAvailability,
          pagination: result.pagination,
        ),
      );
    } catch (e, s) {
      await logger.console(
        e.toString(),
        stackTrace: s,
        error: e,
        type: LogType.error,
      );

      return Result.failure(CensusTopicFailure(message: e.toString()));
    }
  }
}
