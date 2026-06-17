# Tabel Statis

API View Tabel Statis menyediakan akses komprehensif ke tabel statistik terperinci dari BPS (Badan Pusat Statistik) Indonesia. Metode ini memungkinkan aplikasi untuk mengambil data tabel lengkap, termasuk pratinjau HTML, unduhan Excel, metadata, dan klasifikasi subjek untuk analisis statistik, integrasi data, dan tujuan penelitian.

Tabel statis dari BPS merepresentasikan kumpulan data statistik terstruktur yang menyediakan presentasi tabular yang terorganisir dari informasi statistik di berbagai domain. Tabel-tabel ini berfungsi sebagai sumber data fundamental untuk analisis, menawarkan format HTML yang mudah dibaca manusia dan file Excel yang dapat diproses mesin untuk pemanfaatan data yang komprehensif.

## Memahami Sistem Tabel Statis

Tabel statis BPS menyediakan data statistik terstruktur di berbagai dimensi:

- **Akses Data Terstruktur**: Data tabular yang terorganisir dengan baris, kolom, dan hubungan statistik yang jelas
- **Ketersediaan Multi-format**: Akses ke format pratinjau HTML dan format Excel yang dapat diunduh
- **Klasifikasi Subjek**: Tabel yang diorganisir berdasarkan subjek statistik dan area tematik
- **Cakupan Temporal**: Data yang mencakup periode waktu yang berbeda dan siklus statistik
- **Cakupan Geografis**: Tabel tersedia di tingkat administrasi nasional, provinsi, dan lokal

## Kategori Tabel Statis

### Tabel Statistik Ekonomi
- **Indikator Makroekonomi**: PDB, inflasi, pertumbuhan ekonomi, dan statistik keuangan
- **Statistik Perdagangan**: Data ekspor-impor, neraca perdagangan, dan aktivitas komersial
- **Statistik Industri**: Manufaktur, layanan, dan kinerja ekonomi sektoral
- **Statistik Harga**: Indeks harga konsumen, harga produsen, dan data biaya hidup

### Tabel Sosial dan Demografi
- **Statistik Penduduk**: Data sensus, proyeksi penduduk, dan indikator demografi
- **Statistik Pendidikan**: Tingkat partisipasi sekolah, tingkat melek huruf, dan pencapaian pendidikan
- **Statistik Kesehatan**: Indikator kesehatan, tingkat kematian, dan akses layanan kesehatan
- **Statistik Tenaga Kerja**: Tingkat lapangan kerja, data pengangguran, dan karakteristik tenaga kerja

### Tabel Regional dan Administratif
- **Statistik Provinsi**: Data tingkat provinsi di berbagai domain statistik
- **Statistik Kota/Kabupaten**: Informasi statistik tingkat kota dan kabupaten
- **Statistik Pedesaan**: Data tingkat desa dan indikator pembangunan pedesaan
- **Batas Administratif**: Data klasifikasi geografis dan administratif

## Parameter

| Parameter | Tipe           | Deskripsi                                                      |
| --------- | -------------- | -------------------------------------------------------------- |
| `id`      | `int`          | **Wajib**: Pengidentifikasi numerik unik dari tabel statis tertentu |
| `domain`  | `String`       | **Wajib**: Kode domain (wilayah) yang menentukan konteks administratif |
| `lang`    | `DataLanguage` | **Opsional**: Preferensi bahasa untuk konten terlokalisasi (default: `DataLanguage.id`) |

## Contoh

### 1. Pengambilan Tabel Statis Dasar

![Preview](/gif/static_tables.gif)

