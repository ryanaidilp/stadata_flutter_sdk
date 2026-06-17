# Variabel

API Variabel menyediakan akses ke sistem variabel komprehensif yang digunakan oleh BPS (Badan Pusat Statistik) Indonesia untuk mengorganisir dan mengklasifikasi semua elemen data dalam ekosistem statistik Indonesia. Variabel merupakan blok bangunan fundamental dari semua data statistik, yang mendefinisikan dimensi, atribut, dan karakteristik spesifik yang diukur dan dilaporkan dalam berbagai survei, sensus, dan studi statistik.

Memahami sistem variabel BPS sangat penting untuk analisis data yang efektif, karena variabel menyediakan metadata struktural yang memungkinkan interpretasi yang tepat, perbandingan yang bermakna, dan integrasi data di berbagai sumber dan periode waktu.

## Memahami Sistem Variabel BPS

Variabel menyediakan kerangka kerja organisasi yang komprehensif untuk data statistik:

- **Definisi Data**: Spesifikasi tepat tentang apa yang diukur dan bagaimana cara mengukurnya
- **Konteks Struktural**: Kerangka hierarkis yang menghubungkan variabel dengan subjek, kategori, dan domain
- **Konsistensi Metrik**: Standarisasi pengukuran di berbagai dataset dan periode waktu
- **Integrasi Analitis**: Fondasi untuk analisis lintas-dataset dan perbandingan temporal
- **Dokumentasi Metadata**: Informasi kontekstual yang komprehensif termasuk unit, catatan, dan derivasi

## Arsitektur Sistem Variabel

Sistem variabel BPS dirancang untuk mendukung analisis statistik yang kompleks:

- **Hierarki Subjek**: Variabel diorganisir dalam struktur subjek tematik untuk navigasi yang logis
- **Klasifikasi Tipe**: Berbagai tipe variabel untuk mendukung metodologi analitik yang beragam
- **Hubungan Vertikal**: Koneksi ke variabel vertikal untuk analisis hierarkis
- **Derivasi Temporal**: Dukungan untuk variabel turunan dan hubungan periode
- **Sistem Unit**: Standardisasi unit pengukuran untuk konsistensi data
- **Konteks CSA**: Integrasi dengan sistem subjek lintas-sektoral untuk analisis komprehensif

## Parameter

| Parameter              | Tipe           | Deskripsi                                                                                                                                                                                                                                                                                                                              |
| ---------------------- | -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `domain`               | `String`       | Kode domain (wilayah) untuk mengambil variabel **(wajib)**                                                                                                                                                                                                                                                                            |
| `lang`                 | `DataLanguage` | Bahasa untuk data variabel (default: `DataLanguage.id`)                                                                                                                                                                                                                                                                               |
| `page`                 | `int`          | Nomor halaman (default: `1`)                                                                                                                                                                                                                                                                                                          |
| `subjectID`            | `int?`         | ID subjek untuk memfilter variabel berdasarkan area tematik (opsional)                                                                                                                                                                                                                                                               |
| `showExistingVariable` | `bool`         | Menentukan apakah hanya menampilkan variabel yang memiliki data dalam domain. Ketika `true`, memfilter untuk variabel dengan nilai yang ada di domain (default: `false`)                                                                                                                                                           |
| `year`                 | `int?`         | Tahun spesifik untuk permintaan variabel (opsional)                                                                                                                                                                                                                                                                                   |

## Contoh

### 1. Mengambil Semua Variabel untuk Domain

```dart
// Mengambil variabel dari BPS Jawa Tengah
final result = await StadataFlutter.instance.list.variables(
  domain: '3300', // Kode domain Jawa Tengah
  lang: DataLanguage.id,
);

final variables = result.data;
final pagination = result.pagination;

// Mencetak informasi paginasi
print('Halaman Saat Ini: ${pagination.page}');
print('Total Halaman: ${pagination.pages}');
print('Jumlah Data di Halaman Ini: ${pagination.count}');
print('Per Halaman: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Mencetak data variabel yang diambil
for (final variable in variables) {
  print('ID Variabel: ${variable.id}');
  print('Judul: ${variable.title}');
  print('ID Subjek: ${variable.subjectID}');
  print('Nama Subjek: ${variable.subjectName}');
  print('Unit: ${variable.unit}');
  print('Tipe: ${variable.type ?? 'Tidak ditentukan'}');
  print('Catatan: ${variable.notes}');
  print('ID Variabel Vertikal: ${variable.verticalVariableID}');
  print('------------------------');
}
```

