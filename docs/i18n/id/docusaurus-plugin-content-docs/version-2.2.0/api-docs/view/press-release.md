# Siaran Pers

API View Siaran Pers menyediakan akses komprehensif ke informasi detail siaran pers dari BPS (Badan Pusat Statistik) Indonesia. Metode ini memungkinkan aplikasi untuk mengambil konten siaran pers lengkap, termasuk abstrak, dokumen PDF, slide presentasi, gambar sampul, dan metadata publikasi untuk analisis komunikasi, manajemen media, dan tujuan penyebaran informasi.

Siaran pers dari BPS berfungsi sebagai saluran komunikasi resmi untuk pengumuman statistik, pernyataan kebijakan, rilis data, dan pembaruan institusional. API View Siaran Pers memastikan akses ke materi siaran pers lengkap dengan dokumen pendukung, memungkinkan aplikasi menyediakan pengguna dengan komunikasi resmi komprehensif dan sumber daya multimedia.

## Memahami Sistem Siaran Pers BPS

Siaran pers BPS menyediakan komunikasi resmi dan keterlibatan media:

- **Pengumuman Resmi**: Saluran utama untuk rilis statistik formal, pengumuman kebijakan, dan komunikasi institusional
- **Sumber Daya Multi-format**: Paket dokumen lengkap termasuk PDF, slide presentasi, dan materi sampul
- **Klasifikasi Subjek**: Diorganisir berdasarkan subjek statistik dan area tematik untuk komunikasi yang terarah
- **Dukungan Multimedia**: Konten kaya dengan materi visual, grafik, dan dokumentasi pendukung
- **Koordinasi Temporal**: Waktu rilis strategis yang diselaraskan dengan siklus statistik dan acara penting

## Kategori Siaran Pers

### Pengumuman Data Statistik
- **Rilis Ekonomi**: Pengumuman PDB, laporan inflasi, statistik perdagangan, dan indikator makroekonomi
- **Statistik Sosial**: Pembaruan populasi, statistik pendidikan, indikator kesehatan, dan laporan kesejahteraan
- **Rilis Demografi**: Hasil sensus, proyeksi populasi, dan analisis demografi
- **Statistik Regional**: Rilis spesifik provinsi dan analisis regional komparatif

### Komunikasi Kebijakan dan Institusional
- **Pembaruan Metodologi**: Metode statistik baru, teknik pengumpulan data, dan peningkatan kualitas
- **Kerjasama Internasional**: Pengumuman kemitraan, program bantuan teknis, dan inisiatif global
- **Pengembangan Institusional**: Pembaruan organisasi, perencanaan strategis, dan inisiatif pengembangan kapasitas
- **Kemajuan Teknologi**: Pembaruan transformasi digital, peningkatan sistem, dan pengumuman inovasi

### Komunikasi Acara dan Program
- **Pengumuman Konferensi**: Konferensi statistik, workshop, dan acara pengembangan profesional
- **Program Pelatihan**: Inisiatif pengembangan kapasitas, program edukasi, dan pengembangan keterampilan
- **Keterlibatan Publik**: Penjangkauan komunitas, konsultasi pemangku kepentingan, dan inisiatif transparansi
- **Pengakuan dan Penghargaan**: Pengumuman prestasi, penghargaan, dan perayaan pencapaian

## Parameter

| Parameter | Tipe           | Deskripsi                                                                     |
| --------- | -------------- | ----------------------------------------------------------------------------- |
| `id`      | `int`          | **Wajib**: Pengenal numerik unik dari siaran pers tertentu                   |
| `domain`  | `String`       | **Wajib**: Kode domain (wilayah) yang menentukan konteks administratif       |
| `lang`    | `DataLanguage` | **Opsional**: Preferensi bahasa untuk konten terlokalisasi (default: `DataLanguage.id`) |

## Contoh

### 1. Pengambilan Siaran Pers Dasar

![Preview](/gif/press_releases.gif)