```dart
// Mengambil informasi rinci untuk tabel statis tertentu
final staticTable = await StadataFlutter.instance.view.staticTable(
  id: 1234, // Contoh: ID tabel indikator ekonomi
  domain: '0000', // Tingkat nasional
  lang: DataLanguage.id,
);

if (staticTable != null) {
  print('=== Detail Tabel Statis ===');
  print('ID Tabel: ${staticTable.id}');
  print('Judul: ${staticTable.title}');
  print('Subjek: ${staticTable.subject ?? 'Umum'}');
  print('ID Subjek: ${staticTable.subjectId}');
  
  // Metadata tabel
  print('\n=== Metadata Tabel ===');
  print('Ukuran File: ${staticTable.size}');
  print('Dibuat: ${staticTable.createdAt ?? 'Tanggal tidak tersedia'}');
  print('Terakhir Diperbarui: ${staticTable.updatedAt}');
  
  // Informasi akses data
  print('\n=== Akses Data ===');
  print('Pratinjau HTML Tersedia: ${staticTable.table != null && staticTable.table!.isNotEmpty}');
  print('Unduhan Excel Tersedia: ${staticTable.excel.isNotEmpty}');
  
  if (staticTable.excel.isNotEmpty) {
    print('URL Excel: ${staticTable.excel}');
  }
  
  // Pratinjau konten tabel
  if (staticTable.table != null && staticTable.table!.isNotEmpty) {
    print('\n=== Pratinjau Tabel ===');
    // Tampilkan 200 karakter pertama dari tabel HTML
    final tablePreview = staticTable.table!.length > 200 
        ? '${staticTable.table!.substring(0, 200)}...'
        : staticTable.table!;
    print('Konten HTML: $tablePreview');
  }
} else {
  print('Tabel statis tidak ditemukan atau tidak dapat diakses');
}
```

### 2. Alur Kerja Analisis Data dengan Tabel Statis

