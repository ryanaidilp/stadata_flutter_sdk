import 'package:stadata_flutter_sdk/src/base/base.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/enums/data_availability.dart';

class DataAvailabilityConverter
    extends BaseConverter<String, DataAvailability> {
  const DataAvailabilityConverter();

  @override
  DataAvailability fromJson(String json) {
    if (json == 'available') {
      return DataAvailability.available;
    } else if (json == 'not-available') {
      return DataAvailability.notAvailable;
    }

    return DataAvailability.listNotAvailable;
  }

  @override
  String toJson(DataAvailability object) => object.value;
}
