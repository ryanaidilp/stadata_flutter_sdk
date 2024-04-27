# Kategori Subjek

Metode ini digunakan untuk mengambil daftar kategori subjek berdasarkan domain yang dipilih (wilayah).

## Parameter

| Parameter | Tipe           | Deskripsi                                                       |
| --------- | -------------- | --------------------------------------------------------------- |
| `domain`  | `String`       | Kode domain (wilayah) untuk mengambil kategori subjek.          |
| `lang`    | `DataLanguage` | Bahasa untuk data kategori berita (default: `DataLanguage.id`). |

## Contoh

Contoh penggunaan dan hasil keluaran contoh:

![Preview](/gif/subject_categories.gif)

```dart
// Ambil data kategori berita dari API BPS
final result = await StadataFlutter.instance.list.subjectCategories(domain: '7200');
final subjectCategoryList = result.data;
final pagination = result.pagination;

// Tampilkan info halaman
print('Halaman Saat Ini: ${pagination.page}');
print('Total Halaman: ${pagination.pages}');
print('Jumlah Data pada Halaman Ini: ${pagination.count}');
print('Per Halaman: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Tampilkan data kategori subjek yang diambil
for (final subjectCategory in subjectCategoryList) {
    print('ID Kategori Subjek: ${subjectCategory.id}');
    print('Nama Kategori Subjek: ${subjectCategory.name}');
}
```

## Properti (SubjectCategory)

| Properti | Tipe     | Deskripsi                                    |
| -------- | -------- | -------------------------------------------- |
| `id`     | `int`    | Pengidentifikasi unik untuk kategori subjek. |
| `name`   | `String` | Nama kategori subjek.                        |