```dart
// Alur kerja analisis data komprehensif menggunakan tabel statis
class StaticTableDataAnalyzer {
  static Future<void> analyzeTableData(
    String domain, 
    String analysisTheme,
  ) async {
    try {
      // 1. Temukan tabel statis menggunakan List API
      final tablesList = await StadataFlutter.instance.list.staticTables(
        domain: domain,
        keyword: analysisTheme,
        lang: DataLanguage.id,
      );
      
      print('=== Analisis Data Tabel Statis: "$analysisTheme" ===');
      print('Ditemukan ${tablesList.data.length} tabel');
      
      if (tablesList.data.isEmpty) {
        print('Tidak ada tabel yang ditemukan untuk tema: $analysisTheme');
        return;
      }
      
      // 2. Analisis setiap tabel secara detail
      final tableAnalysis = <Map<String, dynamic>>[];
      
      for (final tableSummary in tablesList.data.take(10)) {
        print('\n--- Menganalisis: ${tableSummary.title} ---');
        
        final detailedTable = await StadataFlutter.instance.view.staticTable(
          id: tableSummary.id,
          domain: domain,
          lang: DataLanguage.id,
        );
        
        if (detailedTable != null) {
          final analysis = await _analyzeTableStructure(detailedTable);
          tableAnalysis.add({
            'id': detailedTable.id,
            'title': detailedTable.title,
            'subject': detailedTable.subject,
            'subjectId': detailedTable.subjectId,
            'hasHtmlContent': detailedTable.table != null && detailedTable.table!.isNotEmpty,
            'hasExcelAccess': detailedTable.excel.isNotEmpty,
            'fileSize': detailedTable.size,
            'lastUpdated': detailedTable.updatedAt,
            'structure': analysis,
          });
          
          // Tampilkan temuan utama
          print('Subjek: ${detailedTable.subject ?? 'Tidak Diklasifikasi'}');
          print('Ukuran: ${detailedTable.size}');
          print('Terakhir Diperbarui: ${detailedTable.updatedAt}');
          print('Excel Tersedia: ${detailedTable.excel.isNotEmpty ? 'Ya' : 'Tidak'}');
          print('Pratinjau HTML: ${detailedTable.table != null ? 'Tersedia' : 'Tidak tersedia'}');
          
          if (analysis['estimatedRows'] != null) {
            print('Estimasi Baris: ${analysis['estimatedRows']}');
          }
          if (analysis['estimatedColumns'] != null) {
            print('Estimasi Kolom: ${analysis['estimatedColumns']}');
          }
          
        } else {
          print('Gagal mengambil informasi detail');
        }
        
        // Pembatasan laju
        await Future.delayed(Duration(milliseconds: 400));
      }
      
      // 3. Ringkasan analisis
      print('\n=== Ringkasan Analisis ===');
      print('Total Tabel Dianalisis: ${tableAnalysis.length}');
      print('Dengan Konten HTML: ${tableAnalysis.where((t) => t['hasHtmlContent']).length}');
      print('Dengan Unduhan Excel: ${tableAnalysis.where((t) => t['hasExcelAccess']).length}');
      
      // Distribusi subjek
      final subjectDistribution = <String?, int>{};
      for (final table in tableAnalysis) {
        final subject = table['subject'] as String?;
        subjectDistribution[subject] = (subjectDistribution[subject] ?? 0) + 1;
      }
      
      print('\nDistribusi Subjek:');
      for (final entry in subjectDistribution.entries) {
        final subject = entry.key ?? 'Tidak Diklasifikasi';
        print('  $subject: ${entry.value} tabel');
      }
      
      // Analisis pembaruan terkini
      final currentDate = DateTime.now();
      final recentTables = tableAnalysis.where((t) => 
          t['lastUpdated'] != null && 
          (t['lastUpdated'] as DateTime).isAfter(currentDate.subtract(Duration(days: 365)))
      ).length;
      
      print('\nAnalisis Kekinian:');
      print('Tabel diperbarui dalam setahun terakhir: $recentTables');
      
      // Penilaian kelengkapan data
      final completenesScore = tableAnalysis.isNotEmpty
          ? tableAnalysis.map((t) => [
              t['hasHtmlContent'] ? 1 : 0,
              t['hasExcelAccess'] ? 1 : 0,
              t['subject'] != null ? 1 : 0,
            ].reduce((a, b) => a + b)).reduce((a, b) => a + b) / (tableAnalysis.length * 3)
          : 0.0;
      
      print('Skor Kelengkapan Rata-rata: ${(completenesScore * 100).toStringAsFixed(1)}%');
      
    } catch (e) {
      print('Error analisis data: $e');
    }
  }
  
  static Future<Map<String, dynamic>> _analyzeTableStructure(StaticTable table) async {
    final analysis = <String, dynamic>{};
    
    if (table.table != null && table.table!.isNotEmpty) {
      final htmlContent = table.table!;
      
      // Analisis tabel HTML sederhana
      final trMatches = RegExp(r'<tr[^>]*>').allMatches(htmlContent);
      final tdMatches = RegExp(r'<td[^>]*>').allMatches(htmlContent);
      final thMatches = RegExp(r'<th[^>]*>').allMatches(htmlContent);
      
      analysis['estimatedRows'] = trMatches.length;
      analysis['estimatedDataCells'] = tdMatches.length;
      analysis['estimatedHeaderCells'] = thMatches.length;
      
      if (trMatches.length > 0) {
        analysis['estimatedColumns'] = (tdMatches.length / trMatches.length).round();
      }
      
      // Periksa pola data umum
      final hasNumbers = RegExp(r'\d{1,3}(?:,\d{3})*(?:\.\d+)?').hasMatch(htmlContent);
      final hasPercentages = htmlContent.contains('%');
      final hasYears = RegExp(r'20\d{2}').hasMatch(htmlContent);
      
      analysis['containsNumericalData'] = hasNumbers;
      analysis['containsPercentages'] = hasPercentages;
      analysis['containsYearData'] = hasYears;
    }
    
    return analysis;
  }
}
```

### 3. Alur Kerja Integrasi dan Ekspor Data

