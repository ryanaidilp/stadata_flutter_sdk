# Kategori Subjek

API Kategori Subjek menyediakan akses ke kerangka organisasi tingkat tinggi yang digunakan oleh BPS (Badan Pusat Statistik) Indonesia untuk mengelompokkan subjek-subjek statistik terkait ke dalam area tematik yang koheren. Kategori subjek mewakili tingkat klasifikasi tematik yang paling luas dalam sistem statistik Indonesia, berfungsi sebagai pengelompokan payung yang berisi berbagai subjek terkait.

Memahami kategori subjek sangat penting untuk menavigasi lanskap statistik Indonesia secara efisien. Kategori-kategori ini menyediakan tulang punggung organisasi yang membantu pengguna menemukan konten statistik terkait, memahami hubungan tematik, dan membangun kerangka analitis yang komprehensif di berbagai area penelitian statistik.

## Memahami Kategori Subjek BPS

Kategori subjek menyediakan organisasi tematik tingkat tertinggi:

- **Payung Tematik**: Pengelompokan luas yang mencakup domain statistik terkait
- **Struktur Navigasi**: Kerangka organisasi utama untuk penemuan konten
- **Kerangka Analitis**: Fondasi untuk analisis statistik lintas subjek
- **Organisasi Konten**: Pengelompokan sistematis subjek berdasarkan kesamaan tematik
- **Panduan Penelitian**: Kerangka untuk memahami hubungan domain statistik

## Struktur Sistem Kategori

Kategori subjek BPS dirancang untuk mencerminkan area utama penelitian statistik:

- **Kategori Ekonomi**: Pengelompokan terkait aktivitas ekonomi, indikator, dan analisis
- **Kategori Sosial**: Kategori yang mencakup subjek demografi, pendidikan, kesehatan, dan kesejahteraan
- **Kategori Lingkungan**: Pengelompokan untuk subjek lingkungan, sumber daya alam, dan keberlanjutan
- **Kategori Administratif**: Kategori untuk tata kelola, administrasi publik, dan subjek institusional
- **Kategori Lintas Bidang**: Kategori interdisipliner yang mencakup berbagai domain

## Parameter

| Parameter | Tipe           | Deskripsi                                                           |
| --------- | -------------- | ------------------------------------------------------------------- |
| `domain`  | `String`       | Kode domain (wilayah) untuk mengambil kategori subjek **(wajib)** |
| `lang`    | `DataLanguage` | Bahasa untuk data kategori subjek (default: `DataLanguage.id`)   |

## Contoh

### 1. Mengambil Semua Kategori Subjek untuk Domain

```dart
// Ambil kategori subjek dari BPS Jawa Tengah
final subjectCategoryResult = await StadataFlutter.instance.list.subjectCategories(
  domain: '3300', // Kode domain Jawa Tengah
  lang: DataLanguage.id,
);

final subjectCategoryList = subjectCategoryResult.data;
final pagination = subjectCategoryResult.pagination;

// Tampilkan informasi paginasi
print('Halaman Saat Ini: ${pagination.page}');
print('Total Halaman: ${pagination.pages}');
print('Jumlah Data pada Halaman Ini: ${pagination.count}');
print('Per Halaman: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Tampilkan data kategori subjek yang diambil
for (final subjectCategory in subjectCategoryList) {
  print('ID Kategori Subjek: ${subjectCategory.id}');
  print('Nama Kategori Subjek: ${subjectCategory.name}');
  print('------------------------');
}
```

### 2. Membandingkan Kategori Antar Domain

