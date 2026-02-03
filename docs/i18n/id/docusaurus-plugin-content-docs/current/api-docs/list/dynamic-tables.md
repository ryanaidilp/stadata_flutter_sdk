# Tabel Dinamis

API Tabel Dinamis menyediakan akses ke tabel data statistik interaktif dari BPS (Badan Pusat Statistik) Indonesia. Tabel dinamis menawarkan akses data yang lebih fleksibel dibandingkan tabel statis, memungkinkan pengguna untuk memfilter data berdasarkan variabel, periode, dan dimensi lainnya. Tabel ini berisi data statistik mentah yang dapat dikueri dan difilter secara dinamis berdasarkan parameter tertentu.

Tabel dinamis sangat penting bagi peneliti, data scientist, dan analis yang membutuhkan akses granular ke dataset statistik dengan tampilan dan kemampuan filter yang dapat disesuaikan.

## Memahami Tabel Dinamis

Tabel dinamis berbeda dari tabel statis dalam beberapa hal penting:

- **Filter Fleksibel**: Filter data berdasarkan variabel vertikal, variabel turunan, dan periode waktu
- **Akses Data Terstruktur**: Akses data mentah yang diorganisir berdasarkan variabel statistik dan dimensi
- **Analisis Multi-dimensi**: Kueri data di berbagai dimensi termasuk geografis, temporal, dan kategorikal
- **Organisasi Berbasis Subjek**: Tabel diorganisir berdasarkan kategori subjek dan subjek
- **Kueri Real-time**: Data difilter pada saat permintaan berdasarkan parameter yang diberikan

## Struktur Organisasi Tabel

Tabel dinamis BPS mengikuti organisasi hierarkis:

- **Klasifikasi Domain**: Tabel dikelompokkan berdasarkan wilayah geografis (nasional, provinsi, lokal)
- **Kategori Subjek**: Pengelompokan tema statistik tingkat tinggi
- **Subjek**: Topik statistik spesifik dalam kategori
- **Variabel**: Ukuran statistik individual dengan data terkait
- **Dimensi**: Variabel vertikal, variabel turunan, periode, dan periode turunan

## Parameter

| Parameter | Tipe           | Deskripsi                                                      |
| --------- | -------------- | -------------------------------------------------------------- |
| `domain`  | `String`       | Kode domain (wilayah) untuk mengambil tabel dinamis **(wajib)** |
| `lang`    | `DataLanguage` | Bahasa untuk data tabel dinamis (default: `DataLanguage.id`)   |
| `page`    | `int`          | Nomor halaman (default: `1`)                                   |
| `keyword` | `String?`      | Kata kunci untuk mencari tabel dinamis (opsional)              |

## Contoh

### 1. Mendapatkan Semua Tabel Dinamis untuk Domain

```dart
// Ambil tabel dinamis dari BPS Jawa Tengah
final dynamicTableResult = await StadataFlutter.instance.list.dynamicTables(
  domain: '3300', // Kode domain Jawa Tengah
  lang: DataLanguage.id,
);

final dynamicTableList = dynamicTableResult.data;
final pagination = dynamicTableResult.pagination;

// Cetak informasi pagination
print('Halaman Saat Ini: ${pagination.page}');
print('Total Halaman: ${pagination.pages}');
print('Jumlah Data di Halaman Ini: ${pagination.count}');
print('Per Halaman: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Cetak data tabel dinamis yang diambil
for (final table in dynamicTableList) {
  print('ID Variabel: ${table.id}');
  print('Judul: ${table.title}');
  print('ID Subjek: ${table.subjectId}');
  print('Subjek: ${table.subject}');
  print('Variabel Vertikal: ${table.vertical}');
  print('Satuan: ${table.unit}');
  print('Nama Grafik: ${table.graphName}');
  print('------------------------');
}
```

### 2. Mencari Tabel Dinamis berdasarkan Kata Kunci

```dart
// Mencari tabel dinamis terkait populasi
final populationTables = await StadataFlutter.instance.list.dynamicTables(
  domain: '0000', // Level nasional
  lang: DataLanguage.id,
  keyword: 'penduduk', // Mencari tabel populasi
);

// Proses hasil pencarian
for (final table in populationTables.data) {
  print('Tabel Populasi: ${table.title}');
  print('Subjek: ${table.subject}');
  print('Satuan: ${table.unit}');
  print('Grafik: ${table.graphName}');

  // Periksa ketersediaan variabel vertikal
  if (table.vertical != null) {
    print('Variabel Vertikal: ${table.vertical}');
  }

  print('------------------------');
}
```

