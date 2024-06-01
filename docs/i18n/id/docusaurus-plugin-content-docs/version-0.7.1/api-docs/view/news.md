# Berita

Metode ini digunakan untuk mengambil informasi terperinci tentang berita tertentu.

## Parameter

| Parameter | Tipe           | Deskripsi                                              |
| --------- | -------------- | ------------------------------------------------------ |
| `id`      | `int`          | Identifier unik untuk berita.                          |
| `domain`  | `String`       | Kode domain (wilayah) untuk mengambil detail berita.   |
| `lang`    | `DataLanguage` | Bahasa untuk data berita (default: `DataLanguage.id`). |

## Contoh

Contoh penggunaan dan hasil contoh:

![Preview](/gif/news.gif)

```dart
// Mengambil detail berita dari API BPS
final berita = await StadataFlutter.instance.view.news(id: 12, domain: '7200');

// Mencetak data kategori berita yang diambil
print('ID Berita: ${berita.id}');
print('Kategori: ${berita.category}');
print('Judul: ${berita.title}');
print('Konten: ${berita.content}');
print('Tanggal Rilis: ${berita.releaseDate}');
print('Gambar: ${berita.picture}');
print('------------------------');
```

## Properti (News)

| Properti      | Tipe       | Deskripsi                                    |
| ------------- | ---------- | -------------------------------------------- |
| `id`          | `int`      | Identifier unik untuk berita.                |
| `categoryId`  | `String`   | Identifier kategori untuk berita (opsional). |
| `category`    | `String?`  | Nama kategori berita (opsional).             |
| `title`       | `String`   | Judul berita.                                |
| `content`     | `String`   | Isi berita.                                  |
| `releaseDate` | `DateTime` | Tanggal rilis berita.                        |
| `picture`     | `String`   | Gambar yang terkait dengan berita.           |
