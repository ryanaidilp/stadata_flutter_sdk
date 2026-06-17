# Indikator Strategis

API Indikator Strategis menyediakan akses ke kumpulan komprehensif indikator kunci kinerja dan metrik dari BPS (Badan Pusat Statistik) Indonesia yang sangat penting untuk pengambilan keputusan strategis, perencanaan kebijakan, dan evaluasi pembangunan. Indikator-indikator ini mewakili indikator utama yang paling kritis dan berdampak dalam sistem statistik Indonesia.

Indikator strategis berfungsi sebagai barometer penting untuk mengukur kemajuan, mengidentifikasi tren, dan menilai efektivitas program pembangunan di berbagai sektor ekonomi, sosial, dan administrasi di Indonesia.

## Memahami Indikator Strategis BPS

Indikator strategis menyediakan wawasan kritis untuk pengambilan keputusan:

- **Metrik Kinerja Utama**: Indikator fundamental yang mengukur kemajuan dalam area kebijakan kunci
- **Alat Pengambilan Keputusan**: Data penting untuk perencanaan strategis dan formulasi kebijakan
- **Pemantauan Pembangunan**: Metrik untuk melacak kemajuan terhadap target dan tujuan pembangunan
- **Analisis Komparatif**: Indikator standar yang memungkinkan perbandingan lintas wilayah dan waktu
- **Peringatan Dini**: Indikator yang dapat mengidentifikasi tren yang muncul dan area yang memerlukan perhatian

## Struktur Sistem Indikator Strategis

Indikator strategis BPS diorganisir untuk memaksimalkan utilitas analitis:

- **Klasifikasi Tematik**: Dikelompokkan berdasarkan domain kebijakan dan area fokus strategis
- **Hierarki Geografis**: Tersedia di berbagai tingkat administratif dari nasional hingga lokal
- **Periodisitas**: Diperbarui secara reguler dengan frekuensi yang sesuai untuk setiap indikator
- **Kategorisasi**: Diorganisir berdasarkan kategori untuk navigasi dan analisis yang efisien
- **Integrasi Variabel**: Terhubung dengan variabel dan dataset yang mendasarinya untuk analisis mendalam

## Parameter

| Parameter    | Tipe           | Deskripsi                                                           |
| ------------ | -------------- | ------------------------------------------------------------------- |
| `domain`     | `String`       | Kode domain (wilayah) untuk mengambil indikator strategis **(wajib)** |
| `lang`       | `DataLanguage` | Bahasa untuk data indikator strategis (default: `DataLanguage.id`) |
| `page`       | `int`          | Nomor halaman (default: `1`)                                       |
| `variableID` | `int?`         | ID variabel dari indikator strategis (opsional)                    |

## Contoh

### 1. Mengambil Semua Indikator Strategis untuk Domain

```dart
// Mengambil indikator strategis dari BPS Jawa Tengah
final result = await StadataFlutter.instance.list.strategicIndicators(
  domain: '3300', // Kode domain Jawa Tengah
  lang: DataLanguage.id,
);

final strategicIndicators = result.data;
final pagination = result.pagination;

// Mencetak informasi paginasi
print('Halaman Saat Ini: ${pagination.page}');
print('Total Halaman: ${pagination.pages}');
print('Jumlah Data di Halaman Ini: ${pagination.count}');
print('Per Halaman: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Mencetak data indikator strategis yang diambil
for (final strategicIndicator in strategicIndicators) {
  print('ID Indikator: ${strategicIndicator.id}');
  print('Judul: ${strategicIndicator.title}');
  print('Nama: ${strategicIndicator.name}');
  print('Nilai: ${strategicIndicator.value}');
  print('Satuan: ${strategicIndicator.unit}');
  print('Sumber Data: ${strategicIndicator.dataSource}');
  print('Periode: ${strategicIndicator.period}');
  print('ID Variabel: ${strategicIndicator.variableID}');
  print('ID Kategori: ${strategicIndicator.categoryID}');
  print('------------------------');
}
```

### 2. Memfilter Indikator berdasarkan ID Variabel

