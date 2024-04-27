# Tabel Statis

Metode ini digunakan untuk mengambil informasi rinci tentang tabel statis tertentu.

## Parameter

| Parameter | Tipe           | Deskripsi                                                    |
| --------- | -------------- | ------------------------------------------------------------ |
| `id`      | `int`          | Pengidentifikasi unik dari tabel statis.                     |
| `domain`  | `String`       | Kode domain (wilayah) untuk mendapatkan detail tabel statis. |
| `lang`    | `DataLanguage` | Bahasa untuk data tabel statis (default: `DataLanguage.id`). |

## Contoh

Contoh penggunaan dan hasil keluaran contoh:

![Preview](/gif/static_tables.gif)

```dart
// Mengambil detail tabel statis dari API BPS
final staticTable = await StadataFlutter.instance.view.staticTable(
  id: 'contoh_id_tabel_statis', // Ganti dengan ID tabel statis yang diinginkan
  domain: 'contoh_domain', // Ganti dengan Kode Domain yang diinginkan
  lang: DataLanguage.id,
);

print('ID Tabel: ${staticTable.id}');
print('Judul Tabel: ${staticTable.title}');
print('ID Subjek: ${staticTable.subjectId}');
print('Subjek: ${staticTable.subject}');
print('Ukuran: ${staticTable.size}');
print('Tabel: ${staticTable.table}');
print('Diperbarui Pada: ${staticTable.updatedAt}');
print('Dibuat Pada: ${staticTable.createdAt}');
print('Tautan Excel: ${staticTable.excel}');
```

## Properti (StaticTable)

| Properti    | Tipe        | Deskripsi                                                         |
| ----------- | ----------- | ----------------------------------------------------------------- |
| `id`        | `int`       | Pengidentifikasi unik dari tabel.                                 |
| `title`     | `String`    | Judul atau nama dari tabel.                                       |
| `subjectId` | `int`       | Pengidentifikasi subjek opsional yang terkait dengan tabel.       |
| `subject`   | `String?`   | Nama subjek atau deskripsi opsional.                              |
| `size`      | `String`    | Ukuran file.                                                      |
| `table`     | `String?`   | Representasi HTML dari tabel.                                     |
| `updatedAt` | `DateTime`  | Tanggal dan waktu ketika tabel terakhir diperbarui.               |
| `createdAt` | `DateTime?` | Tanggal dan waktu opsional ketika tabel dibuat.                   |
| `excel`     | `String`    | Tautan atau referensi ke file Excel terkait untuk tabel tersebut. |
