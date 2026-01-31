# Variabel Vertikal

API Variabel Vertikal menyediakan akses ke struktur variabel khusus yang digunakan oleh BPS (Badan Pusat Statistik) Indonesia untuk mengorganisir hubungan data hierarkis yang kompleks. Variabel vertikal merupakan sistem klasifikasi canggih yang memungkinkan analisis data multi-dimensi dengan mengorganisir variabel dalam struktur hubungan vertikal yang mencerminkan koneksi hierarkis dunia nyata.

Variabel vertikal sangat penting untuk memahami hubungan data berlapis dalam statistik Indonesia, terutama dalam domain kompleks seperti indikator ekonomi, hierarki administratif, dan klasifikasi demografis. Variabel-variabel ini memungkinkan peneliti dan analis mengeksplorasi data di berbagai tingkat organisasi secara bersamaan.

## Memahami Variabel Vertikal BPS

Variabel vertikal menyediakan akses terstruktur ke hubungan data hierarkis:

- **Organisasi Hierarkis**: Variabel yang diorganisir dalam hubungan induk-anak dan kelompok
- **Analisis Multi-Level**: Dukungan untuk analisis di berbagai tingkat organisasi
- **Klasifikasi Kelompok**: Pengelompokan sistematis variabel terkait untuk analisis komprehensif
- **Pemetaan Dimensional**: Kerangka kerja untuk memahami dimensi dan hubungan data yang kompleks
- **Fleksibilitas Analitis**: Dukungan untuk operasi analitis drill-down dan roll-up

## Struktur Sistem Variabel Vertikal

Variabel vertikal BPS dirancang untuk menangani hubungan data yang kompleks:

- **Hierarki Variabel**: Organisasi variabel multi-level dengan hubungan induk-anak yang jelas
- **Klasifikasi Kelompok**: Pengelompokan sistematis variabel berdasarkan kriteria tematik dan fungsional
- **Spesifikasi Item**: Organisasi tingkat item yang detail dalam kelompok variabel
- **Tautan Lintas-Dimensi**: Hubungan yang mencakup berbagai dimensi data
- **Konteks Analitis**: Dukungan untuk perspektif dan kasus penggunaan analitis yang berbeda

## Parameter

| Parameter    | Tipe           | Deskripsi                                                         |
| ------------ | -------------- | ----------------------------------------------------------------- |
| `domain`     | `String`       | Kode domain (wilayah) untuk mengambil variabel vertikal **(wajib)** |
| `lang`       | `DataLanguage` | Bahasa untuk data variabel vertikal (default: `DataLanguage.id`) |
| `page`       | `int`          | Nomor halaman (default: `1`)                                     |
| `variableID` | `int?`         | ID variabel untuk memfilter variabel vertikal (opsional)         |

## Contoh

### 1. Mengambil Semua Variabel Vertikal untuk Domain

```dart
// Mengambil variabel vertikal dari BPS Jawa Tengah
final verticalVariablesResult = await StadataFlutter.instance.list.verticalVariables(
  domain: '3300', // Kode domain Jawa Tengah
  lang: DataLanguage.id,
);

final variables = verticalVariablesResult.data;
final pagination = verticalVariablesResult.pagination;

// Mencetak informasi paginasi
print('Halaman Saat Ini: ${pagination.page}');
print('Total Halaman: ${pagination.pages}');
print('Jumlah Data di Halaman Ini: ${pagination.count}');
print('Per Halaman: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Mencetak data variabel vertikal yang diambil
for (final variable in variables) {
  print('ID Variabel Vertikal: ${variable.id}');
  print('Judul: ${variable.title}');
  print('ID Item: ${variable.itemID}');
  print('ID Kelompok: ${variable.groupID ?? 'Tidak ada kelompok'}');
  print('Nama Kelompok: ${variable.groupName ?? 'Tidak berkelompok'}');
  print('------------------------');
}
```

### 2. Memfilter Variabel Vertikal berdasarkan ID Variabel

```dart
// Mengambil variabel vertikal yang terkait dengan variabel tertentu
final specificVerticalVars = await StadataFlutter.instance.list.verticalVariables(
  domain: '0000', // Level nasional
  lang: DataLanguage.id,
  variableID: 2501, // Contoh ID variabel untuk indikator ekonomi
);

// Menganalisis struktur vertikal spesifik variabel
print('=== Variabel Vertikal untuk Variabel 2501 ===');
for (final verticalVar in specificVerticalVars.data) {
  print('Variabel Vertikal: ${verticalVar.title}');
  print('ID Variabel: ${verticalVar.id}');
  print('ID Item: ${verticalVar.itemID}');
  
  // Menganalisis hubungan kelompok
  if (verticalVar.groupID != null && verticalVar.groupName != null) {
    print('Kelompok: ${verticalVar.groupName} (ID: ${verticalVar.groupID})');
    print('  Tipe: Variabel vertikal berkelompok');
  } else {
    print('  Tipe: Variabel vertikal independen');
  }
  
  print('------------------------');
}
```