### 2. Memfilter Variabel berdasarkan Subjek

```dart
// Mengambil variabel untuk subjek ekonomi tertentu
final economicVariables = await StadataFlutter.instance.list.variables(
  domain: '0000', // Level nasional
  lang: DataLanguage.id,
  subjectID: 5, // Contoh ID subjek ekonomi
  showExistingVariable: true, // Hanya variabel dengan data
);

// Menganalisis variabel ekonomi
print('=== Variabel Ekonomi ===');
for (final variable in economicVariables.data) {
  print('Variabel Ekonomi: ${variable.title}');
  print('Subjek: ${variable.subjectName}');
  print('Unit: ${variable.unit}');
  print('Nama Grafik: ${variable.graphName}');
  
  // Mengkategorikan berdasarkan unit
  if (variable.unit.toLowerCase().contains('persen') || variable.unit.contains('%')) {
    print('  Kategori: Indikator persentase');
  } else if (variable.unit.toLowerCase().contains('rupiah') || variable.unit.toLowerCase().contains('rp')) {
    print('  Kategori: Indikator moneter');
  } else if (variable.unit.toLowerCase().contains('orang') || variable.unit.toLowerCase().contains('jiwa')) {
    print('  Kategori: Indikator demografis');
  } else {
    print('  Kategori: Indikator umum');
  }
  
  // Memeriksa variabel turunan
  if (variable.derivedVariableID != null) {
    print('  Status: Variabel turunan (ID: ${variable.derivedVariableID})');
  }
  
  print('------------------------');
}
```

### 3. Mengeksplorasi Variabel di Berbagai Domain

```dart
// Membandingkan ketersediaan variabel di berbagai wilayah
class VariableExplorer {
  static Future<void> compareVariablesAcrossDomains() async {
    final domains = ['0000', '3100', '3200', '3300']; // Nasional, Jakarta, Jawa Barat, Jawa Tengah
    final domainVariables = <String, List<Variable>>{};
    
    for (final domain in domains) {
      final variables = await StadataFlutter.instance.list.variables(
        domain: domain,
        lang: DataLanguage.id,
        showExistingVariable: true, // Hanya variabel dengan data
      );
      domainVariables[domain] = variables.data;
      
      await Future.delayed(Duration(milliseconds: 300));
    }
    
    print('=== Analisis Distribusi Variabel ===');
    for (final entry in domainVariables.entries) {
      print('Domain ${entry.key}: ${entry.value.length} variabel');
      
      // Menganalisis distribusi subjek
      final subjects = <String, int>{};
      final units = <String, int>{};
      
      for (final variable in entry.value) {
        subjects[variable.subjectName] = (subjects[variable.subjectName] ?? 0) + 1;
        units[variable.unit] = (units[variable.unit] ?? 0) + 1;
      }
      
      print('  Subjek unik: ${subjects.keys.length}');
      print('  Unit unik: ${units.keys.length}');
      
      // Menemukan subjek teratas
      if (subjects.isNotEmpty) {
        final topSubject = subjects.entries.reduce((a, b) => a.value > b.value ? a : b);
        print('  Subjek terpopuler: ${topSubject.key} (${topSubject.value} variabel)');
      }
      
      print('---');
    }
  }
}
```

### 4. Sistem Penemuan Variabel Lanjutan