```dart
// Ambil informasi detail untuk siaran pers tertentu
final pressRelease = await StadataFlutter.instance.view.pressRelease(
  id: 1234, // Contoh: ID siaran pers statistik ekonomi
  domain: '0000', // Level nasional
  lang: DataLanguage.id,
);

if (pressRelease != null) {
  print('=== Detail Siaran Pers ===');
  print('ID Rilis: ${pressRelease.id}');
  print('Judul: ${pressRelease.title}');
  print('Subjek: ${pressRelease.subject?.name ?? 'Umum'}');
  
  // Informasi publikasi
  print('\n=== Informasi Publikasi ===');
  print('Tanggal Rilis: ${pressRelease.releaseDate ?? 'Tanggal tidak ditentukan'}');
  print('Terakhir Diperbarui: ${pressRelease.updatedAt}');
  print('Ukuran File: ${pressRelease.size}');
  
  // Konten dan sumber daya
  print('\n=== Sumber Daya Tersedia ===');
  print('PDF Tersedia: ${pressRelease.pdf.isNotEmpty ? 'Ya' : 'Tidak'}');
  print('Slide Tersedia: ${pressRelease.slide.isNotEmpty ? 'Ya' : 'Tidak'}');
  print('Gambar Sampul Tersedia: ${pressRelease.cover.isNotEmpty ? 'Ya' : 'Tidak'}');
  
  if (pressRelease.pdf.isNotEmpty) {
    print('URL PDF: ${pressRelease.pdf}');
  }
  if (pressRelease.slide.isNotEmpty) {
    print('URL Slide: ${pressRelease.slide}');
  }
  if (pressRelease.cover.isNotEmpty) {
    print('URL Sampul: ${pressRelease.cover}');
  }
  
  // Konten abstrak
  if (pressRelease.abstract != null && pressRelease.abstract!.isNotEmpty) {
    print('\n=== Abstrak ===');
    final abstractPreview = pressRelease.abstract!.length > 300 
        ? '${pressRelease.abstract!.substring(0, 300)}...'
        : pressRelease.abstract!;
    print('Konten: $abstractPreview');
    print('Panjang Abstrak: ${pressRelease.abstract!.length} karakter');
  } else {
    print('\n=== Abstrak ===');
    print('Abstrak tidak tersedia');
  }
  
  // Analisis sumber daya
  print('\n=== Analisis Sumber Daya ===');
  final resourceCount = [
    pressRelease.pdf.isNotEmpty,
    pressRelease.slide.isNotEmpty,
    pressRelease.cover.isNotEmpty,
  ].where((available) => available).length;
  
  print('Sumber Daya Tersedia: $resourceCount/3 format');
  
  if (resourceCount >= 3) {
    print('Status: Paket media lengkap');
  } else if (resourceCount >= 2) {
    print('Status: Paket media parsial');
  } else {
    print('Status: Dokumentasi dasar');
  }
  
} else {
  print('Siaran pers tidak ditemukan atau tidak dapat diakses');
}
```

### 2. Analisis Komunikasi Siaran Pers

