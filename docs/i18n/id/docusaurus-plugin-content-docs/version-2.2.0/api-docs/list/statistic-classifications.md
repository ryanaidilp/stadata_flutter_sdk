# Klasifikasi Statistik (KBLI & KBKI)

API Klasifikasi Statistik menyediakan akses ke sistem klasifikasi terstandardisasi Indonesia dari BPS (Badan Pusat Statistik): KBLI (Klasifikasi Baku Lapangan Usaha Indonesia) dan KBKI (Klasifikasi Baku Komoditi Indonesia). Sistem klasifikasi ini merupakan kerangka kerja fundamental untuk mengorganisir dan mengkategorikan kegiatan ekonomi dan komoditas dalam statistik Indonesia.

KBLI dan KBKI berfungsi sebagai tulang punggung untuk pengumpulan data statistik, analisis ekonomi, dan formulasi kebijakan di seluruh Indonesia. Memahami klasifikasi ini sangat penting bagi peneliti, ekonom, analis bisnis, dan pembuat kebijakan yang bekerja dengan data ekonomi dan statistik Indonesia.

## Memahami Klasifikasi Statistik

Klasifikasi statistik menyediakan kerangka kerja terstandarisasi untuk organisasi data:

- **Klasifikasi Kegiatan Ekonomi (KBLI)**: Kategorisasi sistematis kegiatan ekonomi dan industri
- **Klasifikasi Komoditas (KBKI)**: Klasifikasi terstruktur barang dan komoditas
- **Organisasi Hierarki**: Klasifikasi multi-tingkat dari kategori luas hingga aktivitas spesifik
- **Penyelarasan Internasional**: Klasifikasi yang diselaraskan dengan standar internasional namun mencerminkan struktur ekonomi Indonesia
- **Manajemen Versi**: Beberapa versi mencerminkan evolusi ekonomi dan perbaikan metodologi

## Struktur Sistem Klasifikasi

### KBLI (Klasifikasi Baku Lapangan Usaha Indonesia)

KBLI mengorganisir kegiatan ekonomi ke dalam struktur hierarki:

- **Kategori (1 huruf)**: Sektor ekonomi luas (A-U)
- **Golongan Pokok (2 digit)**: Divisi ekonomi utama dalam kategori
- **Golongan (3 digit)**: Kegiatan ekonomi spesifik dalam golongan pokok
- **Sub-golongan (4 digit)**: Aktivitas detail dalam golongan
- **Kelompok (5 digit)**: Tingkat paling spesifik dari klasifikasi kegiatan ekonomi

### KBKI (Klasifikasi Baku Komoditi Indonesia)

KBKI mengorganisir komoditas dan barang ke dalam tingkatan terstruktur:

- **Seksi (1 digit)**: Kategori komoditas luas (0-4)
- **Divisi (2 digit)**: Kelompok komoditas utama dalam seksi
- **Kelompok (3 digit)**: Jenis komoditas spesifik dalam divisi
- **Kelas (4 digit)**: Kategori komoditas detail
- **Sub-kelas (5 digit)**: Sub-kategori komoditas spesifik
- **Kelompok Komoditas (7 digit)**: Pengelompokan komoditas detail
- **Komoditas (10 digit)**: Item komoditas individual

## Enum

### ClassificationType

`ClassificationType` adalah kelas dasar untuk menentukan jenis klasifikasi. Kelas ini kemudian di-extend oleh `KBLIType` dan `KBKIType`.

#### KBLIType

| Enum | Nilai | Deskripsi |
|------|-------|-----------|
|KBLI.y2009 | `kbli2009` | KBLI tahun 2009 |
|KBLI.y2015 | `kbli2015` | KBLI tahun 2015 |
|KBLI.y2017 | `kbli2017` | KBLI tahun 2017 |
|KBLI.y2020 | `kbli2020` | KBLI tahun 2020 |

Untuk melakukan permintaan ke endpoint `detail`, kode KBLI perlu diformat dalam format `kbli_tahun_kode`. Kelas ini memfasilitasi formatting ini melalui metode `urlParamGenerator`.

Contoh:
```dart
final url = KBLIType.y2009.urlParamGenerator('24');
/// hasil: kbli_2009_24
final value = KBLIType.y2009.value;
/// hasil: kbli2009
final year = KBLIType.y2009.year;
/// hasil: 2009
```

