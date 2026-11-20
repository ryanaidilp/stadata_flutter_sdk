# Berita

API View Berita menyediakan akses komprehensif ke artikel berita terperinci dari BPS (Badan Pusat Statistik) Indonesia. Metode ini memungkinkan aplikasi untuk mengambil konten berita lengkap, termasuk teks penuh, konten multimedia, klasifikasi kategori, dan metadata publikasi untuk tujuan analisis berita, manajemen konten, dan penyebaran informasi.

Artikel berita dari BPS berfungsi sebagai saluran komunikasi utama untuk wawasan statistik, rilis data, pengumuman kebijakan, dan komentar analitis. API View Berita memastikan akses ke konten berita lengkap dengan format yang kaya, memungkinkan aplikasi untuk menyediakan komunikasi statistik yang komprehensif dan pembaruan informasi yang tepat waktu kepada pengguna.

## Memahami Sistem Berita BPS

Artikel berita BPS menyediakan komunikasi strategis dan penyebaran informasi:

- **Komunikasi Resmi**: Saluran utama untuk pengumuman statistik, rilis data, dan komunikasi kebijakan
- **Analisis Kontekstual**: Interpretasi dan analisis ahli tentang data dan tren statistik
- **Konten Multi-format**: Konten teks kaya dengan gambar, grafik, dan elemen multimedia
- **Organisasi Kategori**: Sistem klasifikasi terstruktur untuk penemuan dan navigasi konten yang efisien
- **Relevansi Temporal**: Publikasi tepat waktu yang selaras dengan siklus rilis statistik dan peristiwa penting

## Kategori Konten Berita

### Rilis Data Statistik
- **Rilis Ekonomi**: Pengumuman PDB, laporan inflasi, statistik perdagangan, dan indikator ekonomi
- **Statistik Sosial**: Pembaruan populasi, statistik pendidikan, indikator kesehatan, dan laporan kesejahteraan
- **Berita Demografi**: Hasil sensus, proyeksi populasi, dan analisis tren demografi
- **Statistik Regional**: Rilis statistik tingkat provinsi dan lokal serta analisis komparatif

### Komentar Analitis
- **Analisis Tren**: Interpretasi ahli tentang pola dan perkembangan statistik
- **Dampak Kebijakan**: Analisis efek kebijakan terhadap indikator statistik dan hasil kemasyarakatan
- **Studi Komparatif**: Perbandingan antar-regional dan temporal data statistik
- **Pembaruan Metodologi**: Penjelasan metode statistik baru dan teknik pengumpulan data

### Berita Institusional
- **Aktivitas BPS**: Pembaruan badan, konferensi, program pelatihan, dan perkembangan institusional
- **Kerjasama Internasional**: Pengumuman kolaborasi, bantuan teknis, dan inisiatif global
- **Pembaruan Teknologi**: Transformasi digital, peningkatan sistem, dan pengumuman inovasi
- **Keterlibatan Publik**: Penjangkauan komunitas, program pendidikan, dan komunikasi pemangku kepentingan

## Parameter

| Parameter | Tipe           | Deskripsi                                              |
| --------- | -------------- | ------------------------------------------------------ |
| `id`      | `int`          | **Wajib**: Identifier numerik unik dari artikel berita tertentu |
| `domain`  | `String`       | **Wajib**: Kode domain (wilayah) yang menentukan konteks administratif |
| `lang`    | `DataLanguage` | **Opsional**: Preferensi bahasa untuk konten terlokalisasi (default: `DataLanguage.id`) |

## Contoh

### 1. Pengambilan Berita Dasar

![Preview](/gif/news.gif)

