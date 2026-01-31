---
sidebar_position: 20
---

# Variabel Turunan

API Variabel Turunan menyediakan akses ke variabel statistik yang dihitung atau ditransformasi dari BPS (Badan Pusat Statistik) Indonesia. Variabel turunan merepresentasikan metrik yang dihitung dari variabel statistik dasar, seperti tingkat pertumbuhan, perubahan persentase, indeks, atau ukuran terhitung lainnya.

## Memahami Variabel Turunan

Variabel turunan melayani tujuan analitis tertentu:

- **Metrik Terhitung**: Merepresentasikan kalkulasi berdasarkan data statistik mentah
- **Tipe Transformasi**: Mencakup persentase, tingkat pertumbuhan, indeks, dan rasio
- **Analisis Lebih Mendalam**: Memungkinkan wawasan lebih dalam dengan menyediakan ukuran analitis yang telah dihitung sebelumnya
- **Dimensi Filter**: Digunakan sebagai parameter filter dalam kueri tabel dinamis

## Parameter

| Parameter       | Tipe           | Deskripsi                                                          |
| --------------- | -------------- | ------------------------------------------------------------------ |
| `domain`        | `String`       | Kode domain (wilayah) untuk mengambil variabel turunan **(wajib)** |
| `lang`          | `DataLanguage` | Bahasa untuk representasi data (default: `DataLanguage.id`)        |
| `page`          | `int`          | Nomor halaman untuk pagination (default: `1`)                      |
| `variableID`    | `int?`         | Filter berdasarkan ID variabel dasar (opsional)                    |
| `verticalGroup` | `int?`         | Filter berdasarkan grup variabel vertikal (opsional)               |

## Contoh

### 1. Mendapatkan Variabel Turunan untuk Domain

```dart
// Ambil variabel turunan untuk Jawa Tengah
final derivedVarsResult = await StadataFlutter.instance.list.derivedVariables(
  domain: '3300', // Kode domain Jawa Tengah
  lang: DataLanguage.id,
);

final derivedVarsList = derivedVarsResult.data;
final pagination = derivedVarsResult.pagination;

// Cetak informasi pagination
print('Halaman Saat Ini: ${pagination.page}');
print('Total Halaman: ${pagination.pages}');
print('Jumlah Data: ${pagination.count}');
print('Total: ${pagination.total}');
print('------------------------');

// Cetak data variabel turunan
for (final derivedVar in derivedVarsList) {
  print('ID: ${derivedVar.id}');
  print('Nama: ${derivedVar.name}');
  print('------------------------');
}
```

### 2. Mendapatkan Variabel Turunan untuk Variabel Dasar Tertentu

```dart
// Ambil variabel turunan yang terkait dengan variabel tertentu
final derivedVarsResult = await StadataFlutter.instance.list.derivedVariables(
  domain: '0000', // Level nasional
  lang: DataLanguage.id,
  variableID: 145, // ID variabel dasar
);

// Periksa variabel turunan yang bermakna
final meaningfulVars = derivedVarsResult.data
    .where((dv) => dv.id != 0 && dv.name.toLowerCase() != 'tidak ada')
    .toList();

if (meaningfulVars.isEmpty) {
  print('Tidak ada variabel turunan tersedia untuk variabel ini');
} else {
  print('Variabel turunan tersedia: ${meaningfulVars.length}');
  for (final dv in meaningfulVars) {
    print('  - ${dv.name} (ID: ${dv.id})');
  }
}
```

### 3. Integrasi dengan Filter Tabel Dinamis

```dart
// Gunakan variabel turunan untuk memfilter data tabel dinamis
Future<void> loadTableWithDerivedVariable({
  required String domain,
  required int variableID,
}) async {
  // 1. Muat variabel turunan yang tersedia
  final derivedVarsResult = await StadataFlutter.instance.list.derivedVariables(
    domain: domain,
    variableID: variableID,
  );

  // 2. Filter nilai placeholder
  final validDerivedVars = derivedVarsResult.data
      .where((dv) => dv.id != 0 && dv.name.toLowerCase() != 'tidak ada')
      .toList();

  if (validDerivedVars.isEmpty) {
    print('Tidak ada filter variabel turunan tersedia');
    return;
  }

  // 3. Pilih variabel turunan untuk filter
  final selectedDerivedVar = validDerivedVars.first;
  print('Menggunakan variabel turunan: ${selectedDerivedVar.name}');

  // 4. Ambil tabel dinamis dengan filter variabel turunan
  final tableResult = await StadataFlutter.instance.list.dynamicTableDetail(
    variableID: variableID,
    domain: domain,
    derivedVarID: selectedDerivedVar.id,
  );

  tableResult.fold(
    (failure) => print('Error: $failure'),
    (table) {
      print('Tabel: ${table.title}');
      print('Difilter berdasarkan: ${selectedDerivedVar.name}');
      print('Baris data: ${table.dataContent.length}');
    },
  );
}
```

