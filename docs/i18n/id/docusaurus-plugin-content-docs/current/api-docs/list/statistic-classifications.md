# Klasifikasi Statistik (KBKI & KBLI)

Metode ini digunakan untuk mengambil daftar Klasifikasi Baku Lapangan Usaha Indonesia (KBLI) & Klasifikasi Baku Komoditas Indonesia (KBKI) dari API BPS. Ini memungkinkan pengguna untuk mengakses informasi terkait kode klasifikasi dan deskripsinya.

## Enums

Terdapat dua kelas enum yang dapat digunakan sebagai parameter.

### ClassificationType

`ClassificationType` adalah kelas dasar untuk menentukan jenis klasifikasi. Kelas ini kemudian di-extend oleh `KBLIType` dan `KBKIType`. Setiap kelas tersebut memiliki opsi sebagai berikut.

- **KBLIType**
  | Enum | Nilai | Deskripsi |
  |------|-------|-----------|
  |KBLI.y2009 | `kbli2009` | KBLI tahun 2009 |
  |KBLI.y2015 | `kbli2015` | KBLI tahun 2015 |
  |KBLI.y2017 | `kbli2017` | KBLI tahun 2017 |
  |KBLI.y2020 | `kbli2020` | KBLI tahun 2020 |

  Untuk melakukan permintaan ke endpoint `detail`, kode KBLI perlu diformat dalam format `kbli_tahun_kode`. Kelas ini juga memfasilitasi proses formatting tersebut melalui metode `urlParamGenerator` yang menerima parameter kode.

  Contoh:

  ```dart
  final url = KBLIType.y2009.urlParamGenerator('24');
  /// hasil: kbli_2009_24
  final value = KBLIType.y2009.value;
  /// hasil: kbli2009
  final year = KBLIType.y2009.year;
  /// hasil: 2009
  ```

- **KBKIType**
  | Enum | Nilai | Deskripsi |
  |------|-------|-----------|
  |KBKI.y2015 | `kbki2015` | KBKI tahun 2015 |

  Untuk melakukan permintaan ke endpoint `detail`, kode KBKI perlu diformat dalam format `kbki_tahun_kode`. Kelas ini juga memfasilitasi proses formatting tersebut melalui metode `urlParamGenerator` yang menerima parameter kode.

  Contoh:

  ```dart
  final url = KBKIType.y2015.urlParamGenerator('24');
  /// hasil: kbki_2015_24
  final value = KBKIType.y2015.value;
  /// hasil: kbki2015
  final year = KBKIType.y2015.year;
  /// hasil: 2015
  ```

### ClassificationLevel

`ClassificationLevel` adalah kelas dasar untuk menentukan kelompok/tingkat klasifikasi. Kelas ini kemudian di-extend oleh `KBLILevel` dan `KBKILevel`. Setiap kelas tersebut memiliki opsi sebagai berikut.

- **KBLILevel**
  | Enum | Nilai | Deskripsi |
  |------|-------|-----------|
  |KBLILevel.category | `kategori` | Merupakan pembagian klasifikasi utama. Ditandai dengan satu huruf alfabet. |
  |KBLILevel.primaryGroup | `golongan pokok` | Detailed description from category, each coded with two digits. |
  |KBLILevel.group | `golongan` | Further details from the primary group, each coded with three digits. The first two indicate the primary group and the last digit the economic activity. |
  |KBLILevel.subGroup | `subgolongan` | Further detail from a group's economic activities, coded with four digits. The first three indicate the group and the last digit specifies the sub-group. |
  |KBLILevel.cluster | `kelompok` | Distinguishes activities within a subgroup into more homogeneous activities, coded with five digits. |

  Kelas ini juga memfasilitasi proses validasi kode KBLI melalui metode `validateCode`.

  Contoh:

  ```dart
  final isValid = KBLILevel.category.validateCode('A');
  /// hasil: true
  final value = KBLILevel.category.value;
  /// hasil: kategori
  ```

- **KBKILevel**
  | Enum | Nilai | Deskripsi |
  |------|-------|-----------|
  |KBKILevel.section | `seksi` | General classification outline, 1-digit code, 5 sections, 0-4. |
  |KBKILevel.division | `divisi` | Detailed description from section, 2-digit code. |
  |KBKILevel.group | `kelompok` | Further details from division, 3-digit code. |
  |KBKILevel.classes | `kelas` | Further details from group, 4-digit code. |
  |KBKILevel.subClass | `subkelas` | Detailed from classes, 5-digit code. |
  |KBKILevel.commodityGroup | `kelompok komoditas` | Detailed from sub-classes, 7-digit code for commodity group. |
  |KBKILevel.commodity | `komoditas` | Detailed from commodity group, 10-digit code for commodities. |

  Kelas ini juga memfasilitasi proses validasi kode KBLI melalui metode `validateCode`.

  Contoh:

  ```dart
  final isValid = KBKILevel.section.validateCode('A');
  /// hasil: false
  final value = KBKILevel.section.value;
  /// hasil: seksi
  ```