```dart
// Mengambil informasi terperinci untuk artikel berita tertentu
final berita = await StadataFlutter.instance.view.news(
  id: 12345, // Contoh: ID artikel berita ekonomi
  domain: '0000', // Tingkat nasional
  lang: DataLanguage.id,
);

if (berita != null) {
  print('=== Detail Artikel Berita ===');
  print('ID Artikel: ${berita.id}');
  print('Judul: ${berita.title}');
  print('Kategori: ${berita.category ?? 'Umum'}');
  print('ID Kategori: ${berita.categoryId}');
  
  // Informasi publikasi
  print('\n=== Informasi Publikasi ===');
  print('Tanggal Rilis: ${berita.releaseDate}');
  print('Memiliki Gambar: ${berita.picture.isNotEmpty ? 'Ya' : 'Tidak'}');
  
  if (berita.picture.isNotEmpty) {
    print('URL Gambar: ${berita.picture}');
  }
  
  // Pratinjau konten
  print('\n=== Pratinjau Konten ===');
  final cuplikanKonten = berita.content.length > 300 
      ? '${berita.content.substring(0, 300)}...'
      : berita.content;
  print('Konten: $cuplikanKonten');
  
  // Analisis konten
  print('\n=== Analisis Konten ===');
  print('Panjang Konten: ${berita.content.length} karakter');
  print('Jumlah Kata: ${berita.content.split(' ').length} kata');
  
  // Periksa kata kunci statistik
  final kontenHurufKecil = berita.content.toLowerCase();
  final kataKunciStatistik = <String>[];
  
  if (kontenHurufKecil.contains('inflasi') || kontenHurufKecil.contains('inflation')) {
    kataKunciStatistik.add('Inflasi');
  }
  if (kontenHurufKecil.contains('pdb') || kontenHurufKecil.contains('gdp')) {
    kataKunciStatistik.add('PDB');
  }
  if (kontenHurufKecil.contains('penduduk') || kontenHurufKecil.contains('population')) {
    kataKunciStatistik.add('Populasi');
  }
  if (kontenHurufKecil.contains('ekonomi') || kontenHurufKecil.contains('economic')) {
    kataKunciStatistik.add('Ekonomi');
  }
  
  if (kataKunciStatistik.isNotEmpty) {
    print('Topik Statistik: ${kataKunciStatistik.join(', ')}');
  }
  
} else {
  print('Artikel berita tidak ditemukan atau tidak dapat diakses');
}
```

### 2. Alur Kerja Analisis Konten Berita