#### KBKIType

| Enum | Nilai | Deskripsi |
|------|-------|-----------|
|KBKI.y2015 | `kbki2015` | KBKI tahun 2015 |

Contoh:
```dart
final url = KBKIType.y2015.urlParamGenerator('24');
/// hasil: kbki_2015_24
final value = KBKIType.y2015.value;
/// hasil: kbki2015
final year = KBKIType.y2015.year;
/// hasil: 2015
```

### ClassificationLevel

`ClassificationLevel` adalah kelas dasar untuk menentukan kelompok/tingkat klasifikasi.

#### KBLILevel

| Enum | Nilai | Deskripsi |
|------|-------|-----------|
|KBLILevel.category | `category` | Merupakan klasifikasi utama. Ditandai dengan satu huruf alfabet. |
|KBLILevel.primaryGroup | `primary group` | Deskripsi detail dari kategori, masing-masing dikodekan dengan dua digit. |
|KBLILevel.group | `group` | Detail lebih lanjut dari golongan pokok, masing-masing dikodekan dengan tiga digit. |
|KBLILevel.subGroup | `subgroup` | Detail lebih lanjut dari kegiatan ekonomi golongan, dikodekan dengan empat digit. |
|KBLILevel.cluster | `cluster` | Membedakan aktivitas dalam subgolongan, dikodekan dengan lima digit. |

Contoh:
```dart
final isValid = KBLILevel.category.validateCode('A');
/// hasil: true
final value = KBLILevel.category.value;
/// hasil: category
```

#### KBKILevel

| Enum | Nilai | Deskripsi |
|------|-------|-----------|
|KBKILevel.section | `section` | Garis besar klasifikasi umum, kode 1-digit, 5 seksi, 0-4. |
|KBKILevel.division | `division` | Deskripsi detail dari seksi, kode 2-digit. |
|KBKILevel.group | `group` | Detail lebih lanjut dari divisi, kode 3-digit. |
|KBKILevel.classes | `classes` | Detail lebih lanjut dari kelompok, kode 4-digit. |
|KBKILevel.subClass | `subclass` | Detail dari kelas, kode 5-digit. |
|KBKILevel.commodityGroup | `commodity group` | Detail dari sub-kelas, kode 7-digit. |
|KBKILevel.commodity | `commodity` | Detail dari kelompok komoditas, kode 10-digit. |

## Parameter

| Parameter | Tipe                   | Deskripsi                                                                             |
| --------- | ---------------------- | ------------------------------------------------------------------------------------- |
| `type`    | `ClassificationType`   | Menentukan jenis klasifikasi dari enum `KBLIType` atau `KBKIType` **(wajib)** |
| `level`   | `ClassificationLevel?` | Menentukan tingkat klasifikasi dari enum `KBLILevel` atau `KBKILevel` (opsional) |
| `lang`    | `DataLanguage`         | Bahasa yang digunakan untuk data KBLI/KBKI (default: `DataLanguage.id`)                      |
| `page`    | `int`                  | Nomor halaman (default: `1`)                                                               |
| `perPage` | `int`                  | Jumlah data per halaman (default: `10`)                                                  |

## Contoh

### 1. Dapatkan Kategori KBLI (Tingkat Atas)

```dart
// Ambil semua kategori KBLI 2020 (sektor ekonomi luas)
final result = await StadataFlutter.instance.list.statisticClassifications(
  type: KBLIType.y2020,
  level: KBLILevel.category,
  lang: DataLanguage.id,
);

final classificationsList = result.data;
final pagination = result.pagination;

// Tampilkan informasi pagination
print('Halaman Saat Ini: ${pagination.page}');
print('Total Halaman: ${pagination.pages}');
print('Jumlah Data di Halaman Ini: ${pagination.count}');
print('Per Halaman: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Tampilkan kategori KBLI
for (final classification in classificationsList) {
  print('ID Klasifikasi: ${classification.id}');
  print('Judul: ${classification.title}');
  print('Deskripsi: ${classification.description}');
  print('Jenis: ${classification.type?.value}');
  print('Tingkat: ${classification.level?.value}');
  print('Terakhir Update: ${classification.lastUpdate}');
  print('Tanggal Rilis: ${classification.releaseDate}');
  print('------------------------');
}
```

### 2. Jelajahi Hierarki KBLI (Sektor Manufaktur)

