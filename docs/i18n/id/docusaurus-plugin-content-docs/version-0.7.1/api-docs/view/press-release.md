# Siaran Pers

Metode ini digunakan untuk mengambil informasi detail tentang siaran pers tertentu.

## Parameter

| Parameter | Tipe           | Deskripsi                                                   |
| --------- | -------------- | ----------------------------------------------------------- |
| `id`      | `int`          | Pengenal unik dari siaran pers tersebut.                    |
| `domain`  | `String`       | Kode domain (wilayah) untuk mengambil detail siaran pers.   |
| `lang`    | `DataLanguage` | Bahasa untuk data siaran pers (default: `DataLanguage.id`). |

## Contoh

Contoh penggunaan dan hasil contoh:

![Preview](/gif/press_releases.gif)

```dart
// Ambil detail rilis pers dari API BPS
final siaranPers = await StadataFlutter.instance.view.siaranPers(id: 1234, domain: '7200');

// Tampilkan data siaran pers yang diambil
print('ID Siaran Pers: ${siaranPers.id}');
print('Judul: ${siaranPers.title}');
print('Abstrak: ${siaranPers.abstract}');
print('Tanggal Rilis: ${siaranPers.releaseDate}');
print('Cover: ${siaranPers.cover}');
print('Ukuran File: ${siaranPers.size}');
print('URL PDF: ${siaranPers.pdf}');
print('URL Slide: ${siaranPers.slide}');
print('Diperbarui Pada: ${siaranPers.updatedAt}');
```

## Properti (PressRelease)

| Properti      | Tipe        | Deskripsi                                                               |
| ------------- | ----------- | ----------------------------------------------------------------------- |
| `id`          | `int`       | Pengenal unik dari siaran pers tersebut.                                |
| `title`       | `String`    | Judul dari siaran pers tersebut.                                        |
| `subject`     | `Subject?`  | Subjek opsional dari siaran pers tersebut.                              |
| `size`        | `String`    | Ukuran file.                                                            |
| `pdf`         | `String`    | Tautan atau referensi ke file PDF terkait untuk siaran pers tersebut.   |
| `cover`       | `String`    | Gambar miniatur dari siaran pers tersebut.                              |
| `abstract`    | `String?`   | Abstrak dari siaran pers tersebut.                                      |
| `updatedAt`   | `DateTime`  | Tanggal dan waktu ketika tabel terakhir diperbarui.                     |
| `releaseDate` | `DateTime?` | Tanggal dan waktu opsional ketika tabel tersebut dibuat.                |
| `slide`       | `String`    | Tautan atau referensi ke file Slide terkait untuk siaran pers tersebut. |