```dart
// Analisis konten berita komprehensif dan kategorisasi
class NewsContentAnalyzer {
  static Future<void> analyzeNewsContent(
    String domain,
    String temaPenelitian,
  ) async {
    try {
      // 1. Temukan artikel berita menggunakan List API
      final daftarBerita = await StadataFlutter.instance.list.news(
        domain: domain,
        keyword: temaPenelitian,
        lang: DataLanguage.id,
      );
      
      print('=== Analisis Konten Berita: "$temaPenelitian" ===');
      print('Ditemukan ${daftarBerita.data.length} artikel berita');
      
      if (daftarBerita.data.isEmpty) {
        print('Tidak ada artikel berita ditemukan untuk tema: $temaPenelitian');
        return;
      }
      
      // 2. Analisis setiap artikel secara detail
      final analisisKonten = <Map<String, dynamic>>[];
      
      for (final ringkasanBerita in daftarBerita.data.take(10)) {
        print('\n--- Menganalisis: ${ringkasanBerita.title} ---');
        
        final beritaDetailu = await StadataFlutter.instance.view.news(
          id: ringkasanBerita.id,
          domain: domain,
          lang: DataLanguage.id,
        );
        
        if (beritaDetailu != null) {
          final analisis = _analyzeNewsContent(beritaDetailu);
          analisisKonten.add({
            'id': beritaDetailu.id,
            'title': beritaDetailu.title,
            'category': beritaDetailu.category,
            'categoryId': beritaDetailu.categoryId,
            'releaseDate': beritaDetailu.releaseDate,
            'hasImage': beritaDetailu.picture.isNotEmpty,
            'contentLength': beritaDetailu.content.length,
            'wordCount': beritaDetailu.content.split(' ').length,
            'analysis': analisis,
          });
          
          // Tampilkan temuan utama
          print('Kategori: ${beritaDetailu.category ?? 'Tidak Dikategorikan'}');
          print('Tanggal Rilis: ${beritaDetailu.releaseDate}');
          print('Panjang Konten: ${beritaDetailu.content.length} karakter');
          print('Memiliki Gambar: ${beritaDetailu.picture.isNotEmpty ? 'Ya' : 'Tidak'}');
          print('Topik Statistik: ${analisis['topics'].join(', ')}');
          print('Sentimen: ${analisis['sentiment']}');
          print('Tingkat Bacaan: ${analisis['readingLevel']}');
          
        } else {
          print('Gagal mengambil informasi detail');
        }
        
        // Rate limiting
        await Future.delayed(Duration(milliseconds: 500));
      }
      
      // 3. Ringkasan analisis
      print('\n=== Ringkasan Analisis Konten ===');
      print('Total Artikel Dianalisis: ${analisisKonten.length}');
      
      // Distribusi kategori
      final distribusiKategori = <String?, int>{};
      for (final artikel in analisisKonten) {
        final kategori = artikel['category'] as String?;
        distribusiKategori[kategori] = (distribusiKategori[kategori] ?? 0) + 1;
      }
      
      print('\nDistribusi Kategori:');
      for (final entry in distribusiKategori.entries) {
        final kategori = entry.key ?? 'Tidak Dikategorikan';
        print('  $kategori: ${entry.value} artikel');
      }
      
      // Metrik konten
      final rataRataPanjangKonten = analisisKonten.isNotEmpty
          ? analisisKonten.map((a) => a['contentLength'] as int).reduce((a, b) => a + b) / analisisKonten.length
          : 0.0;
      
      final rataRataJumlahKata = analisisKonten.isNotEmpty
          ? analisisKonten.map((a) => a['wordCount'] as int).reduce((a, b) => a + b) / analisisKonten.length
          : 0.0;
      
      final denganGambar = analisisKonten.where((a) => a['hasImage'] as bool).length;
      
      print('\nMetrik Konten:');
      print('Rata-rata Panjang Konten: ${rataRataPanjangKonten.round()} karakter');
      print('Rata-rata Jumlah Kata: ${rataRataJumlahKata.round()} kata');
      print('Artikel dengan Gambar: $denganGambar/${analisisKonten.length}');
      
      // Analisis topik
      final semuaTopik = <String, int>{};
      for (final artikel in analisisKonten) {
        final topik = artikel['analysis']['topics'] as List<String>;
        for (final topikItem in topik) {
          semuaTopik[topikItem] = (semuaTopik[topikItem] ?? 0) + 1;
        }
      }
      
      final topikTerurut = semuaTopik.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      
      print('\nTopik Paling Umum:');
      for (final entry in topikTerurut.take(5)) {
        print('  ${entry.key}: ${entry.value} artikel');
      }
      
      // Analisis temporal
      final tanggalSekarang = DateTime.now();
      final artikelTerbaru = analisisKonten.where((a) => 
          (a['releaseDate'] as DateTime).isAfter(tanggalSekarang.subtract(Duration(days: 30)))
      ).length;
      
      print('\nAnalisis Temporal:');
      print('Artikel Terbaru (30 hari terakhir): $artikelTerbaru');
      
    } catch (e) {
      print('Error analisis konten: $e');
    }
  }
  
  static Map<String, dynamic> _analyzeNewsContent(News berita) {
    final konten = berita.content.toLowerCase();
    final analisis = <String, dynamic>{};
    
    // Deteksi topik
    final topik = <String>[];
    if (konten.contains('inflasi') || konten.contains('harga')) topik.add('Inflasi');
    if (konten.contains('pdb') || konten.contains('ekonomi')) topik.add('Ekonomi');
    if (konten.contains('penduduk') || konten.contains('demografi')) topik.add('Demografi');
    if (konten.contains('perdagangan') || konten.contains('ekspor')) topik.add('Perdagangan');
    if (konten.contains('kemiskinan') || konten.contains('kesejahteraan')) topik.add('Kesejahteraan');
    if (konten.contains('pendidikan') || konten.contains('sekolah')) topik.add('Pendidikan');
    if (konten.contains('kesehatan') || konten.contains('medis')) topik.add('Kesehatan');
    if (konten.contains('teknologi') || konten.contains('digital')) topik.add('Teknologi');
    
    analisis['topics'] = topik.isNotEmpty ? topik : ['Umum'];
    
    // Analisis sentimen sederhana
    final kataPositif = ['meningkat', 'tumbuh', 'positif', 'baik', 'sukses', 'berhasil'];
    final kataNegatif = ['menurun', 'turun', 'negatif', 'buruk', 'gagal', 'masalah'];
    
    final jumlahPositif = kataPositif.where((kata) => konten.contains(kata)).length;
    final jumlahNegatif = kataNegatif.where((kata) => konten.contains(kata)).length;
    
    if (jumlahPositif > jumlahNegatif) {
      analisis['sentiment'] = 'Positif';
    } else if (jumlahNegatif > jumlahPositif) {
      analisis['sentiment'] = 'Negatif';
    } else {
      analisis['sentiment'] = 'Netral';
    }
    
    // Penilaian tingkat bacaan
    final kalimat = berita.content.split(RegExp(r'[.!?]')).length;
    final kata = berita.content.split(' ').length;
    final rataRataKataPerKalimat = kalimat > 0 ? kata / kalimat : 0;
    
    if (rataRataKataPerKalimat < 15) {
      analisis['readingLevel'] = 'Sederhana';
    } else if (rataRataKataPerKalimat < 25) {
      analisis['readingLevel'] = 'Moderat';
    } else {
      analisis['readingLevel'] = 'Kompleks';
    }
    
    return analisis;
  }
}
```