```dart
// Mengambil indikator strategis yang terkait dengan variabel tertentu
final specificIndicators = await StadataFlutter.instance.list.strategicIndicators(
  domain: '0000', // Level nasional
  lang: DataLanguage.id,
  variableID: 1001, // Contoh ID variabel untuk indikator ekonomi
);

// Menganalisis indikator spesifik variabel
print('=== Indikator Strategis untuk Variabel 1001 ===');
for (final indicator in specificIndicators.data) {
  print('Indikator: ${indicator.title}');
  print('Nama: ${indicator.name}');
  print('Nilai Saat Ini: ${indicator.value} ${indicator.unit}');
  print('Periode: ${indicator.period}');
  print('Sumber: ${indicator.dataSource}');
  
  // Mengategorikan tipe indikator berdasarkan unit
  if (indicator.unit.toLowerCase().contains('persen') || indicator.unit.contains('%')) {
    print('  Tipe: Indikator persentase');
  } else if (indicator.unit.toLowerCase().contains('rupiah') || indicator.unit.toLowerCase().contains('rp')) {
    print('  Tipe: Indikator moneter');
  } else if (indicator.unit.toLowerCase().contains('orang') || indicator.unit.toLowerCase().contains('jiwa')) {
    print('  Tipe: Indikator demografis');
  } else {
    print('  Tipe: Indikator umum');
  }
  
  print('------------------------');
}
```

### 3. Menganalisis Indikator di Berbagai Domain

```dart
// Membandingkan indikator strategis di berbagai wilayah
class StrategicIndicatorExplorer {
  static Future<void> compareIndicatorsAcrossDomains() async {
    final domains = ['0000', '3100', '3200', '3300']; // Nasional, Jakarta, Jawa Barat, Jawa Tengah
    final domainIndicators = <String, List<StrategicIndicator>>{};
    
    for (final domain in domains) {
      final indicators = await StadataFlutter.instance.list.strategicIndicators(
        domain: domain,
        lang: DataLanguage.id,
      );
      domainIndicators[domain] = indicators.data;
      
      await Future.delayed(Duration(milliseconds: 300));
    }
    
    print('=== Analisis Distribusi Indikator Strategis ===');
    for (final entry in domainIndicators.entries) {
      print('Domain ${entry.key}: ${entry.value.length} indikator');
      
      // Menganalisis distribusi kategori
      final categories = <int, int>{};
      final dataSources = <String, int>{};
      
      for (final indicator in entry.value) {
        categories[indicator.categoryID] = (categories[indicator.categoryID] ?? 0) + 1;
        dataSources[indicator.dataSource] = (dataSources[indicator.dataSource] ?? 0) + 1;
      }
      
      print('  Kategori unik: ${categories.keys.length}');
      print('  Sumber data unik: ${dataSources.keys.length}');
      
      // Menemukan kategori teratas
      if (categories.isNotEmpty) {
        final topCategory = categories.entries.reduce((a, b) => a.value > b.value ? a : b);
        print('  Kategori terpopuler: ID ${topCategory.key} (${topCategory.value} indikator)');
      }
      
      print('---');
    }
  }
}
```

### 4. Sistem Analisis Kinerja Indikator

