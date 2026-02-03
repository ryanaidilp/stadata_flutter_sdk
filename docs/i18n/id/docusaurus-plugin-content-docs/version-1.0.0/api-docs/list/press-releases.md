# Siaran Pers

API Siaran Pers menyediakan akses ke koleksi lengkap komunikasi resmi dan pengumuman dari BPS (Badan Pusat Statistik) Indonesia di semua wilayah. Siaran pers BPS berfungsi sebagai saluran komunikasi formal utama untuk menyampaikan temuan statistik penting, analisis data, pengumuman metodologi, dan wawasan kunci kepada media, stakeholder, dan masyarakat luas.

Siaran pers BPS memainkan peran krusial dalam ekosistem komunikasi statistik Indonesia, menyediakan informasi resmi yang tepat waktu, akurat, dan dapat dipercaya tentang kondisi ekonomi, sosial, dan demografis Indonesia, sekaligus mendukung transparansi dan akuntabilitas dalam penyebaran informasi statistik.

## Memahami Sistem Siaran Pers BPS

Siaran pers menyediakan komunikasi resmi yang komprehensif dan terstruktur:

- **Komunikasi Resmi**: Saluran formal untuk pengumuman statistik resmi dan temuan penelitian penting
- **Dokumentasi Lengkap**: Format multi-media dengan PDF, slide presentasi, dan materi pendukung visual
- **Ketepatan Waktu**: Distribusi informasi yang selaras dengan jadwal rilis data dan peristiwa penting
- **Aksesibilitas Multi-Format**: Dukungan berbagai format untuk berbagai kebutuhan audiens dan media
- **Kredibilitas Tinggi**: Sumber informasi resmi yang diverifikasi dan diotorisasi oleh BPS

## Struktur Sistem Siaran Pers

Siaran pers BPS dirancang untuk komunikasi yang efektif dan komprehensif:

- **Klasifikasi Subjek**: Diorganisir berdasarkan subjek dan area tematik statistik untuk navigasi yang logis
- **Cakupan Geografis**: Tersedia dari kantor BPS nasional, provinsi, dan lokal untuk perspektif multi-level
- **Organisasi Temporal**: Filter berdasarkan bulan dan tahun untuk akses konten periode spesifik
- **Pencarian Konten**: Kemampuan pencarian berbasis kata kunci untuk penemuan informasi yang ditargetkan
- **Manajemen Sumber Daya**: Sistem terintegrasi untuk mengelola PDF, slide, dan aset visual

## Parameter

| Parameter | Tipe           | Deskripsi                                                   |
| --------- | -------------- | ----------------------------------------------------------- |
| `domain`  | `String`       | Kode domain (wilayah) untuk mengambil siaran pers **(wajib)** |
| `lang`    | `DataLanguage` | Bahasa untuk data siaran pers (default: `DataLanguage.id`) |
| `page`    | `int`          | Nomor halaman (default: `1`)                               |
| `subcat`  | `int?`         | ID kategori subjek untuk memfilter siaran pers (opsional)  |
| `keyword` | `String?`      | Kata kunci untuk mencari siaran pers (opsional)            |
| `month`   | `int?`         | Bulan untuk memfilter siaran pers (opsional - `1..12`)     |
| `year`    | `int?`         | Tahun untuk memfilter siaran pers (opsional)               |

## Contoh

### 1. Mengambil Semua Siaran Pers untuk Domain

```dart
// Mengambil siaran pers dari BPS Jawa Tengah
final result = await StadataFlutter.instance.list.pressReleases(
  domain: '3300', // Kode domain Jawa Tengah
  lang: DataLanguage.id,
);

final pressReleaseList = result.data;
final pagination = result.pagination;

// Mencetak informasi paginasi
print('Halaman Saat Ini: ${pagination.page}');
print('Total Halaman: ${pagination.pages}');
print('Jumlah Data di Halaman Ini: ${pagination.count}');
print('Per Halaman: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Mencetak data siaran pers yang didapat
for (final pressRelease in pressReleaseList) {
  print('ID Siaran Pers: ${pressRelease.id}');
  print('Subjek: ${pressRelease.subject?.name ?? 'Tidak dikategorikan'}');
  print('Judul: ${pressRelease.title}');
  print('Tanggal Rilis: ${pressRelease.releaseDate}');
  print('Ukuran File: ${pressRelease.size}');
  
  // Memeriksa ketersediaan materi
  final hasPdf = pressRelease.pdf.isNotEmpty;
  final hasSlide = pressRelease.slide.isNotEmpty;
  final hasCover = pressRelease.cover.isNotEmpty;
  
  print('Materi Tersedia:');
  print('  PDF: ${hasPdf ? 'Ya' : 'Tidak'}');
  print('  Slide: ${hasSlide ? 'Ya' : 'Tidak'}');
  print('  Sampul: ${hasCover ? 'Ya' : 'Tidak'}');
  
  // Menampilkan abstrak jika tersedia
  if (pressRelease.abstract != null && pressRelease.abstract!.isNotEmpty) {
    final abstractPreview = pressRelease.abstract!.length > 100 
        ? '${pressRelease.abstract!.substring(0, 100)}...'
        : pressRelease.abstract!;
    print('Abstrak: $abstractPreview');
  }
  
  print('------------------------');
}
```