### 3. Menjelajahi Kelompok Variabel Vertikal

```dart
// Menganalisis pola pengelompokan variabel vertikal di berbagai domain
class VerticalVariableGroupExplorer {
  static Future<void> exploreGroupStructures() async {
    final domains = ['0000', '3100', '3200', '3300']; // Nasional, Jakarta, Jawa Barat, Jawa Tengah
    final domainGroups = <String, Map<String, List<VerticalVariable>>>{};
    
    for (final domain in domains) {
      final variables = await StadataFlutter.instance.list.verticalVariables(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      // Mengelompokkan variabel berdasarkan nama kelompok
      final groupedVars = <String, List<VerticalVariable>>{};
      for (final variable in variables.data) {
        final groupName = variable.groupName ?? 'Tidak Berkelompok';
        groupedVars[groupName] = (groupedVars[groupName] ?? [])..add(variable);
      }
      
      domainGroups[domain] = groupedVars;
      
      await Future.delayed(Duration(milliseconds: 300));
    }
    
    print('=== Analisis Kelompok Variabel Vertikal ===');
    for (final entry in domainGroups.entries) {
      print('Domain ${entry.key}:');
      print('  Total Kelompok: ${entry.value.keys.length}');
      
      final sortedGroups = entry.value.entries.toList()
        ..sort((a, b) => b.value.length.compareTo(a.value.length));
      
      print('  Kelompok Teratas berdasarkan Jumlah Variabel:');
      for (final groupEntry in sortedGroups.take(5)) {
        print('    ${groupEntry.key}: ${groupEntry.value.length} variabel');
        
        // Menampilkan contoh judul variabel
        final sampleTitles = groupEntry.value.take(2).map((v) => v.title).join(', ');
        print('      Contoh: $sampleTitles');
      }
      
      print('---');
    }
  }
}
```

### 4. Menganalisis Hierarki Variabel Vertikal

```dart
// Analisis komprehensif struktur hierarkis variabel vertikal
class VerticalVariableHierarchyAnalyzer {
  static Future<void> analyzeHierarchicalStructures(String domain) async {
    try {
      // 1. Mengambil semua variabel vertikal untuk domain
      final allVerticalVars = await StadataFlutter.instance.list.verticalVariables(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      print('=== Analisis Hierarki Variabel Vertikal ===');
      print('Total Variabel Vertikal: ${allVerticalVars.data.length}');
      
      // 2. Menganalisis distribusi kelompok
      final groupDistribution = <String, List<VerticalVariable>>{};
      final ungroupedVariables = <VerticalVariable>[];
      
      for (final variable in allVerticalVars.data) {
        if (variable.groupName != null && variable.groupName!.isNotEmpty) {
          final groupName = variable.groupName!;
          groupDistribution[groupName] = (groupDistribution[groupName] ?? [])..add(variable);
        } else {
          ungroupedVariables.add(variable);
        }
      }
      
      print('Variabel Berkelompok: ${groupDistribution.length} kelompok');
      print('Variabel Tidak Berkelompok: ${ungroupedVariables.length}');
      
      // 3. Menganalisis hierarki kelompok
      for (final entry in groupDistribution.entries) {
        final groupName = entry.key;
        final variables = entry.value;
        
        print('\\n=== Kelompok: $groupName ===');
        print('Variabel dalam kelompok: ${variables.length}');
        
        // Menganalisis pola ID item
        final itemIds = variables.map((v) => v.itemID).toSet();
        print('ID item unik: ${itemIds.length}');
        
        // Memeriksa pola hierarkis
        final groupIds = variables
            .where((v) => v.groupID != null)
            .map((v) => v.groupID!)
            .toSet();
        
        if (groupIds.length > 1) {
          print('Beberapa ID kelompok terdeteksi: $groupIds');
          print('  → Struktur hierarkis kompleks');
        } else if (groupIds.length == 1) {
          print('ID kelompok tunggal: ${groupIds.first}');
          print('  → Struktur kelompok sederhana');
        }
        
        // Menampilkan contoh variabel
        print('Contoh variabel:');
        for (final variable in variables.take(3)) {
          print('  • ${variable.title} (Item: ${variable.itemID})');
        }
      }
      
      // 4. Analisis hubungan lintas-kelompok
      print('\\n=== Analisis Lintas-Kelompok ===');
      final allGroupIds = groupDistribution.values
          .expand((vars) => vars)
          .where((v) => v.groupID != null)
          .map((v) => v.groupID!)
          .toSet();
      
      print('ID kelompok unik di semua kelompok: ${allGroupIds.length}');
      
      // Mencari kelompok yang berbagi ID item
      final itemIdGroups = <int, List<String>>{};
      for (final entry in groupDistribution.entries) {
        for (final variable in entry.value) {
          itemIdGroups[variable.itemID] = (itemIdGroups[variable.itemID] ?? [])..add(entry.key);
        }
      }
      
      final sharedItemIds = itemIdGroups.entries
          .where((entry) => entry.value.length > 1)
          .length;
      
      print('ID item yang dibagi antar kelompok: $sharedItemIds');
      if (sharedItemIds > 0) {
        print('  → Hubungan lintas-kelompok terdeteksi');
      }
      
    } catch (e) {
      print('Error analisis hierarki: $e');
    }
  }
}
```