### 3. Sistem Pemantauan dan Peringatan Berita

```dart
// Sistem pemantauan berita komprehensif untuk melacak pembaruan statistik
class NewsMonitoringSystem {
  static Future<void> setupNewsMonitoring(
    List<String> domains,
    List<String> kataKunci,
  ) async {
    try {
      print('=== Sistem Pemantauan Berita ===');
      print('Memantau ${domains.length} domain untuk ${kataKunci.length} kata kunci');
      
      final hasilPemantauan = <String, Map<String, dynamic>>{};
      
      for (final domain in domains) {
        print('\n--- Memantau Domain: $domain ---');
        
        final hasilDomain = <String, List<News>>{};
        
        for (final kataKunci in kataKunci) {
          // Dapatkan berita untuk setiap kata kunci
          final beritaKataKunci = await StadataFlutter.instance.list.news(
            domain: domain,
            keyword: kataKunci,
            lang: DataLanguage.id,
          );
          
          if (beritaKataKunci.data.isNotEmpty) {
            hasilDomain[kataKunci] = [];
            
            // Dapatkan konten detail untuk berita terbaru
            for (final ringkasanBerita in beritaKataKunci.data.take(5)) {
              final beritaDetail = await StadataFlutter.instance.view.news(
                id: ringkasanBerita.id,
                domain: domain,
                lang: DataLanguage.id,
              );
              
              if (beritaDetail != null) {
                hasilDomain[kataKunci]!.add(beritaDetail);
              }
              
              await Future.delayed(Duration(milliseconds: 200));
            }
          }
          
          await Future.delayed(Duration(milliseconds: 300));
        }
        
        // Analisis hasil pemantauan untuk domain ini
        final analisisDomain = _analyzeDomainNews(hasilDomain);
        hasilPemantauan[domain] = analisisDomain;
        
        print('Ditemukan berita untuk ${hasilDomain.keys.length} kata kunci');
        print('Total artikel: ${analisisDomain['totalArticles']}');
        print('Artikel terbaru: ${analisisDomain['recentArticles']}');
        
        // Peringatan untuk berita prioritas tinggi
        final peringatan = analisisDomain['alerts'] as List<String>;
        if (peringatan.isNotEmpty) {
          print('🚨 PERINGATAN:');
          for (final alert in peringatan) {
            print('  $alert');
          }
        }
      }
      
      // Buat ringkasan pemantauan
      print('\n=== Ringkasan Pemantauan ===');
      
      final totalArtikel = hasilPemantauan.values
          .map((analisis) => analisis['totalArticles'] as int)
          .reduce((a, b) => a + b);
      
      final totalPeringatan = hasilPemantauan.values
          .map((analisis) => (analisis['alerts'] as List<String>).length)
          .reduce((a, b) => a + b);
      
      print('Total artikel dipantau: $totalArtikel');
      print('Total peringatan dihasilkan: $totalPeringatan');
      
      // Efektivitas kata kunci
      final efektivitasKataKunci = <String, int>{};
      for (final analisisDomain in hasilPemantauan.values) {
        final hasilKataKunci = analisisDomain['keywordResults'] as Map<String, int>;
        for (final entry in hasilKataKunci.entries) {
          efektivitasKataKunci[entry.key] = (efektivitasKataKunci[entry.key] ?? 0) + entry.value;
        }
      }
      
      final kataKunciTerurut = efektivitasKataKunci.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      
      print('\nEfektivitas Kata Kunci:');
      for (final entry in kataKunciTerurut) {
        print('  ${entry.key}: ${entry.value} artikel');
      }
      
      // Rekomendasi
      print('\n=== Rekomendasi Pemantauan ===');
      
      if (totalPeringatan > totalArtikel * 0.3) {
        print('📈 Tingkat peringatan tinggi - pertimbangkan untuk menyaring kriteria peringatan');
      }
      
      final kataKunciEfektif = kataKunciTerurut.where((e) => e.value > 0).length;
      if (kataKunciEfektif < kataKunci.length * 0.7) {
        print('🔍 Efektivitas kata kunci rendah - pertimbangkan untuk memperbarui daftar kata kunci');
      }
      
      if (totalArtikel < domains.length * 10) {
        print('📰 Volume artikel rendah - pertimbangkan untuk memperluas cakupan pemantauan');
      } else {
        print('✅ Cakupan pemantauan yang baik di seluruh domain');
      }
      
    } catch (e) {
      print('Error sistem pemantauan: $e');
    }
  }
  
  static Map<String, dynamic> _analyzeDomainNews(Map<String, List<News>> hasilDomain) {
    final analisis = <String, dynamic>{};
    
    final semuaArtikel = <News>[];
    final hasilKataKunci = <String, int>{};
    
    for (final entry in hasilDomain.entries) {
      hasilKataKunci[entry.key] = entry.value.length;
      semuaArtikel.addAll(entry.value);
    }
    
    analisis['totalArticles'] = semuaArtikel.length;
    analisis['keywordResults'] = hasilKataKunci;
    
    // Periksa artikel terbaru
    final tanggalSekarang = DateTime.now();
    final artikelTerbaru = semuaArtikel.where((artikel) => 
        artikel.releaseDate.isAfter(tanggalSekarang.subtract(Duration(days: 7)))
    ).toList();
    
    analisis['recentArticles'] = artikelTerbaru.length;
    
    // Buat peringatan
    final peringatan = <String>[];
    
    // Peringatan untuk kata kunci frekuensi tinggi
    for (final entry in hasilKataKunci.entries) {
      if (entry.value > 10) {
        peringatan.add('Aktivitas tinggi untuk "${entry.key}": ${entry.value} artikel');
      }
    }
    
    // Peringatan untuk lonjakan terbaru
    if (artikelTerbaru.length > semuaArtikel.length * 0.5) {
      peringatan.add('Aktivitas terbaru tinggi: ${artikelTerbaru.length} artikel dalam 7 hari terakhir');
    }
    
    // Peringatan untuk topik tertentu
    for (final artikel in artikelTerbaru) {
      final konten = artikel.content.toLowerCase();
      if (konten.contains('krisis') || konten.contains('darurat')) {
        peringatan.add('Berita terkait krisis: "${artikel.title}"');
      }
      if (konten.contains('rekor') || konten.contains('tertinggi')) {
        peringatan.add('Berita memecahkan rekor: "${artikel.title}"');
      }
    }
    
    analisis['alerts'] = peringatan;
    
    return analisis;
  }
}
```