```dart
// Bandingkan kategori subjek antara wilayah yang berbeda
class CategoryComparator {
  static Future<void> compareSubjectCategories() async {
    final domains = ['0000', '3100', '3200', '3300']; // Nasional, Jakarta, Jabar, Jateng
    final domainCategories = <String, List<SubjectCategory>>{};
    
    for (final domain in domains) {
      final categories = await StadataFlutter.instance.list.subjectCategories(
        domain: domain,
        lang: DataLanguage.id,
      );
      domainCategories[domain] = categories.data;
      
      await Future.delayed(Duration(milliseconds: 300));
    }
    
    print('=== Distribusi Kategori Subjek ===');
    for (final entry in domainCategories.entries) {
      print('Domain ${entry.key}: ${entry.value.length} kategori');
      for (final category in entry.value) {
        print('  - ${category.name} (ID: ${category.id})');
      }
      print('------------------------');
    }
    
    // Temukan kategori umum di semua domain
    final nationalCategories = domainCategories['0000'] ?? [];
    print('\\n=== Analisis Ketersediaan Kategori ===');
    
    for (final nationalCategory in nationalCategories) {
      print('Kategori: ${nationalCategory.name}');
      for (final entry in domainCategories.entries) {
        if (entry.key != '0000') {
          final hasCategory = entry.value.any((cat) => cat.id == nationalCategory.id);
          print('  ${entry.key}: ${hasCategory ? 'Tersedia' : 'Tidak Tersedia'}');
        }
      }
      print('---');
    }
  }
}
```

### 3. Membangun Penemuan Subjek Berdasarkan Kategori

```dart
// Gunakan kategori untuk menemukan dan mengorganisir subjek
class CategoryBasedSubjectExplorer {
  static Future<void> exploreSubjectsByCategory(String domain) async {
    try {
      // 1. Ambil semua kategori subjek
      final categories = await StadataFlutter.instance.list.subjectCategories(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      print('=== Penemuan Subjek Berdasarkan Kategori ===');
      print('Kategori Tersedia: ${categories.data.length}');
      
      // 2. Untuk setiap kategori, ambil subjek-subjeknya
      for (final category in categories.data) {
        print('\\n=== Kategori: ${category.name} (ID: ${category.id}) ===');
        
        // Ambil subjek dalam kategori ini
        final subjects = await StadataFlutter.instance.list.subjects(
          domain: domain,
          lang: DataLanguage.id,
          subjectCategoryId: category.id,
        );
        
        print('Subjek dalam kategori: ${subjects.data.length}');
        
        // Hitung statistik kategori
        final totalTables = subjects.data
            .map((s) => s.nTable ?? 0)
            .fold(0, (a, b) => a + b);
        
        print('Total tabel dalam kategori: $totalTables');
        
        // Tampilkan subjek teratas berdasarkan jumlah tabel
        final topSubjects = subjects.data
            .where((s) => s.nTable != null && s.nTable! > 0)
            .toList()
          ..sort((a, b) => (b.nTable ?? 0).compareTo(a.nTable ?? 0));
        
        print('Subjek teratas:');
        for (final subject in topSubjects.take(3)) {
          print('  • ${subject.name}: ${subject.nTable} tabel');
        }
        
        if (topSubjects.isEmpty) {
          print('  Tidak ada subjek dengan tabel data tersedia');
        }
        
        await Future.delayed(Duration(milliseconds: 200));
      }
      
    } catch (e) {
      print('Error eksplorasi kategori: $e');
    }
  }
}
```

### 4. Analisis Konten Berdasarkan Kategori

