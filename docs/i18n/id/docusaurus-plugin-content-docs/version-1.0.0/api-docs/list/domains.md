# Domain

API Domain menyediakan akses ke wilayah administratif (domain) yang tersedia dalam sistem data BPS (Badan Pusat Statistik) Indonesia. Domain ini merepresentasikan struktur organisasi geografis pengumpulan data statistik Indonesia, mulai dari tingkat nasional hingga tingkat provinsi dan kabupaten/kota.

Memahami domain sangat penting untuk mengakses data BPS, karena sebagian besar endpoint API lainnya memerlukan kode domain untuk menentukan data wilayah geografis mana yang ingin Anda ambil. Setiap domain sesuai dengan kantor BPS regional yang mengumpulkan dan mengelola data statistik untuk wilayah masing-masing.

## Jenis Domain yang Tersedia

Fungsionalitas domain menyediakan beberapa opsi filter untuk mengambil jenis wilayah administratif tertentu:

### Opsi Jenis Domain

| Jenis | Deskripsi | Kasus Penggunaan |
|-------|-----------|------------------|
| `DomainType.all` | Semua domain yang tersedia | Mendapatkan daftar lengkap semua kantor BPS |
| `DomainType.province` | Hanya domain tingkat provinsi | Mengakses data statistik provinsi |
| `DomainType.regency` | Semua domain tingkat kabupaten/kota | Mengakses data statistik pemerintah daerah |
| `DomainType.regencyByProvince` | Kabupaten/kota dalam provinsi tertentu | Memfilter domain lokal berdasarkan provinsi |

## Parameter

| Parameter      | Tipe         | Deskripsi                                                                                       |
| -------------- | ------------ | ----------------------------------------------------------------------------------------------- |
| `type`         | `DomainType` | Jenis domain yang akan diambil (default: `DomainType.all`) |
| `provinceCode` | `String?`    | Kode provinsi untuk memfilter domain **(wajib diisi jika type = `DomainType.regencyByProvince`)** |

## Contoh

### 1. Mendapatkan Semua Domain yang Tersedia

```dart
// Mengambil semua domain dari BPS
final domainResult = await StadataFlutter.instance.list.domains(
  type: DomainType.all,
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

// Menampilkan data domain yang diambil
for (final domain in daftarDomain) {
  print('ID Domain: ${domain.id}'); // Contoh: 0000 (Nasional), 3200 (Jawa Barat)
  print('Nama: ${domain.name}'); // Contoh: Indonesia, Jawa Barat
  print('URL: ${domain.url}'); // Contoh: https://www.bps.go.id, https://jabar.bps.go.id
  print('------------------------');
}
```

### 2. Mendapatkan Hanya Domain Provinsi

```dart
// Mengambil hanya domain tingkat provinsi
final hasilProvinsi = await StadataFlutter.instance.list.domains(
  type: DomainType.province,
);

// Mengakses kantor BPS provinsi
for (final provinsi in hasilProvinsi.data) {
  print('Kode Provinsi: ${provinsi.id}'); // Contoh: 3200, 3300, 7300
  print('Nama Provinsi: ${provinsi.name}'); // Contoh: Jawa Barat, Jawa Tengah, Sulawesi Selatan
  print('URL Kantor BPS: ${provinsi.url}');
  print('------------------------');
}
```

### 3. Mendapatkan Kabupaten/Kota dalam Provinsi Tertentu

```dart
// Mengambil kabupaten/kota di Jawa Barat (kode: 3200)
final hasilKabupaten = await StadataFlutter.instance.list.domains(
  type: DomainType.regencyByProvince,
  provinceCode: '3200', // Kode provinsi Jawa Barat
);

// Mengakses kantor BPS kabupaten/kota
for (final kabupaten in hasilKabupaten.data) {
  print('Kode Kabupaten: ${kabupaten.id}'); // Contoh: 3201, 3202, 3271
  print('Nama Kabupaten: ${kabupaten.name}'); // Contoh: Kab. Bogor, Kab. Sukabumi, Kota Bogor
  print('URL Kantor BPS: ${kabupaten.url}');
  print('------------------------');
}
```

## Properti (DomainEntity)

| Properti | Tipe     | Deskripsi                                        |
| -------- | -------- | ------------------------------------------------ |
| `id`     | `String` | Pengidentifikasi unik untuk domain (kode BPS)   |
| `name`   | `String` | Nama domain (wilayah)                           |
| `url`    | `String` | URL website kantor BPS untuk domain ini         |

