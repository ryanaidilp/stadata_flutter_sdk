# Infografis

API Infografis menyediakan akses ke koleksi lengkap materi visual dan presentasi data dari BPS (Badan Pusat Statistik) Indonesia di semua wilayah. Infografis merupakan sumber daya komunikasi visual yang mengubah data statistik kompleks menjadi format yang mudah dipahami, dapat diakses, dan menarik secara visual untuk berbagai audiens mulai dari peneliti hingga masyarakat umum.

Infografis BPS berfungsi sebagai jembatan penting antara data statistik mentah dan pemahaman publik, memungkinkan stakeholder untuk dengan cepat memahami tren, pola, dan wawasan utama dari sistem statistik Indonesia yang luas.

## Memahami Infografis BPS

Infografis menyediakan nilai komunikasi dan analitis yang signifikan:

- **Visualisasi Data**: Konversi data statistik kompleks menjadi format visual yang mudah dipahami
- **Komunikasi Publik**: Sarana komunikasi efektif untuk menyampaikan temuan statistik kepada audiens yang beragam
- **Wawasan Analitis**: Representasi visual yang menyoroti tren, pola, dan temuan kunci
- **Aksesibilitas**: Format yang membuat informasi statistik dapat diakses oleh audiens non-teknis
- **Keterlibatan**: Konten visual yang menarik yang mendorong keterlibatan dengan data statistik

## Organisasi Sistem Infografis

Infografis BPS diorganisir untuk memaksimalkan utilitas dan aksesibilitas:

- **Klasifikasi Tematik**: Dikategorikan berdasarkan domain statistik dan area subjek
- **Cakupan Geografis**: Tersedia dari kantor BPS nasional, provinsi, dan lokal
- **Organisasi Temporal**: Dapat difilter berdasarkan periode rilis dan relevansi waktu
- **Kemampuan Pencarian**: Penemuan berbasis kata kunci untuk konten yang ditargetkan
- **Format Multiple**: Berbagai format untuk berbagai kasus penggunaan dan platform

## Parameter

| Parameter | Tipe           | Deskripsi                                                  |
| --------- | -------------- | ---------------------------------------------------------- |
| `domain`  | `String`       | Kode domain (wilayah) untuk mendapatkan infografis **(wajib)** |
| `lang`    | `DataLanguage` | Bahasa untuk data infografis (default: `DataLanguage.id`) |
| `page`    | `int`          | Nomor halaman (default: `1`)                              |
| `keyword` | `String?`      | Kata kunci untuk mencari infografis (opsional)            |

## Contoh

### 1. Mengambil Semua Infografis untuk Domain

```dart
// Mengambil infografis dari BPS Jawa Tengah
final hasilInfografis = await StadataFlutter.instance.list.infografis(
  domain: '3300', // Kode domain Jawa Tengah
  lang: DataLanguage.id,
);

final daftarInfografis = hasilInfografis.data;
final paginasi = hasilInfografis.pagination;

// Menampilkan informasi paginasi
print('Halaman Saat Ini: ${paginasi.page}');
print('Total Halaman: ${paginasi.pages}');
print('Jumlah Data di Halaman Ini: ${paginasi.count}');
print('Per Halaman: ${paginasi.perPage}');
print('Total: ${paginasi.total}');
print('------------------------');

// Menampilkan data infografis yang didapatkan
for (final infografis in daftarInfografis) {
  print('ID Infografis: ${infografis.id}');
  print('Judul: ${infografis.title}');
  print('URL Gambar: ${infografis.image}');
  print('Deskripsi: ${infografis.description ?? 'Tidak ada deskripsi'}');
  print('Kategori: ${infografis.category}');
  print('URL Unduh: ${infografis.downloadUrl}');
  print('------------------------');
}
```

### 2. Mencari Infografis berdasarkan Kata Kunci

```dart
// Mencari infografis terkait ekonomi
final infografisEkonomi = await StadataFlutter.instance.list.infografis(
  domain: '0000', // Level nasional
  lang: DataLanguage.id,
  keyword: 'ekonomi', // Mencari infografis terkait ekonomi
);

// Memproses hasil pencarian
for (final infografis in infografisEkonomi.data) {
  print('Infografis Ekonomi: ${infografis.title}');
  print('Kategori: ${infografis.category}');
  print('URL Gambar: ${infografis.image}');
  
  // Memeriksa ketersediaan deskripsi
  if (infografis.description != null && infografis.description!.isNotEmpty) {
    print('Deskripsi: ${infografis.description!.substring(0, 150)}...');
  }
  
  // Memeriksa URL download
  if (infografis.downloadUrl.isNotEmpty) {
    print('Tersedia untuk diunduh: ${infografis.downloadUrl}');
  }
  
  print('------------------------');
}
```

