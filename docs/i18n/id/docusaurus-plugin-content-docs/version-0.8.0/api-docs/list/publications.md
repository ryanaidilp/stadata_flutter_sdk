# Publikasi

API Publikasi menyediakan akses ke publikasi resmi dari BPS (Badan Pusat Statistik) Indonesia. Publikasi-publikasi ini mencakup laporan statistik, hasil penelitian, kompilasi data, dan dokumen analisis yang diproduksi oleh kantor-kantor BPS di seluruh Indonesia. Publikasi merupakan sumber daya penting bagi peneliti, pembuat kebijakan, mahasiswa, dan siapa saja yang mencari informasi statistik yang otoritatif tentang Indonesia.

Publikasi BPS mencakup berbagai topik termasuk demografi, ekonomi, statistik sosial, pertanian, industri, dan pembangunan daerah. Setiap publikasi diproduksi secara profesional dengan metadata yang terstandarisasi termasuk nomor ISSN, nomor katalog, dan abstrak untuk memastikan identifikasi dan sitasi yang mudah.

## Jenis Publikasi dan Cakupan

BPS menerbitkan beberapa kategori dokumen:

- **Laporan Statistik**: Kompilasi data reguler dan analisis tren
- **Publikasi Penelitian**: Studi mendalam dan laporan analitis
- **Publikasi Metodologi**: Dokumentasi teknis dan standar
- **Publikasi Regional**: Kompilasi statistik spesifik wilayah
- **Publikasi Tematik**: Analisis statistik yang berfokus pada subjek tertentu

## Parameter

| Parameter | Tipe           | Deskripsi                                                       |
| --------- | -------------- | --------------------------------------------------------------- |
| `domain`  | `String`       | Kode domain (wilayah) untuk mengambil publikasi **(wajib)**    |
| `lang`    | `DataLanguage` | Bahasa untuk data publikasi (default: `DataLanguage.id`)       |
| `page`    | `int`          | Nomor halaman (default: `1`)                                   |
| `keyword` | `String?`      | Kata kunci untuk mencari publikasi (opsional)                  |
| `month`   | `int?`         | Bulan untuk memfilter publikasi (opsional - `1..12`)           |
| `year`    | `int?`         | Tahun untuk memfilter publikasi (opsional)                     |

## Contoh

### 1. Mendapatkan Semua Publikasi dari Domain

```dart
// Ambil semua publikasi dari BPS Jawa Barat
final publicationResult = await StadataFlutter.instance.list.publications(
  domain: '3200', // Kode domain Jawa Barat
  lang: DataLanguage.id,
);

final publicationList = publicationResult.data;
final pagination = publicationResult.pagination;

// Cetak info paginasi
print('Halaman Saat Ini: ${pagination.page}');
print('Total Halaman: ${pagination.pages}');
print('Jumlah Data di Halaman Ini: ${pagination.count}');
print('Per Halaman: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Cetak data publikasi yang didapatkan
for (final publication in publicationList) {
  print('ID Publikasi: ${publication.id}');
  print('Judul: ${publication.title}');
  print('ISSN: ${publication.issn}');
  print('Tanggal Rilis: ${publication.releaseDate}');
  print('URL Berkas PDF: ${publication.pdf}');
  print('Ukuran: ${publication.size}');
  print('------------------------');
}
```

### 2. Mencari Publikasi dengan Kata Kunci

```dart
// Cari publikasi yang mengandung kata "penduduk" di Jawa Barat
final searchResult = await StadataFlutter.instance.list.publications(
  domain: '3200',
  lang: DataLanguage.id,
  keyword: 'penduduk', // Cari publikasi yang berkaitan dengan kependudukan
);

// Tampilkan hasil pencarian
for (final publication in searchResult.data) {
  print('Ditemukan: ${publication.title}');
  print('Abstrak: ${publication.abstract ?? 'Tidak ada abstrak tersedia'}');
  print('PDF: ${publication.pdf}');
  print('------------------------');
}
```

### 3. Filter Publikasi berdasarkan Tanggal

