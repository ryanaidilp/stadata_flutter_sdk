---
sidebar_position: 2
---

# Contoh Aplikasi

Anda dapat menjelajahi kemampuan SDK Stadata Flutter dengan melihat aplikasi contoh yang disediakan di [repository GitHub SDK](https://github.com/ryanaidilp/stadata_flutter_sdk/tree/main/example).

Untuk menjalankan aplikasi contoh dan melihat SDK dalam tindakan, ikuti langkah-langkah berikut:

1. Buat file .env dalam direktori contoh atau salin dari .env.example:

   ```bash
   cp .env.example .env
   ```

2. Salin `API_KEY` Anda ke file .env:

   ```dotenv
   API_KEY=  # Masukkan API Key Anda di sini
   ```

3. Generate `env.g.dart` dengan menjalankan perintah berikut dalam direktori contoh:

   ```bash
   dart run build_runner build -d
   ```

   Jika pembuatan berhasil, kode yang diperlukan akan dihasilkan.

4. Jalankan aplikasi contoh:

   ```bash
   flutter run
   ```

Sekarang, Anda siap untuk menjelajahi kemampuan SDK Stadata Flutter dalam aplikasi Flutter Anda menggunakan contoh yang disediakan. Contoh ini akan membantu Anda memahami cara mengintegrasikan dan menggunakan SDK secara efektif dalam proyek Anda sendiri.
