# Subjek

API Subjek menyediakan akses ke sistem organisasi tematik yang digunakan oleh BPS (Badan Pusat Statistik) Indonesia untuk mengkategorikan data statistik dan konten. Subjek mewakili area tematik fundamental yang mengorganisir informasi statistik Indonesia, mencakup berbagai domain seperti demografi, ekonomi, indikator sosial, lingkungan, dan tata kelola.

Memahami subjek BPS sangat penting untuk menavigasi lanskap statistik Indonesia, karena subjek berfungsi sebagai kerangka organisasi utama untuk penemuan data, klasifikasi konten, dan penelitian analitis. Setiap subjek mewakili area penyelidikan statistik yang koheren dengan tabel data terkait, publikasi, dan sumber daya analitis.

## Memahami Subjek BPS

Subjek menyediakan organisasi tematik untuk ekosistem statistik Indonesia:

- **Klasifikasi Tematik**: Pengelompokan sistematis konten statistik berdasarkan materi subjek
- **Organisasi Data**: Kerangka kerja untuk mengorganisir tabel, publikasi, dan indikator
- **Navigasi Penelitian**: Panduan untuk menemukan sumber daya statistik terkait
- **Kategorisasi Konten**: Struktur untuk mengklasifikasikan output dan produk data BPS
- **Kerangka Analitis**: Dasar untuk analisis statistik khusus subjek

## Struktur Sistem Subjek

Subjek BPS diorganisir secara hierarkis dalam sistem statistik:

- **Kategori Subjek**: Pengelompokan tematik luas yang berisi subjek terkait
- **Subjek Individual**: Area tematik spesifik dalam kategori
- **Tabel Terkait**: Tabel data yang diorganisir di bawah setiap subjek
- **Referensi Silang**: Hubungan antara subjek dan elemen statistik lainnya
- **Pemetaan Konten**: Tautan antara subjek dan publikasi, indikator, variabel

## Parameter

| Parameter           | Tipe           | Deskripsi                                              |
| ------------------- | -------------- | ------------------------------------------------------ |
| `domain`            | `String`       | Kode domain (wilayah) untuk mendapatkan subjek **(wajib)** |
| `lang`              | `DataLanguage` | Bahasa untuk data subjek (default: `DataLanguage.id`) |
| `page`              | `int`          | Nomor halaman (default: `1`)                          |
| `subjectCategoryId` | `int?`         | ID kategori subjek untuk menyaring subjek (opsional)  |

## Contoh

### 1. Mendapatkan Semua Subjek untuk Domain

```dart
// Mengambil subjek dari BPS Jawa Tengah
final subjectResult = await StadataFlutter.instance.list.subjects(
  domain: '3300', // Kode domain Jawa Tengah
  lang: DataLanguage.id,
);

final subjectList = subjectResult.data;
final pagination = subjectResult.pagination;

// Menampilkan informasi halaman
print('Halaman Saat Ini: ${pagination.page}');
print('Total Halaman: ${pagination.pages}');
print('Jumlah Data di Halaman Ini: ${pagination.count}');
print('Per Halaman: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Menampilkan data subjek yang didapatkan
for (final subject in subjectList) {
  print('ID Subjek: ${subject.id}');
  print('Nama Subjek: ${subject.name}');
  print('ID Kategori: ${subject.category?.id ?? 'Tidak ada kategori'}');
  print('Nama Kategori: ${subject.category?.name ?? 'Tanpa kategori'}');
  print('Jumlah Tabel: ${subject.nTable ?? 0}');
  print('------------------------');
}
```

### 2. Menyaring Subjek berdasarkan Kategori

```dart
// Mendapatkan subjek dalam kategori tertentu (misalnya, subjek ekonomi)
final economicSubjects = await StadataFlutter.instance.list.subjects(
  domain: '0000', // Tingkat nasional
  lang: DataLanguage.id,
  subjectCategoryId: 2, // Asumsikan '2' adalah kategori ekonomi
);

// Menganalisis subjek ekonomi
print('=== Subjek Ekonomi ===');
for (final subject in economicSubjects.data) {
  print('Subjek Ekonomi: ${subject.name}');
  print('ID Subjek: ${subject.id}');
  print('Tabel Tersedia: ${subject.nTable ?? 0}');
  print('Kategori: ${subject.category?.name ?? 'Tidak diketahui'}');
  
  // Mengidentifikasi subjek bernilai tinggi (yang memiliki banyak tabel)
  if (subject.nTable != null && subject.nTable! > 10) {
    print('  ⭐ Subjek bernilai tinggi (${subject.nTable} tabel)');
  }
  
  print('------------------------');
}
```

