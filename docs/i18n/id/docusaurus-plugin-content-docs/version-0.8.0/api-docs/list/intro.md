---
sidebar_position: 1
---

# Pengantar

API Daftar menyediakan metode-metode yang nyaman untuk mendapatkan daftar sumber daya data dari API BPS berdasarkan jenis data yang dibutuhkan. Untuk menggunakan API Daftar, Anda dapat mengaksesnya dengan menggunakan kode berikut:

```dart
final list = StadataFlutter.instance.list;
```

## Jenis Data yang Tersedia

API Daftar mendukung jenis data berikut:

### Data Geografis dan Administratif

- **[Domain](./domains)**: Domain regional (provinsi, kabupaten, dll.)

### Konten Statistik

- **[Publikasi](./publications)**: Publikasi statistik dan laporan
- **[Tabel Statis](./static-tables)**: Tabel statistik yang telah dikompilasi
- **[Infografis](./infographics)**: Presentasi statistik visual
- **[Siaran Pers](./press-releases)**: Pengumuman statistik resmi
- **[Berita](./news)**: Berita dan pembaruan statistik
- **[Kategori Berita](./news-categories)**: Kategori untuk konten berita

### Data Sensus ⭐ **Baru**

- **[Sensus](./census)**: Data sensus komprehensif termasuk:
  - Sensus Penduduk
  - Sensus Pertanian
  - Sensus Ekonomi

### Klasifikasi dan Kategorisasi

- **[Klasifikasi Statistik](./statistic-classifications)**: Klasifikasi KBLI dan KBKI
- **[Kategori Subjek](./subject-categories)**: Kategorisasi subjek statistik
- **[Subjek](./subjects)**: Subjek dan topik statistik
- **[Indikator Strategis](./strategic-indicators)**: Indikator kinerja utama

### Struktur Data dan Metadata

- **[Unit](./units)**: Unit pengukuran data
- **[Variabel](./variables)**: Variabel statistik
- **[Variabel Vertikal](./vertical-variables)**: Struktur variabel hierarkis

Setiap jenis data menyediakan metode untuk mengambil daftar berpaginasi dengan kemampuan filtering dan pencarian yang komprehensif.
