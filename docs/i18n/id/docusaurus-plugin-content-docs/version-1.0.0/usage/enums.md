# Enums

STADATA Flutter SDK menyediakan rangkaian enum yang komprehensif yang dirancang untuk menyederhanakan interaksi API, meningkatkan type safety, dan meningkatkan keterbacaan kode. Enum ini berfungsi sebagai konstanta yang terstandardisasi untuk berbagai parameter dan nilai respons di seluruh SDK, memastikan perilaku yang konsisten dan dapat diprediksi di semua operasi data statistik.

Enum ini menghilangkan kebutuhan akan magic string, mengurangi potensi error, dan menyediakan dukungan IntelliSense di IDE Anda, membuat pengembangan lebih efisien dan mengurangi kesalahan saat bekerja dengan data statistik Indonesia dari BPS.

## Bahasa Inti dan Lokalisasi

### Enum `DataLanguage`

Enum `DataLanguage` mengontrol bahasa data yang dikembalikan dari API BPS, mendukung respons dalam bahasa Indonesia dan Inggris yang tersedia.

| Enum | Nilai Parameter | Deskripsi | Status | Konteks Penggunaan |
|------|----------------|-------------|---------|-------------------|
| `DataLanguage.id` | `ind` | Respons dalam bahasa Indonesia | **Default** | Semua panggilan API, direkomendasikan untuk pengguna Indonesia |
| `DataLanguage.en` | `eng` | Respons dalam bahasa Inggris | Tersedia | Pengguna internasional, dokumentasi bahasa Inggris |

#### Contoh Penggunaan

```dart
// Menggunakan bahasa Indonesia default
final domains = await StadataFlutter.instance.list.domains();

// Secara eksplisit meminta data Indonesia
final domainsIndonesian = await StadataFlutter.instance.list.domains(
  lang: DataLanguage.id,
);

// Meminta data bahasa Inggris jika tersedia
final domainsEnglish = await StadataFlutter.instance.list.domains(
  lang: DataLanguage.en,
);

// Pengambilan konten spesifik bahasa
final publication = await StadataFlutter.instance.view.publication(
  id: '03220.2301',
  domain: '0000',
  lang: DataLanguage.id, // Konten Indonesia
);
```

#### Best Practices

- **Perilaku Default**: Ketika tidak ada bahasa yang ditentukan, `DataLanguage.id` digunakan secara otomatis
- **Konsistensi**: Gunakan bahasa yang sama di seluruh aplikasi untuk pengalaman pengguna yang konsisten
- **Strategi Fallback**: Beberapa konten mungkin hanya tersedia dalam bahasa Indonesia; implementasikan logika fallback jika diperlukan
- **Preferensi Pengguna**: Izinkan pengguna memilih bahasa pilihan mereka dan pertahankan pengaturan ini

```dart
// Implementasi preferensi bahasa dengan fallback
Future<Publication?> getPublicationWithFallback(
  String id, 
  String domain, 
  DataLanguage preferredLang,
) async {
  try {
    // Coba bahasa pilihan terlebih dahulu
    final publication = await StadataFlutter.instance.view.publication(
      id: id,
      domain: domain,
      lang: preferredLang,
    );
    
    if (publication != null) return publication;
    
    // Fallback ke bahasa Indonesia jika bahasa pilihan gagal
    if (preferredLang != DataLanguage.id) {
      return await StadataFlutter.instance.view.publication(
        id: id,
        domain: domain,
        lang: DataLanguage.id,
      );
    }
    
    return null;
  } catch (e) {
    // Tangani error dengan tepat
    return null;
  }
}
```

## Klasifikasi Administratif dan Geografis

### Enum `DomainType`

Enum `DomainType` menyederhanakan spesifikasi jenis domain administratif untuk filtering data geografis dan administratif di seluruh struktur pemerintahan Indonesia.

