# Klasifikasi Statistik (KBLI & KBKI)

API View Klasifikasi Statistik menyediakan akses komprehensif ke informasi detail tentang sistem Klasifikasi Baku Lapangan Usaha Indonesia (KBLI) dan Klasifikasi Baku Komoditas Indonesia (KBKI) dari BPS (Badan Pusat Statistik) Indonesia. Metode ini memungkinkan aplikasi untuk mengambil hierarki klasifikasi lengkap, struktur kode, dan deskripsi detail untuk tujuan klasifikasi kegiatan ekonomi dan kategorisasi komoditas.

Klasifikasi statistik dari BPS berfungsi sebagai kerangka kerja fundamental untuk mengorganisir dan mengkategorikan kegiatan ekonomi, industri, dan komoditas dalam sistem statistik Indonesia. API View Klasifikasi Statistik memastikan akses ke metadata klasifikasi lengkap, hubungan hierarkis, dan dokumentasi komprehensif untuk standardisasi statistik dan tujuan analisis data.

## Memahami Sistem Klasifikasi Statistik

Klasifikasi statistik BPS menyediakan kerangka kerja komprehensif untuk kategorisasi ekonomi dan komoditas:

- **Klasifikasi Standar**: Standar pemerintah resmi untuk klasifikasi industri dan komoditas di seluruh sistem statistik
- **Struktur Hierarkis**: Sistem klasifikasi multi-level dengan rincian detail dari kategori luas hingga item spesifik
- **Manajemen Versi**: Berbagai versi klasifikasi dengan validitas temporal dan pelacakan pembaruan
- **Sistem Referensi Silang**: Hubungan antara versi klasifikasi berbeda dan standar internasional
- **Integrasi Ekonomi**: Integrasi dengan akuntansi ekonomi nasional, sistem survei, dan pelaporan statistik

## Tinjauan Sistem Klasifikasi

### Klasifikasi Baku Lapangan Usaha Indonesia (KBLI)

KBLI menyediakan klasifikasi komprehensif kegiatan ekonomi dan industri:

- **Klasifikasi Kegiatan Ekonomi**: Kategorisasi sistematis semua kegiatan ekonomi dalam Indonesia
- **Struktur Industri**: Organisasi hierarkis dari sektor ekonomi luas hingga kegiatan bisnis spesifik
- **Harmonisasi Statistik**: Penyelarasan dengan standar internasional (ISIC) sambil mempertahankan spesifisitas nasional
- **Integrasi Survei**: Dasar untuk survei ekonomi, operasi sensus, dan pengumpulan data statistik
- **Evolusi Versi**: Berbagai versi yang mencerminkan perubahan dalam struktur ekonomi dan standar internasional

### Klasifikasi Baku Komoditas Indonesia (KBKI)

KBKI menyediakan klasifikasi detail komoditas dan produk:

- **Kategorisasi Produk**: Klasifikasi komprehensif barang, komoditas, dan produk
- **Integrasi Perdagangan**: Dukungan untuk statistik perdagangan, klasifikasi impor-ekspor, dan analisis komersial
- **Analisis Produksi**: Kerangka kerja untuk statistik produksi dan klasifikasi output industri
- **Standar Kualitas**: Integrasi dengan standar kualitas produk dan sistem spesifikasi
- **Penyelarasan Internasional**: Harmonisasi dengan sistem klasifikasi komoditas internasional

## Level Hierarki Klasifikasi

### Level KBLI (Klasifikasi Industri)

- **Kategori**: Klasifikasi level tertinggi ditandai dengan kode alfabet tunggal (A-U)
  - Sektor ekonomi luas seperti Pertanian, Manufaktur, Jasa
  - 21 kategori utama yang mencakup semua kegiatan ekonomi
  
- **Golongan Pokok**: Kode numerik dua digit (01-99)
  - Rincian detail kegiatan ekonomi dalam setiap kategori
  - Pengelompokan industri yang lebih spesifik dan divisi ekonomi
  
- **Golongan**: Kode tiga digit yang memperluas golongan pokok
  - Klasifikasi industri spesifik dan jenis kegiatan bisnis
  - Spesifikasi kegiatan ekonomi yang detail
  
- **Sub-Golongan**: Kode empat digit untuk kegiatan detail
  - Kegiatan bisnis spesifik dan klasifikasi operasional
  - Identifikasi kegiatan ekonomi yang tepat
  
- **Kelompok**: Kode lima digit untuk level klasifikasi terhalus
  - Level paling detail dari klasifikasi kegiatan ekonomi
  - Operasi bisnis dan jenis kegiatan spesifik

### Level KBKI (Klasifikasi Komoditas)

- **Bagian**: Kode satu digit (0-4) untuk kategori komoditas luas
  - Pengelompokan produk dan komoditas utama
  - Klasifikasi fundamental semua barang dan produk
  
- **Bab**: Kode dua digit untuk rincian bagian detail
  - Kategori produk spesifik dalam pengelompokan utama
  - Klasifikasi komoditas spesifik industri
  