```dart
// Dapatkan publikasi dari Desember 2023 di Jawa Tengah
final dateFilteredResult = await StadataFlutter.instance.list.publications(
  domain: '3300', // Kode domain Jawa Tengah
  lang: DataLanguage.id,
  month: 12, // Desember
  year: 2023,
);

// Tampilkan publikasi dari bulan/tahun tertentu
for (final publication in dateFilteredResult.data) {
  print('Publikasi: ${publication.title}');
  print('Terjadwal: ${publication.scheduledDate}');
  print('Dirilis: ${publication.releaseDate}');
  print('Diperbarui: ${publication.updateDate}');
  print('------------------------');
}
```

### 4. Penjelajahan Publikasi dengan Paginasi

```dart
// Jelajahi publikasi halaman demi halaman
int currentPage = 1;
bool hasMorePages = true;

while (hasMorePages && currentPage <= 3) { // Batasi hingga 3 halaman pertama
  final pageResult = await StadataFlutter.instance.list.publications(
    domain: '0000', // Publikasi tingkat nasional
    lang: DataLanguage.id,
    page: currentPage,
  );
  
  print('=== Halaman $currentPage ===');
  for (final publication in pageResult.data) {
    print('${publication.title} (${publication.size})');
  }
  
  hasMorePages = currentPage < pageResult.pagination.pages;
  currentPage++;
}
```

## Properti (Publication)

| Properti            | Tipe        | Deskripsi                                                                    |
| ------------------- | ----------- | ---------------------------------------------------------------------------- |
| `id`                | `String`    | Pengidentifikasi unik untuk publikasi                                       |
| `title`             | `String`    | Judul publikasi                                                              |
| `issn`              | `String`    | Nomor Standar Internasional Serial (ISSN)                                   |
| `scheduledDate`     | `DateTime?` | Tanggal terjadwal untuk publikasi (opsional)                                |
| `releaseDate`       | `DateTime?` | Tanggal rilis publikasi (opsional)                                          |
| `updateDate`        | `DateTime?` | Tanggal terakhir publikasi diperbarui (opsional)                            |
| `cover`             | `String`    | URL gambar cover publikasi                                                   |
| `pdf`               | `String`    | URL berkas PDF publikasi                                                     |
| `size`              | `String`    | Ukuran berkas publikasi (mis., "2.5 MB")                                    |
| `abstract`          | `String?`   | Abstrak atau ringkasan opsional dari publikasi dalam format HTML (opsional) |
| `catalogueNumber`   | `String?`   | Nomor katalog opsional yang terkait dengan publikasi (opsional)             |
| `publicationNumber` | `String?`   | Nomor atau kode publikasi opsional (opsional)                               |

## Pola Penggunaan Umum

### Alur Kerja Penemuan Publikasi

Alur kerja tipikal untuk menemukan dan mengakses publikasi BPS:

1. **Jelajahi berdasarkan Domain**: Mulai dengan area geografis tertentu yang diminati
2. **Filter berdasarkan Topik**: Gunakan kata kunci untuk mempersempit ke subjek yang relevan
3. **Filter berdasarkan Tanggal**: Fokus pada publikasi terbaru atau periode waktu tertentu
4. **Akses Konten Lengkap**: Unduh PDF dan tinjau abstrak untuk informasi detail

### Contoh Lengkap