| Enum | Nilai Parameter | Deskripsi | Status | Level Administratif |
|------|----------------|-------------|---------|---------------------|
| `DomainType.all` | `all` | Semua domain administratif termasuk level nasional, provinsi, dan kabupaten | **Default** | Nasional, Provinsi, Kabupaten |
| `DomainType.province` | `prov` | Hanya domain administratif level provinsi | Tersedia | Provinsi |
| `DomainType.regency` | `kab` | Hanya domain administratif level kabupaten dan kota | Tersedia | Kabupaten/Kota |
| `DomainType.regencyByProvince` | `kabbyprov` | Domain kabupaten yang difilter berdasarkan provinsi tertentu | Tersedia | Kabupaten (Difilter Provinsi) |

#### Contoh Penggunaan

```dart
// Dapatkan semua domain administratif (nasional, provinsi, kabupaten)
final allDomains = await StadataFlutter.instance.list.domains(
  type: DomainType.all,
);

// Dapatkan hanya domain provinsi
final provinces = await StadataFlutter.instance.list.domains(
  type: DomainType.province,
);

// Dapatkan hanya domain kabupaten/kota
final regencies = await StadataFlutter.instance.list.domains(
  type: DomainType.regency,
);

// Dapatkan kabupaten dalam provinsi tertentu
final westJavaRegencies = await StadataFlutter.instance.list.domains(
  type: DomainType.regencyByProvince,
  provinceId: '32', // Kode provinsi Jawa Barat
);
```

#### Integrasi Hierarki Administratif

```dart
// Membangun pemilih administratif hierarkis
class AdministrativeSelector {
  static Future<Map<String, List<Domain>>> buildHierarchy() async {
    final hierarchy = <String, List<Domain>>{};
    
    // Muat semua level administratif
    final [allDomains, provinces, regencies] = await Future.wait([
      StadataFlutter.instance.list.domains(type: DomainType.all),
      StadataFlutter.instance.list.domains(type: DomainType.province),
      StadataFlutter.instance.list.domains(type: DomainType.regency),
    ]);
    
    hierarchy['all'] = allDomains.data;
    hierarchy['provinces'] = provinces.data;
    hierarchy['regencies'] = regencies.data;
    
    return hierarchy;
  }
  
  static Future<List<Domain>> getRegenciesByProvince(String provinceId) async {
    final regencies = await StadataFlutter.instance.list.domains(
      type: DomainType.regencyByProvince,
      provinceId: provinceId,
    );
    
    return regencies.data;
  }
}
```

## Ketersediaan Data dan Status

### Enum `DataAvailability`

Enum `DataAvailability` menyediakan indikator status yang terstandardisasi untuk ketersediaan data di semua resource statistik BPS, memungkinkan error handling yang robust dan mekanisme feedback pengguna.

| Enum | Nilai Parameter | Deskripsi | Konteks Penggunaan |
|------|----------------|-------------|-------------------|
| `DataAvailability.available` | `available` | Data tersedia dan dapat diakses | Pengambilan data berhasil |
| `DataAvailability.listNotAvailable` | `list-not-available` | Data koleksi atau list tidak tersedia | Koleksi kosong, hasil terfilter |
| `DataAvailability.notAvailable` | `not-available` | Resource data spesifik tidak tersedia | Resource hilang, akses dibatasi |

#### Contoh Penggunaan

```dart
// Memeriksa ketersediaan data dalam respons API
final publicationsResult = await StadataFlutter.instance.list.publications(
  domain: '7200',
  keyword: 'kata-kunci-langka',
);

// Tangani status ketersediaan yang berbeda
switch (publicationsResult.dataAvailability) {
  case DataAvailability.available:
    print('Ditemukan ${publicationsResult.data.length} publikasi');
    break;
  case DataAvailability.listNotAvailable:
    print('Tidak ada publikasi yang ditemukan untuk kriteria yang ditentukan');
    break;
  case DataAvailability.notAvailable:
    print('Data publikasi tidak tersedia untuk domain ini');
    break;
}
```

#### Penanganan Ketersediaan Data yang Robust

