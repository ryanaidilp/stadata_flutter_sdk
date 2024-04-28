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

2. Akses pengambil `list` dari instansi tersebut, memberi Anda akses ke berbagai model dari domain, publikasi, rilis pers, dan lain-lain.

3. Gunakan metode `list` dengan parameter yang diinginkan. Misalnya:

   ```dart
   var result = await StadataFlutter.instance.list.publications(domain: '7200');
   ```

Kode diatas ini akan memberi Anda `ListResult` yang berisi data tipe `List<Publication>` dan informasi paginasi untuk navigasi lebih lanjut.