### 2. Mencari Siaran Pers berdasarkan Kata Kunci dan Filter

```dart
// Mencari siaran pers ekonomi untuk periode tertentu
final economicPressReleases = await StadataFlutter.instance.list.pressReleases(
  domain: '0000', // Level nasional
  lang: DataLanguage.id,
  keyword: 'inflasi', // Mencari siaran pers tentang inflasi
  year: 2023,
  month: 12, // Desember 2023
);

// Memproses hasil pencarian
print('=== Siaran Pers Inflasi Desember 2023 ===');
for (final pressRelease in economicPressReleases.data) {
  print('Siaran Pers Ekonomi: ${pressRelease.title}');
  print('Subjek: ${pressRelease.subject?.name}');
  print('Tanggal: ${pressRelease.releaseDate}');
  print('Ukuran: ${pressRelease.size}');
  
  // Menganalisis konten berdasarkan judul
  final title = pressRelease.title.toLowerCase();
  if (title.contains('bank indonesia') || title.contains('bi rate')) {
    print('  Kategori: Kebijakan moneter');
  } else if (title.contains('harga konsumen') || title.contains('idk')) {
    print('  Kategori: Inflasi konsumen');
  } else if (title.contains('pangan') || title.contains('bahan makanan')) {
    print('  Kategori: Inflasi pangan');
  }
  
  // Memeriksa kelengkapan materi komunikasi
  final materialCount = [
    pressRelease.pdf.isNotEmpty,
    pressRelease.slide.isNotEmpty,
    pressRelease.cover.isNotEmpty,
  ].where((available) => available).length;
  
  print('  Kelengkapan materi: $materialCount/3 format');
  
  print('------------------------');
}
```

### 3. Menganalisis Distribusi Siaran Pers di Berbagai Domain

```dart
// Menganalisis aktivitas siaran pers di berbagai wilayah
class PressReleaseAnalyzer {
  static Future<void> analyzePressReleaseActivity() async {
    final domains = ['0000', '3100', '3200', '3300']; // Nasional, Jakarta, Jawa Barat, Jawa Tengah
    final domainPressReleases = <String, List<PressRelease>>{};
    
    for (final domain in domains) {
      final pressReleases = await StadataFlutter.instance.list.pressReleases(
        domain: domain,
        lang: DataLanguage.id,
      );
      domainPressReleases[domain] = pressReleases.data;
      
      await Future.delayed(Duration(milliseconds: 300));
    }
    
    print('=== Analisis Aktivitas Siaran Pers ===');
    for (final entry in domainPressReleases.entries) {
      print('Domain ${entry.key}: ${entry.value.length} siaran pers');
      
      // Menganalisis distribusi subjek
      final subjectDistribution = <String?, int>{};
      final materialAvailability = {
        'pdf': 0,
        'slide': 0,
        'cover': 0,
      };
      
      for (final pressRelease in entry.value) {
        final subjectName = pressRelease.subject?.name;
        subjectDistribution[subjectName] = (subjectDistribution[subjectName] ?? 0) + 1;
        
        // Menghitung ketersediaan materi
        if (pressRelease.pdf.isNotEmpty) materialAvailability['pdf'] = materialAvailability['pdf']! + 1;
        if (pressRelease.slide.isNotEmpty) materialAvailability['slide'] = materialAvailability['slide']! + 1;
        if (pressRelease.cover.isNotEmpty) materialAvailability['cover'] = materialAvailability['cover']! + 1;
      }
      
      print('  Subjek teratas:');
      final sortedSubjects = subjectDistribution.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      
      for (final subjectEntry in sortedSubjects.take(3)) {
        final subjectName = subjectEntry.key ?? 'Tidak dikategorikan';
        print('    $subjectName: ${subjectEntry.value} siaran pers');
      }
      
      print('  Ketersediaan materi:');
      for (final materialEntry in materialAvailability.entries) {
        final percentage = entry.value.isNotEmpty 
            ? (materialEntry.value / entry.value.length * 100)
            : 0.0;
        print('    ${materialEntry.key.toUpperCase()}: ${materialEntry.value} (${percentage.toStringAsFixed(1)}%)');
      }
      
      // Menganalisis aktivitas temporal
      final currentYear = DateTime.now().year;
      final recentReleases = entry.value.where((pr) => 
          pr.releaseDate != null && pr.releaseDate!.year >= currentYear - 1).length;
      
      print('  Siaran pers 12 bulan terakhir: $recentReleases');
      
      print('---');
    }
  }
}
```