```dart
// Analisis komunikasi siaran pers komprehensif
class PressReleaseCommunicationAnalyzer {
  static Future<void> analyzePressReleaseCommunication(
    String domain,
    String analysisTheme,
  ) async {
    try {
      // 1. Temukan siaran pers menggunakan List API
      final pressReleasesList = await StadataFlutter.instance.list.pressReleases(
        domain: domain,
        keyword: analysisTheme,
        lang: DataLanguage.id,
      );
      
      print('=== Analisis Komunikasi Siaran Pers: "$analysisTheme" ===');
      print('Ditemukan ${pressReleasesList.data.length} siaran pers');
      
      if (pressReleasesList.data.isEmpty) {
        print('Tidak ada siaran pers ditemukan untuk tema: $analysisTheme');
        return;
      }
      
      // 2. Analisis setiap siaran pers secara detail
      final communicationAnalysis = <Map<String, dynamic>>[];
      
      for (final prSummary in pressReleasesList.data.take(10)) {
        print('\n--- Menganalisis: ${prSummary.title} ---');
        
        final detailedPR = await StadataFlutter.instance.view.pressRelease(
          id: prSummary.id,
          domain: domain,
          lang: DataLanguage.id,
        );
        
        if (detailedPR != null) {
          final analysis = _analyzePressReleaseContent(detailedPR);
          communicationAnalysis.add({
            'id': detailedPR.id,
            'title': detailedPR.title,
            'subject': detailedPR.subject?.name,
            'releaseDate': detailedPR.releaseDate,
            'updatedAt': detailedPR.updatedAt,
            'hasAbstract': detailedPR.abstract != null && detailedPR.abstract!.isNotEmpty,
            'hasPdf': detailedPR.pdf.isNotEmpty,
            'hasSlides': detailedPR.slide.isNotEmpty,
            'hasCover': detailedPR.cover.isNotEmpty,
            'fileSize': detailedPR.size,
            'analysis': analysis,
          });
          
          // Tampilkan temuan kunci
          print('Subjek: ${detailedPR.subject?.name ?? 'Tidak diklasifikasi'}');
          print('Tanggal Rilis: ${detailedPR.releaseDate ?? 'Tidak ditentukan'}');
          print('Ukuran File: ${detailedPR.size}');
          print('Sumber Daya: PDF(${detailedPR.pdf.isNotEmpty ? '✓' : '✗'}) Slide(${detailedPR.slide.isNotEmpty ? '✓' : '✗'}) Sampul(${detailedPR.cover.isNotEmpty ? '✓' : '✗'})');
          print('Tipe Komunikasi: ${analysis['communicationType']}');
          print('Audiens Target: ${analysis['targetAudience']}');
          
          if (analysis['keyTopics'].isNotEmpty) {
            print('Topik Kunci: ${analysis['keyTopics'].join(', ')}');
          }
          
        } else {
          print('Gagal mengambil informasi detail');
        }
        
        // Pembatasan rate
        await Future.delayed(Duration(milliseconds: 400));
      }
      
      // 3. Ringkasan analisis komunikasi
      print('\n=== Ringkasan Analisis Komunikasi ===');
      print('Total Siaran Pers yang Dianalisis: ${communicationAnalysis.length}');
      
      // Analisis kelengkapan sumber daya
      final withPdf = communicationAnalysis.where((pr) => pr['hasPdf']).length;
      final withSlides = communicationAnalysis.where((pr) => pr['hasSlides']).length;
      final withCover = communicationAnalysis.where((pr) => pr['hasCover']).length;
      final withAbstract = communicationAnalysis.where((pr) => pr['hasAbstract']).length;
      
      print('\nKetersediaan Sumber Daya:');
      print('Dokumen PDF: $withPdf/${communicationAnalysis.length}');
      print('Slide Presentasi: $withSlides/${communicationAnalysis.length}');
      print('Gambar Sampul: $withCover/${communicationAnalysis.length}');
      print('Abstrak: $withAbstract/${communicationAnalysis.length}');
      
      // Distribusi subjek
      final subjectDistribution = <String?, int>{};
      for (final pr in communicationAnalysis) {
        final subject = pr['subject'] as String?;
        subjectDistribution[subject] = (subjectDistribution[subject] ?? 0) + 1;
      }
      
      print('\nDistribusi Subjek:');
      final sortedSubjects = subjectDistribution.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      
      for (final entry in sortedSubjects.take(5)) {
        final subject = entry.key ?? 'Tidak diklasifikasi';
        print('  $subject: ${entry.value} rilis');
      }
      
      // Analisis tipe komunikasi
      final communicationTypes = <String, int>{};
      for (final pr in communicationAnalysis) {
        final type = pr['analysis']['communicationType'] as String;
        communicationTypes[type] = (communicationTypes[type] ?? 0) + 1;
      }
      
      print('\nTipe Komunikasi:');
      for (final entry in communicationTypes.entries) {
        final percentage = (entry.value / communicationAnalysis.length * 100).toStringAsFixed(1);
        print('  ${entry.key}: ${entry.value} rilis (${percentage}%)');
      }
      
      // Penilaian kualitas
      final avgResourceCount = communicationAnalysis.map((pr) => [
        pr['hasPdf'] ? 1 : 0,
        pr['hasSlides'] ? 1 : 0,
        pr['hasCover'] ? 1 : 0,
        pr['hasAbstract'] ? 1 : 0,
      ].reduce((a, b) => a + b)).reduce((a, b) => a + b) / communicationAnalysis.length;
      
      print('\nMetrik Kualitas:');
      print('Rata-rata Sumber Daya per Rilis: ${avgResourceCount.toStringAsFixed(1)}/4');
      
      final completeReleases = communicationAnalysis.where((pr) => 
          pr['hasPdf'] && pr['hasSlides'] && pr['hasCover'] && pr['hasAbstract']
      ).length;
      
      print('Rilis Lengkap (semua sumber daya): $completeReleases/${communicationAnalysis.length}');
      
      // Analisis temporal
      final currentDate = DateTime.now();
      final recentReleases = communicationAnalysis.where((pr) => 
          pr['releaseDate'] != null && 
          (pr['releaseDate'] as DateTime).isAfter(currentDate.subtract(Duration(days: 90)))
      ).length;
      
      print('\nAnalisis Temporal:');
      print('Rilis Terbaru (90 hari terakhir): $recentReleases');
      
    } catch (e) {
      print('Kesalahan analisis komunikasi: $e');
    }
  }
  
  static Map<String, dynamic> _analyzePressReleaseContent(PressRelease pressRelease) {
    final analysis = <String, dynamic>{};
    
    // Tentukan tipe komunikasi berdasarkan konten dan sumber daya
    String communicationType = 'Standar';
    
    if (pressRelease.slide.isNotEmpty && pressRelease.pdf.isNotEmpty) {
      communicationType = 'Komprehensif';
    } else if (pressRelease.slide.isNotEmpty) {
      communicationType = 'Fokus Presentasi';
    } else if (pressRelease.pdf.isNotEmpty) {
      communicationType = 'Fokus Dokumen';
    } else {
      communicationType = 'Dasar';
    }
    
    analysis['communicationType'] = communicationType;
    
    // Tentukan audiens target berdasarkan judul dan subjek
    final title = pressRelease.title.toLowerCase();
    final subject = pressRelease.subject?.name?.toLowerCase() ?? '';
    
    String targetAudience = 'Masyarakat Umum';
    
    if (title.contains('metodologi') || title.contains('teknis')) {
      targetAudience = 'Audiens Teknis';
    } else if (title.contains('kerjasama') || title.contains('internasional')) {
      targetAudience = 'Mitra Internasional';
    } else if (title.contains('pelatihan') || title.contains('workshop')) {
      targetAudience = 'Pengembangan Profesional';
    } else if (subject.contains('ekonomi') || subject.contains('statistik')) {
      targetAudience = 'Pemangku Kepentingan & Media';
    }
    
    analysis['targetAudience'] = targetAudience;
    
    // Ekstrak topik kunci dari judul dan abstrak
    final keyTopics = <String>[];
    final content = '${title} ${pressRelease.abstract ?? ''}'.toLowerCase();
    
    if (content.contains('inflasi') || content.contains('harga')) keyTopics.add('Inflasi');
    if (content.contains('pdb') || content.contains('ekonomi')) keyTopics.add('Pertumbuhan Ekonomi');
    if (content.contains('penduduk') || content.contains('sensus')) keyTopics.add('Populasi');
    if (content.contains('perdagangan') || content.contains('ekspor')) keyTopics.add('Perdagangan');
    if (content.contains('teknologi') || content.contains('digital')) keyTopics.add('Teknologi');
    if (content.contains('kerjasama') || content.contains('mou')) keyTopics.add('Kerjasama');
    if (content.contains('pelatihan') || content.contains('capacity')) keyTopics.add('Pelatihan');
    if (content.contains('metodologi') || content.contains('survei')) keyTopics.add('Metodologi');
    
    analysis['keyTopics'] = keyTopics.isNotEmpty ? keyTopics : ['Umum'];
    
    return analysis;
  }
}
```