```dart
// Handler ketersediaan data yang komprehensif
class DataAvailabilityHandler {
  static Future<T?> handleDataRetrieval<T>(
    Future<ApiResponse<List<T>>> apiCall,
    String dataType,
  ) async {
    try {
      final result = await apiCall;
      
      switch (result.dataAvailability) {
        case DataAvailability.available:
          if (result.data.isNotEmpty) {
            print('✅ Data $dataType dimuat: ${result.data.length} item');
            return result.data.first;
          } else {
            print('⚠️ Data $dataType tersedia tetapi kosong');
            return null;
          }
          
        case DataAvailability.listNotAvailable:
          print('📭 List $dataType tidak tersedia untuk kriteria saat ini');
          return null;
          
        case DataAvailability.notAvailable:
          print('🚫 Data $dataType tidak tersedia');
          return null;
      }
    } catch (e) {
      print('❌ Error mengambil $dataType: $e');
      return null;
    }
  }
  
  static String getAvailabilityMessage(DataAvailability availability, String dataType) {
    switch (availability) {
      case DataAvailability.available:
        return '$dataType tersedia';
      case DataAvailability.listNotAvailable:
        return 'List $dataType saat ini tidak tersedia';
      case DataAvailability.notAvailable:
        return '$dataType tidak tersedia';
    }
  }
}
```

## Enum Klasifikasi Statistik

### Hierarki Enum `ClassificationType`

SDK menyediakan enum khusus untuk sistem Klasifikasi Baku Lapangan Usaha Indonesia (KBLI) dan Klasifikasi Baku Komoditi Indonesia (KBKI).

#### Enum `KBLIType` (Klasifikasi Industri)

Jenis klasifikasi industri dengan manajemen versi untuk kategorisasi aktivitas ekonomi.

| Enum | Nilai Parameter | Tahun | Deskripsi |
|------|----------------|-------|-------------|
| `KBLIType.y2009` | `kbli2009` | 2009 | Versi KBLI asli berdasarkan ISIC Rev. 4 |
| `KBLIType.y2015` | `kbli2015` | 2015 | Versi yang diperbarui dengan kategori ekonomi yang disempurnakan |
| `KBLIType.y2017` | `kbli2017` | 2017 | Versi yang ditingkatkan dengan aktivitas ekonomi tambahan |
| `KBLIType.y2020` | `kbli2020` | 2020 | Versi terbaru yang menggabungkan aktivitas ekonomi baru |

#### Enum `KBKIType` (Klasifikasi Komoditas)

Jenis klasifikasi komoditas untuk kategorisasi produk dan perdagangan.

| Enum | Nilai Parameter | Tahun | Deskripsi |
|------|----------------|-------|-------------|
| `KBKIType.y2015` | `kbki2015` | 2015 | Standar klasifikasi komoditas saat ini |

#### Contoh Penggunaan

```dart
// Bekerja dengan klasifikasi KBLI
const kbliType = KBLIType.y2020;

// Generate ID klasifikasi yang tepat
final classificationId = kbliType.urlParamGenerator('A'); // Hasil: kbli_2020_A

// Ambil data klasifikasi
final classifications = await StadataFlutter.instance.view.statisticClassifications(
  id: classificationId,
  type: kbliType,
);

// Workflow perbandingan versi
final comparisonResults = await Future.wait([
  StadataFlutter.instance.view.statisticClassifications(
    id: KBLIType.y2015.urlParamGenerator('C'),
    type: KBLIType.y2015,
  ),
  StadataFlutter.instance.view.statisticClassifications(
    id: KBLIType.y2020.urlParamGenerator('C'),
    type: KBLIType.y2020,
  ),
]);
```

### Enum `ClassificationLevel`

Spesifikasi level hierarkis untuk sistem klasifikasi.

#### Enum `KBLILevel` (Level Industri)

