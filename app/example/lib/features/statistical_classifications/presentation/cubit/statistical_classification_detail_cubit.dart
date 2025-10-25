import 'package:injectable/injectable.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@injectable
class StatisticalClassificationDetailCubit
    extends BaseListCubit<StatisticClassification> {
  StatisticalClassificationDetailCubit(this._stadataFlutter);

  final StadataFlutter _stadataFlutter;

  late String _id;
  late ClassificationType _type;
  DataLanguage _currentLanguage = DataLanguage.id;

  String get id => _id;
  ClassificationType get type => _type;
  DataLanguage get currentLanguage => _currentLanguage;

  void initialize({
    required String id,
    required ClassificationType type,
    required DataLanguage language,
  }) {
    _id = id;
    _type = type;
    _currentLanguage = language;
  }

  set currentLanguage(DataLanguage language) {
    _currentLanguage = language;
  }

  @override
  Future<ListResult<StatisticClassification>?> fetchData({
    required int page,
  }) async {
    try {
      final result = await _stadataFlutter.view.statisticClassification(
        id: _id,
        type: _type,
        lang: _currentLanguage,
        page: page,
      );

      if (result == null) {
        return const ListResult<StatisticClassification>(
          data: [],
          dataAvailability: DataAvailability.listNotAvailable,
        );
      }

      return ListResult<StatisticClassification>(
        data: result,
        dataAvailability:
            result.isEmpty
                ? DataAvailability.listNotAvailable
                : DataAvailability.available,
      );
    } catch (error) {
      rethrow;
    }
  }
}