### 4. Sistem Pemantauan dan Manajemen Siaran Pers

```dart
// Sistem manajemen komprehensif untuk siaran pers
class PressReleaseManager {
  static Future<void> managePressReleaseWorkflow(String domain) async {
    try {
      // 1. Mengambil semua siaran pers untuk domain
      final allPressReleases = await StadataFlutter.instance.list.pressReleases(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      print('=== Manajemen Siaran Pers ===');
      print('Total siaran pers di domain $domain: ${allPressReleases.data.length}');
      
      // 2. Menganalisis distribusi berdasarkan subjek
      final subjectDistribution = <String?, List<PressRelease>>{};
      for (final pressRelease in allPressReleases.data) {
        final subjectName = pressRelease.subject?.name;
        subjectDistribution[subjectName] = (subjectDistribution[subjectName] ?? [])..add(pressRelease);
      }
      
      print('Subjek yang tersedia: ${subjectDistribution.keys.length}');
      
      // 3. Menganalisis setiap subjek
      for (final entry in subjectDistribution.entries) {
        final subjectName = entry.key ?? 'Tidak dikategorikan';
        final pressReleases = entry.value;
        
        print('\\n=== Subjek: $subjectName ===');
        print('Jumlah siaran pers: ${pressReleases.length}');
        
        // Menganalisis kelengkapan materi
        final withPdf = pressReleases.where((pr) => pr.pdf.isNotEmpty).length;
        final withSlide = pressReleases.where((pr) => pr.slide.isNotEmpty).length;
        final withCover = pressReleases.where((pr) => pr.cover.isNotEmpty).length;
        final withAbstract = pressReleases.where((pr) => 
            pr.abstract != null && pr.abstract!.isNotEmpty).length;
        
        print('Kelengkapan materi:');
        print('  Dengan PDF: $withPdf');
        print('  Dengan Slide: $withSlide');
        print('  Dengan Sampul: $withCover');
        print('  Dengan Abstrak: $withAbstract');
        
        // Menganalisis ukuran file rata-rata
        final fileSizes = pressReleases
            .where((pr) => pr.size.isNotEmpty)
            .map((pr) => pr.size)
            .toList();
        
        if (fileSizes.isNotEmpty) {
          // Menganalisis distribusi ukuran
          final largeSizes = fileSizes.where((size) => 
              size.toLowerCase().contains('mb')).length;
          final smallSizes = fileSizes.where((size) => 
              size.toLowerCase().contains('kb')).length;
          
          print('Distribusi ukuran file:');
          print('  Besar (MB): $largeSizes');
          print('  Kecil (KB): $smallSizes');
        }
        
        // Menganalisis frekuensi rilis
        final currentYear = DateTime.now().year;
        final recentReleases = pressReleases.where((pr) => 
            pr.releaseDate != null && pr.releaseDate!.year == currentYear).length;
        
        print('Siaran pers tahun ini: $recentReleases');
        
        // Menampilkan contoh siaran pers terbaru
        final recentPressReleases = pressReleases
            .where((pr) => pr.releaseDate != null)
            .toList()
          ..sort((a, b) => b.releaseDate!.compareTo(a.releaseDate!));
        
        if (recentPressReleases.isNotEmpty) {
          print('Siaran pers terbaru:');
          for (final pressRelease in recentPressReleases.take(2)) {
            print('  • ${pressRelease.title} (${pressRelease.releaseDate?.day}/${pressRelease.releaseDate?.month})');
          }
        }
      }
      
      // 4. Analisis kualitas komunikasi
      print('\\n=== Analisis Kualitas Komunikasi ===');
      final totalReleases = allPressReleases.data.length;
      
      final qualityMetrics = {
        'pdfAvailability': allPressReleases.data.where((pr) => pr.pdf.isNotEmpty).length / totalReleases,
        'slideAvailability': allPressReleases.data.where((pr) => pr.slide.isNotEmpty).length / totalReleases,
        'coverAvailability': allPressReleases.data.where((pr) => pr.cover.isNotEmpty).length / totalReleases,
        'abstractAvailability': allPressReleases.data.where((pr) => 
            pr.abstract != null && pr.abstract!.isNotEmpty).length / totalReleases,
      };
      
      print('Metrik kualitas komunikasi:');
      for (final entry in qualityMetrics.entries) {
        final percentage = entry.value * 100;
        String label;
        switch (entry.key) {
          case 'pdfAvailability':
            label = 'Ketersediaan PDF';
            break;
          case 'slideAvailability':
            label = 'Ketersediaan Slide';
            break;
          case 'coverAvailability':
            label = 'Ketersediaan Sampul';
            break;
          case 'abstractAvailability':
            label = 'Ketersediaan Abstrak';
            break;
          default:
            label = entry.key;
        }
        print('  $label: ${percentage.toStringAsFixed(1)}%');
      }
      
      // 5. Rekomendasi peningkatan
      print('\\n=== Rekomendasi Peningkatan ===');
      final avgQuality = qualityMetrics.values.reduce((a, b) => a + b) / qualityMetrics.length;
      
      if (avgQuality > 0.8) {
        print('Kualitas komunikasi sangat baik (${(avgQuality * 100).toStringAsFixed(1)}%)');
        print('Rekomendasi: Pertahankan standar dan fokus pada konsistensi');
      } else if (avgQuality > 0.6) {
        print('Kualitas komunikasi baik (${(avgQuality * 100).toStringAsFixed(1)}%)');
        print('Rekomendasi: Tingkatkan kelengkapan materi pendukung');
      } else {
        print('Kualitas komunikasi perlu ditingkatkan (${(avgQuality * 100).toStringAsFixed(1)}%)');
        print('Rekomendasi: Fokus pada standardisasi format dan kelengkapan materi');
      }
      
      // Rekomendasi spesifik
      if (qualityMetrics['abstractAvailability']! < 0.7) {
        print('Prioritas: Tingkatkan penyediaan abstrak untuk aksesibilitas');
      }
      if (qualityMetrics['slideAvailability']! < 0.5) {
        print('Prioritas: Kembangkan materi slide untuk presentasi');
      }
      
    } catch (e) {
      print('Error manajemen siaran pers: $e');
    }
  }
}
```