### 4. Integrasi dan Ekspor Konten Berita

```dart
// Integrasi konten berita untuk tujuan penelitian dan analisis
class NewsContentIntegrator {
  static Future<void> integrateNewsContent(
    List<int> idBerita,
    String domain,
  ) async {
    try {
      print('=== Integrasi Konten Berita ===');
      print('Mengintegrasikan ${idBerita.length} artikel berita...');
      
      final kontenTerintegrasi = <Map<String, dynamic>>[];
      
      // 1. Ambil semua artikel berita
      for (final idBerita in idBerita) {
        final berita = await StadataFlutter.instance.view.news(
          id: idBerita,
          domain: domain,
          lang: DataLanguage.id,
        );
        
        if (berita != null) {
          final dataBerita = {
            'id': berita.id,
            'title': berita.title,
            'category': berita.category,
            'categoryId': berita.categoryId,
            'content': berita.content,
            'releaseDate': berita.releaseDate.toIso8601String(),
            'picture': berita.picture,
            'wordCount': berita.content.split(' ').length,
            'contentLength': berita.content.length,
            'hasImage': berita.picture.isNotEmpty,
          };
          
          // Analisis konten
          final analisis = NewsContentAnalyzer._analyzeNewsContent(berita);
          dataBerita['topics'] = analisis['topics'];
          dataBerita['sentiment'] = analisis['sentiment'];
          dataBerita['readingLevel'] = analisis['readingLevel'];
          
          kontenTerintegrasi.add(dataBerita);
          print('  ✓ Terintegrasi: ${berita.title}');
          
        } else {
          print('  ✗ Gagal memuat berita: $idBerita');
        }
        
        await Future.delayed(Duration(milliseconds: 300));
      }
      
      // 2. Buat laporan integrasi
      print('\n=== Laporan Integrasi ===');
      print('Berhasil terintegrasi: ${kontenTerintegrasi.length} artikel');
      
      // Statistik konten
      final totalKata = kontenTerintegrasi.fold(0, (sum, artikel) => sum + (artikel['wordCount'] as int));
      final rataRataKata = kontenTerintegrasi.isNotEmpty ? totalKata / kontenTerintegrasi.length : 0;
      
      final denganGambar = kontenTerintegrasi.where((artikel) => artikel['hasImage'] as bool).length;
      
      print('Total jumlah kata: $totalKata');
      print('Rata-rata kata per artikel: ${rataRataKata.round()}');
      print('Artikel dengan gambar: $denganGambar/${kontenTerintegrasi.length}');
      
      // Distribusi topik
      final frekuensiTopik = <String, int>{};
      for (final artikel in kontenTerintegrasi) {
        final topik = artikel['topics'] as List<String>;
        for (final topikItem in topik) {
          frekuensiTopik[topikItem] = (frekuensiTopik[topikItem] ?? 0) + 1;
        }
      }
      
      print('\nDistribusi Topik:');
      final topikTerurut = frekuensiTopik.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      
      for (final entry in topikTerurut) {
        final persentase = (entry.value / kontenTerintegrasi.length * 100).toStringAsFixed(1);
        print('  ${entry.key}: ${entry.value} artikel (${persentase}%)');
      }
      
      // Analisis sentimen
      final distribusiSentimen = <String, int>{};
      for (final artikel in kontenTerintegrasi) {
        final sentimen = artikel['sentiment'] as String;
        distribusiSentimen[sentimen] = (distribusiSentimen[sentimen] ?? 0) + 1;
      }
      
      print('\nDistribusi Sentimen:');
      for (final entry in distribusiSentimen.entries) {
        final persentase = (entry.value / kontenTerintegrasi.length * 100).toStringAsFixed(1);
        print('  ${entry.key}: ${entry.value} artikel (${persentase}%)');
      }
      
      // 3. Ringkasan ekspor
      print('\n=== Ringkasan Ekspor ===');
      print('Integrasi selesai pada: ${DateTime.now().toIso8601String()}');
      print('Domain: $domain');
      print('Total artikel: ${kontenTerintegrasi.length}');
      print('Data siap untuk ekspor ke alat analisis atau database');
      
      // Penilaian kualitas
      final metrikKualitas = {
        'averageContentLength': kontenTerintegrasi.fold(0, (sum, a) => sum + (a['contentLength'] as int)) / kontenTerintegrasi.length,
        'imageRatio': denganGambar / kontenTerintegrasi.length,
        'topicDiversity': frekuensiTopik.keys.length.toDouble(),
        'sentimentBalance': _calculateSentimentBalance(distribusiSentimen),
      };
      
      print('\n=== Metrik Kualitas ===');
      print('Rata-rata Panjang Konten: ${metrikKualitas['averageContentLength']!.round()} karakter');
      print('Rasio Gambar: ${(metrikKualitas['imageRatio']! * 100).toStringAsFixed(1)}%');
      print('Keragaman Topik: ${metrikKualitas['topicDiversity']!.round()} topik');
      print('Keseimbangan Sentimen: ${(metrikKualitas['sentimentBalance']! * 100).toStringAsFixed(1)}%');
      
    } catch (e) {
      print('Error integrasi konten: $e');
    }
  }
  
  static double _calculateSentimentBalance(Map<String, int> distribusiSentimen) {
    final total = distribusiSentimen.values.fold(0, (a, b) => a + b);
    if (total == 0) return 0.0;
    
    final positif = distribusiSentimen['Positif'] ?? 0;
    final negatif = distribusiSentimen['Negatif'] ?? 0;
    final netral = distribusiSentimen['Netral'] ?? 0;
    
    // Skor keseimbangan: lebih tinggi ketika distribusi lebih merata
    final diharapkanSetiap = total / 3;
    final variansi = ((positif - diharapkanSetiap).abs() + 
                     (negatif - diharapkanSetiap).abs() + 
                     (netral - diharapkanSetiap).abs()) / 3;
    
    return 1.0 - (variansi / diharapkanSetiap);
  }
}
```

