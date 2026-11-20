# List

Properti `list` mengembalikan kelas `ListResult`, yang mencakup dua properti utama:

1. **Properti Data:**

   - Properti `data` berisi daftar data berdasarkan jenis yang ditentukan. Misalnya, jika Anda mengambil publikasi, data akan berupa `List<Publication>`.

2. **Properti Paginasi:**

   - Properti `pagination` adalah contoh dari entitas `Pagination`, yang memberikan informasi terkait paginasi. Ini mencakup properti berikut:
     - `page`: Halaman saat ini.
     - `pages`: Jumlah total halaman.
     - `count`: Jumlah entri data pada halaman saat ini.
     - `perPage`: Jumlah entri per halaman.
     - `total`: Jumlah total entri data.

3. **Data Availability Property:**

- Properti `dataAvailability` adalah `DataAvailability` enum, yang memberikan informasi terkait ketersediaan data. Ini mencakup beberapa nilai:
  - `DataAvailability.available`: Mengindikasikan bahwa data tersedia.
  - `DataAvailability.listUnavailable`: Mengindikasikan bahwa daftar data yang diminta tidak tersedia.
  - `DataAvailability.unavailable`: Mengindikasikan bahwa data yang diminta tidak tersedia.

Untuk mengambil daftar model, ikuti langkah-langkah ini:

1. Buat instansiasi `StadataFlutter`.

2. Akses pengambil `list` dari instansi tersebut, memberi Anda akses ke berbagai model dari domain, publikasi, rilis pers, data sensus, dan lain-lain.

3. Gunakan metode `list` dengan parameter yang diinginkan. Misalnya:

   ```dart
   // Ambil publikasi untuk domain tertentu
   var publicationsResult = await StadataFlutter.instance.list.publications(domain: '7200');
   
   // Ambil data sensus (FITUR BARU!)
   var censusResult = await StadataFlutter.instance.list.census();
   
   // Ambil topik sensus untuk Sensus Penduduk 2020
   var topicsResult = await StadataFlutter.instance.list.censusTopics(censusID: 'sp2020');
   
   // Ambil dataset sensus untuk topik tertentu
   var datasetsResult = await StadataFlutter.instance.list.censusEventDatasets(
     censusID: 'sp2020',
     topicID: 20,
   );
   ```

Pemanggilan ini akan memberi Anda `ListResult` yang berisi data dengan tipe yang sesuai dan informasi paginasi untuk navigasi lebih lanjut.

## Contoh Data Sensus

SDK sekarang mendukung akses data sensus yang komprehensif:

```dart
// 1. Dapatkan semua jenis sensus yang tersedia
final censusTypes = await StadataFlutter.instance.list.census();
print('Jenis sensus yang tersedia: ${censusTypes.data.length}');

// 2. Dapatkan topik untuk sensus tertentu
final topics = await StadataFlutter.instance.list.censusTopics(
  censusID: 'sp2020', // Sensus Penduduk 2020
);
print('Topik yang tersedia: ${topics.data.length}');

// 3. Dapatkan wilayah geografis untuk sensus
final areas = await StadataFlutter.instance.list.censusEventAreas(
  censusID: 'sp2020',
);
print('Wilayah dengan data: ${areas.data.length}');

// 4. Dapatkan dataset aktual
final datasets = await StadataFlutter.instance.list.censusEventDatasets(
  censusID: 'sp2020',
  topicID: 20, // Topik demografi
);
print('Dataset yang tersedia: ${datasets.data.length}');
```