```dart
// Analisis komprehensif kinerja dan tren indikator strategis
class StrategicIndicatorAnalyzer {
  static Future<void> analyzeIndicatorPerformance(String domain) async {
    try {
      // 1. Mengambil semua indikator strategis untuk domain
      final allIndicators = await StadataFlutter.instance.list.strategicIndicators(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      print('=== Analisis Kinerja Indikator Strategis ===');
      print('Total indikator di domain $domain: ${allIndicators.data.length}');
      
      // 2. Menganalisis distribusi berdasarkan kategori
      final categoryGroups = <int, List<StrategicIndicator>>{};
      for (final indicator in allIndicators.data) {
        final categoryID = indicator.categoryID;
        categoryGroups[categoryID] = (categoryGroups[categoryID] ?? [])..add(indicator);
      }
      
      print('Kategori indikator: ${categoryGroups.keys.length}');
      
      // 3. Menganalisis setiap kategori
      for (final entry in categoryGroups.entries) {
        final categoryID = entry.key;
        final indicators = entry.value;
        
        print('\\n=== Kategori: $categoryID ===');
        print('Jumlah indikator: ${indicators.length}');
        
        // Menganalisis tipe nilai
        final numericValues = indicators
            .where((ind) => ind.value != null && ind.value! > 0)
            .toList();
        
        if (numericValues.isNotEmpty) {
          final values = numericValues.map((ind) => ind.value!).toList();
          values.sort();
          
          final average = values.reduce((a, b) => a + b) / values.length;
          final median = values.length % 2 == 0
              ? (values[values.length ~/ 2 - 1] + values[values.length ~/ 2]) / 2
              : values[values.length ~/ 2];
          
          print('Statistik nilai:');
          print('  Rata-rata: ${average.toStringAsFixed(2)}');
          print('  Median: ${median.toStringAsFixed(2)}');
          print('  Rentang: ${values.first.toStringAsFixed(2)} - ${values.last.toStringAsFixed(2)}');
        }
        
        // Menganalisis sumber data
        final sourceDistribution = <String, int>{};
        for (final indicator in indicators) {
          sourceDistribution[indicator.dataSource] = (sourceDistribution[indicator.dataSource] ?? 0) + 1;
        }
        
        print('Sumber data:');
        sourceDistribution.entries.take(3).forEach((entry) {
          print('  ${entry.key}: ${entry.value} indikator');
        });
        
        // Menampilkan indikator teratas
        print('Indikator sample:');
        for (final indicator in indicators.take(2)) {
          print('  • ${indicator.name}: ${indicator.value} ${indicator.unit}');
        }
      }
      
      // 4. Menganalisis periode data
      final periodDistribution = <String, int>{};
      for (final indicator in allIndicators.data) {
        periodDistribution[indicator.period] = (periodDistribution[indicator.period] ?? 0) + 1;
      }
      
      print('\\n=== Distribusi Periode ===');
      final sortedPeriods = periodDistribution.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      
      for (final entry in sortedPeriods.take(5)) {
        print('${entry.key}: ${entry.value} indikator');
      }
      
    } catch (e) {
      print('Error analisis kinerja: $e');
    }
  }
}
```

### 5. Sistem Pemantauan dan Pelaporan Indikator

```dart
// Sistem pemantauan komprehensif untuk indikator strategis
class IndicatorMonitoringSystem {
  static Future<void> monitorStrategicIndicators() async {
    try {
      // 1. Pemantauan indikator multi-domain
      final monitoredDomains = ['0000', '3100', '3200', '3300']; // Nasional + provinsi utama
      final domainMetrics = <String, Map<String, dynamic>>{};
      
      for (final domain in monitoredDomains) {
        final indicators = await StadataFlutter.instance.list.strategicIndicators(
          domain: domain,
          lang: DataLanguage.id,
        );
        
        // Menganalisis metrik kinerja
        final economicIndicators = indicators.data.where((ind) => 
            ind.name.toLowerCase().contains('ekonomi') ||
            ind.name.toLowerCase().contains('pdb') ||
            ind.name.toLowerCase().contains('inflasi')).toList();
        
        final socialIndicators = indicators.data.where((ind) => 
            ind.name.toLowerCase().contains('penduduk') ||
            ind.name.toLowerCase().contains('kemiskinan') ||
            ind.name.toLowerCase().contains('pendidikan')).toList();
        
        final latestPeriods = indicators.data.map((ind) => ind.period).toSet();
        final currentPeriod = latestPeriods.isNotEmpty 
            ? latestPeriods.reduce((a, b) => a.compareTo(b) > 0 ? a : b)
            : 'N/A';
        
        domainMetrics[domain] = {
          'totalIndicators': indicators.data.length,
          'economicCount': economicIndicators.length,
          'socialCount': socialIndicators.length,
          'latestPeriod': currentPeriod,
          'economicIndicators': economicIndicators,
          'socialIndicators': socialIndicators,
        };
        
        await Future.delayed(Duration(milliseconds: 200));
      }
      
      // 2. Menghasilkan laporan pemantauan
      print('=== Laporan Pemantauan Indikator Strategis ===');
      for (final entry in domainMetrics.entries) {
        final domain = entry.key;
        final metrics = entry.value;
        
        print('Domain $domain - Periode Terbaru: ${metrics['latestPeriod']}');
        print('  Total Indikator: ${metrics['totalIndicators']}');
        print('  Indikator Ekonomi: ${metrics['economicCount']}');
        print('  Indikator Sosial: ${metrics['socialCount']}');
        
        // Highlight indikator ekonomi kunci
        final economicIndicators = metrics['economicIndicators'] as List<StrategicIndicator>;
        if (economicIndicators.isNotEmpty) {
          print('  Indikator Ekonomi Kunci:');
          for (final indicator in economicIndicators.take(2)) {
            print('    • ${indicator.name}: ${indicator.value} ${indicator.unit}');
          }
        }
        
        // Highlight indikator sosial kunci
        final socialIndicators = metrics['socialIndicators'] as List<StrategicIndicator>;
        if (socialIndicators.isNotEmpty) {
          print('  Indikator Sosial Kunci:');
          for (final indicator in socialIndicators.take(2)) {
            print('    • ${indicator.name}: ${indicator.value} ${indicator.unit}');
          }
        }
        
        print('---');
      }
      
      // 3. Menganalisis tren dan peringatan
      print('\\n=== Analisis Tren dan Rekomendasi ===');
      final nationalMetrics = domainMetrics['0000'];
      if (nationalMetrics != null) {
        final totalNational = nationalMetrics['totalIndicators'] as int;
        final economicRatio = (nationalMetrics['economicCount'] as int) / totalNational;
        final socialRatio = (nationalMetrics['socialCount'] as int) / totalNational;
        
        print('Tingkat Nasional:');
        print('  Rasio Indikator Ekonomi: ${(economicRatio * 100).toStringAsFixed(1)}%');
        print('  Rasio Indikator Sosial: ${(socialRatio * 100).toStringAsFixed(1)}%');
        
        if (economicRatio > 0.4) {
          print('  📈 Focus ekonomi tinggi - pantau indikator pertumbuhan');
        }
        if (socialRatio > 0.3) {
          print('  👥 Focus sosial kuat - pantau indikator kesejahteraan');
        }
        
        // Perbandingan dengan daerah
        print('\\nPerbandingan Regional:');
        final provincialDomains = domainMetrics.entries.where((e) => e.key != '0000');
        for (final entry in provincialDomains) {
          final provincialTotal = entry.value['totalIndicators'] as int;
          final coverage = (provincialTotal / totalNational * 100);
          print('  Domain ${entry.key}: ${coverage.toStringAsFixed(1)}% coverage nasional');
        }
      }
      
    } catch (e) {
      print('Error sistem pemantauan: $e');
    }
  }
}
```

