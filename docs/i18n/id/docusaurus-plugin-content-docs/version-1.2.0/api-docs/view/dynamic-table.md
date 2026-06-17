---
sidebar_position: 7
---

# Tabel Dinamis

API Detail Tabel Dinamis menyediakan akses komprehensif ke data tabel statistik interaktif dari BPS (Badan Pusat Statistik) Indonesia. Tidak seperti daftar tabel dinamis yang mengembalikan ringkasan metadata, API detail ini mengambil data lengkap termasuk semua dimensi, periode waktu, dan nilai data aktual dengan kemampuan filter fleksibel.

## Gambaran Umum

Metode `dynamicTableDetail` mengambil data statistik multi-dimensi yang dapat dikueri dengan berbagai parameter filter. Respons mencakup:

- **Metadata Variabel**: Informasi lengkap tentang variabel statistik
- **Variabel Vertikal**: Breakdown hierarkis berdasarkan kategori vertikal
- **Periode Waktu**: Tahun dan periode yang tersedia
- **Variabel Turunan**: Metrik terhitung yang tersedia
- **Periode Turunan**: Agregasi waktu yang dikelompokkan
- **Konten Data**: Nilai data aktual dengan kunci komposit

## Parameter

| Parameter         | Tipe           | Deskripsi                                                      |
| ----------------- | -------------- | -------------------------------------------------------------- |
| `variableID`      | `int`          | Identifier unik variabel statistik **(wajib)**                 |
| `domain`          | `String`       | Kode domain (wilayah) untuk mengambil data **(wajib)**         |
| `lang`            | `DataLanguage` | Bahasa untuk data (default: `DataLanguage.id`)                 |
| `period`          | `String?`      | Filter periode waktu, format dipisah koma (mis. "119,120")     |
| `verticalVarID`   | `int?`         | Filter berdasarkan ID variabel vertikal tertentu               |
| `derivedVarID`    | `int?`         | Filter berdasarkan ID variabel turunan tertentu                |
| `derivedPeriodID` | `int?`         | Filter berdasarkan ID periode turunan tertentu                 |

## Contoh Dasar

### 1. Mengambil Data Tabel Dinamis

```dart
// Ambil data tabel dinamis dengan filter
final result = await StadataFlutter.instance.list.dynamicTableDetail(
  variableID: 31,
  domain: '7315', // Kode domain Luwu Timur
  lang: DataLanguage.id,
);

result.fold(
  (failure) => print('Error: $failure'),
  (table) {
    print('Judul: ${table.title}');
    print('Subjek: ${table.subject}');
    print('Satuan: ${table.unit}');

    // Akses data
    print('Baris data: ${table.dataContent.length}');
    for (final entry in table.dataContent.entries.take(5)) {
      print('Kunci: ${entry.key}, Nilai: ${entry.value}');
    }
  },
);
```

### 2. Filter berdasarkan Periode

```dart
// Ambil data untuk periode spesifik (minimal 2 periode diperlukan)
final result = await StadataFlutter.instance.list.dynamicTableDetail(
  variableID: 31,
  domain: '7315',
  period: '119,120', // Filter 2 periode (format dipisah koma)
  lang: DataLanguage.id,
);

result.fold(
  (failure) => print('Error: $failure'),
  (table) {
    print('Data difilter untuk periode: 119, 120');
    print('Periode tersedia: ${table.periods.length}');
    for (final period in table.periods) {
      print('  - ${period.year} (ID: ${period.id})');
    }
  },
);
```

### 3. Filter berdasarkan Variabel Vertikal

```dart
// Ambil data difilter berdasarkan variabel vertikal spesifik
final result = await StadataFlutter.instance.list.dynamicTableDetail(
  variableID: 31,
  domain: '7315',
  verticalVarID: 1, // Filter berdasarkan variabel vertikal spesifik
  lang: DataLanguage.id,
);

result.fold(
  (failure) => print('Error: $failure'),
  (table) {
    print('Variabel vertikal tersedia: ${table.verticalVariables.length}');
    for (final vv in table.verticalVariables) {
      print('  - ${vv.title} (ID: ${vv.id})');
    }
  },
);
```

## Workflow Komprehensif

### Workflow Lengkap Kueri Tabel Dinamis

```dart
class DynamicTableWorkflow {
  static Future<void> executeFullWorkflow({
    required String domain,
    required int variableID,
  }) async {
    // Langkah 1: Muat dimensi yang tersedia
    print('=== Langkah 1: Loading Dimensi ===');

    // Muat variabel vertikal
    final verticalVars = await StadataFlutter.instance.list.verticalVariables(
      domain: domain,
      variableID: variableID,
    );
    print('Variabel Vertikal: ${verticalVars.data.length}');

    // Muat periode
    final periods = await StadataFlutter.instance.list.periods(
      domain: domain,
      variableID: variableID,
    );
    print('Periode: ${periods.data.length}');

    // Langkah 2: Bangun parameter kueri
    print('\n=== Langkah 2: Menyiapkan Kueri ===');

    // Pilih 2 periode terakhir (wajib untuk API)
    final sortedPeriods = List.of(periods.data)
      ..sort((a, b) => b.year.compareTo(a.year));
    final selectedPeriods = sortedPeriods.take(2).toList();
    final periodFilter = selectedPeriods.map((p) => p.id).join(',');
    print('Filter Periode: $periodFilter');

    // Pilih variabel vertikal (opsional)
    int? verticalVarID;
    if (verticalVars.data.isNotEmpty) {
      verticalVarID = verticalVars.data.first.id;
      print('Filter Variabel Vertikal: $verticalVarID');
    }

    // Langkah 3: Eksekusi kueri
    print('\n=== Langkah 3: Mengambil Data ===');

    final result = await StadataFlutter.instance.list.dynamicTableDetail(
      variableID: variableID,
      domain: domain,
      period: periodFilter,
      verticalVarID: verticalVarID,
      lang: DataLanguage.id,
    );

    // Langkah 4: Proses hasil
    result.fold(
      (failure) => print('Error: $failure'),
      (table) {
        print('\n=== Hasil ===');
        print('Judul: ${table.title}');
        print('Subjek: ${table.subject}');
        print('Satuan: ${table.unit}');
        print('Total titik data: ${table.dataContent.length}');
      },
    );
  }
}
```