```dart
// Jelajahi hierarki sektor manufaktur dalam KBLI 2020
class KBLIExplorer {
  static Future<void> exploreManufacturingHierarchy() async {
    try {
      // 1. Dapatkan Kategori C (Manufaktur)
      final categories = await StadataFlutter.instance.list.statisticClassifications(
        type: KBLIType.y2020,
        level: KBLILevel.category,
        lang: DataLanguage.id,
      );
      
      final manufacturing = categories.data
          .where((item) => item.id.startsWith('C') || 
                          item.title.toLowerCase().contains('manufaktur'))
          .firstOrNull;
      
      if (manufacturing != null) {
        print('=== Kategori Manufaktur ===');
        print('ID: ${manufacturing.id}');
        print('Judul: ${manufacturing.title}');
        print('Deskripsi: ${manufacturing.description}');
      }
      
      // 2. Dapatkan Golongan Pokok dalam Manufaktur
      final primaryGroups = await StadataFlutter.instance.list.statisticClassifications(
        type: KBLIType.y2020,
        level: KBLILevel.primaryGroup,
        lang: DataLanguage.id,
      );
      
      final manufacturingGroups = primaryGroups.data
          .where((item) => item.id.startsWith('1') || item.id.startsWith('2') || item.id.startsWith('3'))
          .take(5)
          .toList();
      
      print('\\n=== Golongan Pokok Manufaktur (Contoh) ===');
      for (final group in manufacturingGroups) {
        print('${group.id}: ${group.title}');
        print('  Deskripsi: ${group.description}');
      }
      
      // 3. Dapatkan golongan detail untuk manufaktur makanan (jika tersedia)
      final detailedGroups = await StadataFlutter.instance.list.statisticClassifications(
        type: KBLIType.y2020,
        level: KBLILevel.group,
        lang: DataLanguage.id,
      );
      
      final foodGroups = detailedGroups.data
          .where((item) => item.title.toLowerCase().contains('makanan') ||
                          item.title.toLowerCase().contains('food'))
          .take(3)
          .toList();
      
      print('\\n=== Golongan Manufaktur Makanan ===');
      for (final group in foodGroups) {
        print('${group.id}: ${group.title}');
        print('  Deskripsi: ${group.description}');
      }
      
    } catch (e) {
      print('Error menjelajahi hierarki KBLI: $e');
    }
  }
}
```

### 3. Bandingkan Versi KBLI

```dart
// Bandingkan perubahan klasifikasi antar versi KBLI
Future<void> compareKBLIVersions() async {
  try {
    final versions = [KBLIType.y2015, KBLIType.y2017, KBLIType.y2020];
    final versionData = <KBLIType, List<StatisticClassification>>{};
    
    // Dapatkan kategori untuk setiap versi
    for (final version in versions) {
      final result = await StadataFlutter.instance.list.statisticClassifications(
        type: version,
        level: KBLILevel.category,
        lang: DataLanguage.id,
      );
      versionData[version] = result.data;
      
      await Future.delayed(Duration(milliseconds: 300));
    }
    
    print('=== Perbandingan Versi KBLI ===');
    for (final entry in versionData.entries) {
      print('${entry.key.value}: ${entry.value.length} kategori');
      
      // Tampilkan contoh kategori
      for (final category in entry.value.take(3)) {
        print('  ${category.id}: ${category.title}');
      }
      print('---');
    }
    
    // Analisis evolusi klasifikasi
    final kbli2015 = versionData[KBLIType.y2015] ?? [];
    final kbli2020 = versionData[KBLIType.y2020] ?? [];
    
    print('\\n=== Analisis Evolusi ===');
    print('Kategori KBLI 2015: ${kbli2015.length}');
    print('Kategori KBLI 2020: ${kbli2020.length}');
    
    // Temukan kategori yang sama berdasarkan ID
    final common2015Ids = kbli2015.map((c) => c.id).toSet();
    final common2020Ids = kbli2020.map((c) => c.id).toSet();
    final commonIds = common2015Ids.intersection(common2020Ids);
    
    print('Kategori yang sama: ${commonIds.length}');
    print('Baru di 2020: ${common2020Ids.difference(common2015Ids).length}');
    print('Dihapus sejak 2015: ${common2015Ids.difference(common2020Ids).length}');
    
  } catch (e) {
    print('Error perbandingan versi: $e');
  }
}
```