```dart
// Sistem penemuan dan analisis variabel yang komprehensif
class VariableDiscoverySystem {
  static Future<void> discoverVariableStructure(String domain) async {
    try {
      // 1. Mengambil semua variabel untuk domain
      final allVariables = await StadataFlutter.instance.list.variables(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      print('=== Penemuan Struktur Variabel ===');
      print('Total variabel di domain $domain: ${allVariables.data.length}');
      
      // 2. Menganalisis distribusi berdasarkan subjek
      final subjectGroups = <String, List<Variable>>{};
      for (final variable in allVariables.data) {
        final subjectName = variable.subjectName;
        subjectGroups[subjectName] = (subjectGroups[subjectName] ?? [])..add(variable);
      }
      
      print('Subjek yang tersedia: ${subjectGroups.keys.length}');
      
      // 3. Menganalisis setiap subjek
      for (final entry in subjectGroups.entries) {
        final subjectName = entry.key;
        final variables = entry.value;
        
        print('\\n=== Subjek: $subjectName ===');
        print('Jumlah variabel: ${variables.length}');
        
        // Menganalisis tipe unit
        final unitDistribution = <String, int>{};
        final typeDistribution = <int, int>{};
        
        for (final variable in variables) {
          unitDistribution[variable.unit] = (unitDistribution[variable.unit] ?? 0) + 1;
          if (variable.type != null) {
            typeDistribution[variable.type!] = (typeDistribution[variable.type!] ?? 0) + 1;
          }
        }
        
        print('Unit yang berbeda: ${unitDistribution.keys.length}');
        print('Tipe variabel: ${typeDistribution.keys.length}');
        
        // Menampilkan unit teratas
        final sortedUnits = unitDistribution.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value));
        
        print('Unit teratas:');
        for (final unitEntry in sortedUnits.take(3)) {
          print('  ${unitEntry.key}: ${unitEntry.value} variabel');
        }
        
        // Memeriksa variabel turunan
        final derivedVariables = variables
            .where((v) => v.derivedVariableID != null || v.derivedPeriodID != null)
            .length;
        
        if (derivedVariables > 0) {
          print('Variabel turunan: $derivedVariables');
        }
        
        // Menampilkan sample variabel
        print('Sample variabel:');
        for (final variable in variables.take(2)) {
          print('  • ${variable.title} (${variable.unit})');
        }
      }
      
      // 4. Analisis hubungan vertikal
      final verticalRelations = allVariables.data
          .where((v) => v.verticalVariableID != 0)
          .length;
      
      print('\\n=== Analisis Hubungan ===');
      print('Variabel dengan hubungan vertikal: $verticalRelations');
      
      // 5. Analisis konteks CSA
      final csaVariables = allVariables.data
          .where((v) => v.csaSubjectName != null && v.csaSubjectName!.isNotEmpty)
          .length;
      
      print('Variabel dengan konteks CSA: $csaVariables');
      
    } catch (e) {
      print('Error penemuan variabel: $e');
    }
  }
}
```

### 5. Sistem Pemetaan dan Analisis Variabel