| Enum | Nilai Parameter | Deskripsi | Format Kode |
|------|----------------|-------------|-------------|
| `KBLILevel.category` | `category` | Sektor ekonomi utama (A-U) | Huruf tunggal |
| `KBLILevel.primaryGroup` | `primary group` | Divisi ekonomi detail | Dua digit |
| `KBLILevel.group` | `group` | Klasifikasi industri spesifik | Tiga digit |
| `KBLILevel.subGroup` | `subgroup` | Aktivitas bisnis detail | Empat digit |
| `KBLILevel.cluster` | `cluster` | Aktivitas ekonomi paling spesifik | Lima digit |

#### Enum `KBKILevel` (Level Komoditas)

| Enum | Nilai Parameter | Deskripsi | Format Kode |
|------|----------------|-------------|-------------|
| `KBKILevel.section` | `section` | Kategori produk utama (0-4) | Digit tunggal |
| `KBKILevel.division` | `division` | Divisi kategori produk | Dua digit |
| `KBKILevel.group` | `group` | Klasifikasi grup produk | Tiga digit |
| `KBKILevel.classes` | `classes` | Kelas produk spesifik | Empat digit |
| `KBKILevel.subClass` | `subclass` | Spesifikasi produk detail | Lima digit |
| `KBKILevel.commodityGroup` | `commodity group` | Klasifikasi grup komoditas | Tujuh digit |
| `KBKILevel.commodity` | `commodity` | Identifikasi komoditas individual | Sepuluh digit |

#### Contoh Validasi Kode

```dart
// Validasi kode KBLI
final categoryValid = KBLILevel.category.validateCode('A'); // true
final groupValid = KBLILevel.group.validateCode('123'); // true
final invalidCode = KBLILevel.category.validateCode('123'); // false

// Validasi kode KBKI  
final sectionValid = KBKILevel.section.validateCode('0'); // true
final commodityValid = KBKILevel.commodity.validateCode('1234567890'); // true
```

## Pola Integrasi Praktis

### Konfigurasi Berbasis Enum

```dart
// Kelas konfigurasi menggunakan enum untuk type safety
class StatisticalDataConfig {
  final DataLanguage language;
  final DomainType domainType;
  final ClassificationType classificationType;
  
  const StatisticalDataConfig({
    this.language = DataLanguage.id,
    this.domainType = DomainType.all,
    required this.classificationType,
  });
  
  // Factory constructor untuk konfigurasi umum
  factory StatisticalDataConfig.indonesian() => const StatisticalDataConfig(
    language: DataLanguage.id,
    domainType: DomainType.all,
    classificationType: KBLIType.y2020,
  );
  
  factory StatisticalDataConfig.english() => const StatisticalDataConfig(
    language: DataLanguage.en,
    domainType: DomainType.all,
    classificationType: KBLIType.y2020,
  );
}
```

### Error Handling dengan Enum

```dart
// Kategorisasi error berbasis enum
enum DataRetrievalError {
  networkError,
  authenticationError,
  dataNotAvailable,
  invalidParameters,
  serviceUnavailable,
}

class EnumBasedErrorHandler {
  static DataRetrievalError categorizeError(dynamic error) {
    if (error is ApiKeyNotFoundException) {
      return DataRetrievalError.authenticationError;
    } else if (error is ApiException) {
      return DataRetrievalError.serviceUnavailable;
    } else if (error is ValidationException) {
      return DataRetrievalError.invalidParameters;
    } else {
      return DataRetrievalError.networkError;
    }
  }
  
  static String getErrorMessage(DataRetrievalError error) {
    switch (error) {
      case DataRetrievalError.networkError:
        return 'Masalah koneksi jaringan. Silakan periksa koneksi internet Anda.';
      case DataRetrievalError.authenticationError:
        return 'API key tidak valid. Silakan periksa kredensial Anda.';
      case DataRetrievalError.dataNotAvailable:
        return 'Data yang diminta tidak tersedia.';
      case DataRetrievalError.invalidParameters:
        return 'Parameter permintaan tidak valid.';
      case DataRetrievalError.serviceUnavailable:
        return 'Layanan sementara tidak tersedia.';
    }
  }
}
```