### 4. Jelajahi Klasifikasi Komoditas KBKI

```dart
// Jelajahi struktur klasifikasi komoditas KBKI
class KBKIExplorer {
  static Future<void> exploreKBKIStructure() async {
    try {
      // 1. Dapatkan semua seksi (tingkat atas)
      final sections = await StadataFlutter.instance.list.statisticClassifications(
        type: KBKIType.y2015,
        level: KBKILevel.section,
        lang: DataLanguage.id,
      );
      
      print('=== Seksi KBKI 2015 ===');
      for (final section in sections.data) {
        print('Seksi ${section.id}: ${section.title}');
        print('  Deskripsi: ${section.description}');
      }
      
      // 2. Dapatkan divisi dalam seksi tertentu
      final divisions = await StadataFlutter.instance.list.statisticClassifications(
        type: KBKIType.y2015,
        level: KBKILevel.division,
        lang: DataLanguage.id,
        perPage: 20,
      );
      
      print('\\n=== Divisi KBKI (Contoh) ===');
      for (final division in divisions.data.take(10)) {
        print('Divisi ${division.id}: ${division.title}');
        
        // Periksa klasifikasi turunan
        if (division.derived.isNotEmpty) {
          print('  Item turunan: ${division.derived.length}');
          for (final derived in division.derived.take(2)) {
            print('    - ${derived.code}: ${derived.title}');
          }
        }
      }
      
      // 3. Dapatkan kelompok komoditas untuk analisis
      final commodityGroups = await StadataFlutter.instance.list.statisticClassifications(
        type: KBKIType.y2015,
        level: KBKILevel.commodityGroup,
        lang: DataLanguage.id,
        perPage: 15,
      );
      
      print('\\n=== Kelompok Komoditas (Contoh) ===');
      for (final group in commodityGroups.data.take(5)) {
        print('Kelompok ${group.id}: ${group.title}');
        print('  Deskripsi: ${group.description}');
        print('  Terakhir Update: ${group.lastUpdate}');
        
        if (group.tags.isNotEmpty) {
          print('  Tag: ${group.tags.join(', ')}');
        }
      }
      
    } catch (e) {
      print('Error eksplorasi KBKI: $e');
    }
  }
}
```

### 5. Analisis Klasifikasi Lanjutan

```dart
// Analisis komprehensif data klasifikasi
class ClassificationAnalyzer {
  static Future<void> analyzeClassificationData() async {
    try {
      // 1. Analisis kelengkapan data KBLI antar tingkat
      final kbliLevels = [
        KBLILevel.category,
        KBLILevel.primaryGroup,
        KBLILevel.group,
        KBLILevel.subGroup,
        KBLILevel.cluster,
      ];
      
      print('=== Analisis Tingkat KBLI 2020 ===');
      for (final level in kbliLevels) {
        final result = await StadataFlutter.instance.list.statisticClassifications(
          type: KBLIType.y2020,
          level: level,
          lang: DataLanguage.id,
          perPage: 50,
        );
        
        print('${level.value}: ${result.pagination.total} item');
        
        // Analisis kualitas data
        final withDescription = result.data
            .where((item) => item.description.isNotEmpty)
            .length;
        
        final withTags = result.data
            .where((item) => item.tags.isNotEmpty)
            .length;
        
        print('  Item dengan deskripsi: $withDescription');
        print('  Item dengan tag: $withTags');
        
        await Future.delayed(Duration(milliseconds: 200));
      }
      
      // 2. Analisis relasi klasifikasi
      final groupsWithDerived = await StadataFlutter.instance.list.statisticClassifications(
        type: KBLIType.y2020,
        level: KBLILevel.group,
        lang: DataLanguage.id,
      );
      
      final itemsWithRelationships = groupsWithDerived.data
          .where((item) => item.derived.isNotEmpty || item.previous.isNotEmpty)
          .length;
      
      print('\\n=== Analisis Relasi ===');
      print('Golongan dengan relasi: $itemsWithRelationships');
      
      // 3. Analisis metadata publikasi
      final classifications = await StadataFlutter.instance.list.statisticClassifications(
        type: KBLIType.y2020,
        level: KBLILevel.category,
        lang: DataLanguage.id,
      );
      
      final withISBN = classifications.data
          .where((item) => item.isbn != null && item.isbn!.isNotEmpty)
          .length;
      
      final withURL = classifications.data
          .where((item) => item.url != null && item.url!.isNotEmpty)
          .length;
      
      print('Klasifikasi dengan ISBN: $withISBN');
      print('Klasifikasi dengan URL: $withURL');
      
    } catch (e) {
      print('Error analisis: $e');
    }
  }
}
```