## Properti (StrategicIndicator)

| Properti       | Tipe     | Deskripsi                                          |
| -------------- | -------- | -------------------------------------------------- |
| `id`           | `int`    | Pengidentifikasi unik untuk indikator strategis   |
| `title`        | `String` | Judul resmi indikator strategis                    |
| `name`         | `String` | Nama atau keterangan indikator                     |
| `variableID`   | `int`    | ID variabel yang mendasari indikator              |
| `csaSubjectID` | `int?`   | ID subjek CSA dari indikator (opsional)           |
| `categoryID`   | `int`    | ID kategori untuk klasifikasi indikator           |
| `hashID`       | `String` | ID hash unik untuk referensi indikator            |
| `value`        | `double` | Nilai numerik dari indikator strategis            |
| `unit`         | `String` | Satuan pengukuran indikator                       |
| `dataSource`   | `String` | Sumber data resmi indikator                       |
| `period`       | `String` | Periode waktu data indikator                      |

## Kategori Indikator Strategis Umum

### Indikator Ekonomi
- **Pertumbuhan PDB**: Indikator pertumbuhan ekonomi regional dan sektoral
- **Tingkat Inflasi**: Indikator stabilitas harga dan daya beli
- **Tingkat Pengangguran**: Indikator ketenagakerjaan dan kesempatan kerja
- **Investasi**: Indikator arus investasi domestik dan asing
- **Neraca Perdagangan**: Indikator kinerja ekspor-impor regional

### Indikator Sosial dan Demografis
- **Indeks Pembangunan Manusia**: Indikator komprehensif kesejahteraan
- **Tingkat Kemiskinan**: Indikator distribusi pendapatan dan kesejahteraan
- **Pertumbuhan Penduduk**: Indikator dinamika demografis
- **Angka Partisipasi Sekolah**: Indikator akses pendidikan
- **Angka Harapan Hidup**: Indikator kesehatan dan kualitas hidup

### Indikator Infrastruktur dan Lingkungan
- **Rasio Elektrifikasi**: Indikator akses energi listrik
- **Akses Air Bersih**: Indikator infrastruktur sanitasi
- **Kualitas Udara**: Indikator lingkungan dan kesehatan
- **Infrastruktur Jalan**: Indikator konektivitas dan mobilitas
- **Akses Internet**: Indikator infrastruktur digital