## Integrasi Alur Kerja Berita

Alur kerja tipikal untuk bekerja dengan konten berita secara efektif:

1. **Fase Penemuan**: Gunakan List API untuk mengidentifikasi artikel berita yang menarik berdasarkan kata kunci, kategori, atau periode waktu
2. **Pengambilan Detail**: Gunakan View API untuk mendapatkan konten berita lengkap dan metadata
3. **Analisis Konten**: Analisis konten berita untuk topik, sentimen, dan relevansi
4. **Perencanaan Integrasi**: Atur konten berita untuk tujuan penelitian, pemantauan, atau publikasi
5. **Penilaian Kualitas**: Evaluasi kelengkapan konten, relevansi, dan potensi keterlibatan

### Integrasi dengan API Lain

```dart
// Membangun alur kerja berita dan data statistik komprehensif
Future<void> buildNewsDataWorkflow(String domain, String topik) async {
  try {
    // 1. Cari artikel berita terkait
    final berita = await StadataFlutter.instance.list.news(
      domain: domain,
      keyword: topik,
    );
    
    // 2. Cari publikasi terkait untuk konteks
    final publikasi = await StadataFlutter.instance.list.publications(
      domain: domain,
      keyword: topik,
    );
    
    // 3. Cari siaran pers terkait
    final siaranPers = await StadataFlutter.instance.list.pressReleases(
      domain: domain,
      keyword: topik,
    );
    
    // 4. Dapatkan informasi detail untuk artikel berita teratas
    final beritaDetail = <News>[];
    for (final itemBerita in berita.data.take(3)) {
      final detail = await StadataFlutter.instance.view.news(
        id: itemBerita.id,
        domain: domain,
      );
      if (detail != null) beritaDetail.add(detail);
    }
    
    print('=== Analisis Berita dan Data Statistik: $topik ===');
    print('Artikel Berita: ${berita.data.length}');
    print('Publikasi Terkait: ${publikasi.data.length}');
    print('Siaran Pers Terkait: ${siaranPers.data.length}');
    print('Analisis berita detail: ${beritaDetail.length} artikel');
    
    // Analisis referensi silang
    for (final itemBerita in beritaDetail) {
      print('\nBerita: ${itemBerita.title}');
      print('Kategori: ${itemBerita.category ?? 'Umum'}');
      print('Tanggal Rilis: ${itemBerita.releaseDate}');
      print('Panjang Konten: ${itemBerita.content.length} karakter');
      
      // Cari publikasi dan siaran pers terkait
      final publikasiTerkait = publikasi.data.where((p) => 
          p.title.toLowerCase().contains(topik.toLowerCase())
      ).take(2);
      
      final siaranPersTerkait = siaranPers.data.where((pr) => 
          pr.title.toLowerCase().contains(topik.toLowerCase())
      ).take(2);
      
      if (publikasiTerkait.isNotEmpty) {
        print('Publikasi Terkait:');
        for (final pub in publikasiTerkait) {
          print('  • ${pub.title}');
        }
      }
      
      if (siaranPersTerkait.isNotEmpty) {
        print('Siaran Pers Terkait:');
        for (final pr in siaranPersTerkait) {
          print('  • ${pr.title}');
        }
      }
    }
    
  } catch (e) {
    print('Error alur kerja data berita: $e');
  }
}
```