- **Golongan**: Kode tiga digit untuk kelompok produk
  - Keluarga produk detail dan jenis komoditas
  - Kategorisasi produk spesifik
  
- **Kelas**: Kode empat digit untuk kelas produk
  - Spesifikasi dan jenis produk detail
  - Klasifikasi komoditas yang tepat
  
- **Sub-Kelas**: Kode lima digit untuk produk detail
  - Varian produk spesifik dan klasifikasi detail
  - Kategorisasi spesifik produk
  
- **Kelompok Komoditas**: Kode tujuh digit
  - Pengelompokan komoditas detail dan keluarga produk
  - Klasifikasi lini produk spesifik
  
- **Komoditas**: Kode sepuluh digit untuk komoditas individual
  - Identifikasi dan spesifikasi produk individual
  - Level paling detail dari klasifikasi komoditas

## Jenis dan Versi Klasifikasi

### Spesifikasi Jenis KBLI

| Klasifikasi | Enum | Nilai | Tahun | Deskripsi |
|---|---|---|---|---|
| KBLI 2009 | `KBLIType.y2009` | `kbli2009` | 2009 | Versi KBLI asli berdasarkan ISIC Rev. 4 |
| KBLI 2015 | `KBLIType.y2015` | `kbli2015` | 2015 | Versi yang diperbarui dengan kategori yang diperbaiki |
| KBLI 2017 | `KBLIType.y2017` | `kbli2017` | 2017 | Versi yang ditingkatkan dengan kegiatan tambahan |
| KBLI 2020 | `KBLIType.y2020` | `kbli2020` | 2020 | Versi terbaru yang menggabungkan kegiatan ekonomi baru |

### Spesifikasi Jenis KBKI

| Klasifikasi | Enum | Nilai | Tahun | Deskripsi |
|---|---|---|---|---|
| KBKI 2015 | `KBKIType.y2015` | `kbki2015` | 2015 | Standar klasifikasi komoditas saat ini |

## Parameter

| Parameter | Tipe | Deskripsi |
| --------- | ---- | ----------- |
| `id` | `String` | **Wajib**: Pengidentifikasi unik dalam format `type_year_code` (gunakan metode `urlParamGenerator`) |
| `type` | `ClassificationType` | **Wajib**: Jenis klasifikasi dari enum `KBLIType` atau `KBKIType` |
| `lang` | `DataLanguage` | **Opsional**: Preferensi bahasa untuk konten terlokalisasi (default: `DataLanguage.id`) |
| `page` | `int` | **Opsional**: Nomor halaman untuk paginasi (default: 1) |
| `perPage` | `int` | **Opsional**: Jumlah item per halaman (default: 10) |

## Contoh

### 1. Pengambilan Klasifikasi Statistik Dasar

<!-- ![Preview](/gif/statistic_classifications.gif) -->

```dart
// Ambil informasi detail untuk klasifikasi KBLI tertentu
const kbliType = KBLIType.y2020;
final classificationId = kbliType.urlParamGenerator('A'); // Sektor pertanian

final result = await StadataFlutter.instance.view.statisticClassifications(
  id: classificationId, // kbli_2020_A
  type: kbliType,
  lang: DataLanguage.id,
);

if (result.data.isNotEmpty) {
  final classification = result.data.first;
  
  print('=== Detail Klasifikasi Statistik ===');
  print('ID Klasifikasi: ${classification.id}');
  print('Judul: ${classification.title}');
  print('Jenis: ${classification.type?.value ?? 'Tidak ditentukan'}');
  print('Level: ${classification.level?.value ?? 'Tidak ditentukan'}');
  
  // Metadata klasifikasi
  print('\n=== Metadata Klasifikasi ===');
  print('Sumber: ${classification.source}');
  print('Deskripsi: ${classification.description}');
  print('Pembaruan Terakhir: ${classification.lastUpdate}');
  print('Tanggal Rilis: ${classification.releaseDate}');
  
  // Informasi publikasi
  print('\n=== Informasi Publikasi ===');
  print('ISBN: ${classification.isbn ?? 'Tidak tersedia'}');
  print('ISSN: ${classification.issn ?? 'Tidak tersedia'}');
  print('Nomor Katalog: ${classification.catalogueNumber ?? 'Tidak ditetapkan'}');
  print('Nomor Publikasi: ${classification.publicationNumber ?? 'Tidak ditetapkan'}');
  
  // Hubungan hierarkis
  print('\n=== Hubungan Hierarkis ===');
  print('Klasifikasi Sebelumnya: ${classification.previous.length}');
  print('Klasifikasi Turunan: ${classification.derived.length}');
  
  if (classification.previous.isNotEmpty) {
    print('\nKlasifikasi Sebelumnya:');
    for (final prev in classification.previous.take(3)) {
      print('  • ${prev.code}: ${prev.title}');
    }
  }
  
  if (classification.derived.isNotEmpty) {
    print('\nKlasifikasi Turunan:');
    for (final derived in classification.derived.take(3)) {
      print('  • ${derived.code}: ${derived.title}');
    }
  }
  
  // Informasi tambahan
  print('\n=== Informasi Tambahan ===');
  print('Status Flag: ${classification.flag ? 'Aktif' : 'Tidak aktif'}');
  print('Tag: ${classification.tags.join(', ')}');
  print('Lokasi: ${classification.location ?? 'Tidak ditentukan'}');
  print('URL: ${classification.url ?? 'Tidak tersedia'}');
  print('MFD: ${classification.mfd ?? 'Tidak tersedia'}');
  
} else {
  print('Data klasifikasi tidak ditemukan');
}

// Tampilkan informasi paginasi
print('\n=== Informasi Paginasi ===');
print('Halaman Saat Ini: ${result.pagination.page}');
print('Total Halaman: ${result.pagination.pages}');
print('Item per Halaman: ${result.pagination.perPage}');
print('Total Item: ${result.pagination.total}');
```