```dart
// Analisis distribusi konten di berbagai kategori
class CategoryContentAnalyzer {
  static Future<void> analyzeCategoryContent(String domain) async {
    try {
      // Ambil kategori dan konten terkaitnya
      final categories = await StadataFlutter.instance.list.subjectCategories(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      final categoryAnalysis = <String, Map<String, dynamic>>{};
      
      for (final category in categories.data) {
        // Ambil subjek untuk kategori ini
        final subjects = await StadataFlutter.instance.list.subjects(
          domain: domain,
          lang: DataLanguage.id,
          subjectCategoryId: category.id,
        );
        
        // Hitung metrik kategori
        final subjectCount = subjects.data.length;
        final totalTables = subjects.data
            .map((s) => s.nTable ?? 0)
            .fold(0, (a, b) => a + b);
        
        final subjectsWithData = subjects.data
            .where((s) => s.nTable != null && s.nTable! > 0)
            .length;
        
        final avgTablesPerSubject = subjectCount > 0 ? totalTables / subjectCount : 0.0;
        
        categoryAnalysis[category.name] = {
          'id': category.id,
          'subjectCount': subjectCount,
          'totalTables': totalTables,
          'subjectsWithData': subjectsWithData,
          'avgTablesPerSubject': avgTablesPerSubject,
          'dataRichness': subjectCount > 0 ? (subjectsWithData / subjectCount) : 0.0,
        };
        
        await Future.delayed(Duration(milliseconds: 200));
      }
      
      // Buat laporan analisis
      print('=== Analisis Konten Kategori ===');
      final sortedCategories = categoryAnalysis.entries.toList()
        ..sort((a, b) => (b.value['totalTables'] as int).compareTo(a.value['totalTables'] as int));
      
      for (final entry in sortedCategories) {
        final categoryName = entry.key;
        final stats = entry.value;
        
        print('📁 $categoryName');
        print('   Subjek: ${stats['subjectCount']}');
        print('   Total Tabel: ${stats['totalTables']}');
        print('   Subjek dengan Data: ${stats['subjectsWithData']}');
        print('   Rata-rata Tabel/Subjek: ${(stats['avgTablesPerSubject'] as double).toStringAsFixed(1)}');
        print('   Kekayaan Data: ${((stats['dataRichness'] as double) * 100).toStringAsFixed(1)}%');
        
        // Indikator kualitas kategori
        if (stats['totalTables'] as int > 50) {
          print('   🌟 Kategori konten tinggi');
        }
        if ((stats['dataRichness'] as double) > 0.8) {
          print('   💎 Cakupan data tinggi');
        }
        
        print('');
      }
      
    } catch (e) {
      print('Error analisis kategori: $e');
    }
  }
}
```

### 5. Membangun Sistem Navigasi Hierarkis

```dart
// Buat navigasi hierarkis lengkap berdasarkan kategori dan subjek
class HierarchicalNavigationBuilder {
  static Future<Map<String, dynamic>> buildCompleteNavigation(String domain) async {
    final navigationTree = <String, dynamic>{};
    
    try {
      // Ambil semua kategori
      final categories = await StadataFlutter.instance.list.subjectCategories(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      navigationTree['domain'] = domain;
      navigationTree['totalCategories'] = categories.data.length;
      navigationTree['categories'] = <Map<String, dynamic>>[];
      
      for (final category in categories.data) {
        // Ambil subjek untuk kategori ini
        final subjects = await StadataFlutter.instance.list.subjects(
          domain: domain,
          lang: DataLanguage.id,
          subjectCategoryId: category.id,
        );
        
        // Bangun node kategori
        final categoryNode = <String, dynamic>{
          'id': category.id,
          'name': category.name,
          'subjectCount': subjects.data.length,
          'subjects': <Map<String, dynamic>>[],
        };
        
        // Tambahkan subjek ke kategori
        for (final subject in subjects.data) {
          categoryNode['subjects'].add({
            'id': subject.id,
            'name': subject.name,
            'tableCount': subject.nTable ?? 0,
            'hasData': (subject.nTable ?? 0) > 0,
          });
        }
        
        // Hitung total kategori
        final totalTables = subjects.data
            .map((s) => s.nTable ?? 0)
            .fold(0, (a, b) => a + b);
        
        categoryNode['totalTables'] = totalTables;
        
        (navigationTree['categories'] as List<Map<String, dynamic>>).add(categoryNode);
        
        await Future.delayed(Duration(milliseconds: 150));
      }
      
      // Hitung statistik navigasi
      final allCategories = navigationTree['categories'] as List<Map<String, dynamic>>;
      final totalSubjects = allCategories
          .map((cat) => cat['subjectCount'] as int)
          .fold(0, (a, b) => a + b);
      
      final totalTables = allCategories
          .map((cat) => cat['totalTables'] as int)
          .fold(0, (a, b) => a + b);
      
      navigationTree['totalSubjects'] = totalSubjects;
      navigationTree['totalTables'] = totalTables;
      
      // Tampilkan ringkasan navigasi
      print('=== Ringkasan Navigasi Hierarkis ===');
      print('Domain: $domain');
      print('Kategori: ${navigationTree['totalCategories']}');
      print('Total Subjek: $totalSubjects');
      print('Total Tabel: $totalTables');
      print('');
      
      // Tampilkan rincian kategori
      for (final category in allCategories) {
        print('📁 ${category['name']}');
        print('   Subjek: ${category['subjectCount']}');
        print('   Tabel: ${category['totalTables']}');
        
        final subjects = category['subjects'] as List<Map<String, dynamic>>;
        final subjectsWithData = subjects.where((s) => s['hasData'] as bool).length;
        print('   Cakupan Data: $subjectsWithData/${subjects.length} subjek');
        print('');
      }
      
      return navigationTree;
      
    } catch (e) {
      print('Error membangun navigasi: $e');
      return {};
    }
  }
}
```

