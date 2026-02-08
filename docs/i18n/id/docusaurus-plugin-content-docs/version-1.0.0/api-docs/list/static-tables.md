# Tabel Statis

API Tabel Statis menyediakan akses ke koleksi komprehensif tabel data terstruktur dari BPS (Badan Pusat Statistik) Indonesia di semua wilayah. Tabel statis merupakan dasar dari distribusi data statistik Indonesia, berisi data numerik terorganisir yang disajikan dalam format tabel standar dengan baris, kolom, dan struktur data yang konsisten.

Tabel statis BPS berfungsi sebagai sumber utama untuk data statistik resmi, memungkinkan peneliti, analis, dan pembuat kebijakan mengakses informasi terstruktur yang dapat diandalkan dalam berbagai format untuk analisis, pelaporan, dan pengambilan keputusan berbasis data.

## Memahami Tabel Statis BPS

Tabel statis menyediakan akses terstruktur ke data statistik resmi:

- **Data Terstruktur**: Format tabel standar dengan baris dan kolom yang konsisten untuk kemudahan analisis
- **Integritas Data**: Data resmi yang telah diverifikasi dan divalidasi oleh BPS untuk keakuratan dan konsistensi
- **Aksesibilitas Multi-Format**: Tersedia dalam format HTML dan Excel untuk berbagai kebutuhan analisis
- **Organisasi Temporal**: Data yang diorganisir berdasarkan periode waktu dengan filter bulan dan tahun
- **Pencarian Tematik**: Kemampuan pencarian berdasarkan kata kunci untuk akses konten yang ditargetkan

## Struktur Sistem Tabel Statis

Tabel statis BPS dirancang untuk memaksimalkan utilitas data:

- **Klasifikasi Subjek**: Diorganisir berdasarkan area tematik untuk navigasi logis dan penemuan konten
- **Cakupan Geografis**: Tersedia dari kantor BPS nasional, provinsi, dan lokal untuk analisis multi-level
- **Granularitas Temporal**: Filtering berdasarkan bulan dan tahun untuk analisis periode spesifik
- **Format Distribusi**: Dukungan format HTML untuk preview web dan Excel untuk analisis mendalam
- **Metadata Lengkap**: Informasi penciptaan, pembaruan, dan ukuran file untuk manajemen data

## Parameter

| Parameter | Tipe           | Deskripsi                                                    |
| --------- | -------------- | ------------------------------------------------------------ |
| `domain`  | `String`       | Kode domain (wilayah) untuk mengambil tabel statis **(wajib)** |
| `lang`    | `DataLanguage` | Bahasa untuk data tabel statis (default: `DataLanguage.id`) |
| `page`    | `int`          | Nomor halaman (default: `1`)                                |
| `keyword` | `String?`      | Kata kunci untuk mencari tabel statis (opsional)            |
| `bulan`   | `int?`         | Bulan untuk penyaringan tabel statis (opsional - `1..12`)   |
| `tahun`   | `int?`         | Tahun untuk penyaringan tabel statis (opsional)             |

## Contoh

### 1. Mengambil Semua Tabel Statis untuk Domain

```dart
// Mengambil tabel statis dari BPS Jawa Tengah
final hasilTabelStatis = await StadataFlutter.instance.list.staticTable(
  domain: '3300', // Kode domain Jawa Tengah
  lang: DataLanguage.id,
);

final daftarTabelStatis = hasilTabelStatis.data;
final paginasi = hasilTabelStatis.pagination;

// Mencetak informasi paginasi
print('Halaman Saat Ini: ${paginasi.page}');
print('Total Halaman: ${paginasi.pages}');
print('Jumlah Data dalam Halaman Ini: ${paginasi.count}');
print('Per Halaman: ${paginasi.perPage}');
print('Total: ${paginasi.total}');
print('------------------------');

// Mencetak data tabel statis yang diambil
for (final tabelStatis in daftarTabelStatis) {
  print('ID Tabel: ${tabelStatis.id}');
  print('Judul Tabel: ${tabelStatis.title}');
  print('ID Subjek: ${tabelStatis.subjectId}');
  print('Subjek: ${tabelStatis.subject}');
  print('Ukuran: ${tabelStatis.size}');
  print('Diperbarui Pada: ${tabelStatis.updatedAt}');
  print('Dibuat Pada: ${tabelStatis.createdAt}');
  print('Tautan Excel: ${tabelStatis.excel}');
  
  // Memeriksa ketersediaan konten tabel HTML
  if (tabelStatis.table != null && tabelStatis.table!.isNotEmpty) {
    print('Preview HTML tersedia: ${tabelStatis.table!.substring(0, 100)}...');
  }
  
  print('------------------------');
}
```