### 2. Workflow Analisis Hierarki Klasifikasi

```dart
// Analisis hierarki klasifikasi komprehensif dan eksplorasi
class ClassificationHierarchyAnalyzer {
  static Future<void> analyzeClassificationHierarchy(
    ClassificationType classificationType,
    String baseCode,
  ) async {
    try {
      print('=== Analisis Hierarki Klasifikasi ===');
      print('Jenis: ${classificationType.value}');
      print('Kode Dasar: $baseCode');
      
      // 1. Dapatkan klasifikasi dasar
      final baseId = classificationType.urlParamGenerator(baseCode);
      final baseResult = await StadataFlutter.instance.view.statisticClassifications(
        id: baseId,
        type: classificationType,
        lang: DataLanguage.id,
      );
      
      if (baseResult.data.isEmpty) {
        print('Klasifikasi dasar tidak ditemukan');
        return;
      }
      
      final baseClassification = baseResult.data.first;
      
      print('\n--- Klasifikasi Dasar ---');
      print('Judul: ${baseClassification.title}');
      print('Level: ${baseClassification.level?.value ?? 'Tidak diketahui'}');
      print('Deskripsi: ${baseClassification.description}');
      
      // 2. Analisis struktur hierarkis
      final hierarchyAnalysis = <String, dynamic>{
        'baseClassification': baseClassification,
        'previousCount': baseClassification.previous.length,
        'derivedCount': baseClassification.derived.length,
        'totalRelated': baseClassification.previous.length + baseClassification.derived.length,
      };
      
      // 3. Eksplorasi klasifikasi sebelumnya (hierarki parent)
      if (baseClassification.previous.isNotEmpty) {
        print('\n--- Analisis Hierarki Parent ---');
        print('Klasifikasi sebelumnya: ${baseClassification.previous.length}');
        
        for (final previous in baseClassification.previous.take(5)) {
          print('\nParent: ${previous.code}');
          print('  Judul: ${previous.title}');
          print('  Deskripsi: ${previous.description}');
          
          // Dapatkan informasi detail untuk parent
          final parentId = classificationType.urlParamGenerator(previous.code);
          final parentResult = await StadataFlutter.instance.view.statisticClassifications(
            id: parentId,
            type: classificationType,
            lang: DataLanguage.id,
          );
          
          if (parentResult.data.isNotEmpty) {
            final parentDetail = parentResult.data.first;
            print('  Level: ${parentDetail.level?.value ?? 'Tidak diketahui'}');
            print('  Terakhir Diperbarui: ${parentDetail.lastUpdate}');
            print('  Jumlah Anak: ${parentDetail.derived.length}');
          }
          
          await Future.delayed(Duration(milliseconds: 300));
        }
      }
      
      // 4. Eksplorasi klasifikasi turunan (hierarki child)
      if (baseClassification.derived.isNotEmpty) {
        print('\n--- Analisis Hierarki Child ---');
        print('Klasifikasi turunan: ${baseClassification.derived.length}');
        
        final childAnalysis = <Map<String, dynamic>>[];
        
        for (final derived in baseClassification.derived.take(5)) {
          print('\nChild: ${derived.code}');
          print('  Judul: ${derived.title}');
          print('  Deskripsi: ${derived.description}');
          
          // Dapatkan informasi detail untuk child
          final childId = classificationType.urlParamGenerator(derived.code);
          final childResult = await StadataFlutter.instance.view.statisticClassifications(
            id: childId,
            type: classificationType,
            lang: DataLanguage.id,
          );
          
          if (childResult.data.isNotEmpty) {
            final childDetail = childResult.data.first;
            print('  Level: ${childDetail.level?.value ?? 'Tidak diketahui'}');
            print('  Terakhir Diperbarui: ${childDetail.lastUpdate}');
            print('  Anak Lebih Lanjut: ${childDetail.derived.length}');
            
            childAnalysis.add({
              'code': derived.code,
              'title': derived.title,
              'level': childDetail.level?.value,
              'childCount': childDetail.derived.length,
              'lastUpdate': childDetail.lastUpdate,
            });
          }
          
          await Future.delayed(Duration(milliseconds: 300));
        }
        
        // 5. Analisis klasifikasi child
        print('\n--- Ringkasan Klasifikasi Child ---');
        final avgChildCount = childAnalysis.isNotEmpty
            ? childAnalysis.map((c) => c['childCount'] as int).reduce((a, b) => a + b) / childAnalysis.length
            : 0.0;
        
        final recentlyUpdated = childAnalysis.where((c) => 
            (c['lastUpdate'] as DateTime).isAfter(DateTime.now().subtract(Duration(days: 365)))
        ).length;
        
        print('Rata-rata anak per klasifikasi: ${avgChildCount.toStringAsFixed(1)}');
        print('Anak yang diperbarui baru-baru ini: $recentlyUpdated/${childAnalysis.length}');
        
        // Distribusi level
        final levelDistribution = <String?, int>{};
        for (final child in childAnalysis) {
          final level = child['level'] as String?;
          levelDistribution[level] = (levelDistribution[level] ?? 0) + 1;
        }
        
        print('\nDistribusi Level:');
        for (final entry in levelDistribution.entries) {
          final level = entry.key ?? 'Tidak diketahui';
          print('  $level: ${entry.value} klasifikasi');
        }
      }
      
      // 6. Ringkasan hierarki
      print('\n=== Ringkasan Analisis Hierarki ===');
      print('Dasar: ${baseClassification.title} (${baseClassification.id})');
      print('Total sebelumnya: ${hierarchyAnalysis['previousCount']}');
      print('Total turunan: ${hierarchyAnalysis['derivedCount']}');
      print('Total terkait: ${hierarchyAnalysis['totalRelated']}');
      print('Level klasifikasi: ${baseClassification.level?.value ?? 'Tidak diketahui'}');
      print('Terakhir diperbarui: ${baseClassification.lastUpdate}');
      print('Status flag: ${baseClassification.flag ? 'Aktif' : 'Tidak aktif'}');
      
    } catch (e) {
      print('Kesalahan analisis hierarki: $e');
    }
  }
}
```

