# Tabel Statis

Metode ini digunakan untuk mengambil daftar tabel statis berdasarkan domain (wilayah) yang dipilih.

## Parameter

| Parameter | Tipe           | Deskripsi                                                    |
| --------- | -------------- | ------------------------------------------------------------ |
| `domain`  | `String`       | Kode domain (wilayah) untuk mengambil tabel statis.          |
| `lang`    | `DataLanguage` | Bahasa untuk data tabel statis (default: `DataLanguage.id`). |
| `page`    | `int`          | Nomor halaman (default: `1`).                                |
| `keyword` | `String?`      | Kata kunci untuk mencari tabel statis (opsional).            |
| `bulan`   | `int?`         | Bulan untuk penyaringan tabel statis (opsional - `1..12`).   |
| `tahun`   | `int?`         | Tahun untuk penyaringan tabel statis (opsional).             |

## Contoh

Contoh penggunaan dan keluaran contoh:

![Preview](/gif/static_tables.gif)

```dart
// Mengambil data tabel statis dari API BPS
final hasilTabelStatis = await StadataFlutter.instance.list.staticTable(
  domain: 'kode_domain_contoh', // Ganti dengan kode domain yang diinginkan
  lang: DataLanguage.id,
  page: 1,
  keyword: 'contoh_kata_kunci', // Ganti dengan kata kunci yang diinginkan atau null
  bulan: null, // Ganti dengan bulan yang diinginkan atau null
  tahun: null, // Ganti dengan tahun yang diinginkan atau null
);

final daftarTabelStatis = hasilTabelStatis.data;
final paginasi = hasilTabelStatis.pagination;

// Mencetak informasi paginasi
print('Halaman Saat Ini: ${paginasi.page}');
print('Total Halaman: ${paginasi.pages}');
print('Jumlah Data dalam Halaman Ini: ${paginasi.count}');
print('Per Halaman: ${paginasi.perPage}');
print('Total: ${paginasi.total}');
print('------------------------');

// Mencetak data tabel statis yang diambil
for (final tabelStatis in daftarTabelStatis) {
    print('ID Tabel: ${tabelStatis.id}');
    print('Judul Tabel: ${tabelStatis.title}');
    print('ID Subjek: ${tabelStatis.subjectId}');
    print('Subjek: ${tabelStatis.subject}');
    print('Ukuran: ${tabelStatis.size}');
    print('Tabel: ${tabelStatis.table}');
    print('Diperbarui Pada: ${tabelStatis.updatedAt}');
    print('Dibuat Pada: ${tabelStatis.createdAt}');
    print('Tautan Excel: ${tabelStatis.excel}');
}

```

## Properti (StaticTable)

| Properti    | Tipe        | Deskripsi                                                 |
| ----------- | ----------- | --------------------------------------------------------- |
| `id`        | `int`       | Pengenal unik tabel.                                      |
| `title`     | `String`    | Judul atau nama tabel.                                    |
| `subjectId` | `int`       | Pengenal subjek opsional yang terkait dengan tabel.       |
| `subject`   | `String?`   | Nama atau deskripsi subjek opsional.                      |
| `size`      | `String`    | Ukuran file.                                              |
| `table`     | `String?`   | Representasi HTML dari tabel.                             |
| `updatedAt` | `DateTime`  | Tanggal dan waktu ketika tabel terakhir diperbarui.       |
| `createdAt` | `DateTime?` | Tanggal dan waktu opsional ketika tabel dibuat.           |
| `excel`     | `String`    | Tautan atau referensi ke file Excel terkait dengan tabel. |
