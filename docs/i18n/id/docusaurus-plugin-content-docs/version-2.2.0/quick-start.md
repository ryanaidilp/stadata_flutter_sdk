---
sidebar_position: 2
---

# Panduan Cepat

Mulai dengan STADATA Flutter SDK dalam hitungan menit! Panduan komprehensif ini akan memandu Anda melalui proses pengaturan SDK, mendapatkan API key, dan mengimplementasikan integrasi data statistik pertama Anda dengan BPS (Badan Pusat Statistik) Indonesia.

STADATA Flutter SDK menyediakan akses tanpa batas ke data statistik resmi Indonesia, memungkinkan Anda mengintegrasikan indikator ekonomi, data demografi, publikasi, berita, dan lainnya ke dalam aplikasi Flutter Anda hanya dengan beberapa baris kode.

## Prasyarat

Sebelum memulai, pastikan lingkungan pengembangan Anda memenuhi persyaratan berikut:

- **Flutter SDK**: Versi 3.7.0 atau lebih tinggi
- **Dart SDK**: Versi 2.19.0 atau lebih tinggi
- **Dukungan Platform**: Android, iOS, Web, Desktop (Windows, macOS, Linux)
- **API Key**: API key yang valid dari [BPS Web API](https://webapi.bps.go.id/developer/)

### Verifikasi Instalasi Flutter

```bash
# Periksa versi Flutter
flutter --version

# Verifikasi instalasi Flutter
flutter doctor
```

## Langkah 1: Registrasi API Key

Sebelum menggunakan SDK, Anda perlu mendaftarkan API key gratis dari BPS:

1. **Kunjungi Portal Developer BPS**: [https://webapi.bps.go.id/developer/](https://webapi.bps.go.id/developer/)
2. **Buat Akun**: Daftar dengan email Anda dan selesaikan verifikasi
3. **Generate API Key**: Navigasi ke dashboard Anda dan buat API key baru
4. **Catat Key**: Simpan API key Anda dengan aman - Anda akan membutuhkannya untuk inisialisasi

:::tip Praktik Terbaik API Key

- Simpan API key Anda dengan aman menggunakan environment variables atau Flutter secure storage
- Jangan pernah commit API key ke version control
- Gunakan API key yang berbeda untuk environment development, staging, dan production
- Monitor penggunaan API Anda melalui dashboard developer BPS
  :::

## Langkah 2: Instalasi

### Opsi A: Tambahkan melalui pubspec.yaml

Tambahkan STADATA Flutter SDK ke dependencies `pubspec.yaml` Anda:

```yaml
dependencies:
  flutter:
    sdk: flutter
  stadata_flutter_sdk: ^latest_version
```

Ganti `^latest_version` dengan versi terbaru yang sebenarnya dari [pub.dev](https://pub.dev/packages/stadata_flutter_sdk).

### Opsi B: Tambahkan melalui Command Line

Gunakan perintah pub Flutter untuk menambahkan dependency secara otomatis:

```bash
flutter pub add stadata_flutter_sdk
```

### Install Dependencies

Ambil dan install paket SDK:

```bash
flutter pub get
```

## Langkah 3: Inisialisasi SDK

Inisialisasikan STADATA Flutter SDK di entry point aplikasi Anda. Ini harus dilakukan sebelum menjalankan aplikasi Anda.

### Inisialisasi Dasar

```dart
import 'package:flutter/material.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

void main() async {
  // Pastikan Flutter binding sudah diinisialisasi
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasikan STADATA Flutter SDK
  await StadataFlutter.instance.init(
    apiKey: 'YOUR_API_KEY_HERE',
  );

  // Jalankan aplikasi Anda
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'STADATA Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const StatisticalDataScreen(),
    );
  }
}
```

### Manajemen API Key yang Aman

Untuk aplikasi production, gunakan secure storage untuk API key Anda:

```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Muat API key dari secure storage atau environment
    const apiKey = String.fromEnvironment(
      'BPS_API_KEY',
      defaultValue: '', // Jangan pernah gunakan key asli sebagai default
    );

    if (apiKey.isEmpty) {
      throw Exception('BPS API Key tidak ditemukan. Silakan periksa konfigurasi Anda.');
    }

    // Inisialisasi dengan API key yang aman
    await StadataFlutter.instance.init(apiKey: apiKey);

    runApp(const MyApp());
  } catch (e) {
    // Tangani error inisialisasi dengan baik
    runApp(ErrorApp(error: e.toString()));
  }
}

class ErrorApp extends StatelessWidget {
  final String error;

  const ErrorApp({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              const Text('Error Inisialisasi', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(error, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
```

:::caution Langkah Inisialisasi Kritis

1. **Selalu panggil** `WidgetsFlutterBinding.ensureInitialized()` sebelum inisialisasi SDK
2. **Inisialisasi SDK** sebelum memanggil `runApp()`
3. **Tangani error inisialisasi** dengan baik untuk mencegah crash aplikasi
4. **Validasi API key** sebelum inisialisasi untuk mendeteksi masalah konfigurasi sejak dini
   :::

## Langkah 4: Implementasi Pertama Anda

Sekarang mari kita implementasikan contoh lengkap yang mendemonstrasikan fungsionalitas inti dari STADATA Flutter SDK.

### Contoh Lengkap: Penjelajah Domain Indonesia

```dart
import 'package:flutter/material.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class StatisticalDataScreen extends StatefulWidget {
  const StatisticalDataScreen({super.key});

  @override
  State<StatisticalDataScreen> createState() => _StatisticalDataScreenState();
}

class _StatisticalDataScreenState extends State<StatisticalDataScreen> {
  List<Domain> domains = [];
  bool isLoading = false;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _loadDomains();
  }

  Future<void> _loadDomains() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      // Ambil domain administratif Indonesia
      final result = await StadataFlutter.instance.list.domains(
        type: DomainType.all,
        lang: DataLanguage.id,
      );

      setState(() {
        domains = result.data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Gagal memuat domain: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Domain Administratif Indonesia'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadDomains,
            tooltip: 'Refresh Data',
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Memuat domain Indonesia...'),
          ],
        ),
      );
    }

    if (errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Error Memuat Data',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              errorMessage!,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _loadDomains,
              icon: const Icon(Icons.refresh),
              label: const Text('Coba Lagi'),
            ),
          ],
        ),
      );
    }

    if (domains.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_off, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text('Tidak ada domain ditemukan'),
          ],
        ),
      );
    }

    return Column(
      children: [
        // Header ringkasan
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          color: Theme.of(context).colorScheme.surfaceVariant,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Domain Administratif',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 4),
              Text(
                '${domains.length} domain tersedia',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        // Daftar domain
        Expanded(
          child: ListView.builder(
            itemCount: domains.length,
            itemBuilder: (context, index) {
              final domain = domains[index];
              return _buildDomainCard(domain);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDomainCard(Domain domain) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Text(
            domain.id.length >= 2 ? domain.id.substring(0, 2) : domain.id,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          domain.name,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Domain ID: ${domain.id}'),
            Text('URL: ${domain.url}'),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.info_outline),
          onPressed: () => _showDomainDetails(domain),
        ),
        onTap: () => _showDomainDetails(domain),
      ),
    );
  }

  void _showDomainDetails(Domain domain) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(domain.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('Domain ID', domain.id),
            _buildDetailRow('Nama', domain.name),
            _buildDetailRow('URL', domain.url),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Tutup'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _exploreData(domain);
            },
            child: const Text('Jelajahi Data'),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  void _exploreData(Domain domain) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DomainDataExplorer(domain: domain),
      ),
    );
  }
}

// Screen tambahan untuk menjelajahi data spesifik domain
class DomainDataExplorer extends StatefulWidget {
  final Domain domain;

  const DomainDataExplorer({super.key, required this.domain});

  @override
  State<DomainDataExplorer> createState() => _DomainDataExplorerState();
}

class _DomainDataExplorerState extends State<DomainDataExplorer> {
  int publicationCount = 0;
  int newsCount = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadDomainData();
  }

  Future<void> _loadDomainData() async {
    try {
      // Muat publikasi dan berita untuk domain ini
      final [publications, news] = await Future.wait([
        StadataFlutter.instance.list.publications(domain: widget.domain.id),
        StadataFlutter.instance.list.news(domain: widget.domain.id),
      ]);

      setState(() {
        publicationCount = publications.data.length;
        newsCount = news.data.length;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error memuat data domain: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.domain.name),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Informasi Domain',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 12),
                          _buildInfoRow('ID', widget.domain.id),
                          _buildInfoRow('Nama', widget.domain.name),
                          _buildInfoRow('URL', widget.domain.url),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Data Tersedia',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 12),
                          _buildDataRow(
                            'Publikasi',
                            publicationCount,
                            Icons.book,
                            Colors.blue,
                          ),
                          _buildDataRow(
                            'Artikel Berita',
                            newsCount,
                            Icons.article,
                            Colors.green,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 60,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _buildDataRow(String label, int count, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              count.toString(),
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

## Langkah 5: Menjelajahi Fitur SDK

Sekarang Anda memiliki implementasi yang berfungsi, jelajahi kemampuan komprehensif dari STADATA Flutter SDK:

### List API - Penemuan Data

List API membantu Anda menemukan dan menjelajahi koleksi data statistik:

```dart
// Temukan publikasi
final publications = await StadataFlutter.instance.list.publications(
  domain: '0000', // Level nasional
  keyword: 'ekonomi', // Data ekonomi
  lang: DataLanguage.id,
);

// Jelajahi artikel berita
final news = await StadataFlutter.instance.list.news(
  domain: '3200', // Jawa Barat
  lang: DataLanguage.id,
);

// Temukan tabel statis
final tables = await StadataFlutter.instance.list.staticTables(
  domain: '0000',
  keyword: 'inflasi',
);
```

### View API - Informasi Detail

View API menyediakan informasi komprehensif tentang item spesifik:

```dart
// Dapatkan informasi publikasi detail
final publication = await StadataFlutter.instance.view.publication(
  id: '03220.2301',
  domain: '0000',
  lang: DataLanguage.id,
);

// Akses detail publikasi
if (publication != null) {
  print('Judul: ${publication.title}');
  print('Abstrak: ${publication.abstract}');
  print('URL PDF: ${publication.pdf}');
  print('Ukuran File: ${publication.size}');
}
```

### Praktik Terbaik Error Handling

Implementasikan error handling yang robust untuk aplikasi production:

```dart
Future<void> fetchDataSafely() async {
  try {
    final result = await StadataFlutter.instance.list.domains();
    // Tangani response yang berhasil
    print('Memuat ${result.data.length} domain');
  } on ApiKeyNotFoundException {
    // Tangani masalah API key
    print('API key tidak valid atau hilang');
  } on ApiException catch (e) {
    // Tangani error komunikasi API
    print('API Error: ${e.message}');
  } on NetworkException {
    // Tangani masalah konektivitas jaringan
    print('Koneksi jaringan gagal');
  } catch (e) {
    // Tangani error yang tidak terduga
    print('Error tidak terduga: $e');
  }
}
```

## Langkah Selanjutnya

Selamat! Anda telah berhasil mengintegrasikan STADATA Flutter SDK. Berikut yang dapat Anda jelajahi selanjutnya:

### 📚 Mendalami Dokumentasi

- **[Dokumentasi List API](./api-docs/list/intro)** - Temukan semua koleksi data yang tersedia
- **[Dokumentasi View API](./api-docs/view/intro)** - Pelajari tentang pengambilan data detail
- **[Panduan Penggunaan](./usage/list)** - Pola penggunaan komprehensif dan contoh

### 🛠 Implementasi Lanjutan

- **State Management**: Integrasi dengan provider seperti Riverpod, Bloc, atau GetX
- **Caching**: Implementasi data caching untuk kemampuan offline
- **Performa**: Optimisasi untuk dataset besar dan query kompleks
- **Komponen UI**: Bangun widget reusable untuk tampilan data statistik

### 📱 Aplikasi Contoh

Jelajahi aplikasi contoh lengkap yang disertakan dengan SDK:

```bash
# Navigasi ke aplikasi contoh
cd example

# Install dependencies
flutter pub get

# Jalankan aplikasi contoh
flutter run
```

### 🔧 Konfigurasi SDK

STADATA Flutter SDK memiliki konfigurasi sederhana dengan hanya API key yang diperlukan:

```dart
// Inisialisasi SDK - hanya API key yang dapat dikonfigurasi
await StadataFlutter.instance.init(
  apiKey: 'YOUR_API_KEY', // Wajib: API key BPS Anda
);
```

**Catatan**: SDK menggunakan pengaturan default untuk semua konfigurasi lainnya termasuk base URL, timeout, dan preferensi bahasa, yang dapat ditentukan per panggilan API jika diperlukan.

### 🚀 Checklist Production

Sebelum men-deploy aplikasi Anda:

- [ ] **API Key Aman**: Simpan API key dengan aman, jangan pernah di source code
- [ ] **Error Handling**: Implementasikan error handling yang komprehensif
- [ ] **Loading States**: Berikan feedback kepada pengguna saat memuat data
- [ ] **Dukungan Offline**: Tangani masalah konektivitas jaringan
- [ ] **Performa**: Optimisasi untuk kasus penggunaan spesifik Anda
- [ ] **Testing**: Tulis test untuk integrasi data statistik Anda
- [ ] **Dokumentasi**: Dokumentasikan implementasi Anda untuk anggota tim

## Dukungan dan Sumber Daya

Butuh bantuan atau ada pertanyaan?

- **📖 Dokumentasi**: Referensi API lengkap dan panduan
- **💬 Issues**: Laporkan bug atau minta fitur di [GitHub](https://github.com/ryanaidilp/stadata_flutter_sdk/issues)
- **📧 Dukungan BPS**: Hubungi BPS untuk pertanyaan terkait API di [webapi.bps.go.id](https://webapi.bps.go.id)
- **🏛 BPS Resmi**: Kunjungi [bps.go.id](https://www.bps.go.id) untuk statistik resmi

---

**Siap membangun aplikasi statistik yang menakjubkan dengan data pemerintah Indonesia? Mulai jelajahi dokumentasi API yang komprehensif dan bangun sesuatu yang hebat!** 🇮🇩📊