### 3. Eksplorasi Distribusi Subjek di Berbagai Domain

```dart
// Membandingkan ketersediaan subjek di berbagai wilayah
class SubjectExplorer {
  static Future<void> compareSubjectsAcrossDomains() async {
    final domains = ['0000', '3100', '3200', '3300']; // Nasional, Jakarta, Jawa Barat, Jawa Tengah
    final domainSubjects = <String, List<Subject>>{};
    
    for (final domain in domains) {
      final subjects = await StadataFlutter.instance.list.subjects(
        domain: domain,
        lang: DataLanguage.id,
      );
      domainSubjects[domain] = subjects.data;
      
      await Future.delayed(Duration(milliseconds: 300));
    }
    
    print('=== Analisis Distribusi Subjek ===');
    for (final entry in domainSubjects.entries) {
      print('Domain ${entry.key}: ${entry.value.length} subjek');
      
      // Menghitung total tabel yang tersedia
      final totalTables = entry.value
          .map((s) => s.nTable ?? 0)
          .reduce((a, b) => a + b);
      
      print('  Total Tabel: $totalTables');
      
      // Mencari subjek dengan tabel terbanyak
      final topSubjects = entry.value
          .where((s) => s.nTable != null && s.nTable! > 0)
          .toList()
        ..sort((a, b) => (b.nTable ?? 0).compareTo(a.nTable ?? 0));
      
      if (topSubjects.isNotEmpty) {
        print('  Subjek Teratas: ${topSubjects.first.name} (${topSubjects.first.nTable} tabel)');
      }
      
      print('---');
    }
  }
}
```

### 4. Analisis Kategori Subjek dan Konten

```dart
// Analisis komprehensif subjek dan kategorinya
class SubjectAnalyzer {
  static Future<void> analyzeSubjectStructure(String domain) async {
    try {
      // 1. Mendapatkan semua subjek untuk domain
      final allSubjects = await StadataFlutter.instance.list.subjects(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      print('=== Analisis Subjek untuk Domain $domain ===');
      print('Total Subjek: ${allSubjects.data.length}');
      
      // 2. Mengelompokkan subjek berdasarkan kategori
      final categoryGroups = <String, List<Subject>>{};
      for (final subject in allSubjects.data) {
        final categoryName = subject.category?.name ?? 'Tanpa kategori';
        categoryGroups[categoryName] = (categoryGroups[categoryName] ?? [])..add(subject);
      }
      
      print('Kategori Subjek: ${categoryGroups.keys.length}');
      
      // 3. Menganalisis setiap kategori
      for (final entry in categoryGroups.entries) {
        print('\\n=== Kategori: ${entry.key} ===');
        print('Subjek dalam kategori: ${entry.value.length}');
        
        // Menghitung statistik kategori
        final totalTables = entry.value
            .map((s) => s.nTable ?? 0)
            .reduce((a, b) => a + b);
        
        final avgTables = totalTables / entry.value.length;
        
        print('Total tabel dalam kategori: $totalTables');
        print('Rata-rata tabel per subjek: ${avgTables.toStringAsFixed(1)}');
        
        // Menampilkan subjek teratas dalam kategori
        final sortedSubjects = entry.value
            .where((s) => s.nTable != null && s.nTable! > 0)
            .toList()
          ..sort((a, b) => (b.nTable ?? 0).compareTo(a.nTable ?? 0));
        
        print('Subjek teratas:');
        for (final subject in sortedSubjects.take(3)) {
          print('  - ${subject.name}: ${subject.nTable} tabel');
        }
      }
      
      // 4. Mengidentifikasi subjek tanpa tabel
      final subjectsWithoutTables = allSubjects.data
          .where((s) => s.nTable == null || s.nTable == 0)
          .length;
      
      print('\\n=== Ketersediaan Data ===');
      print('Subjek tanpa tabel: $subjectsWithoutTables');
      print('Subjek dengan data: ${allSubjects.data.length - subjectsWithoutTables}');
      
    } catch (e) {
      print('Error analisis subjek: $e');
    }
  }
}
```

### 5. Membangun Sistem Navigasi Berbasis Subjek