### 2. Mencari Tabel Statis berdasarkan Kata Kunci dan Periode

```dart
// Mencari tabel statis ekonomi untuk periode tertentu
final tabelEkonomi = await StadataFlutter.instance.list.staticTable(
  domain: '0000', // Level nasional
  lang: DataLanguage.id,
  keyword: 'ekonomi', // Mencari tabel terkait ekonomi
  tahun: 2023, // Data tahun 2023
  bulan: 12, // Data bulan Desember
);

// Memproses hasil pencarian
print('=== Tabel Statis Ekonomi Desember 2023 ===');
for (final tabel in tabelEkonomi.data) {
  print('Tabel Ekonomi: ${tabel.title}');
  print('Subjek: ${tabel.subject}');
  print('Ukuran File: ${tabel.size}');
  print('Tanggal Diperbarui: ${tabel.updatedAt}');
  
  // Mengkategorikan berdasarkan ukuran file
  final fileSize = tabel.size.toLowerCase();
  if (fileSize.contains('mb')) {
    print('  Kategori: Tabel dataset besar');
  } else if (fileSize.contains('kb')) {
    print('  Kategori: Tabel dataset sedang');
  } else {
    print('  Kategori: Tabel dataset kecil');
  }
  
  // Memeriksa format yang tersedia
  final hasExcel = tabel.excel.isNotEmpty;
  final hasHtml = tabel.table != null && tabel.table!.isNotEmpty;
  
  print('  Format Excel: ${hasExcel ? 'Tersedia' : 'Tidak tersedia'}');
  print('  Format HTML: ${hasHtml ? 'Tersedia' : 'Tidak tersedia'}');
  
  print('------------------------');
}
```

### 3. Menganalisis Tabel Statis di Berbagai Domain

```dart
// Membandingkan ketersediaan tabel statis di berbagai wilayah
class StaticTableExplorer {
  static Future<void> compareTablesAcrossDomains() async {
    final domains = ['0000', '3100', '3200', '3300']; // Nasional, Jakarta, Jawa Barat, Jawa Tengah
    final domainTables = <String, List<StaticTable>>{};\
    
    for (final domain in domains) {
      final tables = await StadataFlutter.instance.list.staticTable(
        domain: domain,
        lang: DataLanguage.id,
      );
      domainTables[domain] = tables.data;
      
      await Future.delayed(Duration(milliseconds: 300));
    }
    
    print('=== Distribusi Tabel Statis ===');
    for (final entry in domainTables.entries) {
      print('Domain ${entry.key}: ${entry.value.length} tabel');
      
      // Menganalisis distribusi subjek
      final subjects = <String?, int>{};
      final fileSizes = <String, int>{};
      
      for (final table in entry.value) {
        subjects[table.subject] = (subjects[table.subject] ?? 0) + 1;
        
        // Mengkategorikan ukuran file
        final size = table.size.toLowerCase();
        String sizeCategory;
        if (size.contains('mb')) {
          sizeCategory = 'Besar (MB)';
        } else if (size.contains('kb')) {
          sizeCategory = 'Sedang (KB)';
        } else {
          sizeCategory = 'Kecil';
        }
        fileSizes[sizeCategory] = (fileSizes[sizeCategory] ?? 0) + 1;
      }
      
      print('  Subjek teratas:');
      final sortedSubjects = subjects.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      
      for (final subjectEntry in sortedSubjects.take(3)) {
        final subjectName = subjectEntry.key ?? 'Tidak dikategorikan';
        print('    $subjectName: ${subjectEntry.value} tabel');
      }
      
      print('  Distribusi ukuran file:');
      for (final sizeEntry in fileSizes.entries) {
        print('    ${sizeEntry.key}: ${sizeEntry.value} file');
      }
      
      print('---');
    }
  }
}
```

