# Panduan Penggunaan API View

API View dalam STADATA Flutter SDK menyediakan akses detail ke rekaman individual dan informasi komprehensif tentang entitas statistik tertentu. Berbeda dengan API List yang mengembalikan koleksi data ringkasan, API View memberikan rekaman detail lengkap dengan metadata lengkap, konten, dan informasi kontekstual.

## Memahami API View

API View dirancang untuk pengambilan data detail dan analisis mendalam:

- **Rekaman Terperinci**: Informasi lengkap tentang entitas tertentu termasuk metadata, konten, dan hubungan
- **Konten Kaya**: Konten teks lengkap, lampiran media, detail klasifikasi, dan informasi kontekstual
- **Data Hubungan**: Informasi tentang entitas terkait, struktur hierarkis, dan referensi silang
- **Konteks Analitis**: Konteks statistik, informasi metodologis, dan indikator kualitas data
- **Metadata Lengkap**: Informasi deskriptif komprehensif untuk interpretasi data yang tepat

## API View yang Tersedia

STADATA Flutter SDK menyediakan akses view ke entitas statistik kunci berikut:

### 1. View Publikasi

Akses informasi publikasi terperinci termasuk konten, metodologi, dan konteks statistik.

### 2. View Berita

Ambil artikel berita lengkap dengan konten penuh, detail publikasi, dan informasi terkait.

### 3. View Siaran Pers

Dapatkan data siaran pers komprehensif termasuk konten penuh, lampiran media, dan informasi kontekstual.

### 4. View Tabel Statis

Akses informasi tabel statis terperinci dengan metadata, detail struktur, dan konteks data.

### 5. View Klasifikasi Statistik

Ambil informasi klasifikasi lengkap termasuk struktur hierarkis dan definisi terperinci.

## Pola Penggunaan Dasar

Pola standar untuk menggunakan API View mengikuti struktur ini:

```dart
// 1. Inisialisasi SDK
final stadata = StadataFlutter.instance;
await stadata.init(apiKey: 'api_key_anda');

// 2. Akses API view
final result = await stadata.view.namaMetode(
  id: 'id_entitas_spesifik',
  domain: 'kode_domain',
  lang: DataLanguage.id,
);

// 3. Tangani hasil
if (result.isSuccess) {
  final entity = result.data;
  // Proses data entitas terperinci
} else {
  // Tangani kasus error
  print('Error: ${result.error}');
}
```

## Contoh Komprehensif

### 1. Analisis Detail Publikasi

```dart
// Ambil dan analisis informasi publikasi terperinci
class PublicationAnalyzer {
  static Future<void> analyzePublication(String publicationId, String domain) async {
    try {
      // Dapatkan informasi publikasi terperinci
      final result = await StadataFlutter.instance.view.publication(
        id: publicationId,
        domain: domain,
        lang: DataLanguage.id,
      );
      
      final publication = result.data;
      
      print('=== Analisis Publikasi ===');
      print('Judul: ${publication.title}');
      print('Abstrak: ${publication.abstract}');
      print('Nomor Publikasi: ${publication.publicationNumber}');
      print('ISSN: ${publication.issn}');
      print('Tanggal Terbit: ${publication.releaseDate}');
      print('Halaman: ${publication.pages}');
      print('Ukuran: ${publication.size}');
      print('Bahasa: ${publication.language}');
      
      // Analisis struktur konten
      if (publication.cover.isNotEmpty) {
        print('\\nGambar Sampul Tersedia: ${publication.cover}');
      }
      
      if (publication.pdf.isNotEmpty) {
        print('PDF Tersedia: ${publication.pdf}');
      }
      
      // Klasifikasi publikasi
      print('\\nKlasifikasi:');
      print('ID Subjek: ${publication.subjectId}');
      print('Kategori: Berdasarkan klasifikasi subjek');
      
      // Analisis konten
      print('\\nIkhtisar Konten:');
      final abstractWords = publication.abstract.split(' ').length;
      print('Panjang Abstrak: $abstractWords kata');
      
      // Tentukan jenis dan signifikansi publikasi
      if (publication.pages != null && publication.pages! > 100) {
        print('Jenis Publikasi: Laporan komprehensif');
      } else if (publication.pages != null && publication.pages! > 20) {
        print('Jenis Publikasi: Publikasi standar');
      } else {
        print('Jenis Publikasi: Publikasi ringkas atau ringkasan');
      }
      
    } catch (e) {
      print('Error menganalisis publikasi: $e');
    }
  }
}
```

### 2. Pemrosesan Konten Berita

