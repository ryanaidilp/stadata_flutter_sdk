# Berita

API Berita menyediakan akses ke koleksi lengkap artikel berita dan komunikasi resmi dari BPS (Badan Pusat Statistik) Indonesia di semua wilayah. Berita BPS berfungsi sebagai saluran komunikasi utama untuk menyampaikan pengumuman statistik, rilis data, analisis tren, dan wawasan penting kepada publik, media, dan stakeholder.

Berita BPS memainkan peran vital dalam ekosistem informasi statistik Indonesia, menyediakan konteks, interpretasi, dan analisis yang mudah diakses untuk data statistik kompleks, memastikan bahwa temuan statistik dapat dipahami dan dimanfaatkan oleh audiens yang luas.

## Memahami Sistem Berita BPS

Berita BPS menyediakan komunikasi strategis dan nilai informatif:

- **Komunikasi Resmi**: Saluran utama untuk pengumuman statistik resmi dan rilis data terbaru
- **Analisis Kontekstual**: Interpretasi ahli dan analisis tren untuk data statistik kompleks
- **Aksesibilitas Publik**: Format yang mudah dipahami untuk membuat statistik dapat diakses oleh masyarakat umum
- **Ketepatan Waktu**: Distribusi berita terkini dan relevan yang selaras dengan rilis data
- **Cakupan Regional**: Berita spesifik wilayah yang mencerminkan kondisi dan isu lokal

## Organisasi Sistem Berita

Berita BPS diorganisir untuk memaksimalkan jangkauan dan dampak:

- **Klasifikasi Kategori**: Diorganisir berdasarkan kategori tematik untuk penemuan konten yang efisien
- **Cakupan Geografis**: Tersedia dari kantor BPS nasional, provinsi, dan lokal
- **Organisasi Temporal**: Filter berdasarkan bulan dan tahun untuk akses konten periode spesifik
- **Kemampuan Pencarian**: Penemuan berbasis kata kunci untuk konten yang ditargetkan
- **Integrasi Media**: Dukungan gambar dan konten multimedia untuk keterlibatan yang ditingkatkan

## Parameter

| Parameter        | Tipe           | Deskripsi                                              |
| ---------------- | -------------- | ------------------------------------------------------ |
| `domain`         | `String`       | Kode domain (wilayah) untuk mengambil berita **(wajib)** |
| `lang`           | `DataLanguage` | Bahasa untuk data berita (default: `DataLanguage.id`) |
| `page`           | `int`          | Nomor halaman (default: `1`)                          |
| `keyword`        | `String?`      | Kata kunci untuk mencari berita (opsional)            |
| `newsCategoryId` | `String?`      | ID kategori untuk menyaring berita (opsional)         |
| `month`          | `int?`         | Bulan untuk menyaring berita (opsional - `1..12`)     |
| `year`           | `int?`         | Tahun untuk menyaring berita (opsional)               |

## Contoh

### 1. Mengambil Semua Berita untuk Domain

```dart
// Mengambil berita dari BPS Jawa Tengah
final result = await StadataFlutter.instance.list.news(
  domain: '3300', // Kode domain Jawa Tengah
  lang: DataLanguage.id,
);

final newsList = result.data;
final pagination = result.pagination;

// Menampilkan informasi paginasi
print('Halaman Saat Ini: ${pagination.page}');
print('Total Halaman: ${pagination.pages}');
print('Jumlah Data di Halaman Ini: ${pagination.count}');
print('Per Halaman: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Menampilkan data berita yang diambil
for (final news in newsList) {
  print('ID Berita: ${news.id}');
  print('Kategori: ${news.category ?? 'Umum'}');
  print('Judul: ${news.title}');
  print('Tanggal Rilis: ${news.releaseDate}');
  print('Gambar: ${news.picture}');
  
  // Menampilkan cuplikan konten
  final contentPreview = news.content.length > 150 
      ? '${news.content.substring(0, 150)}...'
      : news.content;
  print('Cuplikan: $contentPreview');
  
  print('------------------------');
}
```

### 2. Mencari Berita berdasarkan Kata Kunci dan Kategori

