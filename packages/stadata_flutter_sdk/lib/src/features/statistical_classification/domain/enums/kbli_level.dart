import 'package:stadata_flutter_sdk/src/features/features.dart';

enum KBLILevel implements StatisticalClassificationLevel {
  category('kategori'),
  primaryGroup('pokok'),
  group('golongan'),
  subGroup('subgolongan'),
  cluster('kelompok');

  const KBLILevel(this.value);

  @override
  final String value;
}