### 3. Menelusuri Tabel Dinamis dengan Pagination

```dart
// Menelusuri semua tabel dinamis yang tersedia secara sistematis
class DynamicTableBrowser {
  static Future<void> browseAllTables(String domain) async {
    int currentPage = 1;
    bool hasMorePages = true;
    final allTables = <DynamicTable>[];

    while (hasMorePages) {
      final pageResult = await StadataFlutter.instance.list.dynamicTables(
        domain: domain,
        lang: DataLanguage.id,
        page: currentPage,
      );

      allTables.addAll(pageResult.data);
      print('Halaman $currentPage: ${pageResult.data.length} tabel');

      hasMorePages = currentPage < pageResult.pagination.pages;
      currentPage++;

      // Tambahkan delay untuk menghormati batas rate API
      await Future.delayed(Duration(milliseconds: 500));
    }

    print('Total tabel dinamis terkumpul: ${allTables.length}');

    // Analisis distribusi tabel berdasarkan subjek
    final subjectGroups = <String, int>{};
    for (final table in allTables) {
      final subject = table.subject;
      subjectGroups[subject] = (subjectGroups[subject] ?? 0) + 1;
    }

    print('\n=== Tabel berdasarkan Subjek ===');
    subjectGroups.forEach((subject, count) {
      print('$subject: $count tabel');
    });
  }
}
```

## Properti (DynamicTable)

| Properti    | Tipe       | Deskripsi                                                       |
| ----------- | ---------- | --------------------------------------------------------------- |
| `id`        | `int`      | Identifier unik variabel (ID variabel)                          |
| `title`     | `String`   | Judul atau nama variabel tabel dinamis                          |
| `subjectId` | `int`      | Identifier subjek yang terkait dengan tabel                     |
| `subject`   | `String`   | Nama subjek atau kategori tematik                               |
| `vertical`  | `int`      | Identifier variabel vertikal                                    |
| `unit`      | `String`   | Satuan pengukuran untuk nilai data                              |
| `graphName` | `String`   | Nama tampilan untuk representasi grafik/chart                   |

## Integrasi dengan View API

Setelah menemukan tabel dinamis menggunakan List API, gunakan View API untuk mengambil data detail:

```dart
// Workflow: List -> View untuk tabel dinamis
Future<void> dynamicTableWorkflow(String domain) async {
  // 1. Temukan tabel yang diinginkan
  final tables = await StadataFlutter.instance.list.dynamicTables(
    domain: domain,
    keyword: 'penduduk',
  );

  if (tables.data.isNotEmpty) {
    final selectedTable = tables.data.first;

    // 2. Dapatkan data detail dengan filter
    final detailResult = await StadataFlutter.instance.list.dynamicTableDetail(
      variableID: selectedTable.id,
      domain: domain,
      period: '119,120', // Filter berdasarkan periode tertentu
      lang: DataLanguage.id,
    );

    detailResult.fold(
      (failure) => print('Error: $failure'),
      (table) {
        print('Judul: ${table.title}');
        print('Baris data: ${table.dataContent.length}');
      },
    );
  }
}
```

## Penanganan Error

Metode API Tabel Dinamis mengembalikan `Future<ListResult<DynamicTable>>` dan mungkin melempar exception tertentu:

- `DynamicTableException`: Error terkait tabel dinamis (domain tidak valid, variabel tidak ditemukan)
- `ApiException`: Error terkait jaringan atau API
- `ApiKeyNotFoundException`: API key tidak valid atau tidak ada

```dart
try {
  final result = await StadataFlutter.instance.list.dynamicTables(
    domain: '3200',
    keyword: 'ekonomi',
  );

  // Proses hasil sukses
  print('Ditemukan ${result.data.length} tabel dinamis');

} on DynamicTableException catch (e) {
  print('Error tabel dinamis: ${e.message}');
  // Tangani error validasi domain atau masalah pencarian

} on ApiException catch (e) {
  print('Error API: ${e.message}');
  // Tangani masalah konektivitas jaringan atau error layanan API

} catch (e) {
  print('Error tidak terduga: $e');
  // Tangani error tak terduga lainnya
}
```

## Pertimbangan Performa

- **Strategi Pagination**: Gunakan pagination untuk domain dengan banyak tabel dinamis
- **Optimasi Pencarian**: Gunakan kata kunci spesifik untuk mengurangi hasil
- **Caching**: Cache metadata tabel yang sering diakses secara lokal
- **Rate Limiting**: Implementasikan delay antara permintaan untuk pengumpulan data skala besar
- **Loading Dimensi**: Muat dimensi (variabel, periode) hanya saat diperlukan