```dart
// Mencari berita ekonomi dengan kata kunci tertentu
final economicNews = await StadataFlutter.instance.list.news(
  domain: '0000', // Level nasional
  lang: DataLanguage.id,
  keyword: 'inflasi', // Mencari berita tentang inflasi
  newsCategoryId: '2', // Contoh ID kategori ekonomi
  year: 2023,
);

// Memproses hasil pencarian
print('=== Berita Inflasi 2023 ===');
for (final news in economicNews.data) {
  print('Berita Ekonomi: ${news.title}');
  print('Kategori: ${news.category}');
  print('Tanggal: ${news.releaseDate}');
  
  // Menganalisis konten untuk kata kunci terkait
  final content = news.content.toLowerCase();
  if (content.contains('bank indonesia') || content.contains('bi')) {
    print('  Topik: Kebijakan moneter');
  } else if (content.contains('harga') || content.contains('konsumen')) {
    print('  Topik: Harga konsumen');
  } else if (content.contains('pangan') || content.contains('makanan')) {
    print('  Topik: Inflasi pangan');
  }
  
  // Memeriksa ketersediaan gambar
  if (news.picture.isNotEmpty) {
    print('  Media: Gambar tersedia');
  }
  
  print('------------------------');
}
```

### 3. Menganalisis Tren Berita di Berbagai Domain

```dart
// Menganalisis distribusi berita di berbagai wilayah
class NewsAnalyzer {
  static Future<void> analyzeNewsDistribution() async {
    final domains = ['0000', '3100', '3200', '3300']; // Nasional, Jakarta, Jawa Barat, Jawa Tengah
    final domainNews = <String, List<News>>{};\
    
    for (final domain in domains) {
      final news = await StadataFlutter.instance.list.news(
        domain: domain,
        lang: DataLanguage.id,
      );
      domainNews[domain] = news.data;
      
      await Future.delayed(Duration(milliseconds: 300));
    }
    
    print('=== Analisis Distribusi Berita ===');
    for (final entry in domainNews.entries) {
      print('Domain ${entry.key}: ${entry.value.length} berita');
      
      // Menganalisis distribusi kategori
      final categories = <String?, int>{};
      final monthlyDistribution = <int, int>{};
      
      for (final news in entry.value) {
        categories[news.category] = (categories[news.category] ?? 0) + 1;
        
        final month = news.releaseDate.month;
        monthlyDistribution[month] = (monthlyDistribution[month] ?? 0) + 1;
      }
      
      print('  Kategori teratas:');
      final sortedCategories = categories.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      
      for (final categoryEntry in sortedCategories.take(3)) {
        final categoryName = categoryEntry.key ?? 'Tidak dikategorikan';
        print('    $categoryName: ${categoryEntry.value} berita');
      }
      
      // Mencari bulan dengan aktivitas tertinggi
      if (monthlyDistribution.isNotEmpty) {
        final peakMonth = monthlyDistribution.entries
            .reduce((a, b) => a.value > b.value ? a : b);
        final monthNames = [
          '', 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
          'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
        ];
        print('  Bulan teraktif: ${monthNames[peakMonth.key]} (${peakMonth.value} berita)');
      }
      
      print('---');
    }
  }
}
```

### 4. Sistem Pemantauan Berita Komprehensif

```dart
// Sistem pemantauan berita untuk melacak topik dan tren
class NewsMonitoringSystem {
  static Future<void> monitorNewsContent(String domain) async {
    try {
      // 1. Mengambil semua berita untuk domain
      final allNews = await StadataFlutter.instance.list.news(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      print('=== Sistem Pemantauan Berita ===');
      print('Total berita di domain $domain: ${allNews.data.length}');
      
      // 2. Menganalisis distribusi berdasarkan kategori
      final categoryDistribution = <String?, List<News>>{};
      for (final news in allNews.data) {
        final category = news.category;
        categoryDistribution[category] = (categoryDistribution[category] ?? [])..add(news);
      }
      
      print('Kategori yang tersedia: ${categoryDistribution.keys.length}');
      
      // 3. Menganalisis setiap kategori
      for (final entry in categoryDistribution.entries) {
        final category = entry.key ?? 'Tidak dikategorikan';
        final newsItems = entry.value;
        
        print('\\n=== Kategori: $category ===');
        print('Jumlah berita: ${newsItems.length}');
        
        // Menganalisis frekuensi publikasi
        final currentMonth = DateTime.now().month;
        final currentYear = DateTime.now().year;
        
        final recentNews = newsItems.where((news) => 
            news.releaseDate.year == currentYear && 
            news.releaseDate.month >= currentMonth - 1).length;
        
        print('Berita terbaru (30 hari): $recentNews');
        
        // Menganalisis konten dengan gambar
        final newsWithPictures = newsItems.where((news) => 
            news.picture.isNotEmpty).length;
        
        print('Dengan gambar: $newsWithPictures');
        
        // Menganalisis panjang rata-rata konten
        final averageContentLength = newsItems.isNotEmpty
            ? newsItems.map((news) => news.content.length).reduce((a, b) => a + b) / newsItems.length
            : 0.0;
        
        print('Panjang rata-rata konten: ${averageContentLength.toInt()} karakter');
        
        // Menampilkan contoh berita terbaru
        final recentNewsItems = newsItems
            .where((news) => news.releaseDate.year == currentYear)
            .toList()
          ..sort((a, b) => b.releaseDate.compareTo(a.releaseDate));
        
        if (recentNewsItems.isNotEmpty) {
          print('Berita terbaru:');
          for (final news in recentNewsItems.take(2)) {
            print('  • ${news.title} (${news.releaseDate.day}/${news.releaseDate.month})');
          }
        }
      }
      
      // 4. Analisis tren temporal
      print('\\n=== Analisis Tren Temporal ===');
      final monthlyActivity = <int, int>{};
      final yearlyActivity = <int, int>{};
      
      for (final news in allNews.data) {
        final month = news.releaseDate.month;
        final year = news.releaseDate.year;
        
        monthlyActivity[month] = (monthlyActivity[month] ?? 0) + 1;
        yearlyActivity[year] = (yearlyActivity[year] ?? 0) + 1;
      }
      
      final sortedMonths = monthlyActivity.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      
      print('Bulan teraktif:');
      final monthNames = [
        '', 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
        'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
      ];
      
      for (final entry in sortedMonths.take(3)) {
        print('  ${monthNames[entry.key]}: ${entry.value} berita');
      }
      
      print('\\nDistribusi tahunan:');
      final sortedYears = yearlyActivity.entries.toList()
        ..sort((a, b) => b.key.compareTo(a.key));
      
      for (final entry in sortedYears.take(3)) {
        print('  ${entry.key}: ${entry.value} berita');
      }
      
    } catch (e) {
      print('Error pemantauan berita: $e');
    }
  }
}
```

