# View

Selain properti `list`, `StadataFlutter` juga menyediakan properti `view`, yang memungkinkan Anda mengambil informasi detail tentang model tertentu. Misalnya, jika Anda ingin melihat detail dari sebuah publikasi, ikuti langkah-langkah ini:

1. **Buat Instance dari StadataFlutter:**

   - Mulailah dengan membuat instance dari `StadataFlutter`.

2. **Akses Getter `view`:**

   - Akses getter `view` dari instance, memberi Anda akses ke berbagai model dari domain, publikasi, rilis pers, dan lainnya.

3. **Gunakan Metode `view` dengan Parameter yang Diperlukan:**

   - Manfaatkan metode `view`, tentukan parameter yang diperlukan. Contohnya:

   ```dart
   var result = await StadataFlutter.instance.view.publication(
     id: 'a78f4d4f1c3548600cffcd29',
     domain: '7200'
   );
   ```

Dengan mengikuti langkah-langkah ini, Anda dapat dengan mudah mengambil informasi detail tentang model-model tertentu menggunakan BPS Web API. Baik Anda membutuhkan akses ke daftar atau detail yang mendalam, `StadataFlutter` menyediakan alat yang membantu Anda mencapai tujuan Anda dengan efisien.