## Properti Respons (DynamicTable)

| Properti            | Tipe                         | Deskripsi                                       |
| ------------------- | ---------------------------- | ----------------------------------------------- |
| `id`                | `int`                        | Identifier unik variabel                        |
| `title`             | `String`                     | Judul tabel                                     |
| `subjectId`         | `int`                        | ID subjek terkait                               |
| `subject`           | `String`                     | Nama subjek                                     |
| `vertical`          | `int`                        | ID variabel vertikal                            |
| `unit`              | `String`                     | Satuan pengukuran                               |
| `graphName`         | `String`                     | Nama untuk representasi grafik                  |
| `periods`           | `List<Period>`               | Periode waktu tersedia                          |
| `verticalVariables` | `List<VerticalVariable>`     | Opsi breakdown vertikal                         |
| `derivedVariables`  | `List<DerivedVariable>`      | Metrik terhitung tersedia                       |
| `derivedPeriods`    | `List<DerivedPeriod>`        | Periode waktu teragregasi                       |
| `dataContent`       | `Map<String, num>`           | Data aktual dengan kunci komposit               |

## Struktur Kunci Data

Properti `dataContent` menggunakan kunci komposit yang mengenkode beberapa dimensi:

```
Format Kunci: {verticalVarID}{periodID}{derivedVarID}{derivedPeriodID}
```

Contoh mengekstrak komponen kunci:

```dart
void parseDataContentKeys(DynamicTable table) {
  for (final entry in table.dataContent.entries) {
    final key = entry.key;
    final value = entry.value;

    // Parsing kunci tergantung struktur spesifik
    print('Kunci: $key, Nilai: $value');
  }
}
```

## Generasi Tabel HTML

SDK menyediakan utilitas built-in untuk menghasilkan tabel HTML dari data tabel dinamis:

```dart
// Hasilkan tabel HTML dari data
result.fold(
  (failure) => print('Error: $failure'),
  (table) {
    final htmlTable = DynamicTableHtmlGenerator.generate(table);
    print('Tabel HTML dihasilkan dengan ${table.dataContent.length} sel data');

    // Gunakan htmlTable dalam WebView atau tampilan HTML
    // htmlTable berisi string HTML lengkap dengan styling
  },
);
```

## Penanganan Error

```dart
try {
  final result = await StadataFlutter.instance.list.dynamicTableDetail(
    variableID: 31,
    domain: '7315',
    period: '119,120',
  );

  result.fold(
    (failure) {
      // Tangani berbagai tipe failure
      print('Gagal mengambil data: $failure');
    },
    (table) {
      // Proses data tabel sukses
      print('Tabel dimuat: ${table.title}');
    },
  );
} on DynamicTableException catch (e) {
  print('Error tabel dinamis: ${e.message}');
} on ApiException catch (e) {
  print('Error API: ${e.message}');
} catch (e) {
  print('Error tidak terduga: $e');
}
```

## Best Practice

1. **Selalu Filter Periode**: API memerlukan minimal 2 periode untuk sebagian besar kueri
2. **Muat Dimensi Lebih Dulu**: Ambil variabel vertikal, periode, dll. sebelum membangun kueri
3. **Tangani Hasil Kosong**: Beberapa kombinasi filter mungkin tidak menghasilkan data
4. **Cache Metadata**: Informasi dimensi jarang berubah; cache untuk performa
5. **Implementasi Pagination**: Untuk dataset besar, pertimbangkan memproses data dalam batch
6. **Validasi Parameter**: Pastikan periode dan ID variabel valid sebelum kueri

## Catatan Format Periode

- API memerlukan minimal 2 periode saat memfilter
- Format: ID dipisah koma (mis. "117,118")
- Periode harus valid dan tersedia untuk variabel yang diminta
- Muat periode yang tersedia terlebih dahulu menggunakan List API

## API Terkait

- **[Tabel Dinamis (List)](../list/dynamic-tables)**: Temukan tabel dinamis yang tersedia
- **[Periode](../list/periods)**: Dapatkan periode yang tersedia untuk filter
- **[Variabel Vertikal](../list/vertical-variables)**: Dapatkan opsi breakdown vertikal
- **[Variabel Turunan](../list/derived-variables)**: Dapatkan metrik terhitung yang tersedia
- **[Periode Turunan](../list/derived-periods)**: Dapatkan periode teragregasi yang tersedia