### 5. Membangun Sistem Navigasi Variabel Vertikal

```dart
// Membuat sistem navigasi komprehensif untuk variabel vertikal
class VerticalVariableNavigationBuilder {
  static Future<Map<String, dynamic>> buildNavigationStructure(String domain) async {
    final navigationStructure = <String, dynamic>{};
    
    try {
      // Mengambil semua variabel vertikal
      final variables = await StadataFlutter.instance.list.verticalVariables(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      navigationStructure['domain'] = domain;
      navigationStructure['totalVariables'] = variables.data.length;
      navigationStructure['groups'] = <Map<String, dynamic>>[];
      
      // Mengelompokkan variabel berdasarkan nama kelompok
      final groupedVars = <String, List<VerticalVariable>>{};
      for (final variable in variables.data) {
        final groupName = variable.groupName ?? 'Tidak Berkelompok';
        groupedVars[groupName] = (groupedVars[groupName] ?? [])..add(variable);
      }
      
      // Membangun navigasi untuk setiap kelompok
      for (final entry in groupedVars.entries) {
        final groupName = entry.key;
        final groupVariables = entry.value;
        
        // Membangun node kelompok
        final groupNode = <String, dynamic>{
          'groupName': groupName,
          'variableCount': groupVariables.length,
          'variables': <Map<String, dynamic>>[],
        };
        
        // Mengambil ID kelompok unik untuk kelompok ini
        final groupIds = groupVariables
            .where((v) => v.groupID != null)
            .map((v) => v.groupID!)
            .toSet();
        
        groupNode['groupIds'] = groupIds.toList();
        
        // Menambahkan variabel ke kelompok
        for (final variable in groupVariables) {
          groupNode['variables'].add({
            'id': variable.id,
            'title': variable.title,
            'itemID': variable.itemID,
            'groupID': variable.groupID,
          });
        }
        
        // Menghitung statistik kelompok
        final uniqueItemIds = groupVariables.map((v) => v.itemID).toSet();
        groupNode['uniqueItemIds'] = uniqueItemIds.length;
        
        (navigationStructure['groups'] as List<Map<String, dynamic>>).add(groupNode);
      }
      
      // Menghitung statistik navigasi
      final allGroups = navigationStructure['groups'] as List<Map<String, dynamic>>;
      final groupsWithMultipleIds = allGroups
          .where((group) => (group['groupIds'] as List).length > 1)
          .length;
      
      navigationStructure['groupsWithMultipleIds'] = groupsWithMultipleIds;
      navigationStructure['totalGroups'] = allGroups.length;
      
      // Mencetak ringkasan navigasi
      print('=== Ringkasan Navigasi Variabel Vertikal ===');
      print('Domain: $domain');
      print('Total Variabel: ${navigationStructure['totalVariables']}');
      print('Total Kelompok: ${navigationStructure['totalGroups']}');
      print('Kelompok dengan Beberapa ID: $groupsWithMultipleIds');
      print('');
      
      // Mencetak breakdown kelompok
      for (final group in allGroups) {
        print('📁 ${group['groupName']}');
        print('   Variabel: ${group['variableCount']}');
        print('   ID Item Unik: ${group['uniqueItemIds']}');
        print('   ID Kelompok: ${(group['groupIds'] as List).join(', ')}');
        print('');
      }
      
      return navigationStructure;
      
    } catch (e) {
      print('Error membangun navigasi: $e');
      return {};
    }
  }
}
```

## Properti (VerticalVariable)