```dart
// Membuat sistem navigasi berdasarkan subjek dan kategori
class SubjectNavigationBuilder {
  static Future<Map<String, Map<String, dynamic>>> buildNavigationStructure(String domain) async {
    final navigationStructure = <String, Map<String, dynamic>>{};
    
    try {
      // Mendapatkan semua subjek
      final subjects = await StadataFlutter.instance.list.subjects(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      // Mendapatkan kategori unik dari daftar subjek
      final categories = <int, String>{};
      for (final subject in subjects.data) {
        if (subject.category != null) {
          categories[subject.category!.id] = subject.category!.name;
        }
      }
      
      // Membangun navigasi untuk setiap kategori
      for (final categoryEntry in categories.entries) {
        final categoryId = categoryEntry.key;
        final categoryName = categoryEntry.value;
        
        // Mendapatkan subjek untuk kategori ini
        final categorySubjects = await StadataFlutter.instance.list.subjects(
          domain: domain,
          lang: DataLanguage.id,
          subjectCategoryId: categoryId,
        );
        
        // Membangun struktur navigasi kategori
        final subjectItems = <Map<String, dynamic>>[];
        for (final subject in categorySubjects.data) {
          subjectItems.add({
            'id': subject.id,
            'name': subject.name,
            'tableCount': subject.nTable ?? 0,
            'hasData': (subject.nTable ?? 0) > 0,
          });
        }
        
        navigationStructure[categoryName] = {
          'categoryId': categoryId,
          'subjectCount': subjectItems.length,
          'totalTables': subjectItems.map((s) => s['tableCount'] as int).reduce((a, b) => a + b),
          'subjects': subjectItems,
        };
        
        await Future.delayed(Duration(milliseconds: 200));
      }
      
      // Menampilkan struktur navigasi
      print('=== Struktur Navigasi Subjek ===');
      for (final entry in navigationStructure.entries) {
        final categoryName = entry.key;
        final categoryData = entry.value;
        
        print('📁 $categoryName');
        print('   Subjek: ${categoryData['subjectCount']}');
        print('   Total Tabel: ${categoryData['totalTables']}');
        
        final subjects = categoryData['subjects'] as List<Map<String, dynamic>>;
        for (final subject in subjects.take(3)) {
          print('   📊 ${subject['name']} (${subject['tableCount']} tabel)');
        }
        
        if (subjects.length > 3) {
          print('   ... dan ${subjects.length - 3} subjek lainnya');
        }
        print('');
      }
      
      return navigationStructure;
      
    } catch (e) {
      print('Error pembangunan navigasi: $e');
      return {};
    }
  }
}
```

## Properti (Subject)

| Properti   | Tipe               | Deskripsi                                     |
| ---------- | ------------------ | --------------------------------------------- |
| `id`       | `int`              | Pengidentifikasi unik untuk subjek           |
| `name`     | `String`           | Nama deskriptif subjek statistik             |
| `category` | `SubjectCategory?` | Kategori subjek yang mengandung subjek ini (opsional) |
| `nTable`   | `int?`             | Jumlah tabel data yang terkait dengan subjek ini (opsional) |

## Area Subjek Umum

### Subjek Ekonomi
- **Indikator Makroekonomi**: PDB, inflasi, metrik pertumbuhan ekonomi
- **Ekonomi Sektoral**: Analisis sektor industri, pertanian, jasa
- **Perdagangan dan Investasi**: Data ekspor/impor, statistik investasi asing
- **Ekonomi Ketenagakerjaan**: Ketenagakerjaan, upah, indikator produktivitas
- **Statistik Keuangan**: Perbankan, pasar modal, indikator moneter

### Subjek Demografi dan Sosial
- **Statistik Penduduk**: Jumlah penduduk, demografi, migrasi
- **Pendidikan**: Pendaftaran sekolah, literasi, hasil pendidikan
- **Kesehatan**: Akses layanan kesehatan, mortalitas, statistik morbiditas
- **Kesejahteraan Sosial**: Kemiskinan, distribusi pendapatan, bantuan sosial
- **Perumahan dan Kondisi Hidup**: Kualitas perumahan, pembangunan perkotaan

### Subjek Lingkungan dan Infrastruktur
- **Statistik Lingkungan**: Sumber daya alam, kualitas lingkungan
- **Transportasi**: Infrastruktur, mobilitas, penggunaan transportasi
- **Energi**: Produksi energi, konsumsi, energi terbarukan
- **Teknologi Informasi**: Infrastruktur digital, penggunaan TIK
- **Pertanian**: Produksi pertanian, penggunaan lahan, pembangunan pedesaan

