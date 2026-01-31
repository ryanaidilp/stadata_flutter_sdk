# Satuan

API Satuan menyediakan akses ke unit pengukuran standar yang digunakan di seluruh sistem statistik BPS (Badan Pusat Statistik) Indonesia. Satuan merepresentasikan standar pengukuran fundamental yang menentukan bagaimana data statistik dikuantifikasi, memungkinkan interpretasi yang konsisten dan perbandingan nilai-nilai statistik di berbagai dataset, variabel, dan periode waktu.

Pemahaman satuan sangat penting untuk interpretasi data yang tepat, karena satuan menyediakan konteks yang diperlukan untuk memahami apa yang direpresentasikan oleh nilai-nilai statistik dan bagaimana mereka dapat dibandingkan atau diagregasi secara bermakna. Satuan dalam sistem BPS mencakup berbagai jenis pengukuran dari hitungan dasar hingga indikator ekonomi yang kompleks.

## Memahami Satuan BPS

Satuan menyediakan konteks pengukuran yang penting untuk data statistik:

- **Standar Pengukuran**: Definisi standar tentang bagaimana kuantitas diukur
- **Interpretasi Data**: Konteks untuk memahami nilai statistik dan signifikansinya
- **Komparabilitas**: Kerangka kerja untuk membandingkan data di berbagai dataset dan periode waktu
- **Konteks Variabel**: Metadata penting yang menentukan bagaimana variabel dikuantifikasi
- **Fondasi Analisis**: Dasar untuk analisis statistik dan agregasi yang tepat

## Struktur Sistem Satuan

Satuan BPS mencakup kategori pengukuran yang beragam:

- **Satuan Hitungan**: Orang, rumah tangga, perusahaan, kejadian
- **Satuan Rasio**: Persentase, tingkat per populasi, ukuran kepadatan
- **Satuan Ekonomi**: Nilai mata uang, indeks harga, rasio ekonomi
- **Satuan Fisik**: Pengukuran area, volume, berat, jarak
- **Satuan Waktu**: Periode, frekuensi, ukuran durasi
- **Satuan Komposit**: Indikator kompleks yang menggabungkan berbagai dimensi pengukuran

## Parameter

| Parameter    | Tipe           | Deskripsi                                              |
| ------------ | -------------- | ------------------------------------------------------ |
| `domain`     | `String`       | Kode domain (wilayah) untuk mengambil satuan **(wajib)** |
| `lang`       | `DataLanguage` | Bahasa untuk data satuan (default: `DataLanguage.id`) |
| `page`       | `int`          | Nomor halaman (default: `1`)                          |
| `variableID` | `int?`         | ID Variabel untuk memfilter satuan (opsional)         |

## Contoh

### 1. Mengambil Semua Satuan untuk Domain

```dart
// Mengambil satuan dari BPS Jawa Tengah
final unitsResult = await StadataFlutter.instance.list.units(
  domain: '3300', // Kode domain Jawa Tengah
  lang: DataLanguage.id,
);

final units = unitsResult.data;
final pagination = unitsResult.pagination;

// Mencetak informasi paginasi
print('Halaman Saat Ini: ${pagination.page}');
print('Total Halaman: ${pagination.pages}');
print('Jumlah Data di Halaman Ini: ${pagination.count}');
print('Per Halaman: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Mencetak data satuan yang diambil
for (final unit in units) {
  print('ID Satuan: ${unit.id}');
  print('Judul: ${unit.title}');
  print('------------------------');
}
```

### 2. Memfilter Satuan berdasarkan Variabel