## Properti (SubjectCategory)

| Properti | Tipe     | Deskripsi                                       |
| -------- | -------- | ----------------------------------------------- |
| `id`     | `int`    | Pengenal unik untuk kategori subjek            |
| `name`   | `String` | Nama deskriptif kategori subjek                 |

## Jenis Kategori Subjek Umum

### Kategori Ekonomi
- **Indikator Makroekonomi**: Metrik kinerja ekonomi nasional dan regional
- **Ekonomi Sektoral**: Data ekonomi spesifik industri dan analisis
- **Perdagangan dan Komersial**: Aktivitas komersial, neraca perdagangan, statistik pasar
- **Statistik Keuangan**: Perbankan, kebijakan moneter, indikator pasar modal
- **Tenaga Kerja dan Ketenagakerjaan**: Statistik tenaga kerja, tren ketenagakerjaan, data upah

### Kategori Sosial dan Demografi
- **Penduduk dan Demografi**: Statistik penduduk, tren demografi, migrasi
- **Pendidikan dan Pengembangan SDM**: Statistik pendidikan, literasi, pengembangan keterampilan
- **Kesehatan dan Kesejahteraan**: Indikator kesehatan, statistik kesehatan masyarakat, kesejahteraan sosial
- **Perumahan dan Pembangunan Perkotaan**: Kondisi perumahan, perencanaan kota, infrastruktur
- **Pelayanan Sosial**: Layanan publik, program komunitas, bantuan sosial

### Kategori Lingkungan dan Sumber Daya
- **Sumber Daya Alam**: Statistik lingkungan, pemanfaatan sumber daya, konservasi
- **Pertanian dan Pangan**: Produksi pertanian, ketahanan pangan, pembangunan pedesaan
- **Energi dan Utilitas**: Produksi energi, konsumsi, layanan utilitas
- **Transportasi**: Infrastruktur transportasi, mobilitas, logistik
- **Teknologi dan Inovasi**: Statistik TIK, transformasi digital, metrik inovasi

### Kategori Tata Kelola dan Administrasi
- **Administrasi Publik**: Operasi pemerintah, efisiensi administratif
- **Pembangunan Daerah**: Statistik pemerintah daerah, perencanaan regional
- **Keadilan dan Keamanan**: Indikator sistem hukum, keamanan publik, statistik keamanan
- **Hubungan Internasional**: Kerja sama internasional, statistik diplomasi

## Alur Kerja Penemuan Kategori

Alur kerja umum untuk menggunakan kategori subjek secara efektif:

1. **Gambaran Kategori**: Dapatkan semua kategori yang tersedia untuk domain
2. **Analisis Konten**: Analisis subjek dan ketersediaan data dalam setiap kategori
3. **Fokus Tematik**: Pilih kategori yang relevan untuk kebutuhan penelitian spesifik
4. **Eksplorasi Subjek**: Gunakan kategori untuk menemukan subjek terkait
5. **Integrasi Data**: Gabungkan data dari berbagai kategori untuk analisis komprehensif