## Ekstensi Utilitas Enum

### Metode Ekstensi Kustom

```dart
// Ekstensi berguna untuk fungsionalitas enum
extension DataLanguageExtension on DataLanguage {
  String get displayName {
    switch (this) {
      case DataLanguage.id:
        return 'Bahasa Indonesia';
      case DataLanguage.en:
        return 'English';
    }
  }
  
  String get flagEmoji {
    switch (this) {
      case DataLanguage.id:
        return '🇮🇩';
      case DataLanguage.en:
        return '🇺🇸';
    }
  }
}

extension DomainTypeExtension on DomainType {
  String get description {
    switch (this) {
      case DomainType.all:
        return 'Semua level administratif';
      case DomainType.province:
        return 'Hanya level provinsi';
      case DomainType.regency:
        return 'Hanya level kabupaten/kota';
      case DomainType.regencyByProvince:
        return 'Kabupaten dalam provinsi';
    }
  }
  
  IconData get icon {
    switch (this) {
      case DomainType.all:
        return Icons.public;
      case DomainType.province:
        return Icons.location_on;
      case DomainType.regency:
        return Icons.location_city;
      case DomainType.regencyByProvince:
        return Icons.filter_list;
    }
  }
}
```

## Performa dan Best Practices

### Panduan Penggunaan Enum

1. **Type Safety**: Selalu gunakan enum daripada string literal untuk parameter
2. **Nilai Default**: Manfaatkan nilai default enum untuk menyederhanakan panggilan API
3. **Validasi**: Gunakan metode validasi enum sebelum melakukan panggilan API
4. **Konsistensi**: Pertahankan penggunaan enum yang konsisten di seluruh aplikasi
5. **Dokumentasi**: Dokumentasikan pilihan enum Anda untuk pemahaman tim

### Optimisasi Performa

```dart
// Strategi caching berbasis enum
class EnumBasedCache {
  static final Map<String, dynamic> _cache = {};
  
  static String _generateCacheKey(
    String endpoint,
    DataLanguage language,
    DomainType domainType,
    Map<String, dynamic> params,
  ) {
    return '$endpoint_${language.name}_${domainType.name}_${params.hashCode}';
  }
  
  static Future<T?> getCachedOrFetch<T>(
    String endpoint,
    DataLanguage language,
    DomainType domainType,
    Map<String, dynamic> params,
    Future<T> Function() fetcher,
  ) async {
    final cacheKey = _generateCacheKey(endpoint, language, domainType, params);
    
    if (_cache.containsKey(cacheKey)) {
      return _cache[cacheKey] as T;
    }
    
    final result = await fetcher();
    _cache[cacheKey] = result;
    return result;
  }
}
```

Sistem enum yang komprehensif dalam STADATA Flutter SDK menyediakan cara yang type-safe, efisien, dan dapat dipelihara untuk berinteraksi dengan data statistik Indonesia. Dengan memanfaatkan enum ini secara efektif, Anda dapat membangun aplikasi yang robust yang menangani kompleksitas klasifikasi data statistik dan hierarki administratif dengan mudah.

## Ringkasan

Enum ini berfungsi sebagai fondasi untuk interaksi type-safe dengan STADATA Flutter SDK:

- **`DataLanguage`**: Mengontrol bahasa respons (Indonesia/Inggris)
- **`DomainType`**: Mengelola filtering domain administratif
- **`DataAvailability`**: Menangani status ketersediaan data
- **Enum Klasifikasi**: Menyediakan akses terstruktur ke sistem KBLI/KBKI
- **Enum Level**: Memungkinkan navigasi hierarkis klasifikasi

Dengan menggunakan enum ini secara konsisten, Anda memastikan integrasi yang dapat diandalkan, dapat dipelihara, dan bebas error dengan data statistik resmi Indonesia melalui sistem API BPS.