```dart
// Alur kerja integrasi data komprehensif untuk tabel statis
class StaticTableDataIntegrator {
  static Future<void> integrateTableData(
    List<int> tableIds,
    String domain,
  ) async {
    try {
      print('=== Integrasi Data Tabel Statis ===');
      print('Mengintegrasikan ${tableIds.length} tabel...');
      
      final integratedData = <Map<String, dynamic>>[];
      final downloadUrls = <String, String>{};
      
      // 1. Ambil semua data tabel
      for (final tableId in tableIds) {
        final table = await StadataFlutter.instance.view.staticTable(
          id: tableId,
          domain: domain,
          lang: DataLanguage.id,
        );
        
        if (table != null) {
          final tableData = {
            'id': table.id,
            'title': table.title,
            'subject': table.subject,
            'subjectId': table.subjectId,
            'size': table.size,
            'updatedAt': table.updatedAt.toIso8601String(),
            'createdAt': table.createdAt?.toIso8601String(),
            'hasHtmlData': table.table != null && table.table!.isNotEmpty,
            'excelUrl': table.excel.isNotEmpty ? table.excel : null,
          };
          
          integratedData.add(tableData);
          
          if (table.excel.isNotEmpty) {
            downloadUrls[table.title] = table.excel;
          }
          
          print('  ✓ Terintegrasi: ${table.title}');
          
          // Ekstrak data terstruktur jika HTML tersedia
          if (table.table != null && table.table!.isNotEmpty) {
            final extractedData = _extractTableData(table.table!);
            tableData['extractedRows'] = extractedData.length;
            
            if (extractedData.isNotEmpty) {
              tableData['firstRowSample'] = extractedData.first;
            }
          }
          
        } else {
          print('  ✗ Gagal memuat tabel: $tableId');
        }
        
        await Future.delayed(Duration(milliseconds: 300));
      }
      
      // 2. Buat laporan integrasi
      print('\n=== Laporan Integrasi ===');
      print('Berhasil terintegrasi: ${integratedData.length} tabel');
      print('Unduhan Excel tersedia: ${downloadUrls.length}');
      
      // Analisis subjek
      final subjectGroups = <String?, List<Map<String, dynamic>>>{};
      for (final table in integratedData) {
        final subject = table['subject'] as String?;
        subjectGroups[subject] = (subjectGroups[subject] ?? [])..add(table);
      }
      
      print('\nData dikelompokkan berdasarkan subjek:');
      for (final entry in subjectGroups.entries) {
        final subject = entry.key ?? 'Tidak Diklasifikasi';
        print('  $subject: ${entry.value.length} tabel');
      }
      
      // 3. Ekspor manifes integrasi
      print('\n=== Manifes Ekspor ===');
      print('Integrasi selesai pada: ${DateTime.now().toIso8601String()}');
      print('Domain: $domain');
      print('Total sumber data: ${integratedData.length}');
      
      if (downloadUrls.isNotEmpty) {
        print('\nURL unduhan Excel:');
        for (final entry in downloadUrls.entries) {
          print('  ${entry.key}: ${entry.value}');
        }
      }
      
      // 4. Penilaian kualitas data
      final qualityMetrics = {
        'withExcelAccess': integratedData.where((t) => t['excelUrl'] != null).length,
        'withHtmlData': integratedData.where((t) => t['hasHtmlData']).length,
        'withSubjectClassification': integratedData.where((t) => t['subject'] != null).length,
        'recentlyUpdated': integratedData.where((t) => 
            DateTime.parse(t['updatedAt']).isAfter(DateTime.now().subtract(Duration(days: 365)))
        ).length,
      };
      
      print('\n=== Metrik Kualitas Data ===');
      for (final entry in qualityMetrics.entries) {
        final percentage = (entry.value / integratedData.length * 100).toStringAsFixed(1);
        print('${_formatMetricName(entry.key)}: ${entry.value} (${percentage}%)');
      }
      
    } catch (e) {
      print('Error integrasi data: $e');
    }
  }
  
  static List<Map<String, String>> _extractTableData(String htmlTable) {
    final rows = <Map<String, String>>[];
    
    // Parsing tabel HTML sederhana (implementasi dasar)
    final trPattern = RegExp(r'<tr[^>]*>(.*?)</tr>', dotAll: true);
    final tdPattern = RegExp(r'<td[^>]*>(.*?)</td>', dotAll: true);
    final thPattern = RegExp(r'<th[^>]*>(.*?)</th>', dotAll: true);
    
    final trMatches = trPattern.allMatches(htmlTable);
    List<String>? headers;
    
    for (final trMatch in trMatches.take(10)) { // Batasi ekstraksi untuk performa
      final rowHtml = trMatch.group(1) ?? '';
      
      // Periksa apakah ini adalah baris header
      final thMatches = thPattern.allMatches(rowHtml);
      if (thMatches.isNotEmpty && headers == null) {
        headers = thMatches.map((m) => _cleanHtml(m.group(1) ?? '')).toList();
        continue;
      }
      
      // Ekstrak sel data
      final tdMatches = tdPattern.allMatches(rowHtml);
      if (tdMatches.isNotEmpty) {
        final cellValues = tdMatches.map((m) => _cleanHtml(m.group(1) ?? '')).toList();
        
        if (headers != null && cellValues.length == headers.length) {
          final rowData = <String, String>{};
          for (int i = 0; i < headers.length; i++) {
            rowData[headers[i]] = cellValues[i];
          }
          rows.add(rowData);
        }
      }
    }
    
    return rows;
  }
  
  static String _cleanHtml(String html) {
    return html.replaceAll(RegExp(r'<[^>]*>'), '').trim();
  }
  
  static String _formatMetricName(String key) {
    switch (key) {
      case 'withExcelAccess':
        return 'Akses Excel Tersedia';
      case 'withHtmlData':
        return 'Data HTML Tersedia';
      case 'withSubjectClassification':
        return 'Klasifikasi Subjek';
      case 'recentlyUpdated':
        return 'Baru Diperbarui';
      default:
        return key;
    }
  }
}
```

