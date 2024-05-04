import 'package:stadata_flutter_sdk/src/features/features.dart';

enum KBLIType implements StatisticalClassification {
  y2009('kbli2009'),
  y2015('kbli2015'),
  y2017('kbli2017'),
  y2020('kbli2020');

  const KBLIType(this.value);

  @override
  final String value;
}
