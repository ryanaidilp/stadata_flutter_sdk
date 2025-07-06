# Census (Sensus)

API Census menyediakan akses ke data sensus dari BPS (Badan Pusat Statistik) Indonesia. Data sensus mencakup survei demografi, perumahan, pertanian, dan ekonomi yang komprehensif yang dilakukan secara berkala oleh BPS.

## Metode yang Tersedia

Fungsionalitas census menyediakan lima metode untuk mengakses berbagai tingkat data sensus:

### 1. `census()` - Dapatkan Semua Jenis Sensus

Mengambil daftar semua jenis sensus yang tersedia dari BPS.

#### Parameter

Metode ini tidak memerlukan parameter.

#### Contoh

```dart
// Ambil semua jenis sensus yang tersedia
final censusResult = await StadataFlutter.instance.list.census();

final censusList = censusResult.data;
final pagination = censusResult.pagination;

// Cetak informasi pagination
print('Halaman Saat Ini: ${pagination.page}');
print('Total Halaman: ${pagination.pages}');
print('Jumlah Data di Halaman Ini: ${pagination.count}');
print('Per Halaman: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Cetak data sensus yang diambil
for (final census in censusList) {
  print('ID Sensus: ${census.id}'); // Contoh: sp2020
  print('Nama: ${census.name}'); // Contoh: Sensus Penduduk 2020
  print('------------------------');
}
```

#### Properti (Census)

| Properti | Tipe     | Deskripsi                           |
| -------- | -------- | ----------------------------------- |
| `id`     | `String` | Pengidentifikasi unik untuk sensus  |
| `name`   | `String` | Nama sensus                         |

### 2. `censusTopics()` - Dapatkan Topik untuk Sensus

Mengambil topik yang tersedia untuk acara sensus tertentu.

#### Parameter

| Parameter  | Tipe     | Deskripsi                                         |
| ---------- | -------- | ------------------------------------------------- |
| `censusID` | `String` | ID sensus (contoh: 'sp2020') **(wajib diisi)**   |

#### Contoh

```dart
// Ambil topik untuk Sensus Penduduk 2020
final topicsResult = await StadataFlutter.instance.list.censusTopics(
  censusID: 'sp2020',
);

final topicsList = topicsResult.data;
final pagination = topicsResult.pagination;

// Cetak informasi pagination
print('Halaman Saat Ini: ${pagination.page}');
print('Total Halaman: ${pagination.pages}');
print('Jumlah Data di Halaman Ini: ${pagination.count}');
print('Per Halaman: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Cetak topik sensus yang diambil
for (final topic in topicsList) {
  print('ID Topik: ${topic.id}'); // Contoh: 20
  print('Nama: ${topic.name}'); // Contoh: Demografi
  print('------------------------');
}
```

#### Properti (CensusTopic)

| Properti | Tipe     | Deskripsi                           |
| -------- | -------- | ----------------------------------- |
| `id`     | `int`    | Pengidentifikasi unik untuk topik   |
| `name`   | `String` | Nama topik sensus                   |

### 3. `censusEventAreas()` - Dapatkan Wilayah untuk Sensus

Mengambil wilayah geografis yang memiliki data untuk acara sensus tertentu.

#### Parameter

| Parameter  | Tipe     | Deskripsi                                         |
| ---------- | -------- | ------------------------------------------------- |
| `censusID` | `String` | ID sensus (contoh: 'sp2020') **(wajib diisi)**   |

#### Contoh

```dart
// Ambil wilayah untuk Sensus Penduduk 2020
final areasResult = await StadataFlutter.instance.list.censusEventAreas(
  censusID: 'sp2020',
);

final areasList = areasResult.data;
final pagination = areasResult.pagination;

// Cetak informasi pagination
print('Halaman Saat Ini: ${pagination.page}');
print('Total Halaman: ${pagination.pages}');
print('Jumlah Data di Halaman Ini: ${pagination.count}');
print('Per Halaman: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Cetak wilayah sensus yang diambil
for (final area in areasList) {
  print('ID Wilayah: ${area.id}'); // Contoh: 3200
  print('Nama: ${area.name}'); // Contoh: Jawa Barat
  print('Level: ${area.level}'); // Contoh: 1 (Level Provinsi)
  print('------------------------');
}
```

#### Properti (CensusArea)

| Properti | Tipe     | Deskripsi                                        |
| -------- | -------- | ------------------------------------------------ |
| `id`     | `String` | Pengidentifikasi unik untuk wilayah             |
| `name`   | `String` | Nama wilayah                                     |
| `level`  | `int`    | Level administratif (1=Provinsi, 2=Kabupaten, dll.) |