```dart
// Sistem analisis komprehensif untuk pemetaan variabel dan hubungan
class VariableMappingSystem {
  static Future<void> mapVariableRelationships(String domain) async {
    try {
      // 1. Mengambil variabel dengan berbagai konfigurasi
      final allVariables = await StadataFlutter.instance.list.variables(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      final existingVariables = await StadataFlutter.instance.list.variables(
        domain: domain,
        lang: DataLanguage.id,
        showExistingVariable: true,
      );
      
      print('=== Pemetaan Hubungan Variabel ===');
      print('Total variabel: ${allVariables.data.length}');
      print('Variabel dengan data: ${existingVariables.data.length}');
      print('Rasio ketersediaan data: ${(existingVariables.data.length / allVariables.data.length * 100).toStringAsFixed(1)}%');
      
      // 2. Menganalisis struktur derivasi
      final derivationMap = <int, List<Variable>>{};
      final periodDerivationMap = <int, List<Variable>>{};
      
      for (final variable in allVariables.data) {
        if (variable.derivedVariableID != null) {
          derivationMap[variable.derivedVariableID!] = 
              (derivationMap[variable.derivedVariableID!] ?? [])..add(variable);
        }
        
        if (variable.derivedPeriodID != null) {
          periodDerivationMap[variable.derivedPeriodID!] = 
              (periodDerivationMap[variable.derivedPeriodID!] ?? [])..add(variable);
        }
      }
      
      print('\\n=== Analisis Derivasi ===');
      print('Derivasi variabel: ${derivationMap.keys.length} sumber');
      print('Derivasi periode: ${periodDerivationMap.keys.length} periode');
      
      if (derivationMap.isNotEmpty) {
        print('\\nContoh derivasi variabel:');
        for (final entry in derivationMap.entries.take(3)) {
          final sourceId = entry.key;
          final derivedVars = entry.value;
          print('  Variabel sumber ID $sourceId → ${derivedVars.length} variabel turunan');
          
          for (final derived in derivedVars.take(2)) {
            print('    • ${derived.title}');
          }
        }
      }
      
      // 3. Menganalisis jaringan subjek
      final subjectNetwork = <int, Map<String, dynamic>>{};
      
      for (final variable in allVariables.data) {
        final subjectId = variable.subjectID;
        if (!subjectNetwork.containsKey(subjectId)) {
          subjectNetwork[subjectId] = {
            'name': variable.subjectName,
            'variables': <Variable>[],
            'units': <String>{},
            'types': <int>{},
          };
        }
        
        subjectNetwork[subjectId]!['variables'].add(variable);
        (subjectNetwork[subjectId]!['units'] as Set<String>).add(variable.unit);
        if (variable.type != null) {
          (subjectNetwork[subjectId]!['types'] as Set<int>).add(variable.type!);
        }
      }
      
      print('\\n=== Jaringan Subjek ===');
      final sortedSubjects = subjectNetwork.entries.toList()
        ..sort((a, b) => (b.value['variables'] as List).length.compareTo((a.value['variables'] as List).length));
      
      for (final entry in sortedSubjects.take(5)) {
        final subjectId = entry.key;
        final subjectData = entry.value;
        final variables = subjectData['variables'] as List<Variable>;
        final units = subjectData['units'] as Set<String>;
        final types = subjectData['types'] as Set<int>;
        
        print('Subjek ${subjectData['name']} (ID: $subjectId):');
        print('  Variabel: ${variables.length}');
        print('  Unit unik: ${units.length}');
        print('  Tipe unik: ${types.length}');
        
        // Menganalisis kelengkapan data
        final withData = variables.where((v) => 
            existingVariables.data.any((ev) => ev.id == v.id)).length;
        final dataCompleteness = variables.isNotEmpty ? (withData / variables.length) : 0.0;
        
        print('  Kelengkapan data: ${(dataCompleteness * 100).toStringAsFixed(1)}%');
        
        if (dataCompleteness > 0.8) {
          print('  Status: Subjek dengan data lengkap');
        } else if (dataCompleteness > 0.5) {
          print('  Status: Subjek dengan data sebagian');
        } else {
          print('  Status: Subjek dengan data terbatas');
        }
        
        print('');
      }
      
      // 4. Rekomendasi pemanfaatan
      print('=== Rekomendasi Pemanfaatan ===');
      final totalVariables = allVariables.data.length;
      final dataAvailabilityRatio = existingVariables.data.length / totalVariables;
      
      if (dataAvailabilityRatio > 0.7) {
        print('Domain ini memiliki ketersediaan data tinggi (${(dataAvailabilityRatio * 100).toStringAsFixed(1)}%)');
        print('Rekomendasi: Ideal untuk analisis komprehensif dan studi longitudinal');
      } else if (dataAvailabilityRatio > 0.4) {
        print('Domain ini memiliki ketersediaan data sedang (${(dataAvailabilityRatio * 100).toStringAsFixed(1)}%)');
        print('Rekomendasi: Cocok untuk analisis terfokus pada subjek dengan data lengkap');
      } else {
        print('Domain ini memiliki ketersediaan data terbatas (${(dataAvailabilityRatio * 100).toStringAsFixed(1)}%)');
        print('Rekomendasi: Fokus pada variabel eksisting atau gunakan domain alternatif');
      }
      
      final highDataSubjects = sortedSubjects.where((entry) {
        final variables = entry.value['variables'] as List<Variable>;
        final withData = variables.where((v) => 
            existingVariables.data.any((ev) => ev.id == v.id)).length;
        return variables.isNotEmpty && (withData / variables.length) > 0.8;
      }).length;
      
      print('Subjek dengan data lengkap: $highDataSubjects dari ${subjectNetwork.length}');
      
    } catch (e) {
      print('Error pemetaan variabel: $e');
    }
  }
}
```

