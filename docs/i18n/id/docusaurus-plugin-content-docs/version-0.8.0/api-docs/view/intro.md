---
sidebar_position: 1
---

# Pengantar

API Tampilan menyediakan metode untuk mengambil informasi terperinci tentang item spesifik dari API BPS. Berbeda dengan API List yang mengembalikan koleksi data, API Tampilan berfokus pada mendapatkan detail komprehensif tentang item individual.

## Penggunaan

Untuk menggunakan API Tampilan, Anda dapat mengaksesnya menggunakan kode berikut:

```dart
final view = StadataFlutter.instance.view;
```

## Metode Tampilan yang Tersedia

API Tampilan saat ini mendukung pengambilan informasi detail untuk jenis data berikut:

### Data Konten
- **[Publikasi](./publication)**: Dapatkan informasi publikasi detail berdasarkan ID dan domain
- **[Tabel Statis](./static-table)**: Ambil detail tabel statis yang komprehensif
- **[Berita](./news)**: Akses informasi artikel berita yang detail
- **[Siaran Pers](./press-release)**: Dapatkan detail siaran pers yang lengkap

### Data Klasifikasi
- **[Klasifikasi Statistik](./statistic-classification)**: Ambil informasi klasifikasi KBLI/KBKI yang detail dengan data hierarkis

## Pola Penggunaan

Semua metode API Tampilan mengikuti pola yang konsisten:

```dart
// Pola umum untuk panggilan API Tampilan
final result = await StadataFlutter.instance.view.namaMetode(
  id: idItem,           // Wajib: ID dari item spesifik
  domain: kodeDomain,   // Wajib: Kode domain untuk data
  lang: DataLanguage.id, // Opsional: Preferensi bahasa
);
```

## Penanganan Error

Metode API Tampilan mengembalikan objek nullable dan mungkin melempar exception spesifik:

```dart
try {
  final publication = await StadataFlutter.instance.view.publication(
    id: '123',
    domain: '7200',
    lang: DataLanguage.id,
  );
  
  if (publication != null) {
    // Tangani pengambilan data yang berhasil
    print('Publikasi: ${publication.title}');
  } else {
    // Tangani kasus dimana item tidak ditemukan
    print('Publikasi tidak ditemukan');
  }
} on PublicationException catch (e) {
  print('Error publikasi: ${e.message}');
} on ApiException catch (e) {
  print('Error API: ${e.message}');
} catch (e) {
  print('Error tak terduga: $e');
}
```

## Hubungan dengan API List

API Tampilan bekerja paling baik dikombinasikan dengan API List:

1. **Penemuan**: Gunakan API List untuk menemukan item yang menarik
2. **Detail**: Gunakan API Tampilan untuk mendapatkan informasi komprehensif tentang item spesifik

```dart
// Contoh alur kerja
// 1. Temukan publikasi menggunakan API List
final publicationsList = await StadataFlutter.instance.list.publications(
  domain: '7200',
);

// 2. Dapatkan detail untuk publikasi spesifik menggunakan API Tampilan
final firstPublication = publicationsList.data.first;
final detailedPublication = await StadataFlutter.instance.view.publication(
  id: firstPublication.id,
  domain: '7200',
);
```