### 5. Sistem Analisis Konten dan Tren Siaran Pers

```dart
// Sistem analisis untuk mengidentifikasi tren dan pola dalam siaran pers
class PressReleaseContentAnalyzer {
  static Future<void> analyzeContentTrends() async {
    try {
      // 1. Mengambil siaran pers dari beberapa domain untuk analisis
      final domains = ['0000', '3100', '3200']; // Nasional, Jakarta, Jawa Barat
      final allPressReleases = <PressRelease>[];
      
      for (final domain in domains) {
        final pressReleases = await StadataFlutter.instance.list.pressReleases(
          domain: domain,
          lang: DataLanguage.id,
        );
        allPressReleases.addAll(pressReleases.data);
        
        await Future.delayed(Duration(milliseconds: 200));
      }
      
      print('=== Analisis Tren Konten Siaran Pers ===');
      print('Total siaran pers untuk analisis: ${allPressReleases.length}');
      
      // 2. Analisis tren temporal
      final monthlyDistribution = <int, int>{};
      final yearlyDistribution = <int, int>{};
      
      for (final pressRelease in allPressReleases) {
        if (pressRelease.releaseDate != null) {
          final month = pressRelease.releaseDate!.month;
          final year = pressRelease.releaseDate!.year;
          
          monthlyDistribution[month] = (monthlyDistribution[month] ?? 0) + 1;
          yearlyDistribution[year] = (yearlyDistribution[year] ?? 0) + 1;
        }
      }
      
      print('\\n=== Tren Temporal ===');
      final sortedMonths = monthlyDistribution.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      
      print('Bulan paling aktif:');
      final monthNames = [
        '', 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
        'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
      ];
      
      for (final entry in sortedMonths.take(5)) {
        print('  ${monthNames[entry.key]}: ${entry.value} siaran pers');
      }
      
      print('\\nDistribusi tahunan:');
      final sortedYears = yearlyDistribution.entries.toList()
        ..sort((a, b) => b.key.compareTo(a.key));
      
      for (final entry in sortedYears.take(3)) {
        print('  ${entry.key}: ${entry.value} siaran pers');
      }
      
      // 3. Analisis subjek dan topik
      final subjectFrequency = <String?, int>{};
      for (final pressRelease in allPressReleases) {
        final subjectName = pressRelease.subject?.name;
        subjectFrequency[subjectName] = (subjectFrequency[subjectName] ?? 0) + 1;
      }
      
      print('\\n=== Tren Subjek ===');
      final sortedSubjects = subjectFrequency.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      
      print('Subjek paling populer:');
      for (final entry in sortedSubjects.take(10)) {
        final subjectName = entry.key ?? 'Tidak dikategorikan';
        final percentage = (entry.value / allPressReleases.length * 100);
        print('  $subjectName: ${entry.value} (${percentage.toStringAsFixed(1)}%)');
      }
      
      // 4. Analisis kata kunci dalam judul
      final wordFrequency = <String, int>{};
      final stopWords = {'dan', 'atau', 'yang', 'pada', 'di', 'ke', 'dari', 'untuk', 'dengan', 'adalah', 'akan', 'telah', 'bps'};
      
      for (final pressRelease in allPressReleases) {
        final words = pressRelease.title.toLowerCase().split(RegExp(r'\\s+'));
        for (final word in words) {
          final cleanWord = word.replaceAll(RegExp(r'[^a-zA-Z]'), '');
          if (cleanWord.length > 3 && !stopWords.contains(cleanWord)) {
            wordFrequency[cleanWord] = (wordFrequency[cleanWord] ?? 0) + 1;
          }
        }
      }
      
      final popularWords = wordFrequency.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      
      print('\\n=== Kata Kunci Populer ===');
      print('Kata kunci paling sering muncul dalam judul:');
      for (final entry in popularWords.take(15)) {
        print('  ${entry.key}: ${entry.value} kali');
      }
      
      // 5. Analisis kelengkapan materi
      print('\\n=== Analisis Kelengkapan Materi ===');
      final materialStats = {
        'lengkap': 0, // Memiliki PDF, slide, dan sampul
        'parsial': 0, // Memiliki sebagian materi
        'minimal': 0, // Hanya PDF atau minimal
      };
      
      for (final pressRelease in allPressReleases) {
        final hasPdf = pressRelease.pdf.isNotEmpty;
        final hasSlide = pressRelease.slide.isNotEmpty;
        final hasCover = pressRelease.cover.isNotEmpty;
        
        final materialCount = [hasPdf, hasSlide, hasCover].where((has) => has).length;
        
        if (materialCount >= 3) {
          materialStats['lengkap'] = materialStats['lengkap']! + 1;
        } else if (materialCount >= 2) {
          materialStats['parsial'] = materialStats['parsial']! + 1;
        } else {
          materialStats['minimal'] = materialStats['minimal']! + 1;
        }
      }
      
      print('Distribusi kelengkapan materi:');
      for (final entry in materialStats.entries) {
        final percentage = (entry.value / allPressReleases.length * 100);
        print('  ${entry.key}: ${entry.value} siaran pers (${percentage.toStringAsFixed(1)}%)');
      }
      
      // 6. Insight dan rekomendasi
      print('\\n=== Insight dan Rekomendasi ===');
      
      // Insight temporal
      if (sortedMonths.isNotEmpty) {
        final peakMonth = sortedMonths.first;
        print('Puncak aktivitas: ${monthNames[peakMonth.key]} dengan ${peakMonth.value} siaran pers');
      }
      
      // Insight subjek
      if (sortedSubjects.isNotEmpty) {
        final dominantSubject = sortedSubjects.first;
        final dominanceRatio = dominantSubject.value / allPressReleases.length;
        
        if (dominanceRatio > 0.3) {
          print('Konsentrasi tinggi pada subjek: ${dominantSubject.key}');
          print('Rekomendasi: Diversifikasi topik untuk cakupan yang lebih seimbang');
        }
      }
      
      // Insight materi
      final completenesRatio = materialStats['lengkap']! / allPressReleases.length;
      if (completenesRatio < 0.5) {
        print('Rekomendasi: Tingkatkan kelengkapan materi pendukung');
        print('Fokus pada penyediaan slide dan sampul untuk semua siaran pers');
      } else {
        print('Kelengkapan materi sudah baik, pertahankan standar');
      }
      
    } catch (e) {
      print('Error analisis konten: $e');
    }
  }
}
```