## Properti (Variable)

| Properti             | Tipe      | Deskripsi                                                                |
| -------------------- | --------- | ------------------------------------------------------------------------ |
| `id`                 | `int`     | Pengenal unik untuk variabel                                             |
| `title`              | `String`  | Judul resmi atau label dari variabel                                     |
| `subjectID`          | `int`     | Pengenal untuk subjek yang berisi variabel ini                           |
| `subjectName`        | `String`  | Nama subjek tematik tempat variabel berada                               |
| `verticalVariableID` | `int`     | Pengenal untuk variabel vertikal terkait                                 |
| `csaSubjectName`     | `String?` | Nama subjek lintas-sektoral yang terkait dengan variabel (opsional)      |
| `graphName`          | `String`  | Nama deskriptif yang digunakan untuk keperluan visualisasi grafis        |
| `notes`              | `String`  | Catatan atau deskripsi tambahan tentang variabel                         |
| `unit`               | `String`  | Satuan pengukuran dari variabel                                          |
| `type`               | `int?`    | Klasifikasi tipe dari variabel (opsional)                                |
| `derivedPeriodID`    | `int?`    | Pengenal untuk periode turunan dalam analisis temporal (opsional)        |
| `derivedVariableID`  | `int?`    | Pengenal untuk variabel sumber dalam hubungan derivasi (opsional)        |

## Kategori Variabel Umum

### Variabel Ekonomi
- **Indikator Makroekonomi**: PDB, inflasi, pertumbuhan ekonomi, indeks harga
- **Indikator Ketenagakerjaan**: Tingkat pengangguran, partisipasi angkatan kerja, upah
- **Indikator Perdagangan**: Ekspor, impor, neraca perdagangan, investasi
- **Indikator Keuangan**: Indikator perbankan, pasar modal, kebijakan moneter

### Variabel Demografis dan Sosial
- **Statistik Penduduk**: Jumlah penduduk, distribusi umur, jenis kelamin, migrasi
- **Indikator Pendidikan**: Tingkat melek huruf, partisipasi sekolah, pencapaian pendidikan
- **Indikator Kesehatan**: Angka kematian, kelahiran, akses layanan kesehatan, status gizi
- **Indikator Kemiskinan**: Tingkat kemiskinan, distribusi pendapatan, garis kemiskinan

### Variabel Infrastruktur dan Lingkungan
- **Infrastruktur Fisik**: Jalan, listrik, telekomunikasi, transportasi
- **Indikator Lingkungan**: Kualitas udara, air, pengelolaan limbah, energi terbarukan
- **Perumahan**: Kondisi perumahan, akses fasilitas, kepemilikan rumah
- **Teknologi**: Akses internet, penggunaan ICT, inovasi teknologi

### Variabel Administrasi dan Governance
- **Indikator Pemerintahan**: Efektivitas layanan publik, transparansi, akuntabilitas
- **Statistik Regional**: Indikator pembangunan daerah, otonomi daerah
- **Keamanan**: Statistik kejahatan, ketertiban umum, keadilan hukum

## Alur Kerja Penemuan Variabel

Alur kerja tipikal untuk bekerja dengan variabel:

1. **Eksplorasi Domain**: Temukan variabel yang tersedia untuk wilayah yang diminati
2. **Filtering Subjek**: Gunakan ID subjek untuk fokus pada area tematik tertentu
3. **Analisis Ketersediaan**: Gunakan `showExistingVariable` untuk mengidentifikasi variabel dengan data
4. **Pemetaan Hubungan**: Pahami hubungan derivasi dan vertikal antara variabel
5. **Integrasi Analitis**: Gunakan variabel sebagai dasar untuk kueri data dan analisis