### 3. Perbandingan dan Analisis Lintas Klasifikasi

```dart
// Perbandingan komprehensif antara sistem klasifikasi dan versi berbeda
class ClassificationComparator {
  static Future<void> compareClassificationVersions(
    List<ClassificationType> types,
    String baseCode,
  ) async {
    try {
      print('=== Perbandingan Versi Klasifikasi ===');
      print('Membandingkan ${types.length} versi klasifikasi untuk kode: $baseCode');
      
      final versionAnalysis = <Map<String, dynamic>>[];
      
      // 1. Muat semua versi klasifikasi
      for (final type in types) {
        print('\n--- Memuat ${type.value} ---');
        
        final classificationId = type.urlParamGenerator(baseCode);
        final result = await StadataFlutter.instance.view.statisticClassifications(
          id: classificationId,
          type: type,
          lang: DataLanguage.id,
        );
        
        if (result.data.isNotEmpty) {
          final classification = result.data.first;
          
          final analysis = {
            'type': type.value,
            'year': type is KBLIType ? type.year : (type as KBKIType).year,
            'classification': classification,
            'title': classification.title,
            'description': classification.description,
            'level': classification.level?.value,
            'previousCount': classification.previous.length,
            'derivedCount': classification.derived.length,
            'lastUpdate': classification.lastUpdate,
            'releaseDate': classification.releaseDate,
            'tags': classification.tags,
            'hasISBN': classification.isbn != null,
            'hasISSN': classification.issn != null,
          };
          
          versionAnalysis.add(analysis);
          
          print('Ditemukan: ${classification.title}');
          print('Level: ${classification.level?.value ?? 'Tidak diketahui'}');
          print('Sebelumnya: ${classification.previous.length}, Turunan: ${classification.derived.length}');
          
        } else {
          print('Data tidak ditemukan untuk ${type.value}');
        }
        
        await Future.delayed(Duration(milliseconds: 400));
      }
      
      if (versionAnalysis.isEmpty) {
        print('Data klasifikasi tidak ditemukan untuk versi apapun');
        return;
      }
      
      // 2. Analisis perbandingan
      print('\n=== Analisis Perbandingan Versi ===');
      
      // Analisis timeline
      versionAnalysis.sort((a, b) => (a['year'] as int).compareTo(b['year'] as int));
      
      print('Evolusi Kronologis:');
      for (final analysis in versionAnalysis) {
        print('${analysis['year']}: ${analysis['title']}');
        print('  Rilis: ${analysis['releaseDate']}');
        print('  Pembaruan Terakhir: ${analysis['lastUpdate']}');
        print('  Hierarki: ${analysis['previousCount']} sebelumnya, ${analysis['derivedCount']} turunan');
      }
      
      // 3. Analisis evolusi konten
      print('\n=== Analisis Evolusi Konten ===');
      
      // Evolusi judul
      final titles = versionAnalysis.map((a) => a['title'] as String).toSet();
      if (titles.length > 1) {
        print('Perubahan Judul Terdeteksi:');
        for (int i = 0; i < versionAnalysis.length; i++) {
          print('  ${versionAnalysis[i]['year']}: ${versionAnalysis[i]['title']}');
        }
      } else {
        print('Konsistensi Judul: Dipertahankan di semua versi');
      }
      
      // Analisis deskripsi
      final descriptions = versionAnalysis.map((a) => a['description'] as String).toSet();
      print('\nEvolusi Deskripsi:');
      if (descriptions.length > 1) {
        print('Deskripsi telah berevolusi di berbagai versi');
        for (int i = 0; i < versionAnalysis.length; i++) {
          final desc = versionAnalysis[i]['description'] as String;
          final preview = desc.length > 100 ? '${desc.substring(0, 100)}...' : desc;
          print('  ${versionAnalysis[i]['year']}: $preview');
        }
      } else {
        print('Konsistensi deskripsi dipertahankan');
      }
      
      // 4. Evolusi hierarki
      print('\n=== Evolusi Hierarki ===');
      
      final hierarchyChanges = <String, List<int>>{
        'previous': versionAnalysis.map((a) => a['previousCount'] as int).toList(),
        'derived': versionAnalysis.map((a) => a['derivedCount'] as int).toList(),
      };
      
      for (final entry in hierarchyChanges.entries) {
        print('Klasifikasi ${entry.key.toUpperCase()}:');
        for (int i = 0; i < versionAnalysis.length; i++) {
          print('  ${versionAnalysis[i]['year']}: ${entry.value[i]}');
        }
        
        final trend = _calculateTrend(entry.value);
        print('  Tren: $trend');
      }
      
      // 5. Perbandingan kelengkapan metadata
      print('\n=== Kelengkapan Metadata ===');
      
      final completenessMetrics = {
        'ISBN Tersedia': versionAnalysis.where((a) => a['hasISBN']).length,
        'ISSN Tersedia': versionAnalysis.where((a) => a['hasISSN']).length,
        'Memiliki Tag': versionAnalysis.where((a) => (a['tags'] as List<String>).isNotEmpty).length,
        'Memiliki Level': versionAnalysis.where((a) => a['level'] != null).length,
      };
      
      for (final entry in completenessMetrics.entries) {
        final percentage = (entry.value / versionAnalysis.length * 100).toStringAsFixed(1);
        print('${entry.key}: ${entry.value}/${versionAnalysis.length} (${percentage}%)');
      }
      
      // 6. Rekomendasi
      print('\n=== Rekomendasi Versi ===');
      
      final latestVersion = versionAnalysis.last;
      final oldestVersion = versionAnalysis.first;
      
      print('Versi Terbaru: ${latestVersion['type']} (${latestVersion['year']})');
      print('Direkomendasikan untuk: Operasi statistik saat ini dan implementasi baru');
      
      if (versionAnalysis.length > 1) {
        final hierarchyGrowth = (latestVersion['derivedCount'] as int) - (oldestVersion['derivedCount'] as int);
        if (hierarchyGrowth > 0) {
          print('Evolusi: Klasifikasi telah berkembang sebesar $hierarchyGrowth item turunan');
        } else if (hierarchyGrowth < 0) {
          print('Evolusi: Klasifikasi telah disederhanakan sebesar ${hierarchyGrowth.abs()} item');
        } else {
          print('Evolusi: Struktur klasifikasi tetap stabil');
        }
      }
      
    } catch (e) {
      print('Kesalahan perbandingan versi: $e');
    }
  }
  
  static String _calculateTrend(List<int> values) {
    if (values.length < 2) return 'Data tidak cukup';
    
    final increases = <int>[];
    final decreases = <int>[];
    
    for (int i = 1; i < values.length; i++) {
      final change = values[i] - values[i - 1];
      if (change > 0) increases.add(change);
      if (change < 0) decreases.add(change.abs());
    }
    
    if (increases.length > decreases.length) {
      return 'Umumnya meningkat';
    } else if (decreases.length > increases.length) {
      return 'Umumnya menurun';
    } else {
      return 'Stabil dengan variasi';
    }
  }
}
```

