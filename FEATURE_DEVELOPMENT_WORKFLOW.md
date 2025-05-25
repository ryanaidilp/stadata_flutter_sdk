# 🚀 Feature Development Workflow

Panduan ini menjelaskan langkah-langkah sistematis untuk mengembangkan fitur baru di dalam project **stadata_flutter_sdk**.

---

## 🔄 Alur Pengembangan Fitur

1. **Buat Folder Fitur**

   - Buat folder baru di `features/nama_fitur`.

2. **Domain Layer**

   - Buat entity yang diperlukan.
   - Buat repository interface untuk fitur.
   - Buat usecase yang merepresentasikan business logic.

3. **Data Layer**

   - Buat model untuk entity (wajib ada: `copyWith`, `fromJson`, `toJson`, `fromEntity`).
   - Buat failure & exception terkait di folder `core`.
   - Buat remote data source.
   - Implementasikan repository.

4. **Testing & Fixture**

   - Copy contoh JSON response, buat fixture `.json` di `test/fixture`.
   - Tambahkan enum baru di `fixtures.dart` dan nama file fixture.
   - Buat unit test untuk usecase, data source, repository (opsional tapi direkomendasikan).

5. **Dependency Injection**

   - Buat injector untuk fitur dan inject file yang diperlukan.
   - Register injector di `stadata_flutter_sdk.dart`.

6. **Integrasi ke UI**

   - Tambahkan usecase di `stadata_list` (untuk list) atau `stadata_view` (untuk detail).
   - Buat unit test untuk integrasi.
   - Buat halaman preview contoh penggunaan di example app (menggunakan GetX).

7. **Commit & Push**
   - Commit perubahan dan push ke repository.

---

## 🗺️ Diagram Workflow

```mermaid
flowchart TD
    A[Mulai Fitur Baru] --> B[Buat folder di features/nama_fitur]
    B --> C[Domain Layer]
    C --> C1[Buat Entity]
    C --> C2[Buat Repository Interface]
    C --> C3[Buat Usecase]
    C3 --> D[Data Layer]
    D --> D1[Buat Model dengan copyWith, fromJson, toJson, fromEntity]
    D --> D2[Buat Failure & Exception di core]
    D --> D3[Buat Remote Data Source]
    D --> D4[Implementasi Repository]
    D4 --> E[Testing & Fixture]
    E --> E1[Copy JSON Response & Buat Fixture]
    E1 --> E2[Update fixtures.dart]
    E2 --> E3[Unit Test Usecase/DataSource/Repo]
    E3 --> F[Dependency Injection]
    F --> F1[Buat Injector Fitur]
    F1 --> F2[Register di stadata_flutter_sdk.dart]
    F2 --> G[Integrasi ke UI]
    G --> G1[Tambahkan Usecase di stadata_list/view]
    G1 --> G2[Unit Test Integrasi]
    G2 --> G3[Preview di Example App dengan GetX]
    G3 --> H[Commit & Push]
```

---

## 📌 Tips

- Selalu mulai dari domain layer untuk memastikan business logic jelas.
- Pastikan semua model memiliki fungsi `copyWith`, `fromJson`, `toJson`, dan `fromEntity`.
- Unit test sangat direkomendasikan untuk setiap layer.
- Gunakan fixture untuk memudahkan testing dan dokumentasi response API.
- Preview di example app membantu validasi end-to-end sebelum merge.

---

Selamat mengembangkan fitur! 🚀
