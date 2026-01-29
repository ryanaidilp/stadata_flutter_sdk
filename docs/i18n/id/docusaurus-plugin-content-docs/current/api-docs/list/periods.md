---
sidebar_position: 18
---

# Periode

API Periode menyediakan akses ke data periode waktu dari BPS (Badan Pusat Statistik) Indonesia. Periode merepresentasikan titik temporal di mana data statistik tersedia dan sangat penting untuk mengkueri tabel dinamis. Setiap periode biasanya sesuai dengan tahun atau kerangka waktu tertentu dalam sistem pengumpulan data BPS.

## Memahami Periode

Periode adalah komponen fundamental dalam arsitektur data dinamis:

- **Referensi Temporal**: Setiap periode merepresentasikan titik waktu spesifik untuk pengumpulan data
- **Asosiasi Variabel**: Periode terkait dengan variabel tertentu, menunjukkan kapan data dikumpulkan
- **Filter Tabel Dinamis**: Digunakan sebagai parameter filter saat mengambil data tabel dinamis
- **Analisis Multi-tahun**: Memungkinkan analisis time-series dengan mengkueri data di berbagai periode

## Parameter

| Parameter    | Tipe           | Deskripsi                                                   |
| ------------ | -------------- | ----------------------------------------------------------- |
| `domain`     | `String`       | Kode domain (wilayah) untuk mengambil periode **(wajib)**   |
| `lang`       | `DataLanguage` | Bahasa untuk data periode (default: `DataLanguage.id`)      |
| `page`       | `int`          | Nomor halaman untuk pagination (default: `1`)               |
| `variableID` | `int?`         | Filter periode untuk variabel tertentu (opsional)           |

## Contoh

### 1. Mendapatkan Semua Periode untuk Domain

```dart
// Ambil semua periode waktu yang tersedia untuk Jawa Tengah
final periodsResult = await StadataFlutter.instance.list.periods(
  domain: '3300', // Kode domain Jawa Tengah
  lang: DataLanguage.id,
);

final periodsList = periodsResult.data;
final pagination = periodsResult.pagination;

// Cetak informasi pagination
print('Halaman Saat Ini: ${pagination.page}');
print('Total Halaman: ${pagination.pages}');
print('Jumlah Data di Halaman Ini: ${pagination.count}');
print('Per Halaman: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Cetak data periode yang diambil
for (final period in periodsList) {
  print('ID Periode: ${period.id}');
  print('Tahun: ${period.year}');
  print('------------------------');
}
```

### 2. Mendapatkan Periode untuk Variabel Tertentu

```dart
// Ambil periode yang tersedia untuk variabel tertentu
final periodsResult = await StadataFlutter.instance.list.periods(
  domain: '0000', // Level nasional
  lang: DataLanguage.id,
  variableID: 145, // ID variabel spesifik
);

// Proses periode
for (final period in periodsResult.data) {
  print('Periode ${period.id}: Tahun ${period.year}');
}
```

### 3. Integrasi dengan Tabel Dinamis

```dart
// Workflow lengkap: Muat periode untuk filter tabel dinamis
Future<void> loadDynamicTableWithPeriods(
  String domain,
  int variableID,
) async {
  // 1. Muat periode yang tersedia untuk variabel
  final periodsResult = await StadataFlutter.instance.list.periods(
    domain: domain,
    variableID: variableID,
  );

  print('Periode tersedia: ${periodsResult.data.length}');
  for (final period in periodsResult.data) {
    print('  - ${period.year} (ID: ${period.id})');
  }

  // 2. Pilih periode untuk filter (contoh: 2 periode terakhir)
  final sortedPeriods = List<Period>.from(periodsResult.data)
    ..sort((a, b) => b.year.compareTo(a.year));

  final selectedPeriods = sortedPeriods.take(2).toList();
  final periodFilter = selectedPeriods.map((p) => p.id).join(',');

  // 3. Ambil data tabel dinamis dengan filter periode
  final tableResult = await StadataFlutter.instance.list.dynamicTableDetail(
    variableID: variableID,
    domain: domain,
    period: periodFilter,
  );

  tableResult.fold(
    (failure) => print('Error: $failure'),
    (table) {
      print('Tabel: ${table.title}');
      print('Baris data: ${table.dataContent.length}');
    },
  );
}
```

## Properti (Period)

| Properti | Tipe  | Deskripsi                              |
| -------- | ----- | -------------------------------------- |
| `id`     | `int` | Identifier unik untuk periode          |
| `year`   | `int` | Tahun yang direpresentasikan periode   |

## Penanganan Error

```dart
try {
  final result = await StadataFlutter.instance.list.periods(
    domain: '3300',
    variableID: 145,
  );

  // Proses hasil sukses
  print('Ditemukan ${result.data.length} periode');

} on PeriodException catch (e) {
  print('Error periode: ${e.message}');
  // Tangani error terkait periode

} on ApiException catch (e) {
  print('Error API: ${e.message}');
  // Tangani error konektivitas jaringan atau layanan API

} catch (e) {
  print('Error tidak terduga: $e');
}
```

## Best Practice

1. **Cache Data Periode**: Daftar periode jarang berubah; cache untuk performa lebih baik
2. **Sort Sebelum Tampilkan**: Urutkan periode berdasarkan tahun untuk presentasi kronologis
3. **Validasi Seleksi**: Pastikan minimal 2 periode dipilih untuk kueri tabel dinamis
4. **Gunakan dengan Variabel**: Selalu tentukan `variableID` saat memuat periode untuk tabel dinamis
5. **Tangani Hasil Kosong**: Beberapa variabel mungkin memiliki ketersediaan periode terbatas

## API Terkait

- **[Variabel](./variables)**: Dapatkan variabel yang memiliki data periode
- **[Tabel Dinamis](./dynamic-tables)**: Gunakan periode untuk memfilter data tabel
- **[Periode Turunan](./derived-periods)**: Dapatkan periode waktu yang diagregasi/dikelompokkan