### 4. Validasi dan Analisis Kode Klasifikasi

```dart
// Sistem validasi dan analisis kode klasifikasi komprehensif
class ClassificationValidator {
  static Future<void> validateAndAnalyzeClassificationCodes(
    ClassificationType type,
    List<String> codes,
  ) async {
    try {
      print('=== Validasi Kode Klasifikasi ===');
      print('Jenis: ${type.value}');
      print('Memvalidasi ${codes.length} kode...');
      
      final validationResults = <Map<String, dynamic>>[];
      
      // 1. Validasi setiap kode
      for (final code in codes) {
        print('\n--- Memvalidasi Kode: $code ---');
        
        // Validasi format
        final formatValid = _validateCodeFormat(type, code);
        print('Format Valid: ${formatValid ? '✓' : '✗'}');
        
        if (!formatValid) {
          validationResults.add({
            'code': code,
            'formatValid': false,
            'exists': false,
            'classification': null,
            'level': null,
          });
          continue;
        }
        
        // Validasi keberadaan
        final classificationId = type.urlParamGenerator(code);
        final result = await StadataFlutter.instance.view.statisticClassifications(
          id: classificationId,
          type: type,
          lang: DataLanguage.id,
        );
        
        final exists = result.data.isNotEmpty;
        print('Ada dalam Sistem: ${exists ? '✓' : '✗'}');
        
        if (exists) {
          final classification = result.data.first;
          print('Judul: ${classification.title}');
          print('Level: ${classification.level?.value ?? 'Tidak diketahui'}');
          print('Terakhir Diperbarui: ${classification.lastUpdate}');
          print('Aktif: ${classification.flag ? '✓' : '✗'}');
          
          validationResults.add({
            'code': code,
            'formatValid': true,
            'exists': true,
            'classification': classification,
            'level': classification.level?.value,
            'title': classification.title,
            'active': classification.flag,
            'lastUpdate': classification.lastUpdate,
            'hierarchySize': classification.previous.length + classification.derived.length,
          });
        } else {
          validationResults.add({
            'code': code,
            'formatValid': true,
            'exists': false,
            'classification': null,
            'level': null,
          });
        }
        
        await Future.delayed(Duration(milliseconds: 300));
      }
      
      // 2. Ringkasan validasi
      print('\n=== Ringkasan Validasi ===');
      
      final validFormat = validationResults.where((r) => r['formatValid']).length;
      final existsInSystem = validationResults.where((r) => r['exists']).length;
      final activeItems = validationResults.where((r) => r['active'] == true).length;
      
      print('Format Valid: $validFormat/${codes.length}');
      print('Ada dalam Sistem: $existsInSystem/${codes.length}');
      print('Klasifikasi Aktif: $activeItems/${codes.length}');
      
      // 3. Analisis distribusi level
      final levelDistribution = <String?, int>{};
      for (final result in validationResults.where((r) => r['exists'])) {
        final level = result['level'] as String?;
        levelDistribution[level] = (levelDistribution[level] ?? 0) + 1;
      }
      
      if (levelDistribution.isNotEmpty) {
        print('\nDistribusi Level:');
        for (final entry in levelDistribution.entries) {
          final level = entry.key ?? 'Tidak diketahui';
          print('  $level: ${entry.value} kode');
        }
      }
      
      // 4. Analisis hierarki
      final hierarchyAnalysis = validationResults
          .where((r) => r['exists'])
          .map((r) => r['hierarchySize'] as int)
          .toList();
      
      if (hierarchyAnalysis.isNotEmpty) {
        final avgHierarchy = hierarchyAnalysis.reduce((a, b) => a + b) / hierarchyAnalysis.length;
        final maxHierarchy = hierarchyAnalysis.reduce((a, b) => a > b ? a : b);
        final minHierarchy = hierarchyAnalysis.reduce((a, b) => a < b ? a : b);
        
        print('\nAnalisis Hierarki:');
        print('Rata-rata ukuran hierarki: ${avgHierarchy.toStringAsFixed(1)}');
        print('Ukuran hierarki maksimum: $maxHierarchy');
        print('Ukuran hierarki minimum: $minHierarchy');
      }
      
      // 5. Analisis kekinian
      final recentUpdates = validationResults
          .where((r) => r['exists'])
          .where((r) => (r['lastUpdate'] as DateTime).isAfter(DateTime.now().subtract(Duration(days: 365))))
          .length;
      
      print('\nAnalisis Kekinian:');
      print('Diperbarui dalam tahun terakhir: $recentUpdates/$existsInSystem');
      
      // 6. Laporan kode tidak valid
      final invalidCodes = validationResults.where((r) => !r['exists'] || !r['formatValid']).toList();
      
      if (invalidCodes.isNotEmpty) {
        print('\n=== Laporan Kode Tidak Valid ===');
        for (final invalid in invalidCodes) {
          print('Kode: ${invalid['code']}');
          if (!invalid['formatValid']) {
            print('  Masalah: Format tidak valid untuk ${type.value}');
          } else {
            print('  Masalah: Tidak ditemukan dalam sistem klasifikasi');
          }
        }
      }
      
      // 7. Rekomendasi
      print('\n=== Rekomendasi Validasi ===');
      
      if (existsInSystem == codes.length) {
        print('✅ Semua kode valid dan ada dalam sistem');
      } else {
        print('⚠️  ${codes.length - existsInSystem} kode memerlukan perhatian');
      }
      
      if (activeItems < existsInSystem) {
        print('⚠️  ${existsInSystem - activeItems} kode tidak aktif');
      }
      
      if (recentUpdates < existsInSystem * 0.8) {
        print('📅 Pertimbangkan untuk memeriksa versi klasifikasi yang diperbarui');
      }
      
    } catch (e) {
      print('Kesalahan validasi: $e');
    }
  }
  
  static bool _validateCodeFormat(ClassificationType type, String code) {
    if (type is KBLIType) {
      // Validasi KBLI berdasarkan level
      if (code.length == 1 && RegExp(r'^[A-U]$').hasMatch(code)) {
        return true; // Kategori
      }
      if (code.length == 2 && RegExp(r'^\d{2}$').hasMatch(code)) {
        return true; // Golongan Pokok
      }
      if (code.length == 3 && RegExp(r'^\d{3}$').hasMatch(code)) {
        return true; // Golongan
      }
      if (code.length == 4 && RegExp(r'^\d{4}$').hasMatch(code)) {
        return true; // Sub-Golongan
      }
      if (code.length == 5 && RegExp(r'^\d{5}$').hasMatch(code)) {
        return true; // Kelompok
      }
    } else if (type is KBKIType) {
      // Validasi KBKI berdasarkan level
      if (code.length == 1 && RegExp(r'^[0-4]$').hasMatch(code)) {
        return true; // Bagian
      }
      if (code.length == 2 && RegExp(r'^\d{2}$').hasMatch(code)) {
        return true; // Bab
      }
      if (code.length >= 3 && code.length <= 10 && RegExp(r'^\d+$').hasMatch(code)) {
        return true; // Golongan sampai Komoditas
      }
    }
    
    return false;
  }
}
```