## Integrasi dengan API Lain

### Membangun Sistem Analisis Data Komprehensif

```dart
// Mengintegrasikan variabel dengan sumber data BPS lainnya
Future<void> buildDataAnalysisSystem(String domain) async {
  try {
    // Mendapatkan informasi domain
    final domains = await StadataFlutter.instance.list.domains();
    final currentDomain = domains.data.firstWhere((d) => d.id == domain);
    
    // Mendapatkan variabel dengan data
    final variables = await StadataFlutter.instance.list.variables(
      domain: domain,
      lang: DataLanguage.id,
      showExistingVariable: true,
    );
    
    // Mendapatkan tabel statis untuk konteks data
    final staticTables = await StadataFlutter.instance.list.staticTable(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    // Mendapatkan indikator strategis
    final indicators = await StadataFlutter.instance.list.strategicIndicators(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    print('=== Sistem Analisis Data ${currentDomain.name} ===');
    print('Variabel dengan Data: ${variables.data.length}');
    print('Tabel Statis: ${staticTables.data.length}');
    print('Indikator Strategis: ${indicators.data.length}');
    
    // Analisis referensi silang
    print('\\n=== Integrasi Variabel-Indikator ===');
    final variableIds = variables.data.map((v) => v.id).toSet();
    final indicatorVariableIds = indicators.data.map((i) => i.variableID).toSet();
    
    final sharedVariableIds = variableIds.intersection(indicatorVariableIds);
    print('Variabel terintegrasi dengan indikator: ${sharedVariableIds.length}');
    
    if (sharedVariableIds.isNotEmpty) {
      print('Contoh integrasi:');
      for (final id in sharedVariableIds.take(3)) {
        final variable = variables.data.firstWhere((v) => v.id == id);
        final indicator = indicators.data.firstWhere((i) => i.variableID == id);
        
        print('  Variabel: ${variable.title}');
        print('  Indikator: ${indicator.name}');
        print('  Unit: ${variable.unit}');
        print('---');
      }
    }
    
  } catch (e) {
    print('Error pembuatan sistem analisis: $e');
  }
}
```

## Penanganan Error

Metode API Variabel mengembalikan `Future<ListResult<Variable>>` dan dapat menimbulkan exception spesifik:

- `VariableException`: Error terkait variabel (domain tidak valid, error ID subjek)
- `ApiException`: Error terkait jaringan atau API
- `ApiKeyNotFoundException`: API key tidak valid atau hilang

```dart
try {
  final result = await StadataFlutter.instance.list.variables(
    domain: '3200',
    subjectID: 5,
    showExistingVariable: true,
    lang: DataLanguage.id,
  );
  
  // Memproses hasil yang berhasil
  print('Ditemukan ${result.data.length} variabel');
  
} on VariableException catch (e) {
  print('Error variabel: ${e.message}');
  // Menangani error validasi domain atau masalah ID subjek
  
} on ApiException catch (e) {
  print('Error API: ${e.message}');
  // Menangani error konektivitas jaringan atau layanan API
  
} catch (e) {
  print('Error tidak terduga: $e');
  // Menangani error tak terduga lainnya
}
```

## Pertimbangan Performa

- **Filtering Efisien**: Gunakan `showExistingVariable: true` untuk memfokuskan pada variabel dengan data aktual
- **Scoping Subjek**: Gunakan ID subjek untuk membatasi ruang lingkup kueri pada area tematik yang relevan
- **Caching Metadata**: Cache informasi variabel karena berubah relatif jarang dibandingkan data aktual
- **Analisis Batch**: Implementasikan analisis batch untuk perbandingan multi-domain yang efisien
- **Optimisasi Hubungan**: Gunakan informasi derivasi untuk membangun kueri hierarkis yang efisien
- **Manajemen Memori**: Pertimbangkan ukuran dataset saat memuat variabel untuk domain besar