### 4. `censusEventDatasets()` - Dapatkan Dataset untuk Sensus dan Topik

Mengambil dataset aktual untuk kombinasi spesifik acara sensus dan topik.

#### Parameter

| Parameter  | Tipe     | Deskripsi                                         |
| ---------- | -------- | ------------------------------------------------- |
| `censusID` | `String` | ID sensus (contoh: 'sp2020') **(wajib diisi)**   |
| `topicID`  | `int`    | ID topik (contoh: 20) **(wajib diisi)**          |

#### Contoh

```dart
// Ambil dataset untuk Sensus Penduduk 2020, topik Demografi
final datasetsResult = await StadataFlutter.instance.list.censusEventDatasets(
  censusID: 'sp2020',
  topicID: 20,
);

final datasetsList = datasetsResult.data;
final pagination = datasetsResult.pagination;

// Cetak informasi pagination
print('Halaman Saat Ini: ${pagination.page}');
print('Total Halaman: ${pagination.pages}');
print('Jumlah Data di Halaman Ini: ${pagination.count}');
print('Per Halaman: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Cetak dataset sensus yang diambil
for (final dataset in datasetsList) {
  print('ID Dataset: ${dataset.id}'); // Contoh: 123456
  print('Judul: ${dataset.title}'); // Contoh: Jumlah Penduduk Menurut Jenis Kelamin
  print('Deskripsi: ${dataset.description}');
  print('Diperbarui: ${dataset.updatedAt}');
  print('------------------------');
}
```

#### Properti (CensusDataset)

| Properti      | Tipe       | Deskripsi                                    |
| ------------- | ---------- | -------------------------------------------- |
| `id`          | `int`      | Pengidentifikasi unik untuk dataset         |
| `title`       | `String`   | Judul dataset                                |
| `description` | `String?`  | Deskripsi dataset (opsional)                |
| `updatedAt`   | `DateTime` | Timestamp pembaruan terakhir dataset        |

### 5. `censusData()` - Dapatkan Data Sensus Aktual

Mengambil data statistik aktual untuk kombinasi spesifik acara sensus, wilayah, dan dataset. Metode ini menyediakan akses ke angka-angka sensus detail dengan kategori, indikator, dan nilai.

#### Parameter

| Parameter       | Tipe     | Deskripsi                                           |
| --------------- | -------- | --------------------------------------------------- |
| `censusID`      | `String` | ID sensus (contoh: 'sp2020') **(wajib diisi)**     |
| `censusAreaID`  | `String` | ID wilayah sensus **(wajib diisi)**                 |
| `datasetID`     | `String` | ID dataset **(wajib diisi)**                        |

#### Contoh

```dart
// Ambil data sensus aktual untuk Sensus Penduduk 2020
// untuk Indonesia (area ID: 1667) dan dataset spesifik
final censusDataResult = await StadataFlutter.instance.list.censusData(
  censusID: 'sp2020',
  censusAreaID: '1667', // Indonesia
  datasetID: '1',
);

final censusDataList = censusDataResult.data;
final pagination = censusDataResult.pagination;

// Cetak informasi pagination
print('Halaman Saat Ini: ${pagination.page}');
print('Total Halaman: ${pagination.pages}');
print('Jumlah Data di Halaman Ini: ${pagination.count}');
print('Per Halaman: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Cetak data sensus yang diambil
for (final data in censusDataList) {
  print('Wilayah: ${data.regionName} (${data.regionCode})');
  print('Indikator: ${data.indicatorName}');
  print('Periode: ${data.period}');
  print('Nilai: ${data.value}');
  
  // Cetak kategori jika tersedia
  if (data.categories.isNotEmpty) {
    print('Kategori:');
    for (final category in data.categories) {
      print('  - ${category.name}: ${category.itemName} (${category.itemCode})');
    }
  }
  print('------------------------');
}
```

#### Properti (CensusData)

| Properti        | Tipe                    | Deskripsi                                       |
| --------------- | ----------------------- | ----------------------------------------------- |
| `regionID`      | `String`                | Pengidentifikasi unik untuk wilayah            |
| `regionCode`    | `String`                | Kode untuk wilayah                              |
| `regionName`    | `String`                | Nama wilayah                                    |
| `regionLevel`   | `String?`               | Level administratif wilayah (opsional)         |
| `indicatorID`   | `String`                | Pengidentifikasi unik untuk indikator          |
| `indicatorName` | `String`                | Nama indikator statistik                        |
| `categories`    | `List<CensusCategory>`  | Daftar kategori untuk data                      |
| `period`        | `String`                | Periode waktu data                              |
| `value`         | `num`                   | Nilai statistik                                 |