### 3. Manajemen Paket Media Siaran Pers

```dart
// Manajemen paket media komprehensif untuk siaran pers
class PressReleaseMediaManager {
  static Future<void> managePressReleaseMediaPackages(
    List<int> pressReleaseIds,
    String domain,
  ) async {
    try {
      print('=== Manajemen Paket Media Siaran Pers ===');
      print('Mengelola ${pressReleaseIds.length} siaran pers...');
      
      final mediaPackages = <Map<String, dynamic>>[];
      final downloadUrls = <String, List<String>>{};
      
      // 1. Ambil semua siaran pers
      for (final prId in pressReleaseIds) {
        final pressRelease = await StadataFlutter.instance.view.pressRelease(
          id: prId,
          domain: domain,
          lang: DataLanguage.id,
        );
        
        if (pressRelease != null) {
          final packageData = {
            'id': pressRelease.id,
            'title': pressRelease.title,
            'subject': pressRelease.subject?.name,
            'releaseDate': pressRelease.releaseDate?.toIso8601String(),
            'updatedAt': pressRelease.updatedAt.toIso8601String(),
            'fileSize': pressRelease.size,
            'abstract': pressRelease.abstract,
            'resources': <String, dynamic>{},
          };
          
          // Katalog sumber daya yang tersedia
          final resources = <String, dynamic>{};
          final urls = <String>[];
          
          if (pressRelease.pdf.isNotEmpty) {
            resources['pdf'] = {
              'available': true,
              'url': pressRelease.pdf,
              'type': 'Dokumen',
            };
            urls.add(pressRelease.pdf);
          }
          
          if (pressRelease.slide.isNotEmpty) {
            resources['slides'] = {
              'available': true,
              'url': pressRelease.slide,
              'type': 'Presentasi',
            };
            urls.add(pressRelease.slide);
          }
          
          if (pressRelease.cover.isNotEmpty) {
            resources['cover'] = {
              'available': true,
              'url': pressRelease.cover,
              'type': 'Gambar',
            };
            urls.add(pressRelease.cover);
          }
          
          packageData['resources'] = resources;
          packageData['resourceCount'] = resources.length;
          packageData['completeness'] = _calculatePackageCompleteness(resources);
          
          mediaPackages.add(packageData);
          
          if (urls.isNotEmpty) {
            downloadUrls[pressRelease.title] = urls;
          }
          
          print('  ✓ Diproses: ${pressRelease.title}');
          print('    Sumber Daya: ${resources.length}/3 tersedia');
          
        } else {
          print('  ✗ Gagal memuat siaran pers: $prId');
        }
        
        await Future.delayed(Duration(milliseconds: 300));
      }
      
      // 2. Buat laporan manajemen paket
      print('\n=== Laporan Paket Media ===');
      print('Berhasil diproses: ${mediaPackages.length} paket');
      print('URL unduhan dikatalog: ${downloadUrls.length}');
      
      // Analisis kelengkapan
      final completePackages = mediaPackages.where((pkg) => pkg['completeness'] == 1.0).length;
      final partialPackages = mediaPackages.where((pkg) => 
          pkg['completeness'] > 0.5 && pkg['completeness'] < 1.0).length;
      final basicPackages = mediaPackages.where((pkg) => pkg['completeness'] <= 0.5).length;
      
      print('\nKelengkapan Paket:');
      print('  Lengkap (3/3 sumber daya): $completePackages');
      print('  Parsial (2/3 sumber daya): $partialPackages');
      print('  Dasar (≤1/3 sumber daya): $basicPackages');
      
      // Analisis tipe sumber daya
      final resourceTypes = <String, int>{
        'pdf': 0,
        'slides': 0,
        'cover': 0,
      };
      
      for (final package in mediaPackages) {
        final resources = package['resources'] as Map<String, dynamic>;
        for (final type in resourceTypes.keys) {
          if (resources.containsKey(type)) {
            resourceTypes[type] = resourceTypes[type]! + 1;
          }
        }
      }
      
      print('\nKetersediaan Tipe Sumber Daya:');
      for (final entry in resourceTypes.entries) {
        final percentage = (entry.value / mediaPackages.length * 100).toStringAsFixed(1);
        print('  ${entry.key.toUpperCase()}: ${entry.value}/${mediaPackages.length} (${percentage}%)');
      }
      
      // Distribusi subjek
      final subjectPackages = <String?, int>{};
      for (final package in mediaPackages) {
        final subject = package['subject'] as String?;
        subjectPackages[subject] = (subjectPackages[subject] ?? 0) + 1;
      }
      
      print('\nPaket berdasarkan Subjek:');
      final sortedSubjects = subjectPackages.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      
      for (final entry in sortedSubjects.take(5)) {
        final subject = entry.key ?? 'Tidak diklasifikasi';
        print('  $subject: ${entry.value} paket');
      }
      
      // 3. Buat manifest unduhan
      print('\n=== Manifest Unduhan ===');
      if (downloadUrls.isNotEmpty) {
        print('Paket media siap diunduh: ${downloadUrls.length}');
        print('Total URL: ${downloadUrls.values.fold(0, (sum, urls) => sum + urls.length)}');
        
        // Kategorisasi berdasarkan tipe sumber daya
        final urlsByType = <String, int>{
          'PDF': 0,
          'Slide': 0,
          'Gambar': 0,
        };
        
        for (final urls in downloadUrls.values) {
          for (final url in urls) {
            if (url.toLowerCase().contains('.pdf')) {
              urlsByType['PDF'] = urlsByType['PDF']! + 1;
            } else if (url.toLowerCase().contains('slide') || url.toLowerCase().contains('.ppt')) {
              urlsByType['Slide'] = urlsByType['Slide']! + 1;
            } else {
              urlsByType['Gambar'] = urlsByType['Gambar']! + 1;
            }
          }
        }
        
        print('URL berdasarkan tipe:');
        for (final entry in urlsByType.entries) {
          print('  ${entry.key}: ${entry.value} file');
        }
      }
      
      // 4. Rekomendasi kualitas
      print('\n=== Rekomendasi Kualitas ===');
      
      final avgCompleteness = mediaPackages.isNotEmpty
          ? mediaPackages.map((pkg) => pkg['completeness'] as double).reduce((a, b) => a + b) / mediaPackages.length
          : 0.0;
      
      print('Rata-rata kelengkapan paket: ${(avgCompleteness * 100).toStringAsFixed(1)}%');
      
      if (avgCompleteness >= 0.8) {
        print('✅ Kualitas paket media sangat baik - pertahankan standar saat ini');
      } else if (avgCompleteness >= 0.6) {
        print('⚠️ Kualitas baik - pertimbangkan peningkatan kelengkapan sumber daya');
      } else {
        print('🔧 Perlu peningkatan kualitas - fokus pada paket media lengkap');
      }
      
      if (resourceTypes['cover']! < mediaPackages.length * 0.7) {
        print('📸 Rekomendasi: Tingkatkan ketersediaan gambar sampul untuk keterlibatan visual yang lebih baik');
      }
      
      if (resourceTypes['slides']! < mediaPackages.length * 0.5) {
        print('📊 Rekomendasi: Kembangkan lebih banyak materi presentasi untuk komunikasi yang lebih baik');
      }
      
    } catch (e) {
      print('Kesalahan manajemen paket media: $e');
    }
  }
  
  static double _calculatePackageCompleteness(Map<String, dynamic> resources) {
    const maxResources = 3; // pdf, slides, cover
    return resources.length / maxResources;
  }
}
```

