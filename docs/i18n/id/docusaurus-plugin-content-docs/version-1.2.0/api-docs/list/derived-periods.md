---
sidebar_position: 19
---

# Periode Turunan

API Periode Turunan menyediakan akses ke data periode waktu yang diagregasi atau ditransformasi dari BPS (Badan Pusat Statistik) Indonesia. Periode turunan merepresentasikan agregasi temporal yang dikelompokkan seperti pengelompokan tahunan, agregasi kuartalan, atau kombinasi rentang waktu kustom yang diturunkan dari data periode dasar.

## Memahami Periode Turunan

Periode turunan berbeda dari periode biasa dalam beberapa hal penting:

- **Kerangka Waktu Agregat**: Merepresentasikan periode waktu yang dikelompokkan atau digabungkan
- **Pengelompokan Kustom**: Dapat mencakup rata-rata multi-tahun, agregasi kuartalan, atau rentang kustom
- **Kalkulasi Turunan**: Sering digunakan untuk menyajikan tren statistik yang dihaluskan atau diagregasi
- **Pelengkap Periode**: Bekerja bersama periode biasa untuk analisis temporal komprehensif

## Parameter

| Parameter    | Tipe           | Deskripsi                                                         |
| ------------ | -------------- | ----------------------------------------------------------------- |
| `domain`     | `String`       | Kode domain (wilayah) untuk mengambil periode turunan **(wajib)** |
| `lang`       | `DataLanguage` | Bahasa untuk representasi data (default: `DataLanguage.id`)       |
| `page`       | `int`          | Nomor halaman untuk pagination (default: `1`)                     |
| `variableID` | `int?`         | Filter periode turunan untuk variabel tertentu (opsional)         |

## Contoh

### 1. Mendapatkan Periode Turunan untuk Domain

```dart
// Ambil periode turunan untuk Jawa Tengah
final derivedPeriodsResult = await StadataFlutter.instance.list.derivedPeriods(
  domain: '3300', // Kode domain Jawa Tengah
  lang: DataLanguage.id,
);

final derivedPeriodsList = derivedPeriodsResult.data;
final pagination = derivedPeriodsResult.pagination;

// Cetak informasi pagination
print('Halaman Saat Ini: ${pagination.page}');
print('Total Halaman: ${pagination.pages}');
print('Jumlah Data: ${pagination.count}');
print('Total: ${pagination.total}');
print('------------------------');

// Cetak data periode turunan
for (final derivedPeriod in derivedPeriodsList) {
  print('ID: ${derivedPeriod.id}');
  print('Nama: ${derivedPeriod.name}');
  print('------------------------');
}
```

### 2. Mendapatkan Periode Turunan untuk Variabel Tertentu

```dart
// Ambil periode turunan untuk variabel tertentu
final derivedPeriodsResult = await StadataFlutter.instance.list.derivedPeriods(
  domain: '0000', // Level nasional
  lang: DataLanguage.id,
  variableID: 145, // ID variabel spesifik
);

// Periksa periode turunan yang bermakna
final meaningfulPeriods = derivedPeriodsResult.data
    .where((dp) => dp.id != 0 && dp.name.toLowerCase() != 'tidak ada')
    .toList();

if (meaningfulPeriods.isEmpty) {
  print('Tidak ada periode turunan tersedia untuk variabel ini');
} else {
  print('Periode turunan tersedia: ${meaningfulPeriods.length}');
  for (final dp in meaningfulPeriods) {
    print('  - ${dp.name} (ID: ${dp.id})');
  }
}
```

### 3. Integrasi dengan Filter Tabel Dinamis

