Oke, ini dia versi `.md` (Markdown) yang sudah saya rapikan. Kamu bisa langsung _copy_ seluruh teks di dalam kotak di bawah ini, lalu simpan dengan nama file `DOKUMENTASI_ISAR.md`.

Format ini sudah mendukung _syntax highlighting_ untuk Dart, jadi kalau kamu buka di VS Code atau GitHub, warnanya akan muncul otomatis.

````markdown
# 📜 DOKUMENTASI LENGKAP ISAR DB UNTUK POS

---

### 1️⃣ INISIALISASI ISAR

Biasanya diletakkan di `main.dart` atau di `repository/database.dart`.

```dart
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'model_user_isar.dart';
import 'model_batch_isar.dart';

late final Isar isar;

Future<void> initIsar() async {
  final dir = await getApplicationDocumentsDirectory();
  isar = await Isar.open(
    [ModelUserIsarSchema, ModelBatchSchema],
    directory: dir.path,
    inspector: true,
  );
}
```
````

---

### 2️⃣ MENYIMPAN DATA (INSERT / UPDATE)

**a. Simpan User**

```dart
final user = ModelUserIsar()
  ..idUser = "USR001"
  ..nameUser = "Oky"
  ..emailUser = "oky@email.com"
  ..permissionsUser = [Permission.Stok, Permission.Penjualan]
  ..createdUser = DateTime.now();

await isar.writeTxn(() async {
  await isar.modelUserIsars.put(user);
});

```

**b. Simpan Batch (Embedded)**

```dart
final batch = ModelBatch()
  ..invoice = "INV001"
  ..idBranch = "BR01"
  ..dateBuy = DateTime.now()
  ..itemsBatch = [
    ModelItemBatch()
      ..idProduct = "P001"
      ..qty = 10
      ..price = 5000
      ..expiredDate = DateTime(2026, 5, 1),
    ModelItemBatch()
      ..idProduct = "P002"
      ..qty = 5
      ..price = 10000
  ];

await isar.writeTxn(() async {
  await isar.modelBatchs.put(batch);
});

```

---

### 3️⃣ MENGAMBIL DATA (QUERY)

**a. Ambil Semua User**

```dart
final allUsers = await isar.modelUserIsars.where().findAll();

```

**b. Query Berdasarkan Index (idUser)**

```dart
final findUser = await isar.modelUserIsars.where().idUserEqualTo("USR001").findFirst();

```

**c. Filter Batch Berdasarkan Cabang**

```dart
final branchBatches = await isar.modelBatchs.where().idBranchEqualTo("BR01").findAll();

```

**d. Filter Embedded List (Mencari Produk Tertentu)**

```dart
final results = await isar.modelBatchs.filter()
    .itemsBatchElement((item) => item.idProductEqualTo("P001")).findAll();

```

---

### 4️⃣ UPDATE & DELETE

**Update Data**

```dart
await isar.writeTxn(() async {
  user!.nameUser = "Oky Updated";
  await isar.modelUserIsars.put(user); // Update otomatis jika ID cocok
});

```

**Delete Data**

```dart
await isar.writeTxn(() async {
  await isar.modelUserIsars.delete(user!.isarId); // Hapus spesifik
});

```

---

### 💡 TIPS POS:

- **Index:** Gunakan `@Index` pada `idUser`, `invoice`, dan `idBranch` agar pencarian ribuan data tetap instan.
- **Embedded Filter:** Filter list di dalam model menggunakan `.filter().itemsBatchElement(...)`.
- **Helper Permission:** Gunakan _extension_ agar pengecekan hak akses di UI lebih bersih:

```dart
extension UserPermission on ModelUserIsar {
  bool can(Permission p) => permissionsUser.contains(p);
}

```

```

Apakah ada bagian lain yang ingin kamu tambahkan ke file `.md` ini?

```