## Integrasi Workflow Klasifikasi Statistik

Workflow tipikal untuk bekerja dengan klasifikasi statistik secara efektif:

1. **Penemuan Klasifikasi**: Identifikasi jenis dan versi klasifikasi yang tepat untuk kasus penggunaan Anda
2. **Eksplorasi Hierarki**: Navigasi melalui level klasifikasi untuk menemukan kode spesifik
3. **Validasi Kode**: Verifikasi format kode dan keberadaan dalam sistem klasifikasi
4. **Analisis Hubungan**: Periksa hubungan hierarkis dan referensi silang
5. **Manajemen Versi**: Lacak pembaruan klasifikasi dan perubahan versi

### Integrasi dengan Analisis Ekonomi

```dart
// Membangun analisis ekonomi komprehensif menggunakan klasifikasi statistik
Future<void> buildEconomicAnalysisWorkflow(String economicSector) async {
  try {
    // 1. Temukan klasifikasi KBLI untuk sektor ekonomi
    const kbliType = KBLIType.y2020;
    
    // Mulai dengan level kategori
    final categoryResult = await StadataFlutter.instance.view.statisticClassifications(
      id: kbliType.urlParamGenerator(economicSector), // misalnya, 'C' untuk Manufaktur
      type: kbliType,
    );
    
    if (categoryResult.data.isEmpty) {
      print('Sektor ekonomi tidak ditemukan: $economicSector');
      return;
    }
    
    final category = categoryResult.data.first;
    
    print('=== Analisis Sektor Ekonomi: ${category.title} ===');
    print('Kategori: ${category.id}');
    print('Deskripsi: ${category.description}');
    print('Sub-klasifikasi: ${category.derived.length}');
    
    // 2. Analisis sub-kategori
    final subCategoryAnalysis = <Map<String, dynamic>>[];
    
    for (final derived in category.derived.take(10)) {
      final subCatResult = await StadataFlutter.instance.view.statisticClassifications(
        id: kbliType.urlParamGenerator(derived.code),
        type: kbliType,
      );
      
      if (subCatResult.data.isNotEmpty) {
        final subCategory = subCatResult.data.first;
        subCategoryAnalysis.add({
          'code': derived.code,
          'title': derived.title,
          'description': derived.description,
          'furtherBreakdown': subCategory.derived.length,
          'lastUpdate': subCategory.lastUpdate,
        });
        
        print('\nSub-kategori: ${derived.code} - ${derived.title}');
        print('  Rincian lebih lanjut: ${subCategory.derived.length} item');
        print('  Terakhir diperbarui: ${subCategory.lastUpdate}');
      }
      
      await Future.delayed(Duration(milliseconds: 200));
    }
    
    // 3. Ringkasan sektor ekonomi
    print('\n=== Ringkasan Sektor Ekonomi ===');
    print('Total sub-kategori yang dianalisis: ${subCategoryAnalysis.length}');
    
    final totalBreakdown = subCategoryAnalysis.fold(0, (sum, item) => sum + (item['furtherBreakdown'] as int));
    print('Total klasifikasi detail: $totalBreakdown');
    
    final avgBreakdown = subCategoryAnalysis.isNotEmpty 
        ? totalBreakdown / subCategoryAnalysis.length 
        : 0.0;
    print('Rata-rata klasifikasi per sub-kategori: ${avgBreakdown.toStringAsFixed(1)}');
    
    // Pembaruan terbaru
    final recentUpdates = subCategoryAnalysis.where((item) => 
        (item['lastUpdate'] as DateTime).isAfter(DateTime.now().subtract(Duration(days: 365)))
    ).length;
    
    print('Sub-kategori yang diperbarui baru-baru ini: $recentUpdates/${subCategoryAnalysis.length}');
    
  } catch (e) {
    print('Kesalahan workflow analisis ekonomi: $e');
  }
}
```