### 3. Menjelajahi Infografis di Berbagai Domain

```dart
// Membandingkan ketersediaan infografis di berbagai wilayah
class InfographicExplorer {
  static Future<void> compareInfographicsAcrossDomains() async {
    final domains = ['0000', '3100', '3200', '3300']; // Nasional, Jakarta, Jawa Barat, Jawa Tengah
    final domainInfographics = <String, List<Infographic>>{};
    
    for (final domain in domains) {
      final infografis = await StadataFlutter.instance.list.infografis(
        domain: domain,
        lang: DataLanguage.id,
      );
      domainInfographics[domain] = infografis.data;
      
      await Future.delayed(Duration(milliseconds: 300));
    }
    
    print('=== Distribusi Infografis ===');
    for (final entry in domainInfographics.entries) {
      print('Domain ${entry.key}: ${entry.value.length} infografis');
      
      // Menganalisis kategori
      final categories = <String, int>{};
      for (final infografis in entry.value) {
        categories[infografis.category] = (categories[infografis.category] ?? 0) + 1;
      }
      
      print('  Kategori teratas:');
      final sortedCategories = categories.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      
      for (final categoryEntry in sortedCategories.take(3)) {
        print('    ${categoryEntry.key}: ${categoryEntry.value} infografis');
      }
      
      print('---');
    }
  }
}
```

### 4. Sistem Penemuan Konten Infografis

```dart
// Sistem pencarian dan penemuan infografis yang komprehensif
class InfographicContentDiscovery {
  static Future<void> discoverInfographicContent(String domain) async {
    try {
      // 1. Mengambil semua infografis untuk domain
      final allInfographics = await StadataFlutter.instance.list.infografis(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      print('=== Penemuan Konten Infografis ===');
      print('Total infografis di domain $domain: ${allInfographics.data.length}');
      
      // 2. Menganalisis distribusi kategori
      final categoryDistribution = <String, List<Infographic>>{};
      for (final infografis in allInfographics.data) {
        final category = infografis.category;
        categoryDistribution[category] = (categoryDistribution[category] ?? [])..add(infografis);
      }
      
      print('Kategori yang tersedia: ${categoryDistribution.keys.length}');
      
      // 3. Menganalisis setiap kategori
      for (final entry in categoryDistribution.entries) {
        final category = entry.key;
        final infographics = entry.value;
        
        print('\\n=== Kategori: $category ===');
        print('Jumlah infografis: ${infographics.length}');
        
        // Menghitung infografis dengan deskripsi
        final withDescription = infographics
            .where((inf) => inf.description != null && inf.description!.isNotEmpty)
            .length;
        
        print('Dengan deskripsi: $withDescription');
        
        // Menampilkan contoh infografis
        print('Contoh infografis:');
        for (final infografis in infographics.take(2)) {
          print('  • ${infografis.title}');
          if (infografis.description != null && infografis.description!.isNotEmpty) {
            final shortDesc = infografis.description!.length > 100 
                ? '${infografis.description!.substring(0, 100)}...'
                : infografis.description!;
            print('    Deskripsi: $shortDesc');
          }
        }
      }
      
      // 4. Pencarian berdasarkan kata kunci populer
      final popularKeywords = ['ekonomi', 'penduduk', 'kemiskinan', 'inflasi'];
      print('\\n=== Pencarian Kata Kunci ===');
      
      for (final keyword in popularKeywords) {
        final keywordResults = await StadataFlutter.instance.list.infografis(
          domain: domain,
          lang: DataLanguage.id,
          keyword: keyword,
        );
        
        print('Kata kunci "$keyword": ${keywordResults.data.length} hasil');
        
        await Future.delayed(Duration(milliseconds: 200));
      }
      
    } catch (e) {
      print('Error penemuan konten: $e');
    }
  }
}
```

### 5. Sistem Manajemen dan Analisis Infografis