### 4. Perbandingan dan Analisis Tabel Statistik

```dart
// Analisis perbandingan beberapa tabel statis
class StaticTableComparator {
  static Future<void> compareStaticTables(
    List<int> tableIds,
    String domain,
  ) async {
    try {
      print('=== Analisis Perbandingan Tabel Statis ===');
      print('Membandingkan ${tableIds.length} tabel...');
      
      final tables = <StaticTable>[];
      
      // 1. Muat semua tabel
      for (final tableId in tableIds) {
        final table = await StadataFlutter.instance.view.staticTable(
          id: tableId,
          domain: domain,
          lang: DataLanguage.id,
        );
        
        if (table != null) {
          tables.add(table);
          print('  ✓ Dimuat: ${table.title}');
        }
        
        await Future.delayed(Duration(milliseconds: 200));
      }
      
      if (tables.length < 2) {
        print('Memerlukan setidaknya 2 tabel untuk perbandingan');
        return;
      }
      
      // 2. Analisis perbandingan
      print('\n=== Hasil Perbandingan ===');
      
      // Perbandingan ukuran
      print('Perbandingan Ukuran File:');
      final sortedBySize = tables.toList()..sort((a, b) => 
          _parseSize(b.size).compareTo(_parseSize(a.size))
      );
      
      for (int i = 0; i < sortedBySize.length; i++) {
        final table = sortedBySize[i];
        print('  ${i + 1}. ${table.title}: ${table.size}');
      }
      
      // Perbandingan kekinian pembaruan
      print('\nPerbandingan Kekinian Pembaruan:');
      final sortedByUpdate = tables.toList()..sort((a, b) => 
          b.updatedAt.compareTo(a.updatedAt)
      );
      
      for (int i = 0; i < sortedByUpdate.length; i++) {
        final table = sortedByUpdate[i];
        final daysSinceUpdate = DateTime.now().difference(table.updatedAt).inDays;
        print('  ${i + 1}. ${table.title}: ${table.updatedAt} ($daysSinceUpdate hari yang lalu)');
      }
      
      // Perbandingan klasifikasi subjek
      print('\nKlasifikasi Subjek:');
      final subjectGroups = <String?, List<StaticTable>>{};
      for (final table in tables) {
        final subject = table.subject;
        subjectGroups[subject] = (subjectGroups[subject] ?? [])..add(table);
      }
      
      for (final entry in subjectGroups.entries) {
        final subject = entry.key ?? 'Tidak Diklasifikasi';
        print('  $subject:');
        for (final table in entry.value) {
          print('    - ${table.title} (ID: ${table.id})');
        }
      }
      
      // Perbandingan ketersediaan data
      print('\nPerbandingan Ketersediaan Data:');
      for (final table in tables) {
        final hasHtml = table.table != null && table.table!.isNotEmpty;
        final hasExcel = table.excel.isNotEmpty;
        
        print('${table.title}:');
        print('  Pratinjau HTML: ${hasHtml ? '✓' : '✗'}');
        print('  Unduhan Excel: ${hasExcel ? '✓' : '✗'}');
        
        if (hasHtml && table.table != null) {
          final structure = await StaticTableDataAnalyzer._analyzeTableStructure(table);
          if (structure['estimatedRows'] != null) {
            print('  Estimasi Baris: ${structure['estimatedRows']}');
          }
          if (structure['estimatedColumns'] != null) {
            print('  Estimasi Kolom: ${structure['estimatedColumns']}');
          }
        }
        print('');
      }
      
      // 3. Ringkasan perbandingan
      print('=== Ringkasan Perbandingan ===');
      print('Tabel yang dibandingkan: ${tables.length}');
      print('Tabel terbesar: ${sortedBySize.first.title} (${sortedBySize.first.size})');
      print('Paling baru diperbarui: ${sortedByUpdate.first.title}');
      print('Pembaruan terlama: ${sortedByUpdate.last.title}');
      
      final avgSize = tables.map((t) => _parseSize(t.size)).where((s) => s > 0).fold(0.0, (a, b) => a + b) / tables.length;
      print('Rata-rata ukuran file: ${avgSize.toStringAsFixed(1)} KB');
      
      final withExcel = tables.where((t) => t.excel.isNotEmpty).length;
      final withHtml = tables.where((t) => t.table != null && t.table!.isNotEmpty).length;
      
      print('Tabel dengan Excel: $withExcel/${tables.length}');
      print('Tabel dengan HTML: $withHtml/${tables.length}');
      
    } catch (e) {
      print('Error perbandingan: $e');
    }
  }
  
  static double _parseSize(String sizeStr) {
    final match = RegExp(r'([\d.]+)\s*(kb|mb)', caseSensitive: false).firstMatch(sizeStr.toLowerCase());
    if (match != null) {
      final value = double.tryParse(match.group(1) ?? '0') ?? 0;
      final unit = match.group(2)?.toLowerCase();
      return unit == 'mb' ? value * 1024 : value;
    }
    return 0.0;
  }
}
```