```dart
// Gunakan periode turunan untuk memfilter data tabel dinamis
Future<void> loadTableWithDerivedPeriod({
  required String domain,
  required int variableID,
}) async {
  // 1. Muat periode turunan yang tersedia
  final derivedPeriodsResult = await StadataFlutter.instance.list.derivedPeriods(
    domain: domain,
    variableID: variableID,
  );

  // 2. Filter nilai placeholder
  final validDerivedPeriods = derivedPeriodsResult.data
      .where((dp) => dp.id != 0 && dp.name.toLowerCase() != 'tidak ada')
      .toList();

  if (validDerivedPeriods.isEmpty) {
    print('Tidak ada filter periode turunan tersedia');
    return;
  }

  // 3. Pilih periode turunan untuk filter
  final selectedDerivedPeriod = validDerivedPeriods.first;
  print('Menggunakan periode turunan: ${selectedDerivedPeriod.name}');

  // 4. Ambil tabel dinamis dengan filter periode turunan
  final tableResult = await StadataFlutter.instance.list.dynamicTableDetail(
    variableID: variableID,
    domain: domain,
    derivedPeriodID: selectedDerivedPeriod.id,
  );

  tableResult.fold(
    (failure) => print('Error: $failure'),
    (table) {
      print('Tabel: ${table.title}');
      print('Difilter berdasarkan: ${selectedDerivedPeriod.name}');
      print('Baris data: ${table.dataContent.length}');
    },
  );
}
```

## Properti (DerivedPeriod)

| Properti | Tipe     | Deskripsi                                     |
| -------- | -------- | --------------------------------------------- |
| `id`     | `int`    | Identifier unik untuk periode turunan         |
| `name`   | `String` | Nama tampilan pengelompokan periode turunan   |

## Tipe Periode Turunan Umum

Periode turunan biasanya merepresentasikan:

| Tipe | Deskripsi | Contoh |
| ---- | --------- | ------ |
| Rata-rata Tahunan | Rata-rata statistik multi-tahun | "Rata-rata 2015-2020" |
| Grup Kuartalan | Agregasi berbasis kuartal | "Kuartal I 2023" |
| Rentang Kustom | Kombinasi rentang tanggal spesifik | "Semester I" |
| Kumulatif | Total berjalan di berbagai periode | "Kumulatif 2020-2023" |

## Menangani Nilai Placeholder

API BPS mungkin mengembalikan periode turunan placeholder. Selalu filter ini:

```dart
// Fungsi utilitas untuk memfilter periode turunan yang bermakna
List<DerivedPeriod> filterMeaningfulDerivedPeriods(List<DerivedPeriod> periods) {
  return periods.where((dp) {
    // Filter ID 0 dan placeholder "tidak ada"
    if (dp.id == 0) return false;
    if (dp.name.toLowerCase() == 'tidak ada') return false;
    return true;
  }).toList();
}

// Penggunaan
final allDerivedPeriods = derivedPeriodsResult.data;
final meaningfulPeriods = filterMeaningfulDerivedPeriods(allDerivedPeriods);
print('Periode turunan bermakna: ${meaningfulPeriods.length}');
```

## Penanganan Error

```dart
try {
  final result = await StadataFlutter.instance.list.derivedPeriods(
    domain: '3300',
    variableID: 145,
  );

  // Proses hasil sukses
  print('Ditemukan ${result.data.length} periode turunan');

} on DerivedPeriodException catch (e) {
  print('Error periode turunan: ${e.message}');

} on ApiException catch (e) {
  print('Error API: ${e.message}');

} catch (e) {
  print('Error tidak terduga: $e');
}
```

## Best Practice

1. **Filter Placeholder**: Selalu filter nilai `id == 0` dan "tidak ada"
2. **Penanganan Graceful**: Tidak semua variabel memiliki periode turunan; tangani hasil kosong
3. **Kombinasi dengan Periode Biasa**: Gunakan kedua tipe periode untuk analisis komprehensif
4. **Cache Hasil**: Daftar periode turunan jarang berubah; pertimbangkan caching
5. **Tampilkan dengan Jelas**: Tampilkan nama periode turunan ke pengguna untuk kejelasan

## API Terkait

- **[Periode](./periods)**: Dapatkan periode waktu biasa
- **[Variabel](./variables)**: Dapatkan variabel dengan data periode
- **[Variabel Turunan](./derived-variables)**: Dapatkan variabel statistik yang dihitung
- **[Tabel Dinamis](./dynamic-tables)**: Gunakan periode turunan untuk filter