### 4. Sistem Manajemen dan Analisis Tabel Statis

```dart
// Sistem manajemen tabel statis yang komprehensif
class StaticTableManager {
  static Future<void> manageStaticTableWorkflow(String domain) async {
    try {
      // 1. Mengambil semua tabel statis untuk domain
      final allTables = await StadataFlutter.instance.list.staticTable(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      print('=== Manajemen Tabel Statis ===');
      print('Total tabel di domain $domain: ${allTables.data.length}');
      
      // 2. Menganalisis distribusi berdasarkan subjek
      final subjectDistribution = <String?, List<StaticTable>>{};
      for (final table in allTables.data) {
        final subject = table.subject;
        subjectDistribution[subject] = (subjectDistribution[subject] ?? [])..add(table);
      }
      
      print('Subjek yang tersedia: ${subjectDistribution.keys.length}');
      
      // 3. Menganalisis setiap subjek
      for (final entry in subjectDistribution.entries) {
        final subject = entry.key ?? 'Tidak dikategorikan';
        final tables = entry.value;
        
        print('\\n=== Subjek: $subject ===');
        print('Jumlah tabel: ${tables.length}');
        
        // Menganalisis ketersediaan format
        final withExcel = tables.where((t) => t.excel.isNotEmpty).length;
        final withHtml = tables.where((t) => t.table != null && t.table!.isNotEmpty).length;
        
        print('Dengan Excel: $withExcel');
        print('Dengan HTML: $withHtml');
        
        // Menganalisis tren temporal
        final currentYear = DateTime.now().year;
        final recentTables = tables.where((t) => 
            t.updatedAt.year >= currentYear - 1).length;
        
        print('Tabel terbaru (1 tahun terakhir): $recentTables');
        
        // Menganalisis ukuran file
        final totalSizeMB = tables.fold<double>(0.0, (sum, table) {
          final sizeStr = table.size.toLowerCase();
          if (sizeStr.contains('mb')) {
            final sizeValue = double.tryParse(sizeStr.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;
            return sum + sizeValue;
          } else if (sizeStr.contains('kb')) {
            final sizeValue = double.tryParse(sizeStr.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;
            return sum + (sizeValue / 1024); // Convert KB to MB
          }
          return sum;
        });
        
        print('Total ukuran: ${totalSizeMB.toStringAsFixed(2)} MB');
        
        // Menampilkan contoh tabel
        print('Contoh tabel:');
        for (final table in tables.take(2)) {
          print('  • ${table.title} (${table.size})');
        }
      }
      
      // 4. Rekomendasi penggunaan
      final totalTables = allTables.data.length;
      final excelAvailability = allTables.data.where((t) => t.excel.isNotEmpty).length / totalTables;
      final htmlAvailability = allTables.data.where((t) => t.table != null && t.table!.isNotEmpty).length / totalTables;
      
      print('\\n=== Rekomendasi Penggunaan ===');
      print('Ketersediaan Excel: ${(excelAvailability * 100).toStringAsFixed(1)}%');
      print('Ketersediaan HTML: ${(htmlAvailability * 100).toStringAsFixed(1)}%');
      
      if (excelAvailability > 0.8) {
        print('Rekomendasi: Domain ini ideal untuk analisis data mendalam dengan Excel');
      } else if (excelAvailability > 0.5) {
        print('Rekomendasi: Sebagian besar data tersedia untuk analisis Excel');
      } else {
        print('Rekomendasi: Fokus pada preview HTML untuk akses data');
      }
      
      if (htmlAvailability > 0.7) {
        print('Rekomendasi: Cocok untuk integrasi web dan preview cepat');
      }
      
    } catch (e) {
      print('Error manajemen tabel: $e');
    }
  }
}
```

