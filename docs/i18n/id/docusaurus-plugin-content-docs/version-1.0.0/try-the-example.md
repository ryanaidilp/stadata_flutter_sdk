---
sidebar_position: 2
---

# Contoh Aplikasi

Anda dapat menjelajahi kemampuan SDK Stadata Flutter dengan melihat aplikasi contoh yang disediakan di [repository GitHub SDK](https://github.com/ryanaidilp/stadata_flutter_sdk/tree/main/app/example).

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

## Fitur yang Ditampilkan dalam Aplikasi Contoh

Aplikasi contoh mendemonstrasikan semua kemampuan SDK, termasuk:

### Data Konten

- **Publikasi**: Jelajahi publikasi statistik
- **Siaran Pers**: Lihat pengumuman resmi BPS
- **Berita**: Baca berita dan pembaruan statistik
- **Infografis**: Jelajahi presentasi statistik visual
- **Tabel Statis**: Akses tabel statistik yang telah dikompilasi

### Data Sensus ⭐ **Baru**

- **Jenis Sensus**: Jelajahi semua acara sensus yang tersedia (Penduduk, Pertanian, Ekonomi)
- **Topik Sensus**: Jelajahi topik dalam setiap sensus (Demografi, Perumahan, Ketenagakerjaan, dll.)
- **Dataset Sensus**: Akses dataset spesifik untuk analisis detail

### Klasifikasi dan Struktur

- **Domain**: Navigasi hierarki regional
- **Kategori Subjek & Subjek**: Jelajahi topik statistik
- **Klasifikasi Statistik**: Jelajahi klasifikasi KBLI dan KBKI
- **Indikator Strategis**: Lihat metrik kinerja utama
- **Unit, Variabel & Variabel Vertikal**: Pahami struktur data

### Fitur Interaktif

- **Dukungan Dwibahasa**: Beralih antara bahasa Indonesia dan Inggris
- **Pencarian dan Filter**: Temukan data spesifik dengan efisien
- **Paginasi**: Navigasi melalui dataset besar
- **Tampilan Detail**: Akses informasi komprehensif tentang setiap item

Aplikasi contoh berfungsi sebagai demonstrasi dan sumber belajar untuk mengimplementasikan SDK dalam aplikasi Anda sendiri.