### 5. Sistem Analisis Konten dan Klasifikasi Berita

```dart
// Sistem analisis konten untuk mengklasifikasi dan menganalisis berita
class NewsContentAnalyzer {
  static Future<void> analyzeNewsContent() async {
    try {
      // 1. Mengambil berita dari berbagai domain untuk analisis komprehensif
      final domains = ['0000', '3100', '3200']; // Nasional, Jakarta, Jawa Barat
      final allNews = <News>[];
      
      for (final domain in domains) {
        final news = await StadataFlutter.instance.list.news(
          domain: domain,
          lang: DataLanguage.id,
        );
        allNews.addAll(news.data);
        
        await Future.delayed(Duration(milliseconds: 200));
      }
      
      print('=== Analisis Konten Berita ===');
      print('Total berita untuk analisis: ${allNews.length}');
      
      // 2. Klasifikasi topik berdasarkan kata kunci
      final topicClassification = <String, List<News>>{
        'Ekonomi': [],
        'Sosial': [],
        'Demografis': [],
        'Infrastruktur': [],
        'Lainnya': [],
      };
      
      for (final news in allNews) {
        final content = news.content.toLowerCase();
        final title = news.title.toLowerCase();
        
        bool classified = false;
        
        // Klasifikasi ekonomi
        if (content.contains('ekonomi') || content.contains('inflasi') || 
            content.contains('pdb') || content.contains('ekspor') || 
            content.contains('impor') || title.contains('ekonomi')) {
          topicClassification['Ekonomi']!.add(news);
          classified = true;
        }
        
        // Klasifikasi sosial
        if (content.contains('pendidikan') || content.contains('kesehatan') || 
            content.contains('kemiskinan') || content.contains('sosial') ||
            title.contains('sosial')) {
          topicClassification['Sosial']!.add(news);
          classified = true;
        }
        
        // Klasifikasi demografis
        if (content.contains('penduduk') || content.contains('sensus') || 
            content.contains('kelahiran') || content.contains('kematian') ||
            title.contains('penduduk')) {
          topicClassification['Demografis']!.add(news);
          classified = true;
        }
        
        // Klasifikasi infrastruktur
        if (content.contains('infrastruktur') || content.contains('jalan') || 
            content.contains('listrik') || content.contains('air') ||
            title.contains('infrastruktur')) {
          topicClassification['Infrastruktur']!.add(news);
          classified = true;
        }
        
        if (!classified) {
          topicClassification['Lainnya']!.add(news);
        }
      }
      
      // 3. Menganalisis distribusi topik
      print('\\n=== Distribusi Topik ===');
      for (final entry in topicClassification.entries) {
        final topic = entry.key;
        final newsItems = entry.value;
        
        print('$topic: ${newsItems.length} berita (${(newsItems.length / allNews.length * 100).toStringAsFixed(1)}%)');
        
        if (newsItems.isNotEmpty) {
          // Menganalisis rata-rata panjang konten per topik
          final avgLength = newsItems.map((n) => n.content.length).reduce((a, b) => a + b) / newsItems.length;
          print('  Rata-rata panjang: ${avgLength.toInt()} karakter');
          
          // Menganalisis ketersediaan gambar per topik
          final withPictures = newsItems.where((n) => n.picture.isNotEmpty).length;
          print('  Dengan gambar: $withPictures (${(withPictures / newsItems.length * 100).toStringAsFixed(1)}%)');
          
          // Menampilkan contoh judul
          print('  Contoh: ${newsItems.first.title}');
        }
        
        print('');
      }
      
      // 4. Analisis tren konten
      print('=== Analisis Tren Konten ===');
      final currentYear = DateTime.now().year;
      final recentNews = allNews.where((news) => 
          news.releaseDate.year >= currentYear - 1).toList();
      
      print('Berita 12 bulan terakhir: ${recentNews.length}');
      
      // Menganalisis kata kunci populer
      final wordFrequency = <String, int>{};
      final stopWords = {'dan', 'atau', 'yang', 'pada', 'di', 'ke', 'dari', 'untuk', 'dengan', 'adalah', 'akan', 'telah'};
      
      for (final news in recentNews.take(50)) { // Sampel 50 berita terbaru
        final words = news.title.toLowerCase().split(RegExp(r'\\s+'));
        for (final word in words) {
          final cleanWord = word.replaceAll(RegExp(r'[^a-zA-Z]'), '');
          if (cleanWord.length > 3 && !stopWords.contains(cleanWord)) {
            wordFrequency[cleanWord] = (wordFrequency[cleanWord] ?? 0) + 1;
          }
        }
      }
      
      final popularWords = wordFrequency.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      
      print('Kata kunci populer dalam judul:');
      for (final entry in popularWords.take(10)) {
        print('  ${entry.key}: ${entry.value} kali');
      }
      
    } catch (e) {
      print('Error analisis konten: $e');
    }
  }
}
```