## Penanganan Error

API View Berita mengembalikan objek `News` yang nullable dan dapat melempar exception tertentu:

- **NewsException**: Error spesifik berita (ID tidak valid, pembatasan domain, izin akses)
- **ApiException**: Error komunikasi API umum (masalah jaringan, error server, rate limiting)
- **ApiKeyNotFoundException**: Error otentikasi (kunci API tidak valid atau hilang)
- **ValidationException**: Error validasi parameter (ID berita tidak valid, kode domain salah format)

```dart
try {
  final berita = await StadataFlutter.instance.view.news(
    id: 12345,
    domain: '0000',
    lang: DataLanguage.id,
  );
  
  if (berita != null) {
    // Berhasil mengambil artikel berita
    print('Berita: ${berita.title}');
    print('Kategori: ${berita.category ?? 'Umum'}');
    print('Konten: ${berita.content.length} karakter');
    print('Memiliki Gambar: ${berita.picture.isNotEmpty}');
  } else {
    // Artikel berita tidak ditemukan atau tidak dapat diakses
    print('Artikel berita tidak ditemukan - mungkin tidak dipublikasikan atau dibatasi');
  }
  
} on NewsException catch (e) {
  print('Error berita: ${e.message}');
  // Tangani error spesifik berita seperti ID tidak valid atau pembatasan akses
  
} on ApiException catch (e) {
  print('Error komunikasi API: ${e.message}');
  // Tangani masalah konektivitas jaringan atau server
  
} on ApiKeyNotFoundException catch (e) {
  print('Otentikasi diperlukan: ${e.message}');
  // Tangani masalah konfigurasi kunci API
  
} catch (e) {
  print('Error tidak terduga: $e');
  // Tangani error lain yang tidak terduga
}
```

