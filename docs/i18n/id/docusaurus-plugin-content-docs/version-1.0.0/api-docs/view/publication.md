# Publikasi

API View Publication menyediakan akses komprehensif ke informasi rinci tentang publikasi statistik spesifik dari BPS (Badan Pusat Statistik) Indonesia. Metode ini memungkinkan aplikasi untuk mengambil metadata publikasi lengkap, abstrak, dokumen PDF, gambar sampul, dan informasi bibliografi untuk tujuan analisis mendalam, penelitian, dan referensi.

Publikasi dari BPS berfungsi sebagai sumber otoritatif informasi statistik, menyediakan analisis data rinci, penjelasan metodologis, dan temuan statistik komprehensif di berbagai domain statistik Indonesia. API View Publication memastikan akses ke ekosistem publikasi lengkap, memungkinkan pengguna untuk memperoleh konteks penuh dan materi pendukung untuk setiap publikasi statistik.

## Memahami Sistem Publikasi

Publikasi BPS merupakan landasan dokumentasi statistik Indonesia:

- **Sumber Otoritatif**: Laporan statistik dan analisis resmi dari kantor statistik nasional
- **Cakupan Komprehensif**: Publikasi yang mencakup statistik ekonomi, sosial, demografi, dan regional
- **Akses Multi-format**: Akses lengkap ke dokumen PDF, abstrak, gambar sampul, dan metadata
- **Informasi Bibliografi**: Detail kutipan lengkap termasuk ISSN, nomor katalog, dan jadwal publikasi
- **Pelacakan Versi**: Akses ke seri publikasi dan riwayat versi untuk analisis longitudinal

## Kategori Publikasi

### Laporan dan Analisis Statistik
- **Publikasi Ekonomi**: Laporan PDB, analisis inflasi, statistik perdagangan, dan indikator ekonomi
- **Publikasi Sosial**: Analisis penduduk, statistik pendidikan, indikator kesehatan, dan laporan kesejahteraan
- **Publikasi Demografi**: Hasil sensus, proyeksi penduduk, dan analisis tren demografi
- **Publikasi Regional**: Statistik provinsi dan lokal, laporan pembangunan daerah

### Publikasi Metodologi
- **Metodologi Survei**: Dokumentasi metode survei, teknik sampling, dan prosedur pengumpulan data
- **Standar dan Klasifikasi**: Sistem klasifikasi statistik, skema pengkodean, dan panduan standarisasi
- **Laporan Kualitas**: Penilaian kualitas data, prosedur validasi, dan analisis reliabilitas

### Publikasi Referensi
- **Buku Tahunan Statistik**: Kompendium tahunan informasi statistik di berbagai domain
- **Buku Saku**: Ringkasan statistik singkat dan koleksi indikator kunci
- **Katalog dan Direktori**: Daftar komprehensif produk dan layanan statistik

## Parameter

| Parameter | Tipe           | Deskripsi                                                        |
| --------- | -------------- | ---------------------------------------------------------------- |
| `id`      | `String`       | **Wajib**: Pengenal unik dari publikasi spesifik                |
| `domain`  | `String`       | **Wajib**: Kode domain (wilayah) yang menentukan konteks administratif |
| `lang`    | `DataLanguage` | **Opsional**: Preferensi bahasa untuk konten yang dilokalkan (default: `DataLanguage.id`) |

## Contoh

### 1. Pengambilan Publikasi Dasar

![Preview](/gif/publications.gif)

