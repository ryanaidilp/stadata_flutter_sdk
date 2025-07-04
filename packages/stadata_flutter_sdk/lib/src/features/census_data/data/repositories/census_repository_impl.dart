// Repository implementations use generic catch for comprehensive error handling
// ignore_for_file: avoid_catches_without_on_clauses
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

      return Result.success(
        ApiResponse(
          data: result.data,
          status: result.status,
          message: result.message,
          pagination: result.pagination,
          dataAvailability: result.dataAvailability,
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

      return Result.success(
        ApiResponse(
          data: result.data,
          status: result.status,
          pagination: result.pagination,
          dataAvailability: result.dataAvailability,
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

  @override
  Future<Result<Failure, ApiResponse<List<CensusArea>>>> getCensusArea({
    required String censusID,
  }) async {
    try {
      final result = await remoteDataSource.getCensusArea(censusID: censusID);

      if (result.data == null) {
        throw const CensusAreaNotAvailableException();
      }

      final data = result.data;

      return Result.success(
        ApiResponse(
          data: data,
          status: result.status,
          pagination: result.pagination,
          dataAvailability: result.dataAvailability,
        ),
      );
    } catch (e, s) {
      await logger.console(
        e.toString(),
        stackTrace: s,
        error: e,
        type: LogType.error,
      );

      return Result.failure(CensusAreaFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<Failure, ApiResponse<List<CensusDataset>>>> getCensusDatasets({
    required String censusID,
    required int topicID,
  }) async {
    try {
      final result = await remoteDataSource.getCensusDatasets(
        censusID: censusID,
        topicID: topicID,
      );

      if (result.data == null) {
        throw const CensusDatasetNotAvailableException();
      }

      return Result.success(
        ApiResponse(
          data: result.data,
          status: result.status,
          message: result.message,
          pagination: result.pagination,
          dataAvailability: result.dataAvailability,
        ),
      );
    } catch (e, s) {
      await logger.console(
        e.toString(),
        error: e,
        stackTrace: s,
        type: LogType.error,
      );

      return Result.failure(CensusDatasetFailure(message: e.toString()));
    }
  }
}