## Properti

### StatisticClassification

| Properti            | Tipe                       | Deskripsi                            |
| ------------------- | -------------------------- | ------------------------------------ |
| `id`                | `String`                   | Pengidentifikasi unik untuk KBLI/KBKI       |
| `type`              | `ClassificationType?`      | Jenis klasifikasi (KBLI/KBKI)        |
| `level`             | `ClassificationLevel?`     | Tingkat klasifikasi dalam hierarki  |
| `source`            | `String`                   | Informasi sumber data                |
| `title`             | `String`                   | Judul resmi klasifikasi  |
| `description`       | `String`                   | Deskripsi detail klasifikasi |
| `isbn`              | `String?`                  | Nomor ISBN untuk referensi publikasi |
| `issn`              | `String?`                  | Nomor ISSN untuk publikasi seri    |
| `catalogueNumber`   | `String?`                  | Nomor katalog resmi             |
| `publicationNumber` | `String?`                  | Nomor referensi publikasi          |
| `lastUpdate`        | `DateTime`                 | Tanggal terakhir update                    |
| `releaseDate`       | `DateTime`                 | Tanggal rilis resmi                  |
| `location`          | `String?`                  | Lokasi publikasi atau sumber         |
| `url`               | `String?`                  | Referensi URL resmi                 |
| `mfd`               | `String?`                  | Informasi tanggal manufaktur         |
| `previous`          | `List<ClassificationItem>` | Daftar item klasifikasi sebelumnya  |
| `derived`           | `List<ClassificationItem>` | Daftar item klasifikasi turunan   |
| `flag`              | `bool`                     | Flag status klasifikasi             |
| `tags`              | `List<String>`             | Tag terkait untuk kategorisasi     |

### ClassificationItem

| Properti      | Tipe     | Deskripsi                           |
| ------------- | -------- | ----------------------------------- |
| `code`        | `String` | Pengidentifikasi kode klasifikasi        |
| `title`       | `String` | Judul item klasifikasi      |
| `description` | `String` | Deskripsi detail item      |

## Kasus Penggunaan Umum

### Analisis Sektor Ekonomi

```dart
// Analisis sektor ekonomi menggunakan data KBLI
Future<void> analyzeEconomicSectors() async {
  try {
    final sectors = await StadataFlutter.instance.list.statisticClassifications(
      type: KBLIType.y2020,
      level: KBLILevel.category,
      lang: DataLanguage.id,
    );
    
    print('=== Sektor Ekonomi Indonesia (KBLI 2020) ===');
    for (final sector in sectors.data) {
      print('${sector.id}: ${sector.title}');
      
      // Identifikasi sektor kunci
      final isKeyEconomic = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J']
          .contains(sector.id);
      
      if (isKeyEconomic) {
        print('  ⭐ Sektor Ekonomi Kunci');
      }
      
      print('  Deskripsi: ${sector.description}');
      
      if (sector.derived.isNotEmpty) {
        print('  Sub-klasifikasi: ${sector.derived.length}');
      }
      
      print('---');
    }
    
  } catch (e) {
    print('Error analisis sektor ekonomi: $e');
  }
}
```

### Pemetaan Klasifikasi Bisnis

```dart
// Petakan aktivitas bisnis ke kode KBLI
class BusinessClassificationMapper {
  static Future<Map<String, String>> mapBusinessActivities() async {
    final businessMapping = <String, String>{};
    
    try {
      // Dapatkan aktivitas bisnis detail (tingkat sub-golongan)
      final activities = await StadataFlutter.instance.list.statisticClassifications(
        type: KBLIType.y2020,
        level: KBLILevel.subGroup,
        lang: DataLanguage.id,
        perPage: 100,
      );
      
      for (final activity in activities.data) {
        // Buat pemetaan untuk istilah bisnis umum
        final keywords = activity.title.toLowerCase();
        
        if (keywords.contains('makanan') || keywords.contains('food')) {
          businessMapping['Produksi Makanan'] = activity.id;
        } else if (keywords.contains('teknologi') || keywords.contains('software')) {
          businessMapping['Teknologi'] = activity.id;
        } else if (keywords.contains('perdagangan') || keywords.contains('retail')) {
          businessMapping['Perdagangan Eceran'] = activity.id;
        } else if (keywords.contains('konstruksi') || keywords.contains('construction')) {
          businessMapping['Konstruksi'] = activity.id;
        }
      }
      
      print('=== Pemetaan Aktivitas Bisnis ===');
      businessMapping.forEach((business, kbliCode) {
        print('$business → Kode KBLI: $kbliCode');
      });
      
      return businessMapping;
      
    } catch (e) {
      print('Error pemetaan bisnis: $e');
      return {};
    }
  }
}
```