```dart
// Mengambil informasi rinci untuk publikasi spesifik
final publikasi = await StadataFlutter.instance.view.publication(
  id: '03220.2301', // Contoh: ID publikasi Statistik Ekonomi
  domain: '0000', // Tingkat nasional
  lang: DataLanguage.id,
);

if (publikasi != null) {
  print('=== Detail Publikasi ===');
  print('Judul: ${publikasi.title}');
  print('ISSN: ${publikasi.issn}');
  print('Nomor Katalog: ${publikasi.catalogueNumber ?? 'Tidak ada'}');
  print('Nomor Publikasi: ${publikasi.publicationNumber ?? 'Tidak ada'}');
  
  // Timeline publikasi
  print('\n=== Timeline Publikasi ===');
  print('Tanggal Terjadwal: ${publikasi.scheduledDate ?? 'Tidak terjadwal'}');
  print('Tanggal Rilis: ${publikasi.releaseDate ?? 'Belum dirilis'}');
  print('Pembaruan Terakhir: ${publikasi.updateDate ?? 'Tidak ada pembaruan'}');
  
  // Konten dan sumber daya
  print('\n=== Konten dan Sumber Daya ===');
  print('Ukuran Berkas: ${publikasi.size}');
  print('PDF Tersedia: ${publikasi.pdf.isNotEmpty ? 'Ya' : 'Tidak'}');
  print('Gambar Sampul: ${publikasi.cover.isNotEmpty ? 'Ya' : 'Tidak'}');
  
  if (publikasi.abstract != null && publikasi.abstract!.isNotEmpty) {
    // Tampilkan 200 karakter pertama dari abstrak
    final previewAbstrak = publikasi.abstract!.length > 200 
        ? '${publikasi.abstract!.substring(0, 200)}...'
        : publikasi.abstract!;
    print('Abstrak: $previewAbstrak');
  } else {
    print('Abstrak: Tidak tersedia');
  }
  
  // URL akses langsung
  print('\n=== URL Akses ===');
  if (publikasi.pdf.isNotEmpty) {
    print('URL PDF: ${publikasi.pdf}');
  }
  if (publikasi.cover.isNotEmpty) {
    print('URL Sampul: ${publikasi.cover}');
  }
} else {
  print('Publikasi tidak ditemukan atau tidak tersedia');
}
```

### 2. Alur Kerja Penelitian Publikasi

```dart
// Alur kerja penelitian publikasi komprehensif
class PublicationResearcher {
  static Future<void> telitiTopikPublikasi(
    String domain, 
    String kataKunci,
  ) async {
    try {
      // 1. Temukan publikasi menggunakan List API
      final daftarPublikasi = await StadataFlutter.instance.list.publications(
        domain: domain,
        keyword: kataKunci,
        lang: DataLanguage.id,
      );
      
      print('=== Penelitian Publikasi: "$kataKunci" ===');
      print('Ditemukan ${daftarPublikasi.data.length} publikasi');
      
      if (daftarPublikasi.data.isEmpty) {
        print('Tidak ada publikasi ditemukan untuk kata kunci: $kataKunci');
        return;
      }
      
      // 2. Analisis setiap publikasi secara rinci
      final analisisRinci = <Map<String, dynamic>>[];
      
      for (final ringkasanPub in daftarPublikasi.data.take(5)) {
        print('\n--- Menganalisis: ${ringkasanPub.title} ---');
        
        final pubRinci = await StadataFlutter.instance.view.publication(
          id: ringkasanPub.id,
          domain: domain,
          lang: DataLanguage.id,
        );
        
        if (pubRinci != null) {
          final analisis = {
            'id': pubRinci.id,
            'title': pubRinci.title,
            'hasAbstract': pubRinci.abstract != null && pubRinci.abstract!.isNotEmpty,
            'hasPdf': pubRinci.pdf.isNotEmpty,
            'hasCover': pubRinci.cover.isNotEmpty,
            'fileSize': pubRinci.size,
            'issn': pubRinci.issn,
            'releaseDate': pubRinci.releaseDate,
            'catalogueNumber': pubRinci.catalogueNumber,
          };
          
          analisisRinci.add(analisis);
          
          // Tampilkan temuan kunci
          print('ISSN: ${pubRinci.issn}');
          print('Tanggal Rilis: ${pubRinci.releaseDate ?? 'Tidak ditentukan'}');
          print('Ukuran Berkas: ${pubRinci.size}');
          print('Abstrak Tersedia: ${analisis['hasAbstract'] ? 'Ya' : 'Tidak'}');
          print('Sumber Daya: PDF(${analisis['hasPdf'] ? '✓' : '✗'}) Sampul(${analisis['hasCover'] ? '✓' : '✗'})');
          
          if (pubRinci.abstract != null && pubRinci.abstract!.isNotEmpty) {
            // Analisis abstrak untuk kata kunci tambahan
            final abstrakLower = pubRinci.abstract!.toLowerCase();
            final topikTerkait = <String>[];
            
            // Cek istilah ekonomi terkait
            if (abstrakLower.contains('ekonomi') || abstrakLower.contains('gdp')) {
              topikTerkait.add('Analisis Ekonomi');
            }
            if (abstrakLower.contains('penduduk') || abstrakLower.contains('demografi')) {
              topikTerkait.add('Demografi');
            }
            if (abstrakLower.contains('inflasi') || abstrakLower.contains('harga')) {
              topikTerkait.add('Analisis Harga');
            }
            if (abstrakLower.contains('perdagangan') || abstrakLower.contains('ekspor')) {
              topikTerkait.add('Statistik Perdagangan');
            }
            
            if (topikTerkait.isNotEmpty) {
              print('Topik Terkait: ${topikTerkait.join(', ')}');
            }
          }
        } else {
          print('Gagal mengambil informasi rinci');
        }
        
        // Pembatasan rate
        await Future.delayed(Duration(milliseconds: 300));
      }
      
      // 3. Ringkasan penelitian
      print('\n=== Ringkasan Penelitian ===');
      print('Total Publikasi Dianalisis: ${analisisRinci.length}');
      print('Dengan Abstrak: ${analisisRinci.where((p) => p['hasAbstract']).length}');
      print('Dengan Akses PDF: ${analisisRinci.where((p) => p['hasPdf']).length}');
      print('Dengan Gambar Sampul: ${analisisRinci.where((p) => p['hasCover']).length}');
      
      // Publikasi terbaru
      final pubTerbaru = analisisRinci.where((p) => 
          p['releaseDate'] != null && 
          (p['releaseDate'] as DateTime).isAfter(DateTime.now().subtract(Duration(days: 365)))
      ).length;
      
      print('Publikasi Terbaru (tahun lalu): $pubTerbaru');
      
      // Penilaian kualitas
      final skorKelengkapan = analisisRinci.isNotEmpty
          ? analisisRinci.map((p) => [
              p['hasAbstract'] ? 1 : 0,
              p['hasPdf'] ? 1 : 0,
              p['hasCover'] ? 1 : 0,
              p['catalogueNumber'] != null ? 1 : 0,
            ].reduce((a, b) => a + b)).reduce((a, b) => a + b) / (analisisRinci.length * 4)
          : 0.0;
      
      print('Skor Kelengkapan Rata-rata: ${(skorKelengkapan * 100).toStringAsFixed(1)}%');
      
    } catch (e) {
      print('Kesalahan penelitian: $e');
    }
  }
}
```

