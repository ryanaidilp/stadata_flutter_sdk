---
sidebar_position: 2
---

# Instalasi

Ikuti langkah-langkah ini untuk dengan cepat mengintegrasikan Stadata Flutter SDK ke dalam proyek Flutter Anda.

## Perbarui Dependensi Anda

Pertama, pastikan dependensi `stadata_flutter_sdk` Anda sudah terbaru dengan menyertakan versi terbaru di file `pubspec.yaml` Anda. Anda dapat memeriksa versi terbaru yang tersedia di [pub.dev](https://pub.dev/packages/stadata_flutter_sdk).

```yaml
dependencies:
  stadata_flutter_sdk: ^latest_version
```

Ganti `^latest_version` dengan nomor versi terbaru yang sebenarnya.

## Install Dependensi

Setelah memperbarui `pubspec.yaml`, jalankan perintah berikut untuk mengunduh dan memasang paket SDK:

```bash
flutter pub get
```

Anda juga dapat memasangnya melalui `cli` dengan menggunakan perintah ini:

```sh
flutter pub add stadata_flutter_sdk
```

## Inisialisasi SDK

Inisialisasikan Stadata Flutter SDK di file `main.dart` Anda dan pastikan untuk menyertakan token API Anda. Ganti `'YOUR_API_KEY'` dengan kunci API sebenarnya yang Anda dapatkan dari [Web API BPS](https://webapi.bps.go.id/developer).

```dart
import 'package:flutter/material.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

void main() async {
  // Pastikan Flutter sudah diinisialisasi
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasikan instansi Stadata Flutter dengan kunci API Anda
  await StadataFlutter.instance.init(
    apiKey: 'YOUR_API_KEY',
  );

  // Titik masuk aplikasi Anda
  runApp(MyApp());
}
```

:::caution Catatan Penting

Pastikan Anda memanggil `WidgetsFlutterBinding.ensureInitialized()` sebelum melakukan inisialisasi SDK dan pastikan insialisasi dilakukan sebelum `runApp()`!

:::

## Mulai Menggunakan STADATA Flutter SDK

Setelah SDK diinisialisasi, Anda siap untuk mulai menggunakan API Stadata dalam aplikasi Flutter Anda. Lihat dokumentasi dan contoh SDK untuk mempelajari cara mengambil dan mengintegrasikan data ke dalam aplikasi Anda.

```dart
// Contoh: Mengambil data menggunakan SDK
final response = await StadataFlutter.instance.list.domains();
// Tangani respons dan perbarui antarmuka aplikasi Anda sesuai kebutuhan.
```

Itu saja! Anda telah berhasil mengintegrasikan Stadata Flutter SDK ke dalam proyek Anda. Anda sekarang dapat mulai menggunakan data dan fitur yang disediakan oleh Stadata dalam aplikasi Flutter Anda.

Sekarang, Anda siap untuk menjelajahi kemampuan `STADATA Flutter SDK` dalam aplikasi Flutter Anda.