```dart
// Proses dan analisis konten berita secara detail
class NewsContentProcessor {
  static Future<void> processNewsContent(int newsId, String domain) async {
    try {
      // Ambil informasi berita terperinci
      final result = await StadataFlutter.instance.view.news(
        id: newsId,
        domain: domain,
        lang: DataLanguage.id,
      );
      
      final news = result.data;
      
      print('=== Analisis Konten Berita ===');
      print('Judul: ${news.title}');
      print('Tanggal Publikasi: ${news.releaseDate}');
      print('Kategori Berita: ${news.categoryId}');
      
      // Analisis konten
      print('\\nAnalisis Konten:');
      final contentLength = news.content.length;
      final wordCount = news.content.split(' ').length;
      final paragraphs = news.content.split('\\n').where((p) => p.trim().isNotEmpty).length;
      
      print('Panjang Konten: $contentLength karakter');
      print('Jumlah Kata: $wordCount kata');
      print('Paragraf: $paragraphs');
      
      // Estimasi waktu baca (rata-rata 200 kata per menit)
      final readingTimeMinutes = (wordCount / 200).ceil();
      print('Estimasi Waktu Baca: $readingTimeMinutes menit');
      
      // Kategorisasi konten
      print('\\nKategorisasi Konten:');
      final contentLower = news.content.toLowerCase();
      if (contentLower.contains('ekonomi')) {
        print('Kategori: Berita ekonomi');
      } else if (contentLower.contains('sosial') || contentLower.contains('penduduk')) {
        print('Kategori: Berita sosial/demografi');
      } else if (contentLower.contains('statistik') || contentLower.contains('data')) {
        print('Kategori: Berita metodologi statistik');
      } else {
        print('Kategori: Berita statistik umum');
      }
      
      // Media dan lampiran
      if (news.picture.isNotEmpty) {
        print('\\nMedia: Gambar unggulan tersedia');
        print('URL Gambar: ${news.picture}');
      }
      
    } catch (e) {
      print('Error memproses konten berita: $e');
    }
  }
}
```

### 3. Analisis Komprehensif Siaran Pers

```dart
// Analisis dan pemrosesan siaran pers komprehensif
class PressReleaseAnalyzer {
  static Future<void> analyzePressRelease(int pressReleaseId, String domain) async {
    try {
      // Dapatkan informasi siaran pers terperinci
      final result = await StadataFlutter.instance.view.pressRelease(
        id: pressReleaseId,
        domain: domain,
        lang: DataLanguage.id,
      );
      
      final pressRelease = result.data;
      
      print('=== Analisis Komprehensif Siaran Pers ===');
      print('Judul: ${pressRelease.title}');
      print('Tanggal Rilis: ${pressRelease.releaseDate}');
      print('Abstrak: ${pressRelease.abstract}');
      
      // Analisis struktur konten
      print('\\nStruktur Konten:');
      final content = pressRelease.content;
      final sections = content.split('\\n\\n').where((s) => s.trim().isNotEmpty).length;
      print('Bagian Konten: $sections');
      
      // Analisis signifikansi statistik
      print('\\nAnalisis Konten Statistik:');
      final hasNumbers = RegExp(r'\\d+[.,]?\\d*\\s*%|\\d+[.,]?\\d*\\s*(juta|ribu|miliar)').hasMatch(content);
      final hasPercentages = content.contains('%');
      final hasComparisons = content.contains('naik') || content.contains('turun') || content.contains('meningkat');
      
      print('Mengandung Data Statistik: $hasNumbers');
      print('Mengandung Persentase: $hasPercentages');
      print('Mengandung Informasi Tren: $hasComparisons');
      
      // Indikator urgensi dan kepentingan
      print('\\nKlasifikasi Siaran Pers:');
      final titleLower = pressRelease.title.toLowerCase();
      if (titleLower.contains('darurat') || titleLower.contains('mendesak')) {
        print('Prioritas: Urgensi tinggi');
      } else if (titleLower.contains('penting') || titleLower.contains('khusus')) {
        print('Prioritas: Pengumuman penting');
      } else {
        print('Prioritas: Pengumuman statistik reguler');
      }
      
      // Penilaian paket media
      if (pressRelease.picture.isNotEmpty) {
        print('\\nPaket Media: Konten visual tersedia');
        print('Gambar: ${pressRelease.picture}');
      }
      
      // Penilaian data terkait
      print('\\nKonteks Data:');
      print('ID Subjek: ${pressRelease.subjectId}');
      print('Terkait dengan area subjek statistik');
      
    } catch (e) {
      print('Error menganalisis siaran pers: $e');
    }
  }
}
```

### 4. Analisis Mendalam Tabel Statis