## Integrasi Alur Kerja Tabel Statis

Alur kerja tipikal untuk bekerja dengan tabel statis secara efektif:

1. **Fase Penemuan**: Gunakan List API untuk mengidentifikasi tabel yang diminati berdasarkan kata kunci atau subjek
2. **Pengambilan Detail**: Gunakan View API untuk mendapatkan informasi tabel komprehensif dan URL akses
3. **Analisis Data**: Periksa struktur konten HTML dan ekstrak pola data yang bermakna
4. **Perencanaan Ekspor**: Manfaatkan URL unduhan Excel untuk integrasi dan pemrosesan data
5. **Penilaian Kualitas**: Evaluasi kelengkapan data, kekinian, dan aksesibilitas

### Integrasi dengan API Lain

```dart
// Membangun alur kerja data statistik komprehensif
Future<void> buildStatisticalDataWorkflow(String domain, String topic) async {
  try {
    // 1. Temukan tabel statis terkait
    final tables = await StadataFlutter.instance.list.staticTables(
      domain: domain,
      keyword: topic,
    );
    
    // 2. Temukan publikasi terkait untuk konteks
    final publications = await StadataFlutter.instance.list.publications(
      domain: domain,
      keyword: topic,
    );
    
    // 3. Dapatkan informasi detail untuk tabel teratas
    final detailedTables = <StaticTable>[];
    for (final table in tables.data.take(3)) {
      final detailed = await StadataFlutter.instance.view.staticTable(
        id: table.id,
        domain: domain,
      );
      if (detailed != null) detailedTables.add(detailed);
    }
    
    print('=== Analisis Data Statistik: $topic ===');
    print('Tabel Statis ditemukan: ${tables.data.length}');
    print('Publikasi Terkait: ${publications.data.length}');
    print('Analisis tabel detail: ${detailedTables.length} tabel');
    
    // Analisis referensi silang
    for (final table in detailedTables) {
      print('\nTabel: ${table.title}');
      print('Subjek: ${table.subject ?? 'Umum'}');
      print('Terakhir Diperbarui: ${table.updatedAt}');
      print('Excel Tersedia: ${table.excel.isNotEmpty}');
      
      // Temukan publikasi terkait
      final relatedPubs = publications.data.where((p) => 
          p.title.toLowerCase().contains(topic.toLowerCase()) ||
          (table.subject != null && p.title.toLowerCase().contains(table.subject!.toLowerCase()))
      ).take(2);
      
      if (relatedPubs.isNotEmpty) {
        print('Publikasi Terkait:');
        for (final pub in relatedPubs) {
          print('  • ${pub.title}');
        }
      }
    }
    
  } catch (e) {
    print('Error alur kerja data statistik: $e');
  }
}
```