```dart
// Alur kerja penemuan publikasi yang lengkap
class PublicationExplorer {
  static Future<void> explorePublications() async {
    try {
      // 1. Dapatkan publikasi terbaru dari Jawa Timur
      final recentPubs = await StadataFlutter.instance.list.publications(
        domain: '3500', // Jawa Timur
        lang: DataLanguage.id,
        year: 2023,
      );
      
      print('Publikasi Terbaru Jawa Timur (2023): ${recentPubs.data.length}');
      
      // 2. Cari publikasi ekonomi
      final economicPubs = await StadataFlutter.instance.list.publications(
        domain: '3500',
        lang: DataLanguage.id,
        keyword: 'ekonomi',
      );
      
      print('Publikasi Ekonomi: ${economicPubs.data.length}');
      
      // 3. Dapatkan detail publikasi
      if (economicPubs.data.isNotEmpty) {
        final firstPub = economicPubs.data.first;
        print('Publikasi Unggulan:');
        print('Judul: ${firstPub.title}');
        print('ISSN: ${firstPub.issn}');
        print('Ukuran: ${firstPub.size}');
        print('PDF: ${firstPub.pdf}');
        
        // Proses abstrak jika tersedia
        if (firstPub.abstract != null) {
          print('Abstrak tersedia: ${firstPub.abstract!.length} karakter');
        }
      }
      
    } catch (e) {
      print('Error saat menjelajahi publikasi: $e');
    }
  }
}
```

## Bekerja dengan Konten Publikasi

### Memproses URL PDF

```dart
// Unduh dan proses PDF publikasi
Future<void> downloadPublication(String pdfUrl, String fileName) async {
  try {
    // Contoh menggunakan paket http (tambahkan ke dependencies)
    final response = await http.get(Uri.parse(pdfUrl));
    if (response.statusCode == 200) {
      final file = File(fileName);
      await file.writeAsBytes(response.bodyBytes);
      print('Berhasil diunduh: $fileName');
    }
  } catch (e) {
    print('Gagal mengunduh: $e');
  }
}
```

### Memproses Abstrak HTML

```dart
// Proses konten HTML dalam abstrak
String cleanAbstract(String? htmlAbstract) {
  if (htmlAbstract == null) return 'Tidak ada abstrak tersedia';
  
  // Hapus tag HTML untuk tampilan teks biasa
  return htmlAbstract
      .replaceAll(RegExp(r'<[^>]*>'), '')
      .replaceAll('&nbsp;', ' ')
      .replaceAll('&amp;', '&')
      .trim();
}
```

## Contoh Publikasi Berdasarkan Domain

### Publikasi Nasional (Domain: 0000)

- Buku tahunan statistik nasional
- Indikator ekonomi utama Indonesia
- Laporan sensus nasional
- Studi komparatif antar provinsi

### Publikasi Provinsi (Domain: XX00)

- Buku tahunan statistik provinsi
- Analisis ekonomi regional
- Laporan demografi provinsi
- Indikator pembangunan daerah

### Publikasi Kabupaten/Kota (Domain: XXXX)

- Profil statistik daerah
- Laporan pembangunan kota
- Data demografi tingkat kabupaten
- Survei ekonomi lokal

## Penanganan Error

Metode API Publikasi mengembalikan `Future<ListResult<Publication>>` dan dapat melempar pengecualian spesifik:

- `PublicationException`: Error terkait publikasi (domain tidak valid, error pencarian)
- `ApiException`: Error terkait jaringan atau API
- `ApiKeyNotFoundException`: Kunci API tidak valid atau hilang

```dart
try {
  final result = await StadataFlutter.instance.list.publications(
    domain: '3200',
    keyword: 'statistik',
  );
  
  // Proses hasil yang berhasil
  print('Ditemukan ${result.data.length} publikasi');
  
} on PublicationException catch (e) {
  print('Error publikasi: ${e.message}');
  // Tangani error validasi domain atau masalah pencarian
  
} on ApiException catch (e) {
  print('Error API: ${e.message}');
  // Tangani error konektivitas jaringan atau layanan API
  
} catch (e) {
  print('Error tidak terduga: $e');
  // Tangani error tidak terduga lainnya
}
```

## Pertimbangan Performa

- **Paginasi**: Gunakan paginasi untuk set hasil yang besar untuk meningkatkan performa
- **Filter Kata Kunci**: Gunakan kata kunci spesifik untuk mengurangi transfer data
- **Filter Tanggal**: Filter berdasarkan tahun/bulan untuk mendapatkan hasil yang ditargetkan
- **Pemilihan Domain**: Pilih domain spesifik daripada tingkat nasional jika memungkinkan