```dart
// Analisis mendalam struktur dan konten tabel statis
class StaticTableAnalyzer {
  static Future<void> analyzeStaticTable(int tableId, String domain) async {
    try {
      // Ambil informasi tabel statis terperinci
      final result = await StadataFlutter.instance.view.staticTable(
        id: tableId,
        domain: domain,
        lang: DataLanguage.id,
      );
      
      final table = result.data;
      
      print('=== Analisis Mendalam Tabel Statis ===');
      print('Judul Tabel: ${table.title}');
      print('ID Tabel: ${table.id}');
      print('ID Subjek: ${table.subjectId}');
      print('Diperbarui: ${table.updatedAt}');
      print('Dibuat: ${table.createdAt}');
      
      // Analisis metadata tabel
      print('\\nMetadata Tabel:');
      print('Ukuran: ${table.size}');
      print('Excel Tersedia: ${table.excel.isNotEmpty ? "Ya" : "Tidak"}');
      
      if (table.excel.isNotEmpty) {
        print('Unduh Excel: ${table.excel}');
      }
      
      // Analisis struktur konten
      print('\\nAnalisis Struktur Data:');
      
      // Analisis deskripsi tabel untuk wawasan data
      final description = table.table;
      if (description.isNotEmpty) {
        print('Deskripsi Tersedia: Ya');
        
        // Cari indikator temporal
        if (description.contains('tahun') || description.contains('bulan')) {
          print('Data Temporal: Data time series terdeteksi');
        }
        
        // Cari indikator geografis
        if (description.contains('provinsi') || description.contains('kabupaten') || description.contains('kota')) {
          print('Data Geografis: Rincian regional terdeteksi');
        }
        
        // Cari indikator demografis
        if (description.contains('jenis kelamin') || description.contains('umur') || description.contains('pendidikan')) {
          print('Data Demografis: Karakteristik populasi terdeteksi');
        }
      }
      
      // Penilaian kesegaran data
      final now = DateTime.now();
      final updated = DateTime.parse(table.updatedAt);
      final daysSinceUpdate = now.difference(updated).inDays;
      
      print('\\nKesegaran Data:');
      if (daysSinceUpdate < 30) {
        print('Status: Sangat terkini (diperbarui $daysSinceUpdate hari lalu)');
      } else if (daysSinceUpdate < 90) {
        print('Status: Terkini (diperbarui $daysSinceUpdate hari lalu)');
      } else if (daysSinceUpdate < 365) {
        print('Status: Cukup terkini (diperbarui $daysSinceUpdate hari lalu)');
      } else {
        print('Status: Data lama (diperbarui $daysSinceUpdate hari lalu)');
      }
      
      // Rekomendasi penggunaan
      print('\\nRekomendasi Penggunaan:');
      if (table.excel.isNotEmpty) {
        print('✓ Unduh file Excel untuk analisis detail');
      }
      print('✓ Gunakan ID tabel ${table.id} untuk kueri data');
      print('✓ Referensi ID subjek ${table.subjectId} untuk konten terkait');
      
    } catch (e) {
      print('Error menganalisis tabel statis: $e');
    }
  }
}
```

### 5. Analisis Detail Klasifikasi Statistik