### 5. Sistem Integrasi dan Pemrosesan Tabel Statis

```dart
// Sistem pemrosesan file dan integrasi tabel statis
class StaticTableProcessor {
  static Future<void> processStaticTableData() async {
    try {
      // 1. Mengambil tabel berdasarkan kriteria tertentu
      final tables = await StadataFlutter.instance.list.staticTable(
        domain: '0000', // Level nasional
        lang: DataLanguage.id,
        keyword: 'inflasi', // Fokus pada data inflasi
        tahun: 2023,
      );
      
      print('=== Pemrosesan Tabel Statis Inflasi 2023 ===');
      print('Tabel yang ditemukan: ${tables.data.length}');
      
      // 2. Menganalisis struktur data
      final processingStats = <String, dynamic>{
        'totalTables': tables.data.length,
        'excelFiles': 0,
        'htmlTables': 0,
        'averageSize': 0.0,
        'processingRecommendations': <String>[],
      };
      
      double totalSizeKB = 0.0;
      
      for (final table in tables.data) {
        // Menghitung file Excel
        if (table.excel.isNotEmpty) {
          processingStats['excelFiles']++;
        }
        
        // Menghitung tabel HTML
        if (table.table != null && table.table!.isNotEmpty) {
          processingStats['htmlTables']++;
        }
        
        // Menghitung ukuran rata-rata
        final sizeStr = table.size.toLowerCase();
        double sizeKB = 0.0;
        
        if (sizeStr.contains('mb')) {
          final sizeValue = double.tryParse(sizeStr.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;
          sizeKB = sizeValue * 1024;
        } else if (sizeStr.contains('kb')) {
          sizeKB = double.tryParse(sizeStr.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;
        }
        
        totalSizeKB += sizeKB;
        
        print('Memproses: ${table.title}');
        print('  Format Excel: ${table.excel.isNotEmpty ? 'Tersedia' : 'Tidak tersedia'}');
        print('  Format HTML: ${table.table != null ? 'Tersedia' : 'Tidak tersedia'}');
        print('  Ukuran: ${table.size}');
        print('  Terakhir Diperbarui: ${table.updatedAt}');
        print('---');
      }
      
      // 3. Menghitung statistik
      if (tables.data.isNotEmpty) {
        processingStats['averageSize'] = totalSizeKB / tables.data.length;
      }
      
      // 4. Memberikan rekomendasi pemrosesan
      final excelRatio = processingStats['excelFiles'] / processingStats['totalTables'];
      final htmlRatio = processingStats['htmlTables'] / processingStats['totalTables'];
      final avgSizeKB = processingStats['averageSize'] as double;
      
      final recommendations = processingStats['processingRecommendations'] as List<String>;
      
      if (excelRatio > 0.8) {
        recommendations.add('Gunakan pemrosesan batch Excel untuk analisis data');
        recommendations.add('Implementasikan parser Excel untuk ekstraksi data otomatis');
      }
      
      if (htmlRatio > 0.7) {
        recommendations.add('Gunakan parser HTML untuk preview data cepat');
        recommendations.add('Implementasikan rendering tabel web untuk integrasi UI');
      }
      
      if (avgSizeKB > 1024) { // > 1MB
        recommendations.add('Implementasikan download progresif untuk file besar');
        recommendations.add('Pertimbangkan kompresi data untuk transfer');
      } else {
        recommendations.add('File berukuran sedang - cocok untuk pemrosesan real-time');
      }
      
      print('\\n=== Ringkasan Pemrosesan ===');
      print('Total Tabel: ${processingStats['totalTables']}');
      print('File Excel: ${processingStats['excelFiles']} (${(excelRatio * 100).toStringAsFixed(1)}%)');
      print('Tabel HTML: ${processingStats['htmlTables']} (${(htmlRatio * 100).toStringAsFixed(1)}%)');
      print('Ukuran Rata-rata: ${avgSizeKB.toStringAsFixed(1)} KB');
      
      print('\\nRekomendasi Pemrosesan:');
      for (final recommendation in recommendations) {
        print('• $recommendation');
      }
      
    } catch (e) {
      print('Error pemrosesan tabel: $e');
    }
  }
}
```