```dart
// Mengambil satuan yang terkait dengan variabel tertentu
final variableUnits = await StadataFlutter.instance.list.units(
  domain: '0000', // Tingkat nasional
  lang: DataLanguage.id,
  variableID: 1001, // Contoh ID variabel untuk data populasi
);

// Menganalisis satuan spesifik variabel
print('=== Satuan untuk Variabel 1001 ===');
for (final unit in variableUnits.data) {
  print('Satuan Variabel: ${unit.title}');
  print('ID Satuan: ${unit.id}');
  
  // Mengkategorikan jenis satuan
  final unitTitle = unit.title.toLowerCase();
  if (unitTitle.contains('orang') || unitTitle.contains('jiwa')) {
    print('  Jenis: Satuan hitungan populasi');
  } else if (unitTitle.contains('persen') || unitTitle.contains('%')) {
    print('  Jenis: Satuan persentase');
  } else if (unitTitle.contains('rupiah') || unitTitle.contains('rp')) {
    print('  Jenis: Satuan mata uang');
  } else if (unitTitle.contains('per') || unitTitle.contains('rate')) {
    print('  Jenis: Satuan tingkat/rasio');
  } else {
    print('  Jenis: Satuan pengukuran umum');
  }
  
  print('------------------------');
}
```

### 3. Menjelajahi Jenis Satuan di Berbagai Domain

```dart
// Membandingkan penggunaan satuan di berbagai wilayah
class UnitExplorer {
  static Future<void> exploreUnitsAcrossDomains() async {
    final domains = ['0000', '3100', '3200', '3300']; // Nasional, Jakarta, Jabar, Jateng
    final domainUnits = <String, List<UnitData>>{};
    
    for (final domain in domains) {
      final units = await StadataFlutter.instance.list.units(
        domain: domain,
        lang: DataLanguage.id,
      );
      domainUnits[domain] = units.data;
      
      await Future.delayed(Duration(milliseconds: 300));
    }
    
    print('=== Analisis Distribusi Satuan ===');
    for (final entry in domainUnits.entries) {
      print('Domain ${entry.key}: ${entry.value.length} satuan');
      
      // Mengkategorikan satuan berdasarkan jenis
      final unitCategories = <String, int>{
        'Populasi': 0,
        'Ekonomi': 0,
        'Persentase': 0,
        'Fisik': 0,
        'Lainnya': 0,
      };
      
      for (final unit in entry.value) {
        final title = unit.title.toLowerCase();
        if (title.contains('orang') || title.contains('jiwa') || title.contains('penduduk')) {
          unitCategories['Populasi'] = unitCategories['Populasi']! + 1;
        } else if (title.contains('rupiah') || title.contains('rp') || title.contains('ekonomi')) {
          unitCategories['Ekonomi'] = unitCategories['Ekonomi']! + 1;
        } else if (title.contains('persen') || title.contains('%') || title.contains('rate')) {
          unitCategories['Persentase'] = unitCategories['Persentase']! + 1;
        } else if (title.contains('meter') || title.contains('kg') || title.contains('liter')) {
          unitCategories['Fisik'] = unitCategories['Fisik']! + 1;
        } else {
          unitCategories['Lainnya'] = unitCategories['Lainnya']! + 1;
        }
      }
      
      print('  Jenis Satuan:');
      unitCategories.forEach((type, count) {
        if (count > 0) {
          print('    $type: $count satuan');
        }
      });
      
      print('---');
    }
  }
}
```

### 4. Menganalisis Hubungan Satuan-Variabel

```dart
// Menjelajahi hubungan antara satuan dan variabel
class UnitVariableAnalyzer {
  static Future<void> analyzeUnitVariableRelationships(String domain) async {
    try {
      // 1. Mengambil semua satuan untuk domain
      final allUnits = await StadataFlutter.instance.list.units(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      print('=== Analisis Hubungan Satuan-Variabel ===');
      print('Total Satuan di Domain $domain: ${allUnits.data.length}');
      
      // 2. Mengambil variabel untuk memahami konteks satuan
      final variables = await StadataFlutter.instance.list.variables(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      print('Total Variabel: ${variables.data.length}');
      
      // 3. Menganalisis keragaman satuan dalam variabel
      final variableUnits = <String, int>{};
      final unitUsage = <String, int>{};
      
      for (final variable in variables.data.take(20)) { // Sampel untuk analisis
        final variableSpecificUnits = await StadataFlutter.instance.list.units(
          domain: domain,
          lang: DataLanguage.id,
          variableID: variable.id,
        );
        
        if (variableSpecificUnits.data.isNotEmpty) {
          final primaryUnit = variableSpecificUnits.data.first.title;
          variableUnits[variable.title] = variableSpecificUnits.data.length;
          unitUsage[primaryUnit] = (unitUsage[primaryUnit] ?? 0) + 1;
        }
        
        await Future.delayed(Duration(milliseconds: 100));
      }
      
      // 4. Menghasilkan laporan analisis
      print('\\n=== Analisis Satuan Variabel ===');
      final variablesWithMultipleUnits = variableUnits.entries
          .where((entry) => entry.value > 1)
          .length;
      
      print('Variabel dengan beberapa satuan: $variablesWithMultipleUnits');
      
      print('\\n=== Satuan Paling Umum ===');
      final sortedUnits = unitUsage.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      
      for (final entry in sortedUnits.take(10)) {
        print('${entry.key}: Digunakan dalam ${entry.value} variabel');
      }
      
    } catch (e) {
      print('Kesalahan analisis satuan-variabel: $e');
    }
  }
}
```