```dart
// Analisis klasifikasi statistik komprehensif
class ClassificationAnalyzer {
  static Future<void> analyzeClassification(int classificationId, String domain) async {
    try {
      // Dapatkan informasi klasifikasi terperinci
      final result = await StadataFlutter.instance.view.statisticClassification(
        id: classificationId,
        domain: domain,
        lang: DataLanguage.id,
      );
      
      final classification = result.data;
      
      print('=== Analisis Klasifikasi Statistik ===');
      print('Judul Klasifikasi: ${classification.title}');
      print('Catatan Turunan: ${classification.derivationNote}');
      print('Status: ${classification.status}');
      print('Level: ${classification.level}');
      
      // Analisis struktur hierarkis
      print('\\nStruktur Hierarkis:');
      print('Level Klasifikasi: ${classification.level}');
      
      if (classification.level > 1) {
        print('Posisi Hierarkis: Sub-klasifikasi (Level ${classification.level})');
        print('Bagian dari sistem klasifikasi yang lebih besar');
      } else {
        print('Posisi Hierarkis: Klasifikasi level akar');
      }
      
      // Analisis sistem klasifikasi
      print('\\nSistem Klasifikasi:');
      final title = classification.title.toLowerCase();
      
      if (title.contains('kbli') || title.contains('klasifikasi baku lapangan usaha')) {
        print('Jenis Sistem: KBLI (Klasifikasi Baku Lapangan Usaha Indonesia)');
        print('Tujuan: Klasifikasi aktivitas ekonomi');
        print('Penggunaan: Pendaftaran usaha, survei ekonomi, neraca nasional');
      } else if (title.contains('kbki') || title.contains('klasifikasi baku komoditi')) {
        print('Jenis Sistem: KBKI (Klasifikasi Baku Komoditi Indonesia)');
        print('Tujuan: Klasifikasi komoditas dan produk');
        print('Penggunaan: Statistik perdagangan, pemantauan harga, analisis produksi');
      } else if (title.contains('isco') || title.contains('pekerjaan')) {
        print('Jenis Sistem: Klasifikasi Pekerjaan');
        print('Tujuan: Klasifikasi pekerjaan dan okupasi');
        print('Penggunaan: Survei angkatan kerja, statistik ketenagakerjaan');
      } else {
        print('Jenis Sistem: Klasifikasi statistik umum');
        print('Tujuan: Kategorisasi dan analisis statistik');
      }
      
      // Turunan dan metodologi
      print('\\nInformasi Metodologis:');
      if (classification.derivationNote.isNotEmpty) {
        print('Detail Turunan Tersedia: Ya');
        print('Turunan: ${classification.derivationNote}');
        
        // Analisis turunan untuk standar internasional
        final derivation = classification.derivationNote.toLowerCase();
        if (derivation.contains('isic') || derivation.contains('international')) {
          print('Standar Internasional: Berdasarkan klasifikasi internasional');
        } else if (derivation.contains('nasional') || derivation.contains('indonesia')) {
          print('Standar Nasional: Klasifikasi spesifik Indonesia');
        }
      } else {
        print('Detail Turunan: Tidak dispesifikasi');
      }
      
      // Status dan validitas
      print('\\nInformasi Status:');
      print('Status Saat Ini: ${classification.status}');
      
      if (classification.status.toLowerCase().contains('aktif') || classification.status.toLowerCase().contains('active')) {
        print('Validitas: Saat ini aktif dan digunakan');
        print('Rekomendasi: Aman digunakan untuk pekerjaan statistik saat ini');
      } else if (classification.status.toLowerCase().contains('revisi') || classification.status.toLowerCase().contains('revision')) {
        print('Validitas: Sedang direvisi atau diperbarui');
        print('Rekomendasi: Periksa pembaruan sebelum penggunaan ekstensif');
      } else {
        print('Validitas: Status tidak jelas - verifikasi penerapan saat ini');
      }
      
      // Rekomendasi penggunaan
      print('\\nRekomendasi Penggunaan:');
      print('✓ Gunakan untuk kategorisasi data dalam area subjek');
      print('✓ Referensi dalam survei dan analisis statistik');
      print('✓ Terapkan dalam alur kerja pengumpulan dan pemrosesan data');
      if (classification.level > 1) {
        print('✓ Pertimbangkan klasifikasi induk untuk konteks yang lebih luas');
      }
      
    } catch (e) {
      print('Error menganalisis klasifikasi: $e');
    }
  }
}
```

## Alur Kerja Integrasi

### Alur Kerja Analisis Multi-Entitas

```dart
// Alur kerja komprehensif yang menggabungkan beberapa API view
class IntegratedAnalysisWorkflow {
  static Future<void> performComprehensiveAnalysis(String domain) async {
    try {
      print('=== Analisis Konten Statistik Terintegrasi ===');
      
      // 1. Mulai dengan publikasi untuk konteks
      final publicationResult = await StadataFlutter.instance.view.publication(
        id: 'sample_publication_id',
        domain: domain,
        lang: DataLanguage.id,
      );
      
      if (publicationResult.isSuccess) {
        final publication = publicationResult.data;
        print('\\n1. Konteks Publikasi:');
        print('   Judul: ${publication.title}');
        print('   Area Subjek: ${publication.subjectId}');
        
        // 2. Cari berita terkait tentang subjek yang sama
        // Ini memerlukan mendapatkan daftar berita terlebih dahulu, kemudian melihat item spesifik
        print('\\n2. Mencari konten berita terkait...');
        
        // 3. Periksa siaran pers tentang topik yang sama
        print('\\n3. Memeriksa siaran pers terkait...');
        
        // 4. Cari tabel statis terkait dengan subjek publikasi
        print('\\n4. Menganalisis tabel data terkait...');
        
        // 5. Periksa sistem klasifikasi yang digunakan
        print('\\n5. Memahami kerangka klasifikasi...');
        
        print('\\nAlur kerja analisis terintegrasi mendemonstrasikan bagaimana API view');
        print('dapat digabungkan untuk penelitian statistik komprehensif.');
      }
      
    } catch (e) {
      print('Error dalam analisis terintegrasi: $e');
    }
  }
}
```