### Contoh Manajemen Kategori Lengkap

```dart
// Sistem manajemen dan pemanfaatan kategori komprehensif
class SubjectCategoryManager {
  static Future<void> manageCompleteWorkflow() async {
    try {
      // 1. Analisis kategori multi-domain
      final domains = ['0000', '3100', '3200']; // Nasional, Jakarta, Jabar
      final domainAnalysis = <String, Map<String, dynamic>>{};
      
      for (final domain in domains) {
        final categories = await StadataFlutter.instance.list.subjectCategories(
          domain: domain,
          lang: DataLanguage.id,
        );
        
        // Bangun analisis kategori spesifik domain
        final categoryData = <String, dynamic>{
          'totalCategories': categories.data.length,
          'categories': <Map<String, dynamic>>[],
        };
        
        for (final category in categories.data) {
          final subjects = await StadataFlutter.instance.list.subjects(
            domain: domain,
            lang: DataLanguage.id,
            subjectCategoryId: category.id,
          );
          
          final totalTables = subjects.data
              .map((s) => s.nTable ?? 0)
              .fold(0, (a, b) => a + b);
          
          categoryData['categories'].add({
            'id': category.id,
            'name': category.name,
            'subjectCount': subjects.data.length,
            'totalTables': totalTables,
          });
          
          await Future.delayed(Duration(milliseconds: 100));
        }
        
        domainAnalysis[domain] = categoryData;
      }
      
      // 2. Perbandingan lintas domain
      print('=== Perbandingan Kategori Lintas Domain ===');
      for (final entry in domainAnalysis.entries) {
        final domain = entry.key;
        final data = entry.value;
        
        print('Domain $domain:');
        print('  Kategori: ${data['totalCategories']}');
        
        final categories = data['categories'] as List<Map<String, dynamic>>;
        final totalTables = categories
            .map((cat) => cat['totalTables'] as int)
            .fold(0, (a, b) => a + b);
        
        print('  Total Tabel: $totalTables');
        
        // Temukan kategori teratas berdasarkan konten
        final topCategory = categories.isNotEmpty
            ? categories.reduce((a, b) => 
                (a['totalTables'] as int) > (b['totalTables'] as int) ? a : b)
            : null;
        
        if (topCategory != null) {
          print('  Kategori Teratas: ${topCategory['name']} (${topCategory['totalTables']} tabel)');
        }
        
        print('');
      }
      
      // 3. Rekomendasi pemanfaatan kategori
      print('=== Rekomendasi Pemanfaatan Kategori ===');
      final nationalData = domainAnalysis['0000'];
      if (nationalData != null) {
        final nationalCategories = nationalData['categories'] as List<Map<String, dynamic>>;
        
        // Rekomendasikan kategori konten tinggi
        final highContentCategories = nationalCategories
            .where((cat) => (cat['totalTables'] as int) > 20)
            .toList()
          ..sort((a, b) => (b['totalTables'] as int).compareTo(a['totalTables'] as int));
        
        print('Kategori Konten Tinggi (>20 tabel):');
        for (final category in highContentCategories.take(5)) {
          print('  🌟 ${category['name']}: ${category['totalTables']} tabel');
          print('     Subjek: ${category['subjectCount']}');
          print('     Direkomendasikan untuk: Analisis statistik komprehensif');
        }
        
        // Rekomendasikan kategori berkembang
        final emergingCategories = nationalCategories
            .where((cat) => (cat['subjectCount'] as int) > 3 && (cat['totalTables'] as int) < 20)
            .toList();
        
        if (emergingCategories.isNotEmpty) {
          print('\\nKategori Berkembang (cakupan subjek baik, data berkembang):');
          for (final category in emergingCategories.take(3)) {
            print('  🚀 ${category['name']}: ${category['subjectCount']} subjek');
            print('     Direkomendasikan untuk: Penelitian eksplorasi dan pemantauan');
          }
        }
      }
      
    } catch (e) {
      print('Error manajemen kategori: $e');
    }
  }
}
```