## Integrasi dengan API Lain

### Referensi Silang dengan Data Statistik

```dart
// Gunakan klasifikasi untuk memahami konteks data statistik
Future<void> integrateWithStatisticalData() async {
  try {
    // Dapatkan klasifikasi manufaktur
    final manufacturing = await StadataFlutter.instance.list.statisticClassifications(
      type: KBLIType.y2020,
      level: KBLILevel.primaryGroup,
      lang: DataLanguage.id,
    );
    
    final manufacturingGroups = manufacturing.data
        .where((item) => item.title.toLowerCase().contains('industri'))
        .toList();
    
    print('=== Klasifikasi Manufaktur ===');
    for (final group in manufacturingGroups.take(5)) {
      print('${group.id}: ${group.title}');
      
      // Ini dapat digunakan untuk memfilter data ekonomi
      print('  Gunakan untuk memfilter statistik ekonomi berdasarkan sektor ${group.id}');
      print('  Berkaitan dengan data produksi industri');
    }
    
    // Klasifikasi komoditas untuk data perdagangan
    final commodities = await StadataFlutter.instance.list.statisticClassifications(
      type: KBKIType.y2015,
      level: KBKILevel.division,
      lang: DataLanguage.id,
    );
    
    print('\\n=== Klasifikasi Komoditas untuk Analisis Perdagangan ===');
    for (final commodity in commodities.data.take(3)) {
      print('${commodity.id}: ${commodity.title}');
      print('  Gunakan untuk: Analisis data ekspor/impor');
      print('  Kalkulasi neraca perdagangan berdasarkan kelompok komoditas');
    }
    
  } catch (e) {
    print('Error integrasi: $e');
  }
}
```

## Penanganan Error

Metode API Klasifikasi Statistik mengembalikan `Future<ListResult<StatisticClassification>>` dan dapat melempar exception spesifik:

- `StatisticClassificationException`: Error terkait klasifikasi (jenis tidak valid, error tingkat)
- `ApiException`: Error terkait jaringan atau API
- `ApiKeyNotFoundException`: API key tidak valid atau hilang

```dart
try {
  final result = await StadataFlutter.instance.list.statisticClassifications(
    type: KBLIType.y2020,
    level: KBLILevel.category,
    lang: DataLanguage.id,
  );
  
  // Proses hasil yang berhasil
  print('Ditemukan ${result.data.length} klasifikasi');
  
} on StatisticClassificationException catch (e) {
  print('Error klasifikasi: ${e.message}');
  // Tangani error jenis klasifikasi atau tingkat
  
} on ApiException catch (e) {
  print('Error API: ${e.message}');
  // Tangani error konektivitas jaringan atau layanan API
  
} catch (e) {
  print('Error tak terduga: $e');
  // Tangani error tak terduga lainnya
}
```

## Pertimbangan Performa

- **Navigasi Hierarki**: Gunakan tingkat yang sesuai untuk menghindari pengambilan data berlebihan
- **Pemilihan Versi**: Pilih versi KBLI/KBKI yang paling relevan untuk kasus penggunaan Anda
- **Manajemen Pagination**: Implementasikan pagination efisien untuk dataset klasifikasi besar
- **Pemrosesan Relasi**: Tangani klasifikasi turunan dan sebelumnya dengan efisien
- **Strategi Caching**: Cache klasifikasi yang sering diakses karena jarang berubah
- **Validasi Kode**: Gunakan metode validasi built-in untuk kode klasifikasi
- **Pertimbangan Bahasa**: Pertimbangkan versi bahasa Indonesia dan Inggris untuk pengguna internasional