## Penanganan Error

API View Klasifikasi Statistik mengembalikan hasil yang dipaginasi dengan data klasifikasi statistik dan dapat melempar exception spesifik:

- **StatisticClassificationException**: Error spesifik klasifikasi (ID tidak valid, ketidaksesuaian jenis, pembatasan akses)
- **ApiException**: Error komunikasi API umum (masalah jaringan, error server, pembatasan rate)
- **ApiKeyNotFoundException**: Error autentikasi (API key tidak valid atau hilang)
- **ValidationException**: Error validasi parameter (kode klasifikasi tidak valid, parameter yang salah format)

```dart
try {
  const kbliType = KBLIType.y2020;
  final result = await StadataFlutter.instance.view.statisticClassifications(
    id: kbliType.urlParamGenerator('A'),
    type: kbliType,
    lang: DataLanguage.id,
  );
  
  if (result.data.isNotEmpty) {
    // Berhasil mengambil data klasifikasi
    final classification = result.data.first;
    print('Klasifikasi: ${classification.title}');
    print('Jenis: ${classification.type?.value ?? 'Tidak diketahui'}');
    print('Level: ${classification.level?.value ?? 'Tidak diketahui'}');
    print('Hubungan hierarkis: ${classification.previous.length + classification.derived.length}');
  } else {
    // Data klasifikasi tidak ditemukan
    print('Klasifikasi tidak ditemukan - mungkin kode tidak valid atau akses dibatasi');
  }
  
} on StatisticClassificationException catch (e) {
  print('Error klasifikasi: ${e.message}');
  // Tangani error spesifik klasifikasi seperti kode tidak valid atau ketidaksesuaian jenis
  
} on ApiException catch (e) {
  print('Error komunikasi API: ${e.message}');
  // Tangani masalah konektivitas jaringan atau server
  
} on ApiKeyNotFoundException catch (e) {
  print('Autentikasi diperlukan: ${e.message}');
  // Tangani masalah konfigurasi API key
  
} catch (e) {
  print('Error tidak terduga: $e');
  // Tangani error lain yang tidak terduga
}
```