## Properti (StaticTable)

| Properti    | Tipe        | Deskripsi                                                 |
| ----------- | ----------- | --------------------------------------------------------- |
| `id`        | `int`       | Pengenal unik tabel                                       |
| `title`     | `String`    | Judul atau nama tabel                                     |
| `subjectId` | `int`       | Pengenal subjek yang terkait dengan tabel                |
| `subject`   | `String?`   | Nama atau deskripsi subjek (opsional)                    |
| `size`      | `String`    | Ukuran file dalam format string (KB/MB)                  |
| `table`     | `String?`   | Representasi HTML dari tabel untuk preview (opsional)    |
| `updatedAt` | `DateTime`  | Tanggal dan waktu ketika tabel terakhir diperbarui       |
| `createdAt` | `DateTime?` | Tanggal dan waktu ketika tabel dibuat (opsional)         |
| `excel`     | `String`    | URL untuk mengunduh file Excel terkait dengan tabel      |

## Kategori Tabel Statis Umum

### Data Ekonomi
- **Indikator Makroekonomi**: PDB, pertumbuhan ekonomi, inflasi, indeks harga konsumen
- **Statistik Ketenagakerjaan**: Tingkat pengangguran, partisipasi angkatan kerja, upah dan gaji
- **Data Perdagangan**: Ekspor-impor, neraca perdagangan, investasi langsung asing
- **Statistik Industri**: Produksi industri, kapasitas utilisasi, indeks produksi

### Data Demografis dan Sosial
- **Statistik Penduduk**: Sensus penduduk, proyeksi penduduk, distribusi umur dan jenis kelamin
- **Statistik Vital**: Kelahiran, kematian, perkawinan, perceraian
- **Data Pendidikan**: Partisipasi sekolah, tingkat melek huruf, pencapaian pendidikan
- **Statistik Kesehatan**: Akses layanan kesehatan, angka kematian bayi, status gizi

### Data Regional dan Administratif
- **Statistik Provinsi**: Data spesifik provinsi, perbandingan antar provinsi
- **Data Kabupaten/Kota**: Statistik tingkat kabupaten dan kota
- **Indikator Pembangunan**: Indeks pembangunan manusia, tingkat kemiskinan
- **Infrastruktur**: Akses listrik, air bersih, telekomunikasi, transportasi

### Data Sektoral
- **Pertanian**: Produksi pangan, luas panen, produktivitas pertanian
- **Perumahan**: Kondisi perumahan, kepemilikan rumah, fasilitas perumahan
- **Lingkungan**: Kualitas air, udara, pengelolaan limbah, energi terbarukan
- **Teknologi**: Akses internet, penggunaan teknologi informasi, inovasi

## Alur Kerja Manajemen Tabel Statis

Alur kerja tipikal untuk bekerja dengan tabel statis:

1. **Eksplorasi Domain**: Temukan tabel yang tersedia untuk wilayah yang diminati
2. **Pencarian Tematik**: Gunakan kata kunci untuk menemukan tabel spesifik
3. **Filtering Temporal**: Terapkan filter bulan dan tahun untuk periode tertentu
4. **Evaluasi Format**: Pilih antara preview HTML atau download Excel berdasarkan kebutuhan
5. **Integrasi Analitis**: Integrasikan data tabel ke dalam sistem analisis atau pelaporan

## Integrasi dengan API Lain

### Membangun Sistem Manajemen Data Komprehensif