### 5. Membangun Sistem Klasifikasi Satuan

```dart
// Membuat sistem klasifikasi dan rekomendasi satuan yang komprehensif
class UnitClassificationSystem {
  static Future<Map<String, List<UnitData>>> classifyUnits(String domain) async {
    final unitClassification = <String, List<UnitData>>{
      'Populasi dan Demografi': [],
      'Ekonomi dan Keuangan': [],
      'Persentase dan Rasio': [],
      'Pengukuran Fisik': [],
      'Berbasis Waktu': [],
      'Geografis dan Spasial': [],
      'Indikator Khusus': [],
    };
    
    try {
      // Mengambil semua satuan
      final units = await StadataFlutter.instance.list.units(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      // Mengklasifikasikan satuan berdasarkan judul dan konteks
      for (final unit in units.data) {
        final title = unit.title.toLowerCase();
        bool classified = false;
        
        // Populasi dan Demografi
        if (title.contains('orang') || title.contains('jiwa') || 
            title.contains('penduduk') || title.contains('keluarga')) {
          unitClassification['Populasi dan Demografi']!.add(unit);
          classified = true;
        }
        
        // Ekonomi dan Keuangan
        if (!classified && (title.contains('rupiah') || title.contains('rp') || 
            title.contains('dollar') || title.contains('ekonomi') || 
            title.contains('harga') || title.contains('nilai'))) {
          unitClassification['Ekonomi dan Keuangan']!.add(unit);
          classified = true;
        }
        
        // Persentase dan Rasio
        if (!classified && (title.contains('persen') || title.contains('%') || 
            title.contains('per') || title.contains('rate') || 
            title.contains('rasio') || title.contains('indeks'))) {
          unitClassification['Persentase dan Rasio']!.add(unit);
          classified = true;
        }
        
        // Pengukuran Fisik
        if (!classified && (title.contains('meter') || title.contains('kg') || 
            title.contains('ton') || title.contains('liter') || 
            title.contains('hektar') || title.contains('km'))) {
          unitClassification['Pengukuran Fisik']!.add(unit);
          classified = true;
        }
        
        // Berbasis Waktu
        if (!classified && (title.contains('tahun') || title.contains('bulan') || 
            title.contains('hari') || title.contains('jam') || 
            title.contains('minggu'))) {
          unitClassification['Berbasis Waktu']!.add(unit);
          classified = true;
        }
        
        // Geografis dan Spasial
        if (!classified && (title.contains('wilayah') || title.contains('daerah') || 
            title.contains('provinsi') || title.contains('kabupaten') || 
            title.contains('kota'))) {
          unitClassification['Geografis dan Spasial']!.add(unit);
          classified = true;
        }
        
        // Indikator Khusus (untuk satuan kompleks)
        if (!classified) {
          unitClassification['Indikator Khusus']!.add(unit);
        }
      }
      
      // Mencetak hasil klasifikasi
      print('=== Hasil Klasifikasi Satuan ===');
      for (final entry in unitClassification.entries) {
        final category = entry.key;
        final categoryUnits = entry.value;
        
        if (categoryUnits.isNotEmpty) {
          print('\\n📊 $category (${categoryUnits.length} satuan)');
          for (final unit in categoryUnits.take(5)) {
            print('  • ${unit.title} (ID: ${unit.id})');
          }
          if (categoryUnits.length > 5) {
            print('  ... dan ${categoryUnits.length - 5} satuan lainnya');
          }
        }
      }
      
      // Menghasilkan rekomendasi
      print('\\n=== Rekomendasi Penggunaan Satuan ===');
      final topCategories = unitClassification.entries
          .where((entry) => entry.value.isNotEmpty)
          .toList()
        ..sort((a, b) => b.value.length.compareTo(a.value.length));
      
      for (final entry in topCategories.take(3)) {
        print('${entry.key}:');
        print('  Satuan Tersedia: ${entry.value.length}');
        print('  Direkomendasikan untuk: ${_getRecommendation(entry.key)}');
        print('');
      }
      
      return unitClassification;
      
    } catch (e) {
      print('Kesalahan klasifikasi satuan: $e');
      return {};
    }
  }
  
  static String _getRecommendation(String category) {
    switch (category) {
      case 'Populasi dan Demografi':
        return 'Studi populasi, analisis demografi, survei rumah tangga';
      case 'Ekonomi dan Keuangan':
        return 'Analisis ekonomi, pelaporan keuangan, studi pasar';
      case 'Persentase dan Rasio':
        return 'Analisis komparatif, studi tren, indikator kinerja';
      case 'Pengukuran Fisik':
        return 'Analisis infrastruktur, manajemen sumber daya, perencanaan fisik';
      case 'Berbasis Waktu':
        return 'Analisis temporal, studi durasi, penelitian time series';
      case 'Geografis dan Spasial':
        return 'Analisis regional, studi spasial, penelitian administratif';
      default:
        return 'Penelitian khusus, analisis statistik lanjutan';
    }
  }
}
```