## Properti (PressRelease)

| Properti      | Tipe        | Deskripsi                                                      |
| ------------- | ----------- | -------------------------------------------------------------- |
| `id`          | `int`       | Pengenal unik dari siaran pers                                |
| `title`       | `String`    | Judul siaran pers                                             |
| `subject`     | `Subject?`  | Subjek siaran pers (opsional)                                 |
| `size`        | `String`    | Ukuran file dalam format string (KB/MB)                       |
| `pdf`         | `String`    | URL untuk mengunduh file PDF siaran pers                      |
| `cover`       | `String`    | URL gambar sampul atau miniatur siaran pers                   |
| `abstract`    | `String?`   | Abstrak atau ringkasan siaran pers (opsional)                 |
| `updatedAt`   | `DateTime`  | Tanggal dan waktu ketika siaran pers terakhir diperbarui      |
| `releaseDate` | `DateTime?` | Tanggal dan waktu ketika siaran pers dirilis (opsional)       |
| `slide`       | `String`    | URL untuk mengunduh file slide presentasi terkait             |

## Kategori Siaran Pers BPS Umum

### Siaran Pers Ekonomi
- **Rilis Data Makroekonomi**: Pengumuman PDB, pertumbuhan ekonomi, inflasi terbaru
- **Statistik Perdagangan**: Data ekspor-impor, neraca perdagangan, kerjasama ekonomi
- **Indikator Ketenagakerjaan**: Tingkat pengangguran, angkatan kerja, produktivitas
- **Kebijakan Ekonomi**: Analisis dampak kebijakan dan proyeksi ekonomi