## Pertimbangan Performa

- **Rate Limiting**: Implementasikan penundaan yang sesuai antara permintaan, terutama untuk alur kerja analisis konten
- **Strategi Caching**: Cache konten berita dan hasil analisis untuk artikel yang sering diakses
- **Pemrosesan Konten**: Perhatikan penggunaan memori saat memproses koleksi konten berita yang besar
- **Pemuatan Gambar**: Implementasikan pemuatan progresif untuk gambar berita dan konten multimedia
- **Batch Processing**: Proses artikel berita dalam batch untuk sistem analisis dan pemantauan
- **Analisis Teks**: Pertimbangkan menggunakan perpustakaan pemrosesan teks yang efisien untuk analisis konten lanjutan

## Properti (News)

| Properti      | Tipe       | Deskripsi                                      |
| ------------- | ---------- | ---------------------------------------------- |
| `id`          | `int`      | Identifier numerik unik untuk artikel berita |
| `categoryId`  | `String`   | Identifier untuk klasifikasi kategori berita  |
| `category`    | `String?`  | Nama kategori berita yang dapat dibaca manusia (opsional) |
| `title`       | `String`   | Judul lengkap artikel berita               |
| `content`     | `String`   | Konten penuh artikel berita dengan format teks kaya |
| `releaseDate` | `DateTime` | Timestamp saat artikel berita dipublikasikan    |
| `picture`     | `String`   | URL ke gambar atau konten multimedia terkait |