## Kode Domain Umum

Berikut adalah beberapa kode domain yang sering digunakan untuk referensi:

### Tingkat Nasional dan Wilayah Khusus
| Kode Domain | Nama | Tingkat |
|-------------|------|---------|
| `0000` | Indonesia | Nasional |

### Provinsi Utama
| Kode Domain | Nama | Ibu Kota |
|-------------|------|----------|
| `1100` | Aceh | Banda Aceh |
| `1200` | Sumatera Utara | Medan |
| `3100` | DKI Jakarta | Jakarta |
| `3200` | Jawa Barat | Bandung |
| `3300` | Jawa Tengah | Semarang |
| `3400` | DI Yogyakarta | Yogyakarta |
| `3500` | Jawa Timur | Surabaya |
| `5100` | Bali | Denpasar |
| `7300` | Sulawesi Selatan | Makassar |

### Kota Besar (Tingkat Kabupaten/Kota)
| Kode Domain | Nama | Provinsi |
|-------------|------|----------|
| `3171` | Kota Jakarta Selatan | DKI Jakarta |
| `3271` | Kota Bogor | Jawa Barat |
| `3372` | Kota Surakarta | Jawa Tengah |
| `3471` | Kota Yogyakarta | DI Yogyakarta |
| `3578` | Kota Surabaya | Jawa Timur |

## Alur Kerja Penggunaan

Alur kerja umum untuk menggunakan domain dengan endpoint API BPS lainnya:

1. **Temukan Domain yang Tersedia**: Gunakan `domains()` untuk melihat wilayah geografis apa yang tersedia
2. **Pilih Wilayah Target**: Pilih kode domain yang sesuai berdasarkan kebutuhan data Anda
3. **Gunakan Kode Domain**: Berikan kode domain ke endpoint API lain (publikasi, berita, tabel statis, dll.)

### Contoh Lengkap

```dart
// 1. Dapatkan semua domain yang tersedia
final semuaDomain = await StadataFlutter.instance.list.domains();
print('Total Domain yang Tersedia: ${semuaDomain.data.length}');

// 2. Filter untuk provinsi tertentu (Jawa Barat)
final kabupatenJabar = await StadataFlutter.instance.list.domains(
  type: DomainType.regencyByProvince,
  provinceCode: '3200',
);
print('Kabupaten/Kota di Jawa Barat: ${kabupatenJabar.data.length}');

// 3. Gunakan kode domain dengan API lain
final publikasi = await StadataFlutter.instance.list.publications(
  domain: '3200', // Gunakan kode domain Jawa Barat
  lang: DataLanguage.id,
);
print('Publikasi dari BPS Jawa Barat: ${publikasi.data.length}');
```

## Konteks Struktur Administratif

Struktur administratif Indonesia terdiri dari:

1. **Tingkat Nasional** (`0000`): BPS Pusat Indonesia
2. **Tingkat Provinsi** (`XX00`): 34 provinsi, masing-masing dengan kantor BPS provinsi
3. **Tingkat Kabupaten/Kota** (`XXXX`): 514+ kabupaten dan kota, masing-masing dengan kantor BPS lokal

Setiap tingkat mengumpulkan dan mengelola data statistik yang relevan dengan ruang lingkup administratif mereka. Memahami hierarki ini membantu dalam memilih domain yang tepat untuk kebutuhan data Anda.

## Penanganan Error

Semua metode domain mengembalikan `Future<ListResult<Domain>>` dan mungkin melempar exception spesifik:

- `DomainException`: Error terkait domain (kode provinsi tidak valid, dll.)
- `ApiException`: Error terkait jaringan atau API
- `ApiKeyNotFoundException`: Kunci API tidak valid atau hilang

```dart
try {
  final result = await StadataFlutter.instance.list.domains(
    type: DomainType.regencyByProvince,
    provinceCode: '3200',
  );
  // Tangani keberhasilan
  print('Ditemukan ${result.data.length} kabupaten/kota di provinsi tersebut');
} on DomainException catch (e) {
  print('Error domain: ${e.message}');
  // Tangani kode provinsi tidak valid atau error spesifik domain
} on ApiException catch (e) {
  print('Error API: ${e.message}');
  // Tangani error terkait jaringan atau API
} catch (e) {
  print('Error tak terduga: $e');
}
```