## Penanganan Error

API View Tabel Statis mengembalikan objek `StaticTable` yang nullable dan dapat melempar pengecualian spesifik:

- **StaticTableException**: Error spesifik tabel (ID tidak valid, pembatasan domain, izin akses)
- **ApiException**: Error komunikasi API umum (masalah jaringan, error server, pembatasan laju)
- **ApiKeyNotFoundException**: Error autentikasi (kunci API tidak valid atau hilang)
- **ValidationException**: Error validasi parameter (ID tabel tidak valid, kode domain yang salah format)

```dart
try {
  final staticTable = await StadataFlutter.instance.view.staticTable(
    id: 1234,
    domain: '0000',
    lang: DataLanguage.id,
  );
  
  if (staticTable != null) {
    // Berhasil mengambil tabel statis
    print('Tabel: ${staticTable.title}');
    print('Subjek: ${staticTable.subject ?? 'Umum'}');
    print('Excel Tersedia: ${staticTable.excel.isNotEmpty}');
    print('Pratinjau HTML: ${staticTable.table != null && staticTable.table!.isNotEmpty}');
  } else {
    // Tabel tidak ditemukan atau tidak dapat diakses
    print('Tabel statis tidak ditemukan - mungkin tidak dipublikasikan atau dibatasi');
  }
  
} on StaticTableException catch (e) {
  print('Error tabel statis: ${e.message}');
  // Tangani error spesifik tabel seperti ID tidak valid atau pembatasan akses
  
} on ApiException catch (e) {
  print('Error komunikasi API: ${e.message}');
  // Tangani masalah konektivitas jaringan atau server
  
} on ApiKeyNotFoundException catch (e) {
  print('Autentikasi diperlukan: ${e.message}');
  // Tangani masalah konfigurasi kunci API
  
} catch (e) {
  print('Error tidak terduga: $e');
  // Tangani error lain yang tidak terduga
}
```

## Pertimbangan Performa

- **Pembatasan Laju**: Implementasikan jeda yang sesuai antara permintaan, terutama untuk ekstraksi data skala besar
- **Strategi Caching**: Cache metadata tabel dan analisis struktur untuk tabel yang sering diakses
- **Parsing HTML**: Pertimbangkan menggunakan pustaka parsing HTML yang efisien untuk konten tabel besar
- **Unduhan Excel**: Implementasikan strategi unduhan progresif untuk file Excel besar
- **Manajemen Memori**: Perhatikan penggunaan memori saat memproses beberapa tabel besar secara bersamaan
- **Pemrosesan Batch**: Proses tabel dalam batch untuk menghindari membanjiri API dan sumber daya lokal

## Properti (StaticTable)

| Properti    | Tipe        | Deskripsi                                                     |
| ----------- | ----------- | ------------------------------------------------------------- |
| `id`        | `int`       | Pengidentifikasi numerik unik untuk tabel statis             |
| `title`     | `String`    | Judul atau nama lengkap yang menggambarkan konten tabel      |
| `subjectId` | `int`       | Pengidentifikasi numerik untuk klasifikasi subjek statistik  |
| `subject`   | `String?`   | Nama yang dapat dibaca manusia dari kategori subjek (opsional) |
| `size`      | `String`    | Informasi ukuran file dalam format yang mudah dibaca         |
| `table`     | `String?`   | Representasi HTML dari konten tabel untuk pratinjau (opsional) |
| `updatedAt` | `DateTime`  | Timestamp ketika data tabel terakhir diperbarui              |
| `createdAt` | `DateTime?` | Timestamp pembuatan asli tabel (opsional)                    |
| `excel`     | `String`    | URL langsung untuk mengunduh data tabel dalam format Excel   |