## Integrasi dengan API Lain

### Membangun Aplikasi Data Berbasis Kategori

```dart
// Buat aplikasi data komprehensif menggunakan struktur kategori
Future<void> buildCategoryBasedDataApp(String domain) async {
  try {
    // Dapatkan kategori sebagai struktur navigasi
    final categories = await StadataFlutter.instance.list.subjectCategories(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    print('=== Aplikasi Data Berbasis Kategori ===');
    
    for (final category in categories.data) {
      print('\\nMemproses Kategori: ${category.name}');
      
      // Dapatkan subjek dalam kategori ini
      final subjects = await StadataFlutter.instance.list.subjects(
        domain: domain,
        lang: DataLanguage.id,
        subjectCategoryId: category.id,
      );
      
      // Untuk setiap subjek, kumpulkan sumber daya terkait
      for (final subject in subjects.data.take(2)) { // Batasi untuk demo
        print('  Subjek: ${subject.name}');
        
        // Dapatkan variabel untuk subjek ini
        final variables = await StadataFlutter.instance.list.variables(
          domain: domain,
          subjectID: subject.id,
          lang: DataLanguage.id,
        );
        
        // Dapatkan tabel statis untuk subjek ini
        final staticTables = await StadataFlutter.instance.list.staticTable(
          domain: domain,
          lang: DataLanguage.id,
        );
        
        final subjectTables = staticTables.data
            .where((table) => table.subjectId == subject.id)
            .length;
        
        print('    Variabel: ${variables.data.length}');
        print('    Tabel Statis: $subjectTables');
        print('    Tabel Tersedia: ${subject.nTable ?? 0}');
        
        // Ini menciptakan konteks data lengkap untuk hierarki kategori-subjek
        print('    → Siap untuk analisis dan visualisasi data');
      }
      
      await Future.delayed(Duration(milliseconds: 300));
    }
    
  } catch (e) {
    print('Error membangun aplikasi data: $e');
  }
}
```

## Penanganan Error

Metode API Kategori Subjek mengembalikan `Future<ListResult<SubjectCategory>>` dan dapat menimbulkan pengecualian spesifik:

- `SubjectCategoryException`: Error terkait kategori subjek (domain tidak valid, error akses)
- `ApiException`: Error terkait jaringan atau API
- `ApiKeyNotFoundException`: Kunci API tidak valid atau hilang

```dart
try {
  final result = await StadataFlutter.instance.list.subjectCategories(
    domain: '3200',
    lang: DataLanguage.id,
  );
  
  // Proses hasil yang berhasil
  print('Ditemukan ${result.data.length} kategori subjek');
  
} on SubjectCategoryException catch (e) {
  print('Error kategori subjek: ${e.message}');
  // Tangani error validasi domain atau masalah akses kategori
  
} on ApiException catch (e) {
  print('Error API: ${e.message}');
  // Tangani error konektivitas jaringan atau layanan API
  
} catch (e) {
  print('Error tak terduga: $e');
  // Tangani error tak terduga lainnya
}
```

## Pertimbangan Kinerja

- **Caching Kategori**: Cache daftar kategori karena sangat jarang berubah
- **Pemuatan Hierarkis**: Muat kategori dulu, kemudian subjek sesuai kebutuhan
- **Navigasi Efisien**: Gunakan kategori untuk mengurangi cakupan query subjek
- **Prioritas Konten**: Fokus pada kategori dengan jumlah subjek dan tabel yang lebih tinggi
- **Optimasi Lintas Domain**: Gunakan struktur kategori untuk mengoptimalkan query multi-domain
- **Manajemen Memori**: Hindari memuat hierarki lengkap untuk semua kategori secara bersamaan