## Properti (UnitData)

| Properti | Tipe     | Deskripsi                              |
| -------- | -------- | -------------------------------------- |
| `id`     | `int`    | Identifier unik untuk satuan           |
| `title`  | `String` | Nama deskriptif dari satuan pengukuran |

## Kategori Satuan Umum

### Satuan Populasi dan Demografi
- **Hitungan Orang**: `orang`, `jiwa` (orang, individu)
- **Satuan Rumah Tangga**: `keluarga`, `rumah tangga` (keluarga, rumah tangga)
- **Tingkat Populasi**: `per 1000 penduduk` (per 1000 penduduk)
- **Rasio Demografi**: `rasio jenis kelamin` (rasio jenis kelamin)

### Satuan Ekonomi dan Keuangan
- **Mata Uang**: `rupiah`, `ribu rupiah`, `juta rupiah` (mata uang Indonesia)
- **Indikator Ekonomi**: `indeks harga` (indeks harga)
- **Rasio Keuangan**: `rasio utang` (rasio utang)
- **Tingkat Ekonomi**: `tingkat inflasi` (tingkat inflasi)

### Satuan Persentase dan Rasio
- **Persentase**: `persen`, `%` (persentase)
- **Tingkat**: `per 100 ribu`, `per 1000` (per populasi tertentu)
- **Tingkat Pertumbuhan**: `persen pertumbuhan` (persentase pertumbuhan)
- **Rasio Cakupan**: `rasio cakupan` (rasio cakupan)

### Satuan Pengukuran Fisik
- **Area**: `hektar`, `km²`, `m²` (pengukuran area)
- **Berat**: `kg`, `ton`, `gram` (pengukuran berat)
- **Jarak**: `km`, `meter` (pengukuran jarak)
- **Volume**: `liter`, `m³` (pengukuran volume)

### Satuan Berbasis Waktu
- **Periode**: `tahun`, `bulan`, `hari` (tahun, bulan, hari)
- **Frekuensi**: `per tahun`, `bulanan` (tahunan, bulanan)
- **Durasi**: `jam kerja`, `hari kerja` (jam kerja, hari kerja)

## Alur Kerja Penemuan Satuan

Alur kerja tipikal untuk bekerja dengan satuan:

1. **Eksplorasi Satuan**: Menemukan satuan yang tersedia untuk suatu domain
2. **Asosiasi Variabel**: Memahami satuan mana yang digunakan dengan variabel tertentu
3. **Klasifikasi Satuan**: Mengkategorikan satuan berdasarkan jenis pengukuran
4. **Analisis Konteks**: Memahami interpretasi yang tepat dari kombinasi satuan-nilai
5. **Integrasi Data**: Menggunakan informasi satuan untuk analisis dan perbandingan data yang tepat

### Contoh Manajemen Satuan Lengkap

```dart
// Sistem manajemen dan analisis satuan yang komprehensif
class UnitManagementSystem {
  static Future<void> manageCompleteUnitWorkflow() async {
    try {
      // 1. Penemuan satuan multi-domain
      final domains = ['0000', '3100', '3200']; // Nasional, Jakarta, Jabar
      final domainUnitAnalysis = <String, Map<String, dynamic>>{};
      
      for (final domain in domains) {
        final units = await StadataFlutter.instance.list.units(
          domain: domain,
          lang: DataLanguage.id,
        );
        
        // Menganalisis distribusi satuan
        final unitTypes = <String, int>{};
        for (final unit in units.data) {
          final category = _categorizeUnit(unit.title);
          unitTypes[category] = (unitTypes[category] ?? 0) + 1;
        }
        
        domainUnitAnalysis[domain] = {
          'totalUnits': units.data.length,
          'unitTypes': unitTypes,
          'sampleUnits': units.data.take(5).map((u) => u.title).toList(),
        };
        
        await Future.delayed(Duration(milliseconds: 200));
      }
      
      // 2. Analisis lintas domain
      print('=== Analisis Satuan Lintas Domain ===');
      for (final entry in domainUnitAnalysis.entries) {
        final domain = entry.key;
        final analysis = entry.value;
        
        print('Domain $domain:');
        print('  Total Satuan: ${analysis['totalUnits']}');
        
        final unitTypes = analysis['unitTypes'] as Map<String, int>;
        print('  Kategori Satuan:');
        unitTypes.forEach((type, count) {
          print('    $type: $count satuan');
        });
        
        print('  Contoh Satuan:');
        final sampleUnits = analysis['sampleUnits'] as List<String>;
        for (final unit in sampleUnits) {
          print('    • $unit');
        }
        print('');
      }
      
      // 3. Rekomendasi standardisasi satuan
      print('=== Rekomendasi Standardisasi Satuan ===');
      final nationalUnits = domainUnitAnalysis['0000'];
      if (nationalUnits != null) {
        final unitTypes = nationalUnits['unitTypes'] as Map<String, int>;
        final topCategories = unitTypes.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value));
        
        print('Kategori satuan prioritas untuk standardisasi:');
        for (final entry in topCategories.take(5)) {
          print('${entry.key}: ${entry.value} satuan');
          print('  Rekomendasi: ${_getStandardizationRecommendation(entry.key)}');
          print('');
        }
      }
      
    } catch (e) {
      print('Kesalahan manajemen satuan: $e');
    }
  }
  
  static String _categorizeUnit(String unitTitle) {
    final title = unitTitle.toLowerCase();
    
    if (title.contains('orang') || title.contains('jiwa')) {
      return 'Populasi';
    } else if (title.contains('rupiah') || title.contains('rp')) {
      return 'Ekonomi';
    } else if (title.contains('persen') || title.contains('%')) {
      return 'Persentase';
    } else if (title.contains('meter') || title.contains('kg') || title.contains('liter')) {
      return 'Fisik';
    } else if (title.contains('tahun') || title.contains('bulan')) {
      return 'Temporal';
    } else {
      return 'Lainnya';
    }
  }
  
  static String _getStandardizationRecommendation(String category) {
    switch (category) {
      case 'Populasi':
        return 'Standardisasi metode penghitungan orang dan rasio demografi';
      case 'Ekonomi':
        return 'Selaraskan denominasi mata uang dan perhitungan indikator ekonomi';
      case 'Persentase':
        return 'Standardisasi perhitungan persentase dan presentasi rasio';
      case 'Fisik':
        return 'Gunakan standar pengukuran fisik yang konsisten';
      case 'Temporal':
        return 'Standardisasi definisi periode waktu dan frekuensi pelaporan';
      default:
        return 'Tinjau kebutuhan standardisasi khusus';
    }
  }
}
```

