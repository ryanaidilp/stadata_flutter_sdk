import 'package:stadata_flutter_sdk/src/features/features.dart';

enum KBKIType implements StatisticalClassification {
  y2015('kbki2015');

  const KBKIType(this.value);

  @override
  final String value;
}