## Properti (News)

| Properti      | Tipe       | Deskripsi                                          |
| ------------- | ---------- | -------------------------------------------------- |
| `id`          | `int`      | Pengidentifikasi unik untuk berita                |
| `categoryId`  | `String`   | Pengidentifikasi kategori untuk berita            |
| `category`    | `String?`  | Nama kategori berita (opsional)                   |
| `title`       | `String`   | Judul berita                                       |
| `content`     | `String`   | Isi lengkap berita                                 |
| `releaseDate` | `DateTime` | Tanggal dan waktu ketika berita dirilis           |
| `picture`     | `String`   | URL gambar yang terkait dengan berita             |

## Kategori Berita BPS Umum

### Berita Ekonomi
- **Rilis Data Ekonomi**: Pengumuman PDB, inflasi, pertumbuhan ekonomi terbaru
- **Analisis Ekonomi**: Interpretasi tren ekonomi dan dampak kebijakan
- **Data Perdagangan**: Statistik ekspor-impor, neraca perdagangan, investasi
- **Indikator Makroekonomi**: Laporan indeks harga, tingkat pengangguran, produktivitas

### Berita Demografis dan Sosial
- **Hasil Sensus**: Pengumuman hasil sensus penduduk dan survei demografi
- **Statistik Sosial**: Data pendidikan, kesehatan, kemiskinan, kesejahteraan
- **Tren Demografis**: Analisis perubahan struktur penduduk dan migrasi
- **Indikator Pembangunan**: Laporan indeks pembangunan manusia dan target SDGs

### Berita Regional
- **Statistik Daerah**: Data spesifik provinsi, kabupaten, dan kota
- **Pembangunan Regional**: Capaian pembangunan daerah dan perbandingan wilayah
- **Profil Wilayah**: Karakteristik ekonomi dan sosial daerah tertentu
- **Kolaborasi Regional**: Kerjasama antar daerah dalam pengembangan statistik

### Berita Metodologi dan Inovasi
- **Metodologi Baru**: Pengenalan metode survei dan pengumpulan data terbaru
- **Inovasi Teknologi**: Implementasi teknologi dalam sistem statistik
- **Peningkatan Kualitas**: Program peningkatan kualitas data dan layanan
- **Standarisasi**: Adopsi standar internasional dan praktik terbaik

## Alur Kerja Pemantauan Berita

Alur kerja tipikal untuk menggunakan berita BPS secara efektif:

1. **Eksplorasi Domain**: Temukan berita yang tersedia untuk wilayah yang diminati
2. **Filtering Kategori**: Gunakan kategori untuk fokus pada topik tertentu
3. **Pencarian Temporal**: Terapkan filter bulan dan tahun untuk periode spesifik
4. **Analisis Konten**: Tinjau konten dan konteks untuk pemahaman mendalam
5. **Integrasi Sistem**: Integrasikan berita ke dalam sistem pemantauan atau dashboard

## Integrasi dengan API Lain

### Membangun Sistem Informasi Berita Komprehensif

```dart
// Mengintegrasikan berita dengan sumber informasi BPS lainnya
Future<void> buildNewsInformationSystem(String domain) async {
  try {
    // Mendapatkan informasi domain
    final domains = await StadataFlutter.instance.list.domains();
    final currentDomain = domains.data.firstWhere((d) => d.id == domain);
    
    // Mendapatkan berita terbaru
    final news = await StadataFlutter.instance.list.news(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    // Mendapatkan kategori berita
    final newsCategories = await StadataFlutter.instance.list.newsCategories(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    // Mendapatkan siaran pers untuk referensi silang
    final pressReleases = await StadataFlutter.instance.list.pressReleases(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    print('=== Sistem Informasi Berita ${currentDomain.name} ===');
    print('Berita: ${news.data.length}');
    print('Kategori Berita: ${newsCategories.data.length}');
    print('Siaran Pers: ${pressReleases.data.length}');
    
    // Analisis referensi silang konten
    print('\\n=== Analisis Konten Terintegrasi ===');
    final categoryMapping = <String, int>{};
    
    for (final newsItem in news.data) {
      final categoryId = newsItem.categoryId;
      categoryMapping[categoryId] = (categoryMapping[categoryId] ?? 0) + 1;
    }
    
    print('Distribusi konten berdasarkan kategori:');
    for (final entry in categoryMapping.entries) {
      final categoryName = newsCategories.data
          .where((cat) => cat.id == entry.key)
          .map((cat) => cat.name)
          .firstOrNull ?? 'Kategori ${entry.key}';
      
      print('  $categoryName: ${entry.value} berita');
    }
    
    // Analisis aktivitas komunikasi
    final currentMonth = DateTime.now().month;
    final currentYear = DateTime.now().year;
    
    final recentNews = news.data.where((n) => 
        n.releaseDate.year == currentYear && 
        n.releaseDate.month == currentMonth).length;
    
    final recentPressReleases = pressReleases.data.where((pr) => 
        pr.releaseDate.year == currentYear && 
        pr.releaseDate.month == currentMonth).length;
    
    print('\\nAktivitas bulan ini:');
    print('  Berita: $recentNews');
    print('  Siaran Pers: $recentPressReleases');
    print('  Total komunikasi: ${recentNews + recentPressReleases}');
    
  } catch (e) {
    print('Error pembuatan sistem informasi: $e');
  }
}
```

## Penanganan Error

Metode API Berita mengembalikan `Future<ListResult<News>>` dan dapat menimbulkan exception spesifik:

- `NewsException`: Error terkait berita (domain tidak valid, error kategori, filter waktu tidak valid)
- `ApiException`: Error terkait jaringan atau API
- `ApiKeyNotFoundException`: API key tidak valid atau hilang

```dart
try {
  final result = await StadataFlutter.instance.list.news(
    domain: '3200',
    keyword: 'ekonomi',
    newsCategoryId: '2',
    year: 2023,
    month: 12,
    lang: DataLanguage.id,
  );
  
  // Memproses hasil yang berhasil
  print('Ditemukan ${result.data.length} berita');
  
} on NewsException catch (e) {
  print('Error berita: ${e.message}');
  // Menangani error validasi domain, kategori, atau filter temporal
  
} on ApiException catch (e) {
  print('Error API: ${e.message}');
  // Menangani error konektivitas jaringan atau layanan API
  
} catch (e) {
  print('Error tidak terduga: $e');
  // Menangani error tak terduga lainnya
}
```

## Pertimbangan Performa

- **Caching Konten**: Cache berita yang sering diakses untuk mengurangi beban API
- **Filtering Efisien**: Kombinasikan filter kategori dan temporal untuk pencarian yang ditargetkan
- **Manajemen Gambar**: Implementasikan lazy loading untuk gambar berita
- **Optimisasi Pencarian**: Gunakan kata kunci spesifik untuk mengurangi ukuran set hasil
- **Analisis Batch**: Proses analisis konten secara batch untuk performa yang lebih baik
- **Pemantauan Real-time**: Implementasikan sistem polling untuk berita terbaru dengan interval yang tepat