### Subjek Tata Kelola dan Administrasi
- **Administrasi Publik**: Operasi pemerintahan, layanan publik
- **Pembangunan Daerah**: Statistik pemerintah daerah, indikator regional
- **Keadilan dan Keamanan**: Statistik kriminal, indikator sistem hukum
- **Hubungan Internasional**: Kerjasama internasional, statistik diplomatik

## Alur Kerja Penemuan Subjek

Alur kerja tipikal untuk menemukan dan menggunakan subjek:

1. **Pemilihan Domain**: Memilih area geografis yang diminati
2. **Eksplorasi Kategori**: Menjelajahi subjek berdasarkan kategori tematik
3. **Analisis Subjek**: Meneliti subjek individual dan ketersediaan datanya
4. **Penemuan Konten**: Menggunakan subjek untuk menemukan tabel dan publikasi terkait
5. **Integrasi Data**: Menggabungkan beberapa subjek untuk analisis komprehensif

### Contoh Penemuan Subjek Lengkap

```dart
// Alur kerja penemuan dan pemanfaatan subjek yang komprehensif
class SubjectDiscoverySystem {
  static Future<void> discoverAndAnalyzeSubjects() async {
    try {
      // 1. Menemukan subjek di tingkat nasional
      final nationalSubjects = await StadataFlutter.instance.list.subjects(
        domain: '0000', // Nasional
        lang: DataLanguage.id,
      );
      
      print('=== Penemuan Subjek Nasional ===');
      print('Total Subjek Nasional: ${nationalSubjects.data.length}');
      
      // 2. Mengidentifikasi subjek ekonomi utama
      final economicKeywords = ['ekonomi', 'perdagangan', 'industri', 'keuangan'];
      final economicSubjects = nationalSubjects.data.where((subject) {
        return economicKeywords.any((keyword) => 
            subject.name.toLowerCase().contains(keyword));
      }).toList();
      
      print('Subjek Ekonomi Ditemukan: ${economicSubjects.length}');
      
      // 3. Menganalisis kekayaan data subjek ekonomi
      final richEconomicSubjects = economicSubjects
          .where((s) => s.nTable != null && s.nTable! > 5)
          .toList()
        ..sort((a, b) => (b.nTable ?? 0).compareTo(a.nTable ?? 0));
      
      print('\\n=== Subjek Ekonomi Kaya Data ===');
      for (final subject in richEconomicSubjects.take(5)) {
        print('${subject.name}: ${subject.nTable} tabel');
        print('  ID Subjek: ${subject.id}');
        print('  Kategori: ${subject.category?.name ?? 'Tanpa kategori'}');
        
        // Subjek ini dapat digunakan untuk kueri data lebih lanjut
        print('  → Gunakan untuk kueri tabel data ekonomi');
        print('  → Dapat difilter dalam publikasi dan variabel');
      }
      
      // 4. Perbandingan dengan data provinsi
      final provincialComparison = await _compareProvincialSubjects(
        richEconomicSubjects.take(3).toList(),
      );
      
      print('\\n=== Perbandingan Provinsi ===');
      provincialComparison.forEach((subjectName, provincialData) {
        print('$subjectName:');
        provincialData.forEach((province, tableCount) {
          print('  $province: $tableCount tabel');
        });
      });
      
    } catch (e) {
      print('Error penemuan subjek: $e');
    }
  }
  
  static Future<Map<String, Map<String, int>>> _compareProvincialSubjects(
    List<Subject> nationalSubjects,
  ) async {
    final comparison = <String, Map<String, int>>{};
    final provinces = ['3100', '3200', '3300']; // Jakarta, Jawa Barat, Jawa Tengah
    
    for (final nationalSubject in nationalSubjects) {
      final provincialData = <String, int>{};
      
      for (final province in provinces) {
        try {
          final provinceSubjects = await StadataFlutter.instance.list.subjects(
            domain: province,
            lang: DataLanguage.id,
          );
          
          // Mencari subjek yang cocok berdasarkan nama
          final matchingSubject = provinceSubjects.data
              .where((s) => s.name.contains(nationalSubject.name.split(' ').first))
              .firstOrNull;
          
          provincialData[province] = matchingSubject?.nTable ?? 0;
          
        } catch (e) {
          provincialData[province] = 0;
        }
        
        await Future.delayed(Duration(milliseconds: 100));
      }
      
      comparison[nationalSubject.name] = provincialData;
    }
    
    return comparison;
  }
}
```