```dart
// Sistem manajemen infografis yang komprehensif dengan analisis konten
class InfographicManager {
  static Future<void> manageInfographicWorkflow() async {
    try {
      // 1. Penemuan infografis multi-domain
      final domains = ['0000', '3100', '3200']; // Nasional, Jakarta, Jawa Barat
      final domainAnalysis = <String, Map<String, dynamic>>{};
      
      for (final domain in domains) {
        final infografis = await StadataFlutter.instance.list.infografis(
          domain: domain,
          lang: DataLanguage.id,
        );
        
        // Menganalisis distribusi kategori
        final categoryStats = <String, int>{};
        final downloadableCount = infografis.data
            .where((inf) => inf.downloadUrl.isNotEmpty)
            .length;
        
        for (final inf in infografis.data) {
          categoryStats[inf.category] = (categoryStats[inf.category] ?? 0) + 1;
        }
        
        domainAnalysis[domain] = {
          'totalInfographics': infografis.data.length,
          'categoryCount': categoryStats.keys.length,
          'downloadableCount': downloadableCount,
          'categoryStats': categoryStats,
        };
        
        await Future.delayed(Duration(milliseconds: 200));
      }
      
      // 2. Perbandingan lintas-domain
      print('=== Analisis Infografis Lintas-Domain ===');
      for (final entry in domainAnalysis.entries) {
        final domain = entry.key;
        final analysis = entry.value;
        
        print('Domain $domain:');
        print('  Total Infografis: ${analysis['totalInfographics']}');
        print('  Kategori: ${analysis['categoryCount']}');
        print('  Dapat Diunduh: ${analysis['downloadableCount']}');
        
        final categoryStats = analysis['categoryStats'] as Map<String, int>;
        final topCategory = categoryStats.entries
            .reduce((a, b) => a.value > b.value ? a : b);
        
        print('  Kategori Terpopuler: ${topCategory.key} (${topCategory.value} infografis)');
        print('');
      }
      
      // 3. Rekomendasi pemanfaatan infografis
      print('=== Rekomendasi Pemanfaatan ===');
      final nationalData = domainAnalysis['0000'];
      if (nationalData != null) {
        final totalNational = nationalData['totalInfographics'] as int;
        final downloadableNational = nationalData['downloadableCount'] as int;
        final downloadableRatio = downloadableNational / totalNational;
        
        print('Tingkat nasional:');
        print('  Rasio dapat diunduh: ${(downloadableRatio * 100).toStringAsFixed(1)}%');
        
        if (downloadableRatio > 0.8) {
          print('  Rekomendasi: Koleksi lengkap tersedia - ideal untuk distribusi luas');
        } else if (downloadableRatio > 0.5) {
          print('  Rekomendasi: Sebagian besar konten tersedia - cocok untuk penggunaan selektif');
        } else {
          print('  Rekomendasi: Konten terbatas - fokus pada kategorisasi dan preview');
        }
        
        final categoryCount = nationalData['categoryCount'] as int;
        print('  Diversitas konten: $categoryCount kategori');
        
        if (categoryCount > 10) {
          print('  Rekomendasi: Diversitas tinggi - implementasikan sistem filtering yang robust');
        } else if (categoryCount > 5) {
          print('  Rekomendasi: Diversitas sedang - gunakan navigasi berbasis kategori');
        } else {
          print('  Rekomendasi: Diversitas rendah - fokus pada presentasi konten langsung');
        }
      }
      
    } catch (e) {
      print('Error manajemen infografis: $e');
    }
  }
}
```

## Properti (Infographic)

| Properti      | Tipe      | Deskripsi                                           |
| ------------- | --------- | --------------------------------------------------- |
| `id`          | `String`  | Pengenal unik dari infografis                       |
| `title`       | `String`  | Judul atau nama dari infografis                     |
| `image`       | `String`  | URL gambar yang terkait dengan infografis           |
| `description` | `String?` | Deskripsi singkat dari konten infografis (opsional) |
| `category`    | `String`  | Kategori atau topik yang menjadi subjek infografis  |
| `downloadUrl` | `String`  | URL tempat infografis dapat diunduh                  |

## Kategori Infografis Umum

### Indikator Ekonomi
- **Data Inflasi**: Visualisasi tren inflasi dan analisis dampak ekonomi
- **Pertumbuhan PDB**: Infografis pertumbuhan ekonomi dan perbandingan sektoral
- **Data Perdagangan**: Visualisasi ekspor-impor dan neraca perdagangan
- **Indikator Ketenagakerjaan**: Data pengangguran, partisipasi angkatan kerja

### Statistik Demografis
- **Data Penduduk**: Visualisasi distribusi dan pertumbuhan penduduk
- **Piramida Penduduk**: Struktur umur dan jenis kelamin populasi
- **Migrasi**: Pola migrasi internal dan pergerakan penduduk
- **Statistik Vital**: Kelahiran, kematian, dan perkawinan