### 3. Manajemen Kutipan dan Referensi Publikasi

```dart
// Manajemen kutipan publikasi dan referensi akademis
class PublicationCitationManager {
  static Future<void> generateInformasiKutipan(
    String idPublikasi, 
    String domain,
  ) async {
    try {
      final publikasi = await StadataFlutter.instance.view.publication(
        id: idPublikasi,
        domain: domain,
        lang: DataLanguage.id,
      );
      
      if (publikasi == null) {
        print('Publikasi tidak ditemukan untuk pembuatan kutipan');
        return;
      }
      
      print('=== Informasi Kutipan Publikasi ===');
      print('Judul: ${publikasi.title}');
      
      // Buat berbagai format kutipan
      print('\n=== Format Kutipan ===');
      
      // Gaya APA
      final apaPengarang = 'Badan Pusat Statistik';
      final apaTahun = publikasi.releaseDate?.year ?? DateTime.now().year;
      final apaJudul = publikasi.title;
      final apaPenerbit = 'BPS-Statistics Indonesia';
      final apaLokasi = 'Jakarta';
      
      print('Gaya APA:');
      print('$apaPengarang ($apaTahun). $apaJudul. $apaPenerbit: $apaLokasi.');
      if (publikasi.pdf.isNotEmpty) {
        print('Diambil dari ${publikasi.pdf}');
      }
      
      // Gaya Chicago
      print('\nGaya Chicago:');
      print('Badan Pusat Statistik. "$apaJudul." BPS-Statistics Indonesia. $apaLokasi: BPS, $apaTahun.');
      
      // Gaya MLA
      print('\nGaya MLA:');
      print('Badan Pusat Statistik. $apaJudul. BPS-Statistics Indonesia, $apaTahun.');
      
      // Detail Bibliografi
      print('\n=== Detail Bibliografi ===');
      print('ISSN: ${publikasi.issn}');
      if (publikasi.catalogueNumber != null) {
        print('Nomor Katalog: ${publikasi.catalogueNumber}');
      }
      if (publikasi.publicationNumber != null) {
        print('Nomor Publikasi: ${publikasi.publicationNumber}');
      }
      
      // Tanggal Publikasi
      print('\n=== Timeline Publikasi ===');
      if (publikasi.scheduledDate != null) {
        print('Tanggal Terjadwal: ${_formatTanggal(publikasi.scheduledDate!)}');
      }
      if (publikasi.releaseDate != null) {
        print('Tanggal Rilis: ${_formatTanggal(publikasi.releaseDate!)}');
      }
      if (publikasi.updateDate != null) {
        print('Terakhir Diperbarui: ${_formatTanggal(publikasi.updateDate!)}');
      }
      
      // Informasi Akses
      print('\n=== Informasi Akses ===');
      print('Ukuran Berkas: ${publikasi.size}');
      if (publikasi.pdf.isNotEmpty) {
        print('Akses PDF: Tersedia');
        print('URL PDF: ${publikasi.pdf}');
      }
      if (publikasi.cover.isNotEmpty) {
        print('Gambar Sampul: Tersedia');
        print('URL Sampul: ${publikasi.cover}');
      }
      
      // Abstrak untuk keperluan penelitian
      if (publikasi.abstract != null && publikasi.abstract!.isNotEmpty) {
        print('\n=== Abstrak ===');
        print(publikasi.abstract!);
      }
      
    } catch (e) {
      print('Kesalahan pembuatan kutipan: $e');
    }
  }
  
  static String _formatTanggal(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
```