## Integrasi dengan API Lain

### Membangun Kueri Data Berbasis Subjek

```dart
// Menggunakan subjek untuk membangun analisis data komprehensif
Future<void> buildSubjectBasedAnalysis(String domain) async {
  try {
    // 1. Mendapatkan subjek untuk domain
    final subjects = await StadataFlutter.instance.list.subjects(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    // 2. Fokus pada subjek dengan data substansial
    final dataRichSubjects = subjects.data
        .where((s) => s.nTable != null && s.nTable! > 3)
        .take(3)
        .toList();
    
    print('=== Analisis Data Berbasis Subjek ===');
    
    for (final subject in dataRichSubjects) {
      print('\\nMenganalisis Subjek: ${subject.name}');
      print('Tabel Tersedia: ${subject.nTable}');
      
      // 3. Mendapatkan variabel terkait untuk subjek ini
      try {
        final variables = await StadataFlutter.instance.list.variables(
          domain: domain,
          subjectID: subject.id,
          lang: DataLanguage.id,
        );
        
        print('Variabel Terkait: ${variables.data.length}');
        
        // 4. Mendapatkan publikasi terkait
        final publications = await StadataFlutter.instance.list.publications(
          domain: domain,
          lang: DataLanguage.id,
        );
        
        // Menyaring publikasi yang mungkin terkait dengan subjek ini
        final relatedPubs = publications.data
            .where((pub) => pub.title.toLowerCase()
                .contains(subject.name.toLowerCase().split(' ').first))
            .length;
        
        print('Publikasi Terkait Potensial: $relatedPubs');
        
        // 5. Mendapatkan tabel statis untuk subjek ini
        final staticTables = await StadataFlutter.instance.list.staticTable(
          domain: domain,
          lang: DataLanguage.id,
        );
        
        final subjectTables = staticTables.data
            .where((table) => table.subjectId == subject.id)
            .length;
        
        print('Tabel Statis untuk Subjek: $subjectTables');
        
        print('Analisis Subjek Selesai untuk ${subject.name}');
        
      } catch (e) {
        print('Error menganalisis subjek ${subject.name}: $e');
      }
      
      await Future.delayed(Duration(milliseconds: 500));
    }
    
  } catch (e) {
    print('Error analisis berbasis subjek: $e');
  }
}
```

## Penanganan Error

Metode API Subjek mengembalikan `Future<ListResult<Subject>>` dan dapat melempar pengecualian spesifik:

- `SubjectException`: Error terkait subjek (domain tidak valid, error ID kategori)
- `ApiException`: Error terkait jaringan atau API
- `ApiKeyNotFoundException`: Kunci API tidak valid atau hilang

```dart
try {
  final result = await StadataFlutter.instance.list.subjects(
    domain: '3200',
    subjectCategoryId: 2,
    lang: DataLanguage.id,
  );
  
  // Memproses hasil yang berhasil
  print('Ditemukan ${result.data.length} subjek');
  
} on SubjectException catch (e) {
  print('Error subjek: ${e.message}');
  // Menangani error validasi domain atau masalah ID kategori
  
} on ApiException catch (e) {
  print('Error API: ${e.message}');
  // Menangani error konektivitas jaringan atau layanan API
  
} catch (e) {
  print('Error tak terduga: $e');
  // Menangani error tak terduga lainnya
}
```

## Pertimbangan Kinerja

- **Penyaringan Kategori**: Gunakan ID kategori subjek untuk mengurangi lingkup kueri ketika fokus pada tema tertentu
- **Kesadaran Jumlah Tabel**: Pertimbangkan subjek dengan jumlah tabel lebih tinggi untuk analisis kaya data
- **Analisis Lintas Domain**: Perhatikan batas laju API saat membandingkan subjek di berbagai domain
- **Caching Subjek**: Cache daftar subjek karena jarang berubah dibandingkan dengan data aktual
- **Pemetaan Hubungan**: Bangun pemetaan yang efisien antara subjek dan elemen data terkait
- **Penanganan Paginasi**: Implementasikan paginasi yang tepat untuk domain dengan banyak subjek