## Parameter

| Parameter | Tipe                   | Deskripsi                                                                         |
| --------- | ---------------------- | --------------------------------------------------------------------------------- |
| `type`    | `ClassificationType`   | Menentukan jenis klasifikasi dari enum `KBLIType` atau `KBKIType`.                |
| `level`   | `ClassificationLevel?` | Menentukan tingkat klasifikasi dari enum `KBLILevel` atau `KBKILevel`. (opsional) |
| `lang`    | `DataLanguage`         | Bahasa yang digunakan untuk data KBLI/KBKI (default: `DataLanguage.id`).          |
| `page`    | `int`                  | Nomor halaman (default: 1).                                                       |
| `perPage` | `int`                  | Jumlah data per halaman (default: 10).                                            |

## Contoh

Berikut ini adalah contoh penggunaan:

```dart
// Fetch KBLI/KBKI data from the BPS API
final result = await StadataFlutter.instance.list.statisticClassifications(
  type: KBLIType.y2015,
  level: KBLILevel.category,
);
final statisticClassificationsList = result.data;
final pagination = result.pagination;

// Display page information
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count on This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Display the retrieved statuc classification data
for (final statisticClassifications in statisticClassificationsList) {
    print('Statistic Classification ID: ${statisticClassifications.id}');
    print('Source: ${statisticClassifications.source}');
    print('Title: ${statisticClassifications.title}');
    print('Description: ${statisticClassifications.description}');
    print('Last Update: ${statisticClassifications.lastUpdate}');
    print('Release Date: ${statisticClassifications.releaseDate}');
    print('Previous Classification Items: ${statisticClassifications.previous}');
    print('Derived Classification Items: ${statisticClassifications.derived}');
    print('Flag: ${statisticClassifications.flag}');
    print('Tags: ${statisticClassifications.tags}');
    print('Type: ${statisticClassifications.type}');
    print('Level: ${statisticClassifications.level}');
    print('ISBN: ${statisticClassifications.isbn}');
    print('ISSN: ${statisticClassifications.issn}');
    print('Catalogue Number: ${statisticClassifications.catalogueNumber}');
    print('Publication Number: ${statisticClassifications.publicationNumber}');
    print('Location: ${statisticClassifications.location}');
    print('URL: ${statisticClassifications.url}');
    print('MFD: ${statisticClassifications.mfd}');
}

```

## Properti

- StatisticClassification

| Properti            | Tipe                       | Deskripsi                                |
| ------------------- | -------------------------- | ---------------------------------------- |
| `id`                | `String`                   | Pengidentifikasi unik untuk KBLI/KBKI.   |
| `type`              | `ClassificationType?`      | Jenis klasifikasi.                       |
| `level`             | `ClassificationLevel?`     | Tingkat klasifikasi.                     |
| `source`            | `String`                   | Sumber data.                             |
| `title`             | `String`                   | Judul.                                   |
| `description`       | `String`                   | Deskripsi.                               |
| `isbn`              | `String?`                  | Nomor ISBN.                              |
| `issn`              | `String?`                  | Nomor ISSN.                              |
| `catalogueNumber`   | `String?`                  | Nomor katalog.                           |
| `publicationNumber` | `String?`                  | Nomor publikasi.                         |
| `lastUpdate`        | `DateTime`                 | Tanggal terakhir pembaruan.              |
| `releaseDate`       | `DateTime`                 | Tanggal rilis.                           |
| `location`          | `String?`                  | Lokasi.                                  |
| `url`               | `String?`                  | URL.                                     |
| `mfd`               | `String?`                  | Informasi MFD.                           |
| `previous`          | `List<ClassificationItem>` | Daftar item klasifikasi sebelumnya.      |
| `derived`           | `List<ClassificationItem>` | Daftar item klasifikasi yang diturunkan. |
| `flag`              | `bool`                     | Tanda.                                   |
| `tags`              | `List<String>`             | Daftar tag.                              |

- ClassificationItem

| Properti      | Tipe     | Deskripsi  |
| ------------- | -------- | ---------- |
| `code`        | `String` | Kode.      |
| `title`       | `String` | Judul.     |
| `description` | `String` | Deskripsi. |