### 4. Analisis Strategi Komunikasi Siaran Pers

```dart
// Analisis strategis efektivitas komunikasi siaran pers
class PressReleaseCommunicationStrategy {
  static Future<void> analyzeCommunicationStrategy(
    String domain,
    {int analysisMonths = 12}
  ) async {
    try {
      print('=== Analisis Strategi Komunikasi Siaran Pers ===');
      print('Menganalisis $analysisMonths bulan siaran pers untuk domain: $domain');
      
      // 1. Dapatkan data siaran pers komprehensif
      final allPressReleases = await StadataFlutter.instance.list.pressReleases(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      if (allPressReleases.data.isEmpty) {
        print('Tidak ada siaran pers ditemukan untuk analisis');
        return;
      }
      
      // 2. Analisis siaran pers detail
      final strategyAnalysis = <Map<String, dynamic>>[];
      final cutoffDate = DateTime.now().subtract(Duration(days: analysisMonths * 30));
      
      for (final prSummary in allPressReleases.data.take(20)) {
        final detailedPR = await StadataFlutter.instance.view.pressRelease(
          id: prSummary.id,
          domain: domain,
          lang: DataLanguage.id,
        );
        
        if (detailedPR != null && 
            (detailedPR.releaseDate?.isAfter(cutoffDate) ?? false)) {
          
          final strategicAnalysis = _analyzeStrategicElements(detailedPR);
          strategyAnalysis.add({
            'id': detailedPR.id,
            'title': detailedPR.title,
            'subject': detailedPR.subject?.name,
            'releaseDate': detailedPR.releaseDate,
            'strategic': strategicAnalysis,
          });
          
          print('  ✓ Dianalisis: ${detailedPR.title}');
        }
        
        await Future.delayed(Duration(milliseconds: 200));
      }
      
      if (strategyAnalysis.isEmpty) {
        print('Tidak ada siaran pers terbaru ditemukan untuk analisis strategis');
        return;
      }
      
      // 3. Analisis komunikasi strategis
      print('\n=== Analisis Komunikasi Strategis ===');
      print('Siaran pers yang dianalisis: ${strategyAnalysis.length}');
      
      // Analisis waktu komunikasi
      final monthlyDistribution = <int, int>{};
      final dayOfWeekDistribution = <int, int>{};
      
      for (final pr in strategyAnalysis) {
        final releaseDate = pr['releaseDate'] as DateTime;
        final month = releaseDate.month;
        final dayOfWeek = releaseDate.weekday;
        
        monthlyDistribution[month] = (monthlyDistribution[month] ?? 0) + 1;
        dayOfWeekDistribution[dayOfWeek] = (dayOfWeekDistribution[dayOfWeek] ?? 0) + 1;
      }
      
      print('\nStrategi Waktu:');
      print('Bulan paling aktif:');
      final sortedMonths = monthlyDistribution.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      
      final monthNames = [
        '', 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
        'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
      ];
      
      for (final entry in sortedMonths.take(3)) {
        print('  ${monthNames[entry.key]}: ${entry.value} rilis');
      }
      
      print('Hari paling aktif:');
      final dayNames = ['', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu'];
      final sortedDays = dayOfWeekDistribution.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      
      for (final entry in sortedDays.take(3)) {
        print('  ${dayNames[entry.key]}: ${entry.value} rilis');
      }
      
      // Analisis prioritas strategis
      final priorityDistribution = <String, int>{};
      final impactDistribution = <String, int>{};
      
      for (final pr in strategyAnalysis) {
        final strategic = pr['strategic'] as Map<String, dynamic>;
        final priority = strategic['priority'] as String;
        final impact = strategic['impact'] as String;
        
        priorityDistribution[priority] = (priorityDistribution[priority] ?? 0) + 1;
        impactDistribution[impact] = (impactDistribution[impact] ?? 0) + 1;
      }
      
      print('\nDistribusi Prioritas Strategis:');
      for (final entry in priorityDistribution.entries) {
        final percentage = (entry.value / strategyAnalysis.length * 100).toStringAsFixed(1);
        print('  ${entry.key}: ${entry.value} rilis (${percentage}%)');
      }
      
      print('\nDistribusi Dampak Komunikasi:');
      for (final entry in impactDistribution.entries) {
        final percentage = (entry.value / strategyAnalysis.length * 100).toStringAsFixed(1);
        print('  ${entry.key}: ${entry.value} rilis (${percentage}%)');
      }
      
      // Analisis strategi subjek
      final subjectStrategy = <String?, Map<String, int>>{};
      for (final pr in strategyAnalysis) {
        final subject = pr['subject'] as String?;
        final strategic = pr['strategic'] as Map<String, dynamic>;
        final priority = strategic['priority'] as String;
        
        subjectStrategy[subject] = subjectStrategy[subject] ?? <String, int>{};
        subjectStrategy[subject]![priority] = (subjectStrategy[subject]![priority] ?? 0) + 1;
      }
      
      print('\nStrategi Komunikasi Subjek:');
      for (final entry in subjectStrategy.entries) {
        final subject = entry.key ?? 'Tidak diklasifikasi';
        final strategies = entry.value;
        final total = strategies.values.reduce((a, b) => a + b);
        
        print('$subject ($total rilis):');
        for (final strategyEntry in strategies.entries) {
          print('  ${strategyEntry.key}: ${strategyEntry.value}');
        }
      }
      
      // 4. Rekomendasi strategis
      print('\n=== Rekomendasi Strategis ===');
      
      // Rekomendasi waktu
      final weekdayReleases = dayOfWeekDistribution.entries
          .where((entry) => entry.key >= 1 && entry.key <= 5)
          .map((entry) => entry.value)
          .fold(0, (a, b) => a + b);
      
      final weekendReleases = strategyAnalysis.length - weekdayReleases;
      
      if (weekendReleases > strategyAnalysis.length * 0.2) {
        print('📅 Pertimbangkan mengurangi rilis akhir pekan untuk keterlibatan media yang lebih baik');
      }
      
      // Rekomendasi keseimbangan prioritas
      final highPriority = priorityDistribution['Tinggi'] ?? 0;
      if (highPriority > strategyAnalysis.length * 0.4) {
        print('⚖️ Pertimbangkan keseimbangan prioritas yang lebih baik - terlalu banyak rilis prioritas tinggi dapat mengurangi dampak');
      }
      
      // Rekomendasi kelengkapan sumber daya
      final strategicReleases = strategyAnalysis.where((pr) => 
          (pr['strategic'] as Map<String, dynamic>)['priority'] == 'Tinggi').length;
      
      print('📊 Kesehatan Komunikasi Strategis:');
      print('  Rilis prioritas tinggi: ${(highPriority / strategyAnalysis.length * 100).toStringAsFixed(1)}%');
      print('  Optimasi hari kerja: ${(weekdayReleases / strategyAnalysis.length * 100).toStringAsFixed(1)}%');
      
      if (highPriority >= strategyAnalysis.length * 0.2 && weekdayReleases >= strategyAnalysis.length * 0.7) {
        print('✅ Strategi komunikasi seimbang dengan baik');
      } else {
        print('🔧 Strategi komunikasi perlu optimasi');
      }
      
    } catch (e) {
      print('Kesalahan analisis strategi komunikasi: $e');
    }
  }
  
  static Map<String, dynamic> _analyzeStrategicElements(PressRelease pressRelease) {
    final strategic = <String, dynamic>{};
    
    // Tentukan prioritas strategis
    final title = pressRelease.title.toLowerCase();
    final subject = pressRelease.subject?.name?.toLowerCase() ?? '';
    
    String priority = 'Sedang';
    
    if (title.contains('penting') || title.contains('urgent') || title.contains('darurat')) {
      priority = 'Kritis';
    } else if (title.contains('nasional') || title.contains('presiden') || title.contains('menteri')) {
      priority = 'Tinggi';
    } else if (subject.contains('ekonomi') || subject.contains('inflasi') || subject.contains('pdb')) {
      priority = 'Tinggi';
    } else if (title.contains('pelatihan') || title.contains('workshop') || title.contains('teknis')) {
      priority = 'Rendah';
    }
    
    strategic['priority'] = priority;
    
    // Tentukan dampak komunikasi
    String impact = 'Sedang';
    
    final hasCompletePackage = pressRelease.pdf.isNotEmpty && 
                               pressRelease.slide.isNotEmpty && 
                               pressRelease.cover.isNotEmpty;
    
    if (hasCompletePackage && priority == 'Tinggi') {
      impact = 'Tinggi';
    } else if (hasCompletePackage || priority == 'Tinggi') {
      impact = 'Sedang-Tinggi';
    } else if (pressRelease.pdf.isNotEmpty) {
      impact = 'Sedang';
    } else {
      impact = 'Rendah';
    }
    
    strategic['impact'] = impact;
    
    // Tentukan jangkauan audiens
    String audienceReach = 'Terarah';
    
    if (title.contains('nasional') || title.contains('indonesia')) {
      audienceReach = 'Nasional';
    } else if (title.contains('regional') || title.contains('provinsi')) {
      audienceReach = 'Regional';
    } else if (title.contains('internasional') || title.contains('global')) {
      audienceReach = 'Internasional';
    }
    
    strategic['audienceReach'] = audienceReach;
    
    return strategic;
  }
}
```