### Siaran Pers Sosial dan Demografi
- **Hasil Sensus**: Pengumuman hasil sensus penduduk dan survei demografi terbaru
- **Statistik Kesejahteraan**: Data kemiskinan, kesejahteraan, program sosial
- **Indikator Pendidikan**: Tingkat melek huruf, partisipasi sekolah, capaian pendidikan
- **Statistik Kesehatan**: Akses layanan kesehatan, angka vital, status gizi

### Siaran Pers Regional dan Pembangunan
- **Capaian Pembangunan**: Laporan kemajuan pembangunan regional dan nasional
- **Statistik Daerah**: Data spesifik provinsi, kabupaten, dan perbandingan wilayah
- **Infrastruktur**: Pembangunan infrastruktur, akses fasilitas, konektivitas
- **Lingkungan**: Statistik lingkungan, sumber daya alam, keberlanjutan

### Siaran Pers Metodologi dan Inovasi
- **Metodologi Baru**: Pengenalan metode survei dan teknik pengumpulan data terbaru
- **Inovasi Teknologi**: Implementasi teknologi dalam sistem statistik
- **Standarisasi**: Adopsi standar internasional dan harmonisasi data
- **Kerjasama Internasional**: Partnership dan program kerjasama statistik

## Alur Kerja Manajemen Siaran Pers

Alur kerja tipikal untuk mengelola siaran pers secara efektif:

1. **Eksplorasi Domain**: Temukan siaran pers yang tersedia untuk wilayah yang diminati
2. **Filtering Subjek**: Gunakan kategori subjek untuk fokus pada topik tertentu
3. **Pencarian Temporal**: Terapkan filter bulan dan tahun untuk periode spesifik
4. **Evaluasi Materi**: Tinjau ketersediaan PDF, slide, dan materi pendukung
5. **Integrasi Komunikasi**: Integrasikan siaran pers ke dalam sistem komunikasi atau monitoring

## Integrasi dengan API Lain

### Membangun Sistem Komunikasi Terpadu