### Indikator Governance dan Administrasi
- **Indeks Kepuasan Layanan Publik**: Indikator kinerja pemerintahan
- **Transparansi Anggaran**: Indikator akuntabilitas fiskal
- **Efektivitas Regulasi**: Indikator kualitas kebijakan publik
- **Partisipasi Masyarakat**: Indikator keterlibatan sipil

## Alur Kerja Analisis Indikator Strategis

Alur kerja tipikal untuk menggunakan indikator strategis:

1. **Identifikasi Domain**: Pilih wilayah geografis untuk analisis
2. **Eksplorasi Kategori**: Pahami klasifikasi indikator yang tersedia
3. **Analisis Variabel**: Gunakan filter variabel untuk fokus pada area spesifik
4. **Pemantauan Tren**: Lacak perubahan nilai indikator dari waktu ke waktu
5. **Analisis Komparatif**: Bandingkan kinerja indikator antar wilayah

## Integrasi dengan API Lain

### Membangun Dashboard Indikator Komprehensif

```dart
// Mengintegrasikan indikator strategis dengan data pendukung
Future<void> buildIndicatorDashboard(String domain) async {
  try {
    // Mendapatkan informasi domain
    final domains = await StadataFlutter.instance.list.domains();
    final currentDomain = domains.data.firstWhere((d) => d.id == domain);
    
    // Mendapatkan indikator strategis
    final indicators = await StadataFlutter.instance.list.strategicIndicators(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    // Mendapatkan variabel terkait
    final variables = await StadataFlutter.instance.list.variables(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    // Mendapatkan tabel statis untuk konteks data
    final staticTables = await StadataFlutter.instance.list.staticTable(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    print('=== Dashboard Indikator Strategis ${currentDomain.name} ===');
    print('Indikator Strategis: ${indicators.data.length}');
    print('Variabel Tersedia: ${variables.data.length}');
    print('Tabel Statis: ${staticTables.data.length}');
    
    // Analisis referensi silang
    print('\\n=== Highlight Indikator Kunci ===');
    final keyIndicators = indicators.data
        .where((ind) => ind.value != null && ind.value! > 0)
        .take(5);
    
    for (final indicator in keyIndicators) {
      print('${indicator.name}');
      print('  Nilai: ${indicator.value} ${indicator.unit}');
      print('  Periode: ${indicator.period}');
      print('  Sumber: ${indicator.dataSource}');
      
      // Mencari variabel terkait
      final relatedVariable = variables.data
          .where((v) => v.id == indicator.variableID)
          .firstOrNull;
      
      if (relatedVariable != null) {
        print('  Variabel Terkait: ${relatedVariable.title}');
      }
    }
    
  } catch (e) {
    print('Error pembuatan dashboard: $e');
  }
}
```

## Penanganan Error

Metode API Indikator Strategis mengembalikan `Future<ListResult<StrategicIndicator>>` dan dapat menimbulkan exception spesifik:

- `StrategicIndicatorException`: Error terkait indikator strategis (domain tidak valid, error ID variabel)
- `ApiException`: Error terkait jaringan atau API
- `ApiKeyNotFoundException`: API key tidak valid atau hilang

```dart
try {
  final result = await StadataFlutter.instance.list.strategicIndicators(
    domain: '3200',
    variableID: 1001,
    lang: DataLanguage.id,
  );
  
  // Memproses hasil yang berhasil
  print('Ditemukan ${result.data.length} indikator strategis');
  
} on StrategicIndicatorException catch (e) {
  print('Error indikator strategis: ${e.message}');
  // Menangani error validasi domain atau masalah ID variabel
  
} on ApiException catch (e) {
  print('Error API: ${e.message}');
  // Menangani error konektivitas jaringan atau layanan API
  
} catch (e) {
  print('Error tidak terduga: $e');
  // Menangani error tak terduga lainnya
}
```

## Pertimbangan Performa

- **Filtering Efisien**: Gunakan ID variabel untuk memfokuskan pada indikator spesifik
- **Caching Data**: Cache indikator yang sering diakses untuk performa dashboard
- **Analisis Batch**: Implementasikan analisis batch untuk perbandingan multi-domain
- **Pemantauan Real-time**: Bangun sistem pemantauan dengan update periodik
- **Visualisasi Data**: Implementasikan visualisasi yang efisien untuk trend analysis
- **Manajemen Memori**: Optimalkan penggunaan memori saat memproses dataset besar