## Integrasi Workflow Siaran Pers

Workflow tipikal untuk bekerja dengan siaran pers secara efektif:

1. **Fase Penemuan**: Gunakan List API untuk mengidentifikasi siaran pers yang menarik berdasarkan kata kunci, subjek, atau periode waktu
2. **Pengambilan Detail**: Gunakan View API untuk mendapatkan konten siaran pers lengkap dan sumber daya media
3. **Manajemen Sumber Daya**: Katalog dan atur dokumen PDF, slide presentasi, dan gambar sampul
4. **Analisis Komunikasi**: Analisis strategi siaran pers, waktu, dan efektivitas
5. **Perencanaan Paket Media**: Siapkan paket media komprehensif untuk distribusi dan arsip

### Integrasi dengan API Lain

```dart
// Membangun workflow komunikasi dan siaran pers komprehensif
Future<void> buildPressReleaseCommunicationWorkflow(String domain, String topic) async {
  try {
    // 1. Temukan siaran pers terkait
    final pressReleases = await StadataFlutter.instance.list.pressReleases(
      domain: domain,
      keyword: topic,
    );
    
    // 2. Temukan berita terkait untuk konteks
    final news = await StadataFlutter.instance.list.news(
      domain: domain,
      keyword: topic,
    );
    
    // 3. Temukan publikasi terkait untuk materi pendukung
    final publications = await StadataFlutter.instance.list.publications(
      domain: domain,
      keyword: topic,
    );
    
    // 4. Dapatkan informasi detail untuk siaran pers teratas
    final detailedPressReleases = <PressRelease>[];
    for (final pr in pressReleases.data.take(3)) {
      final detailed = await StadataFlutter.instance.view.pressRelease(
        id: pr.id,
        domain: domain,
      );
      if (detailed != null) detailedPressReleases.add(detailed);
    }
    
    print('=== Analisis Komunikasi Siaran Pers: $topic ===');
    print('Siaran Pers: ${pressReleases.data.length}');
    print('Berita Terkait: ${news.data.length}');
    print('Publikasi Pendukung: ${publications.data.length}');
    print('Analisis detail: ${detailedPressReleases.length} rilis');
    
    // Analisis referensi silang
    for (final pr in detailedPressReleases) {
      print('\nSiaran Pers: ${pr.title}');
      print('Subjek: ${pr.subject?.name ?? 'Umum'}');
      print('Tanggal Rilis: ${pr.releaseDate ?? 'Tidak ditentukan'}');
      print('Sumber Daya: PDF(${pr.pdf.isNotEmpty ? '✓' : '✗'}) Slide(${pr.slide.isNotEmpty ? '✓' : '✗'}) Sampul(${pr.cover.isNotEmpty ? '✓' : '✗'})');
      
      // Temukan konten terkait
      final relatedNews = news.data.where((n) => 
          n.title.toLowerCase().contains(topic.toLowerCase())
      ).take(2);
      
      final relatedPubs = publications.data.where((p) => 
          p.title.toLowerCase().contains(topic.toLowerCase())
      ).take(2);
      
      if (relatedNews.isNotEmpty) {
        print('Liputan Berita Terkait:');
        for (final newsItem in relatedNews) {
          print('  • ${newsItem.title}');
        }
      }
      
      if (relatedPubs.isNotEmpty) {
        print('Publikasi Pendukung:');
        for (final pub in relatedPubs) {
          print('  • ${pub.title}');
        }
      }
    }
    
  } catch (e) {
    print('Kesalahan workflow komunikasi siaran pers: $e');
  }
}
```