```dart
// Mengintegrasikan siaran pers dengan sistem komunikasi BPS lainnya
Future<void> buildIntegratedCommunicationSystem(String domain) async {
  try {
    // Mendapatkan informasi domain
    final domains = await StadataFlutter.instance.list.domains();
    final currentDomain = domains.data.firstWhere((d) => d.id == domain);
    
    // Mendapatkan siaran pers terbaru
    final pressReleases = await StadataFlutter.instance.list.pressReleases(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    // Mendapatkan berita terkait
    final news = await StadataFlutter.instance.list.news(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    // Mendapatkan publikasi terkait
    final publications = await StadataFlutter.instance.list.publications(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    print('=== Sistem Komunikasi Terpadu ${currentDomain.name} ===');
    print('Siaran Pers: ${pressReleases.data.length}');
    print('Berita: ${news.data.length}');
    print('Publikasi: ${publications.data.length}');
    
    // Analisis aktivitas komunikasi
    print('\\n=== Analisis Aktivitas Komunikasi ===');
    final currentMonth = DateTime.now().month;
    final currentYear = DateTime.now().year;
    
    final recentPressReleases = pressReleases.data.where((pr) => 
        pr.releaseDate != null &&
        pr.releaseDate!.year == currentYear && 
        pr.releaseDate!.month == currentMonth).length;
    
    final recentNews = news.data.where((n) => 
        n.releaseDate.year == currentYear && 
        n.releaseDate.month == currentMonth).length;
    
    print('Aktivitas bulan ini:');
    print('  Siaran Pers: $recentPressReleases');
    print('  Berita: $recentNews');
    print('  Total komunikasi: ${recentPressReleases + recentNews}');
    
    // Analisis cakupan subjek
    final pressReleaseSubjects = <String>{};
    for (final pr in pressReleases.data) {
      if (pr.subject?.name != null) {
        pressReleaseSubjects.add(pr.subject!.name);
      }
    }
    
    print('\\nCakupan subjek siaran pers: ${pressReleaseSubjects.length} topik');
    
    // Analisis kelengkapan komunikasi
    final completeReleases = pressReleases.data.where((pr) => 
        pr.pdf.isNotEmpty && 
        pr.slide.isNotEmpty && 
        pr.cover.isNotEmpty).length;
    
    final completionRate = pressReleases.data.isNotEmpty 
        ? (completeReleases / pressReleases.data.length)
        : 0.0;
    
    print('Kelengkapan materi komunikasi: ${(completionRate * 100).toStringAsFixed(1)}%');
    
    // Rekomendasi integrasi
    if (completionRate > 0.8) {
      print('Rekomendasi: Kualitas komunikasi sangat baik, pertahankan standar');
    } else if (completionRate > 0.6) {
      print('Rekomendasi: Tingkatkan kelengkapan materi untuk komunikasi optimal');
    } else {
      print('Rekomendasi: Fokus pada standardisasi dan kelengkapan materi');
    }
    
  } catch (e) {
    print('Error pembuatan sistem komunikasi: $e');
  }
}
```

## Penanganan Error

Metode API Siaran Pers mengembalikan `Future<ListResult<PressRelease>>` dan dapat menimbulkan exception spesifik:

- `PressReleaseException`: Error terkait siaran pers (domain tidak valid, error subjek, filter waktu tidak valid)
- `ApiException`: Error terkait jaringan atau API
- `ApiKeyNotFoundException`: API key tidak valid atau hilang

```dart
try {
  final result = await StadataFlutter.instance.list.pressReleases(
    domain: '3200',
    keyword: 'inflasi',
    subcat: 5,
    year: 2023,
    month: 12,
    lang: DataLanguage.id,
  );
  
  // Memproses hasil yang berhasil
  print('Ditemukan ${result.data.length} siaran pers');
  
} on PressReleaseException catch (e) {
  print('Error siaran pers: ${e.message}');
  // Menangani error validasi domain, subjek, atau filter temporal
  
} on ApiException catch (e) {
  print('Error API: ${e.message}');
  // Menangani error konektivitas jaringan atau layanan API
  
} catch (e) {
  print('Error tidak terduga: $e');
  // Menangani error tak terduga lainnya
}
```

## Pertimbangan Performa

- **Manajemen File**: Implementasikan download progresif untuk file PDF dan slide besar
- **Caching Konten**: Cache siaran pers yang sering diakses untuk mengurangi beban API
- **Optimisasi Pencarian**: Kombinasikan filter subjek dan temporal untuk pencarian yang efisien
- **Manajemen Media**: Implementasikan lazy loading untuk gambar sampul dan preview
- **Analisis Batch**: Proses analisis konten secara batch untuk performa optimal
- **Sinkronisasi**: Implementasikan polling periodik untuk siaran pers terbaru dengan interval yang tepat
