# Domain

Metode ini digunakan untuk mendapatkan daftar domain (wilayah) yang tersedia dalam data BPS.

## Parameter

| Parameter      | Tipe         | Deskripsi                                                                                       |
| -------------- | ------------ | ----------------------------------------------------------------------------------------------- |
| `type`         | `DomainType` | Tipe domain yang akan diambil (default: `DomainType.all`).                                      |
| `provinceCode` | `String?`    | Kode provinsi untuk memfilter domain (diperlukan jika `type` = `DomainType.regencyByProvince`). |

## Contoh

Contoh penggunaan dan hasil keluaran:

![Preview](/gif/domains.gif)

```dart
// Mengambil data domain dari API BPS
final domainResult = await StadataFlutter.instance.list.domains(
  type: DomainType.all,
  provinceCode: null, // Ganti dengan kode provinsi yang diinginkan jika diperlukan
);

final daftarDomain = domainResult.data;
final paginasi = domainResult.pagination;

// Menampilkan informasi paginasi
print('Halaman Saat Ini: ${paginasi.page}');
print('Total Halaman: ${paginasi.pages}');
print('Jumlah Data di Halaman Ini: ${paginasi.count}');
print('Per Halaman: ${paginasi.perPage}');
print('Total: ${paginasi.total}');
print('------------------------');

// Menampilkan data domain yang didapat
for (final domain in daftarDomain) {
  print('ID Domain: ${domain.id}'); /// Contoh: 7200
  print('Nama: ${domain.name}'); /// Sulawesi Tengah
  print('URL: ${domain.url}'); /// https://sultengprov.bps.go.id
  print('------------------------');
}
```

## Properti (DomainEntity)

| Properti | Tipe     | Deskripsi                           |
| -------- | -------- | ----------------------------------- |
| `name`   | `String` | Nama domain (wilayah).              |
| `id`     | `String` | Pengidentifikasi unik untuk domain. |
| `url`    | `String` | URL terkait dengan domain.          |