## Praktik Terbaik Penanganan Error

### Manajemen Error Komprehensif

```dart
// Penanganan error yang robust untuk operasi API view
class ViewAPIErrorHandler {
  static Future<void> handleViewOperationSafely<T>(
    Future<Result<T>> Function() viewOperation,
    String operationName,
  ) async {
    try {
      final result = await viewOperation();
      
      if (result.isSuccess) {
        print('$operationName berhasil diselesaikan');
        // Proses hasil yang berhasil
        return result.data;
      } else {
        // Tangani jenis error spesifik
        final error = result.error;
        
        if (error is ApiKeyNotFoundException) {
          print('$operationName gagal: Kunci API tidak valid atau hilang');
          print('Solusi: Periksa konfigurasi kunci API Anda');
        } else if (error is ApiException) {
          print('$operationName gagal: Error API - ${error.message}');
          print('Solusi: Periksa konektivitas jaringan dan status API');
        } else if (error.toString().contains('not found')) {
          print('$operationName gagal: Entitas yang diminta tidak ditemukan');
          print('Solusi: Verifikasi parameter ID dan domain');
        } else {
          print('$operationName gagal: ${error.toString()}');
        }
      }
      
    } catch (e) {
      print('$operationName mengalami error tak terduga: $e');
      print('Solusi: Periksa parameter input dan konektivitas jaringan');
    }
  }
}

// Contoh penggunaan
await ViewAPIErrorHandler.handleViewOperationSafely(
  () => StadataFlutter.instance.view.publication(
    id: 'publication_id',
    domain: '0000',
    lang: DataLanguage.id,
  ),
  'Pengambilan publikasi',
);
```

## Optimasi Kinerja

### Penggunaan API View yang Efisien

```dart
// Pola yang dioptimalkan untuk operasi API view
class ViewAPIOptimizer {
  static final Map<String, dynamic> _cache = {};
  
  static Future<T?> getCachedOrFetch<T>(
    String cacheKey,
    Future<Result<T>> Function() fetchOperation,
    Duration cacheTimeout,
  ) async {
    // Periksa cache terlebih dahulu
    if (_cache.containsKey(cacheKey)) {
      final cachedData = _cache[cacheKey];
      if (DateTime.now().difference(cachedData['timestamp']).compareTo(cacheTimeout) < 0) {
        print('Mengembalikan data cache untuk $cacheKey');
        return cachedData['data'] as T;
      }
    }
    
    // Ambil data segar
    try {
      final result = await fetchOperation();
      if (result.isSuccess) {
        _cache[cacheKey] = {
          'data': result.data,
          'timestamp': DateTime.now(),
        };
        return result.data;
      }
    } catch (e) {
      print('Error mengambil data untuk $cacheKey: $e');
    }
    
    return null;
  }
  
  // Pemrosesan batch untuk beberapa operasi view
  static Future<void> batchViewOperations(
    List<Future<void> Function()> operations,
    {int concurrentLimit = 3}
  ) async {
    // Proses operasi dalam batch untuk menghindari overload API
    for (int i = 0; i < operations.length; i += concurrentLimit) {
      final batch = operations.skip(i).take(concurrentLimit);
      await Future.wait(batch.map((op) => op()));
      
      // Tambahkan jeda antara batch
      if (i + concurrentLimit < operations.length) {
        await Future.delayed(Duration(milliseconds: 500));
      }
    }
  }
}
```

## Ringkasan Praktik Terbaik

### Panduan Penggunaan API View

1. **Identifikasi Entitas**: Selalu verifikasi ID entitas dan kode domain sebelum melakukan panggilan API view
2. **Penanganan Error**: Implementasikan penanganan error komprehensif untuk masalah jaringan dan parameter tidak valid
3. **Validasi Data**: Validasi data yang diambil sebelum pemrosesan untuk memastikan kelengkapan
4. **Strategi Caching**: Cache data view yang sering diakses untuk meningkatkan kinerja
5. **Pembatasan Rate**: Hormati batas rate API saat melakukan beberapa permintaan view
6. **Pemrosesan Konten**: Proses konten besar (seperti PDF publikasi) secara efisien
7. **Pemetaan Hubungan**: Gunakan data view untuk memahami hubungan antara entitas yang berbeda
8. **Pemanfaatan Metadata**: Manfaatkan metadata untuk interpretasi dan konteks data yang tepat

API View menyediakan kemampuan yang kuat untuk analisis konten statistik terperinci dan eksplorasi data komprehensif dalam sistem statistik Indonesia.