## Penanganan Error

API View Siaran Pers mengembalikan objek `PressRelease` nullable dan dapat melempar exception spesifik:

- **PressReleaseException**: Error spesifik siaran pers (ID tidak valid, pembatasan domain, izin akses)
- **ApiException**: Error komunikasi API umum (masalah jaringan, error server, pembatasan rate)
- **ApiKeyNotFoundException**: Error autentikasi (API key tidak valid atau hilang)
- **ValidationException**: Error validasi parameter (ID siaran pers tidak valid, kode domain yang salah format)

```dart
try {
  final pressRelease = await StadataFlutter.instance.view.pressRelease(
    id: 1234,
    domain: '0000',
    lang: DataLanguage.id,
  );
  
  if (pressRelease != null) {
    // Berhasil mengambil siaran pers
    print('Siaran Pers: ${pressRelease.title}');
    print('Subjek: ${pressRelease.subject?.name ?? 'Umum'}');
    print('PDF Tersedia: ${pressRelease.pdf.isNotEmpty}');
    print('Slide Tersedia: ${pressRelease.slide.isNotEmpty}');
    print('Sampul Tersedia: ${pressRelease.cover.isNotEmpty}');
  } else {
    // Siaran pers tidak ditemukan atau tidak dapat diakses
    print('Siaran pers tidak ditemukan - mungkin tidak dipublikasikan atau dibatasi');
  }
  
} on PressReleaseException catch (e) {
  print('Error siaran pers: ${e.message}');
  // Tangani error spesifik siaran pers seperti ID tidak valid atau pembatasan akses
  
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

- **Pembatasan Rate**: Implementasikan delay yang sesuai antar request, terutama untuk manajemen paket media
- **Strategi Caching**: Cache konten siaran pers dan URL media untuk rilis yang sering diakses
- **Manajemen Sumber Daya**: Pertimbangkan ukuran file saat mengimplementasikan fungsi unduhan untuk PDF dan slide
- **Pemrosesan Media**: Implementasikan pemuatan progresif untuk gambar sampul dan konten multimedia
- **Pemrosesan Batch**: Proses siaran pers dalam batch untuk analisis dan workflow manajemen
- **Perencanaan Penyimpanan**: Rencanakan penyimpanan yang memadai untuk paket media yang diunduh dan konten arsip

## Properti (PressRelease)

| Properti      | Tipe        | Deskripsi                                                                         |
| ------------- | ----------- | --------------------------------------------------------------------------------- |
| `id`          | `int`       | Pengenal numerik unik untuk siaran pers                                          |
| `title`       | `String`    | Judul lengkap siaran pers                                                        |
| `subject`     | `Subject?`  | Klasifikasi subjek statistik untuk siaran pers (opsional)                        |
| `size`        | `String`    | Informasi ukuran file dalam format yang dapat dibaca manusia                     |
| `pdf`         | `String`    | URL langsung ke dokumen PDF siaran pers                                          |
| `cover`       | `String`    | URL ke gambar sampul atau representasi thumbnail                                  |
| `abstract`    | `String?`   | Ringkasan atau abstrak konten siaran pers (opsional)                             |
| `updatedAt`   | `DateTime`  | Timestamp ketika siaran pers terakhir diperbarui                                 |
| `releaseDate` | `DateTime?` | Tanggal dan waktu rilis resmi siaran pers (opsional)                             |
| `slide`       | `String`    | URL ke slide presentasi yang terkait dengan siaran pers                          |