### 4. Loading Dimensi Lengkap untuk Tabel Dinamis

```dart
// Muat semua dimensi filter untuk variabel tabel dinamis
class DynamicTableDimensionLoader {
  static Future<void> loadAllDimensions({
    required String domain,
    required int variableID,
  }) async {
    print('=== Loading Dimensi untuk Variabel $variableID ===\n');

    // Muat variabel vertikal
    try {
      final verticalVarsResult = await StadataFlutter.instance.list.verticalVariables(
        domain: domain,
        variableID: variableID,
      );
      print('Variabel Vertikal: ${verticalVarsResult.data.length}');
      for (final v in verticalVarsResult.data.take(3)) {
        print('  - ${v.title} (ID: ${v.id})');
      }
    } catch (e) {
      print('Variabel Vertikal: Tidak tersedia');
    }

    // Muat variabel turunan
    try {
      final derivedVarsResult = await StadataFlutter.instance.list.derivedVariables(
        domain: domain,
        variableID: variableID,
      );
      final validVars = derivedVarsResult.data
          .where((dv) => dv.id != 0 && dv.name.toLowerCase() != 'tidak ada')
          .toList();
      print('\nVariabel Turunan: ${validVars.length}');
      for (final dv in validVars.take(3)) {
        print('  - ${dv.name} (ID: ${dv.id})');
      }
    } catch (e) {
      print('\nVariabel Turunan: Tidak tersedia');
    }

    // Muat periode
    try {
      final periodsResult = await StadataFlutter.instance.list.periods(
        domain: domain,
        variableID: variableID,
      );
      print('\nPeriode: ${periodsResult.data.length}');
      for (final p in periodsResult.data.take(3)) {
        print('  - ${p.year} (ID: ${p.id})');
      }
    } catch (e) {
      print('\nPeriode: Tidak tersedia');
    }
  }
}
```

## Properti (DerivedVariable)

| Properti | Tipe     | Deskripsi                                   |
| -------- | -------- | ------------------------------------------- |
| `id`     | `int`    | Identifier unik untuk variabel turunan      |
| `name`   | `String` | Nama tampilan variabel turunan              |

## Tipe Variabel Turunan Umum

Variabel turunan biasanya merepresentasikan:

| Tipe | Deskripsi | Contoh |
| ---- | --------- | ------ |
| Tingkat Pertumbuhan | Perubahan tahun ke tahun | "Pertumbuhan (%)" |
| Persentase | Nilai proporsional | "Persentase" |
| Nilai Indeks | Ukuran yang dinormalisasi | "Indeks" |
| Per Kapita | Nilai yang disesuaikan populasi | "Per Kapita" |
| Kumulatif | Total berjalan | "Kumulatif" |

## Menangani Nilai Placeholder

API BPS mungkin mengembalikan variabel turunan placeholder. Selalu filter ini:

```dart
// Fungsi utilitas untuk memfilter variabel turunan yang bermakna
List<DerivedVariable> filterMeaningfulDerivedVariables(
  List<DerivedVariable> variables,
) {
  return variables.where((dv) {
    // Filter ID 0 dan placeholder "tidak ada"
    if (dv.id == 0) return false;
    if (dv.name.toLowerCase() == 'tidak ada') return false;
    return true;
  }).toList();
}

// Penggunaan
final allDerivedVars = derivedVarsResult.data;
final meaningfulVars = filterMeaningfulDerivedVariables(allDerivedVars);
print('Variabel turunan bermakna: ${meaningfulVars.length}');
```

## Penanganan Error

```dart
try {
  final result = await StadataFlutter.instance.list.derivedVariables(
    domain: '3300',
    variableID: 145,
  );

  // Proses hasil sukses
  print('Ditemukan ${result.data.length} variabel turunan');

} on DerivedVariableException catch (e) {
  print('Error variabel turunan: ${e.message}');

} on ApiException catch (e) {
  print('Error API: ${e.message}');

} catch (e) {
  print('Error tidak terduga: $e');
}
```

## Best Practice

1. **Filter Placeholder**: Selalu filter nilai `id == 0` dan "tidak ada"
2. **Penanganan Graceful**: Tidak semua variabel memiliki varian turunan; tangani hasil kosong
3. **Tampilkan Opsi "Semua"**: Izinkan pengguna melihat data tanpa filter bersama tampilan terfilter
4. **Kombinasi Filter**: Variabel turunan dapat dikombinasikan dengan dimensi lain
5. **Cache Hasil**: Daftar variabel turunan jarang berubah; pertimbangkan caching

## API Terkait

- **[Variabel](./variables)**: Dapatkan variabel statistik dasar
- **[Variabel Vertikal](./vertical-variables)**: Dapatkan struktur variabel hierarkis
- **[Periode](./periods)**: Dapatkan periode waktu
- **[Periode Turunan](./derived-periods)**: Dapatkan periode waktu yang diagregasi
- **[Tabel Dinamis](./dynamic-tables)**: Gunakan variabel turunan untuk filter