## Integrasi Alur Kerja Publikasi

Alur kerja tipikal untuk bekerja dengan publikasi secara efektif:

1. **Fase Penemuan**: Gunakan List API untuk mengidentifikasi publikasi yang menarik
2. **Analisis Rinci**: Gunakan View API untuk mengambil informasi publikasi komprehensif
3. **Penilaian Konten**: Evaluasi abstrak, ukuran berkas, dan sumber daya yang tersedia
4. **Pembuatan Kutipan**: Ekstrak informasi bibliografi untuk referensi akademis
5. **Manajemen Koleksi**: Organisasi dan analisis metadata publikasi untuk tujuan penelitian

### Integrasi dengan API Lain

```dart
// Membangun alur kerja penelitian statistik komprehensif
Future<void> bangunAlurKerjapenelitianStatistik(String domain, String topik) async {
  try {
    // 1. Temukan publikasi terkait
    final publikasi = await StadataFlutter.instance.list.publications(
      domain: domain,
      keyword: topik,
    );
    
    // 2. Temukan berita terkait untuk konteks
    final berita = await StadataFlutter.instance.list.news(
      domain: domain,
      keyword: topik,
    );
    
    // 3. Dapatkan informasi rinci untuk publikasi teratas
    final pubRinci = <Publication>[];
    for (final pub in publikasi.data.take(3)) {
      final rinci = await StadataFlutter.instance.view.publication(
        id: pub.id,
        domain: domain,
      );
      if (rinci != null) pubRinci.add(rinci);
    }
    
    print('=== Penelitian Statistik: $topik ===');
    print('Publikasi ditemukan: ${publikasi.data.length}');
    print('Berita terkait: ${berita.data.length}');
    print('Analisis rinci: ${pubRinci.length} publikasi');
    
    // Analisis menggabungkan detail publikasi dan konteks berita
    for (final pub in pubRinci) {
      print('\nPublikasi: ${pub.title}');
      print('Rilis: ${pub.releaseDate ?? 'Tanggal tidak ditentukan'}');
      if (pub.abstract != null) {
        print('Abstrak tersedia: ${pub.abstract!.length} karakter');
      }
      
      // Temukan liputan berita terkait
      final beritaTerkait = berita.data.where((n) => 
          n.title.toLowerCase().contains(topik.toLowerCase()) ||
          n.content.toLowerCase().contains(topik.toLowerCase())
      ).take(2);
      
      if (beritaTerkait.isNotEmpty) {
        print('Liputan berita terkait:');
        for (final itemBerita in beritaTerkait) {
          print('  • ${itemBerita.title} (${itemBerita.releaseDate})');
        }
      }
    }
    
  } catch (e) {
    print('Kesalahan alur kerja penelitian: $e');
  }
}
```