```dart
// Mengintegrasikan tabel statis dengan sumber data BPS lainnya
Future<void> buildDataManagementSystem(String domain) async {
  try {
    // Mendapatkan informasi domain
    final domains = await StadataFlutter.instance.list.domains();
    final currentDomain = domains.data.firstWhere((d) => d.id == domain);
    
    // Mendapatkan tabel statis terbaru
    final staticTables = await StadataFlutter.instance.list.staticTable(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    // Mendapatkan variabel terkait
    final variables = await StadataFlutter.instance.list.variables(
      domain: domain,
      lang: DataLanguage.id,
      showExistingVariable: true,
    );
    
    // Mendapatkan indikator strategis
    final indicators = await StadataFlutter.instance.list.strategicIndicators(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    print('=== Sistem Manajemen Data ${currentDomain.name} ===');
    print('Tabel Statis: ${staticTables.data.length}');
    print('Variabel dengan Data: ${variables.data.length}');
    print('Indikator Strategis: ${indicators.data.length}');
    
    // Analisis integrasi data
    print('\\n=== Analisis Integrasi ===');
    final subjectCoverage = <String, Map<String, int>>{};
    
    // Menganalisis cakupan subjek di berbagai sumber data
    for (final table in staticTables.data) {
      final subject = table.subject ?? 'Tidak dikategorikan';
      subjectCoverage[subject] = subjectCoverage[subject] ?? {
        'tables': 0, 'variables': 0, 'indicators': 0
      };
      subjectCoverage[subject]!['tables'] = subjectCoverage[subject]!['tables']! + 1;
    }
    
    for (final variable in variables.data) {
      final subject = variable.subjectName;
      subjectCoverage[subject] = subjectCoverage[subject] ?? {
        'tables': 0, 'variables': 0, 'indicators': 0
      };
      subjectCoverage[subject]!['variables'] = subjectCoverage[subject]!['variables']! + 1;
    }
    
    print('Cakupan subjek terpadu:');
    for (final entry in subjectCoverage.entries) {
      final subject = entry.key;
      final counts = entry.value;
      print('$subject:');
      print('  Tabel: ${counts['tables']}');
      print('  Variabel: ${counts['variables']}');
      print('  Indikator: ${counts['indicators']}');
    }
    
  } catch (e) {
    print('Error pembuatan sistem manajemen: $e');
  }
}
```

## Penanganan Error

Metode API Tabel Statis mengembalikan `Future<ListResult<StaticTable>>` dan dapat menimbulkan exception spesifik:

- `StaticTableException`: Error terkait tabel statis (domain tidak valid, error kata kunci, filter waktu tidak valid)
- `ApiException`: Error terkait jaringan atau API
- `ApiKeyNotFoundException`: API key tidak valid atau hilang

```dart
try {
  final result = await StadataFlutter.instance.list.staticTable(
    domain: '3200',
    keyword: 'ekonomi',
    tahun: 2023,
    bulan: 12,
    lang: DataLanguage.id,
  );
  
  // Memproses hasil yang berhasil
  print('Ditemukan ${result.data.length} tabel statis');
  
} on StaticTableException catch (e) {
  print('Error tabel statis: ${e.message}');
  // Menangani error validasi domain, kata kunci, atau filter temporal
  
} on ApiException catch (e) {
  print('Error API: ${e.message}');
  // Menangani error konektivitas jaringan atau layanan API
  
} catch (e) {
  print('Error tidak terduga: $e');
  // Menangani error tak terduga lainnya
}
```

## Pertimbangan Performa

- **Manajemen File**: Implementasikan download progresif untuk file Excel besar
- **Caching Data**: Cache tabel yang sering diakses untuk mengurangi beban API
- **Optimisasi Pencarian**: Gunakan kata kunci spesifik untuk mengurangi ukuran set hasil
- **Filtering Efisien**: Kombinasikan filter temporal untuk mempersempit ruang pencarian
- **Parsing HTML**: Implementasikan parser HTML yang efisien untuk preview tabel
- **Manajemen Memori**: Pertimbangkan ukuran tabel saat memuat data dalam aplikasi