## Integrasi dengan Variabel dan Data

### Menggunakan Satuan untuk Interpretasi Data

```dart
// Gunakan informasi satuan untuk interpretasi data statistik yang tepat
Future<void> interpretDataWithUnits(String domain) async {
  try {
    // Mengambil variabel dan satuan terkait
    final variables = await StadataFlutter.instance.list.variables(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    print('=== Interpretasi Data dengan Satuan ===');
    
    for (final variable in variables.data.take(5)) {
      print('\\nVariabel: ${variable.title}');
      print('Satuan: ${variable.unit}');
      
      // Mendapatkan satuan spesifik untuk variabel ini
      final variableUnits = await StadataFlutter.instance.list.units(
        domain: domain,
        variableID: variable.id,
        lang: DataLanguage.id,
      );
      
      if (variableUnits.data.isNotEmpty) {
        print('Satuan pengukuran yang tersedia:');
        for (final unit in variableUnits.data) {
          print('  • ${unit.title}');
        }
        
        // Memberikan panduan interpretasi
        final primaryUnit = variableUnits.data.first.title.toLowerCase();
        if (primaryUnit.contains('orang')) {
          print('  → Interpretasi: Data hitungan - nilai mewakili jumlah orang');
        } else if (primaryUnit.contains('persen')) {
          print('  → Interpretasi: Data rasio - nilai adalah persentase (0-100%)');
        } else if (primaryUnit.contains('rupiah')) {
          print('  → Interpretasi: Data mata uang - nilai dalam Rupiah Indonesia');
        } else if (primaryUnit.contains('per')) {
          print('  → Interpretasi: Data tingkat - nilai per unit populasi');
        } else {
          print('  → Interpretasi: Data pengukuran - periksa satuan untuk skala yang tepat');
        }
      } else {
        print('  Tidak ada satuan spesifik tersedia - gunakan satuan variabel: ${variable.unit}');
      }
      
      await Future.delayed(Duration(milliseconds: 100));
    }
    
  } catch (e) {
    print('Kesalahan interpretasi data: $e');
  }
}
```

## Penanganan Kesalahan

Metode API Satuan mengembalikan `Future<ListResult<UnitData>>` dan dapat melemparkan exception spesifik:

- `UnitException`: Kesalahan terkait satuan (domain tidak valid, kesalahan ID variabel)
- `ApiException`: Kesalahan terkait jaringan atau API
- `ApiKeyNotFoundException`: Kunci API tidak valid atau hilang

```dart
try {
  final result = await StadataFlutter.instance.list.units(
    domain: '3200',
    variableID: 1001,
    lang: DataLanguage.id,
  );
  
  // Memproses hasil yang berhasil
  print('Ditemukan ${result.data.length} satuan');
  
} on UnitException catch (e) {
  print('Kesalahan satuan: ${e.message}');
  // Menangani kesalahan validasi domain atau masalah ID variabel
  
} on ApiException catch (e) {
  print('Kesalahan API: ${e.message}');
  // Menangani kesalahan konektivitas jaringan atau layanan API
  
} catch (e) {
  print('Kesalahan tak terduga: $e');
  // Menangani kesalahan tak terduga lainnya
}
```

## Pertimbangan Kinerja

- **Penyaringan Variabel**: Gunakan ID variabel untuk mendapatkan satuan yang relevan untuk konteks data tertentu
- **Caching Satuan**: Cache definisi satuan karena jarang berubah
- **Efisiensi Klasifikasi**: Klasifikasi satuan terlebih dahulu untuk menghindari pencocokan pola berulang
- **Kesadaran Konteks**: Pertimbangkan satuan bersama dengan variabel untuk interpretasi data yang tepat
- **Standardisasi**: Gunakan interpretasi satuan yang konsisten di seluruh alur kerja analitis
- **Dokumentasi**: Pertahankan dokumentasi yang jelas tentang makna satuan dan penggunaan yang tepat