## Penanganan Kesalahan

API View Publication mengembalikan objek `Publication` nullable dan dapat melempar exception spesifik:

- **PublicationException**: Kesalahan khusus publikasi (ID tidak valid, batasan domain, izin akses)
- **ApiException**: Kesalahan komunikasi API umum (masalah jaringan, kesalahan server, pembatasan rate)
- **ApiKeyNotFoundException**: Kesalahan autentikasi (API key tidak valid atau hilang)
- **ValidationException**: Kesalahan validasi parameter (ID yang salah format, kode domain tidak valid)

```dart
try {
  final publikasi = await StadataFlutter.instance.view.publication(
    id: '03220.2301',
    domain: '0000',
    lang: DataLanguage.id,
  );
  
  if (publikasi != null) {
    // Berhasil mengambil publikasi
    print('Publikasi: ${publikasi.title}');
    print('ISSN: ${publikasi.issn}');
    print('PDF Tersedia: ${publikasi.pdf.isNotEmpty}');
  } else {
    // Publikasi tidak ditemukan atau tidak dapat diakses
    print('Publikasi tidak ditemukan - mungkin belum dipublikasikan atau dibatasi');
  }
  
} on PublicationException catch (e) {
  print('Kesalahan publikasi: ${e.message}');
  // Tangani kesalahan spesifik publikasi seperti ID tidak valid atau batasan akses
  
} on ApiException catch (e) {
  print('Kesalahan komunikasi API: ${e.message}');
  // Tangani konektivitas jaringan atau masalah server
  
} on ApiKeyNotFoundException catch (e) {
  print('Autentikasi diperlukan: ${e.message}');
  // Tangani masalah konfigurasi API key
  
} catch (e) {
  print('Kesalahan tak terduga: $e');
  // Tangani kesalahan lain yang tidak terduga
}
```

## Pertimbangan Performa

- **Pembatasan Rate**: Implementasikan delay yang tepat antara permintaan untuk menghindari membebani API
- **Strategi Caching**: Cache metadata publikasi untuk publikasi yang sering diakses
- **Pemrosesan Batch**: Proses beberapa publikasi dalam batch dengan pembatasan rate
- **Manajemen Sumber Daya**: Pertimbangkan ukuran berkas PDF saat mengimplementasikan fungsi download
- **Pemulihan Kesalahan**: Implementasikan penanganan kesalahan yang robust untuk masalah jaringan dan ketidaktersediaan layanan
- **Manajemen Memori**: Perhatikan penggunaan memori saat memproses koleksi publikasi besar

## Properti (Publication)

| Properti            | Tipe        | Deskripsi                                                                    |
| ------------------- | ----------- | ---------------------------------------------------------------------------- |
| `id`                | `String`    | Pengenal unik untuk publikasi                                                |
| `title`             | `String`    | Judul lengkap publikasi                                                      |
| `issn`              | `String`    | Nomor Serial Standar Internasional untuk identifikasi seri publikasi        |
| `scheduledDate`     | `DateTime?` | Tanggal publikasi yang dijadwalkan awalnya (opsional)                       |
| `releaseDate`       | `DateTime?` | Tanggal rilis aktual ketika publikasi tersedia (opsional)                   |
| `updateDate`        | `DateTime?` | Tanggal ketika publikasi terakhir diperbarui atau direvisi (opsional)       |
| `cover`             | `String`    | URL ke gambar sampul atau representasi thumbnail publikasi                  |
| `pdf`               | `String`    | URL langsung ke berkas PDF untuk download dan akses                         |
| `size`              | `String`    | Informasi ukuran berkas dalam format yang dapat dibaca manusia (mis., "2.5 MB", "1.2 GB") |
| `abstract`          | `String?`   | Ringkasan komprehensif atau abstrak konten publikasi dalam format HTML (opsional) |
| `catalogueNumber`   | `String?`   | Nomor katalog internal BPS untuk keperluan perpustakaan dan arsip (opsional) |
| `publicationNumber` | `String?`   | Nomor publikasi resmi atau pengenal seri (opsional)                         |