#### Properti (CensusCategory)

| Properti   | Tipe     | Deskripsi                           |
| ---------- | -------- | ----------------------------------- |
| `id`       | `String` | Pengidentifikasi unik untuk kategori|
| `name`     | `String` | Nama kategori                       |
| `itemID`   | `String` | Pengidentifikasi unik untuk item    |
| `itemCode` | `String` | Kode untuk item                     |
| `itemName` | `String` | Nama item                           |

## ID Sensus Umum

Berikut adalah beberapa ID sensus yang umum digunakan:

| ID Sensus | Deskripsi                        | Tahun |
| --------- | -------------------------------- | ----- |
| `sp2020`  | Sensus Penduduk                  | 2020  |
| `st2023`  | Sensus Pertanian                 | 2023  |
| `se2016`  | Sensus Ekonomi                   | 2016  |

## Alur Kerja Penggunaan

Alur kerja umum untuk mengakses data sensus mengikuti hierarki ini:

1. **Dapatkan Jenis Sensus yang Tersedia**: Gunakan `census()` untuk melihat acara sensus apa yang tersedia
2. **Dapatkan Topik untuk Sensus**: Gunakan `censusTopics(censusID)` untuk melihat topik apa yang tersedia untuk sensus pilihan Anda
3. **Dapatkan Wilayah untuk Sensus**: Gunakan `censusEventAreas(censusID)` untuk melihat wilayah geografis mana yang memiliki data
4. **Dapatkan Dataset**: Gunakan `censusEventDatasets(censusID, topicID)` untuk mendapatkan dataset aktual yang dapat Anda query
5. **Dapatkan Data Sensus**: Gunakan `censusData(censusID, censusAreaID, datasetID)` untuk mendapatkan data statistik aktual

### Contoh Lengkap

```dart
// 1. Dapatkan semua jenis sensus yang tersedia
final censusTypes = await StadataFlutter.instance.list.census();
print('Jenis Sensus yang Tersedia: ${censusTypes.data.length}');

// 2. Dapatkan topik untuk Sensus Penduduk 2020
final topics = await StadataFlutter.instance.list.censusTopics(
  censusID: 'sp2020',
);
print('Topik untuk SP2020: ${topics.data.length}');

// 3. Dapatkan wilayah untuk Sensus Penduduk 2020
final areas = await StadataFlutter.instance.list.censusEventAreas(
  censusID: 'sp2020',
);
print('Wilayah untuk SP2020: ${areas.data.length}');

// 4. Dapatkan dataset untuk Sensus Penduduk 2020, topik Demografi
final datasets = await StadataFlutter.instance.list.censusEventDatasets(
  censusID: 'sp2020',
  topicID: 20, // ID topik Demografi
);
print('Dataset untuk SP2020 Demografi: ${datasets.data.length}');

// 5. Dapatkan data sensus aktual
final censusData = await StadataFlutter.instance.list.censusData(
  censusID: 'sp2020',
  censusAreaID: '1667', // Indonesia
  datasetID: '1',
);
print('Record Data Sensus: ${censusData.data.length}');

// Tampilkan record pertama
if (censusData.data.isNotEmpty) {
  final firstRecord = censusData.data.first;
  print('Contoh Data: ${firstRecord.indicatorName} = ${firstRecord.value}');
}
```

## Penanganan Error

Semua metode census mengembalikan `Future<ListResult<T>>` dan mungkin melempar exception spesifik:

- `CensusDataException`: Error umum terkait data census
- `CensusTopicException`: Error terkait topik census
- `CensusAreaException`: Error terkait wilayah census
- `CensusDatasetException`: Error terkait dataset census
- `ApiException`: Error terkait jaringan atau API
- `ApiKeyNotFoundException`: Kunci API tidak valid atau hilang

```dart
try {
  final result = await StadataFlutter.instance.list.censusData(
    censusID: 'sp2020',
    censusAreaID: '1667',
    datasetID: '1',
  );
  // Tangani keberhasilan
} on CensusDataException catch (e) {
  print('Error data census: ${e.message}');
} on ApiException catch (e) {
  print('Error API: ${e.message}');
} catch (e) {
  print('Error tak terduga: $e');
}
```