## Pertimbangan Performa

- **Pembatasan Rate**: Implementasikan delay yang sesuai antar request, terutama untuk traversal hierarki
- **Strategi Caching**: Cache metadata klasifikasi dan hubungan hierarkis
- **Pemrosesan Batch**: Proses multiple klasifikasi secara efisien dengan pembatasan rate yang tepat
- **Manajemen Memori**: Perhatikan penggunaan memori saat memproses hierarki klasifikasi besar
- **Manajemen Versi**: Pertimbangkan kompatibilitas versi klasifikasi untuk analisis historis
- **Validasi Kode**: Implementasikan validasi format kode di sisi klien sebelum panggilan API

## Properti (StatisticClassification)

| Properti | Tipe | Deskripsi |
| -------- | ---- | ----------- |
| `id` | `String` | Pengidentifikasi unik untuk klasifikasi statistik |
| `type` | `ClassificationType?` | Jenis klasifikasi (KBLI atau KBKI) dengan versi (opsional) |
| `level` | `ClassificationLevel?` | Level hierarkis dalam sistem klasifikasi (opsional) |
| `source` | `String` | Informasi sumber dan asal data |
| `title` | `String` | Judul atau nama lengkap klasifikasi |
| `description` | `String` | Deskripsi detail klasifikasi dan cakupannya |
| `isbn` | `String?` | Nomor Buku Standar Internasional (opsional) |
| `issn` | `String?` | Nomor Serial Standar Internasional (opsional) |
| `catalogueNumber` | `String?` | Nomor referensi katalog internal BPS (opsional) |
| `publicationNumber` | `String?` | Nomor seri publikasi resmi (opsional) |
| `lastUpdate` | `DateTime` | Timestamp pembaruan klasifikasi terbaru |
| `releaseDate` | `DateTime` | Tanggal rilis asli klasifikasi |
| `location` | `String?` | Konteks lokasi geografis atau administratif (opsional) |
| `url` | `String?` | URL langsung ke dokumentasi atau sumber daya klasifikasi (opsional) |
| `mfd` | `String?` | Informasi metadata atau deskripsi format (opsional) |
| `previous` | `List<ClassificationItem>` | Daftar klasifikasi parent atau level sebelumnya dalam hierarki |
| `derived` | `List<ClassificationItem>` | Daftar klasifikasi child atau turunan dalam hierarki |
| `flag` | `bool` | Flag status aktif yang menunjukkan apakah klasifikasi saat ini valid |
| `tags` | `List<String>` | Daftar tag deskriptif dan kata kunci untuk klasifikasi |

## Properti (ClassificationItem)

| Properti | Tipe | Deskripsi |
| -------- | ---- | ----------- |
| `code` | `String` | Pengidentifikasi kode klasifikasi unik |
| `title` | `String` | Judul atau nama lengkap item klasifikasi |
| `description` | `String` | Deskripsi detail cakupan dan makna item klasifikasi |
