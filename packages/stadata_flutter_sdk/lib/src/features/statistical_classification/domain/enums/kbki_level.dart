import 'package:stadata_flutter_sdk/src/features/features.dart';

enum KBKILevel implements StatisticalClassificationLevel {
  section('seksi'),
  division('divisi'),
  classes('kelas'),
  subClass('subkelas'),
  commodityGroup('komoditas'),
  group('kelompok');

  const KBKILevel(this.value);

  @override
  final String value;
}