| Properti    | Tipe      | Deskripsi                                                        |
| ----------- | --------- | ---------------------------------------------------------------- |
| `id`        | `int`     | Pengenal unik untuk variabel vertikal                           |
| `title`     | `String`  | Judul atau label deskriptif dari variabel vertikal              |
| `itemID`    | `int`     | Pengenal item spesifik dalam struktur variabel vertikal         |
| `groupID`   | `int?`    | Pengenal kelompok untuk organisasi hierarkis (opsional)         |
| `groupName` | `String?` | Nama kelompok yang berisi variabel vertikal ini (opsional)      |

## Pola Variabel Vertikal Umum

### Indikator Ekonomi Hierarkis
- **Klasifikasi Sektor**: Variabel yang diorganisir berdasarkan sektor dan sub-sektor ekonomi
- **Hierarki Regional**: Variabel yang terstruktur berdasarkan tingkat administratif (nasional, provinsi, kabupaten)
- **Klasifikasi Temporal**: Variabel yang diorganisir berdasarkan periode waktu dan frekuensi
- **Pengelompokan Industri**: Variabel yang dikategorikan berdasarkan klasifikasi industri

### Variabel Struktur Administratif
- **Tingkat Pemerintahan**: Variabel yang diorganisir berdasarkan hierarki administratif
- **Klasifikasi Departemen**: Variabel yang dikelompokkan berdasarkan departemen dan instansi pemerintah
- **Kategori Layanan**: Variabel yang terstruktur berdasarkan jenis layanan publik
- **Domain Kebijakan**: Variabel yang diorganisir berdasarkan area kebijakan dan tingkat implementasi

### Variabel Klasifikasi Demografis
- **Segmen Populasi**: Variabel yang diorganisir berdasarkan karakteristik demografis
- **Klasifikasi Geografis**: Variabel yang terstruktur berdasarkan batas geografis dan administratif
- **Kategori Sosial**: Variabel yang dikelompokkan berdasarkan klasifikasi sosial dan ekonomi
- **Tipe Rumah Tangga**: Variabel yang diorganisir berdasarkan struktur rumah tangga dan keluarga

## Alur Kerja Penemuan Variabel Vertikal

Alur kerja tipikal untuk bekerja dengan variabel vertikal:

1. **Eksplorasi Domain**: Menemukan variabel vertikal yang tersedia untuk domain
2. **Analisis Kelompok**: Memahami pengelompokan variabel dan struktur hierarkis
3. **Pemetaan Hubungan**: Mengidentifikasi hubungan antara variabel dan kelompok
4. **Navigasi Hierarkis**: Menggunakan struktur kelompok untuk eksplorasi data yang efisien
5. **Analisis Multi-Dimensi**: Memanfaatkan struktur vertikal untuk analisis komprehensif

## Penanganan Error

Metode API Variabel Vertikal mengembalikan `Future<ListResult<VerticalVariable>>` dan dapat menimbulkan exception spesifik:

- `VerticalVariableException`: Error terkait variabel vertikal (domain tidak valid, error ID variabel)
- `ApiException`: Error terkait jaringan atau API
- `ApiKeyNotFoundException`: API key tidak valid atau hilang

```dart
try {
  final result = await StadataFlutter.instance.list.verticalVariables(
    domain: '3200',
    variableID: 2501,
    lang: DataLanguage.id,
  );
  
  // Memproses hasil yang berhasil
  print('Ditemukan ${result.data.length} variabel vertikal');
  
} on VerticalVariableException catch (e) {
  print('Error variabel vertikal: ${e.message}');
  // Menangani error validasi domain atau masalah ID variabel
  
} on ApiException catch (e) {
  print('Error API: ${e.message}');
  // Menangani error konektivitas jaringan atau layanan API
  
} catch (e) {
  print('Error tidak terduga: $e');
  // Menangani error tak terduga lainnya
}
```

## Pertimbangan Performa

- **Filtering Berbasis Kelompok**: Gunakan ID variabel untuk fokus pada cabang hierarkis spesifik
- **Caching Hierarkis**: Cache struktur kelompok karena menyediakan konteks analitis
- **Pemetaan Hubungan**: Bangun pemetaan efisien antara variabel vertikal dan tabel data
- **Optimisasi Navigasi**: Gunakan struktur kelompok untuk mengoptimalkan eksplorasi data multi-level
- **Manajemen Memori**: Tangani hierarki variabel besar secara efisien dalam lingkungan terbatas memori
- **Analisis Lintas-Domain**: Pertimbangkan batas laju API saat menganalisis variabel vertikal di berbagai domain