### Indikator Sosial
- **Data Kemiskinan**: Visualisasi tingkat kemiskinan dan distribusi pendapatan
- **Statistik Pendidikan**: Tingkat melek huruf, partisipasi sekolah
- **Indikator Kesehatan**: Akses layanan kesehatan, angka kematian
- **Kondisi Perumahan**: Kualitas perumahan dan fasilitas

### Statistik Regional
- **Perbandingan Provinsi**: Visualisasi indikator di berbagai provinsi
- **Pembangunan Perkotaan**: Statistik kota dan pembangunan infrastruktur
- **Data Lingkungan**: Kualitas lingkungan dan sumber daya alam
- **Indikator Pembangunan**: Capaian target pembangunan regional

## Alur Kerja Penemuan Infografis

Alur kerja tipikal untuk menggunakan infografis secara efektif:

1. **Eksplorasi Domain**: Jelajahi infografis yang tersedia untuk wilayah yang diminati
2. **Pencarian Tematik**: Gunakan kata kunci untuk menemukan konten spesifik
3. **Analisis Kategori**: Pahami organisasi konten berdasarkan kategori
4. **Evaluasi Konten**: Tinjau deskripsi dan kualitas visual
5. **Integrasi Penggunaan**: Integrasikan infografis ke dalam aplikasi atau analisis

## Integrasi dengan API Lain

### Membangun Sistem Presentasi Data Komprehensif

```dart
// Mengintegrasikan infografis dengan sumber data BPS lainnya
Future<void> buildDataPresentationSystem(String domain) async {
  try {
    // Mendapatkan informasi domain
    final domains = await StadataFlutter.instance.list.domains();
    final currentDomain = domains.data.firstWhere((d) => d.id == domain);
    
    // Mendapatkan infografis terbaru
    final infografis = await StadataFlutter.instance.list.infografis(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    // Mendapatkan publikasi terkait
    final publications = await StadataFlutter.instance.list.publications(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    // Mendapatkan siaran pers terkait
    final pressReleases = await StadataFlutter.instance.list.pressReleases(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    print('=== Sistem Presentasi Data untuk ${currentDomain.name} ===');
    print('Infografis: ${infografis.data.length}');
    print('Publikasi: ${publications.data.length}');
    print('Siaran Pers: ${pressReleases.data.length}');
    
    // Analisis referensi silang
    print('\\n=== Highlight Infografis Terbaru ===');
    final recentInfographics = infografis.data.take(5);
    
    for (final infografis in recentInfographics) {
      print('${infografis.title}');
      print('  Kategori: ${infografis.category}');
      print('  URL Gambar: ${infografis.image}');
      
      // Memeriksa dokumentasi pendukung
      final hasDownload = infografis.downloadUrl.isNotEmpty;
      print('  Dapat Diunduh: ${hasDownload ? 'Ya' : 'Tidak'}');
    }
    
  } catch (e) {
    print('Error pembuatan sistem presentasi: $e');
  }
}
```

## Penanganan Error

Metode API Infografis mengembalikan `Future<ListResult<Infographic>>` dan dapat menimbulkan exception spesifik:

- `InfographicException`: Error terkait infografis (domain tidak valid, error kata kunci)
- `ApiException`: Error terkait jaringan atau API
- `ApiKeyNotFoundException`: API key tidak valid atau hilang

```dart
try {
  final result = await StadataFlutter.instance.list.infografis(
    domain: '3200',
    keyword: 'ekonomi',
    lang: DataLanguage.id,
  );
  
  // Memproses hasil yang berhasil
  print('Ditemukan ${result.data.length} infografis');
  
} on InfographicException catch (e) {
  print('Error infografis: ${e.message}');
  // Menangani error validasi domain atau masalah kata kunci
  
} on ApiException catch (e) {
  print('Error API: ${e.message}');
  // Menangani error konektivitas jaringan atau layanan API
  
} catch (e) {
  print('Error tidak terduga: $e');
  // Menangani error tak terduga lainnya
}
```

## Pertimbangan Performa

- **Optimisasi Gambar**: Implementasikan lazy loading dan caching untuk gambar infografis
- **Efisiensi Pencarian**: Gunakan kata kunci spesifik untuk mengurangi set hasil
- **Manajemen Konten**: Cache infografis yang sering diakses untuk performa lebih baik
- **Paginasi**: Implementasikan paginasi yang efisien untuk koleksi infografis besar
- **Manajemen Download**: Implementasikan manajemen download yang tepat untuk file besar
- **Pengalaman Pengguna**: Sediakan preview sebelum download dan indikator ukuran file