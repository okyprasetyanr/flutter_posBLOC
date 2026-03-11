import 'package:isar/isar.dart';

part 'model_user_isar.g.dart';

@collection
class ModelUserIsar {
  Id isarId = Isar.autoIncrement;
  @Index(unique: true)
  late String idUser;
  @Index()
  late String? idBranchUser;

  late String statusUser;
  late String roleUser;
  late String nameUser;
  late String emailUser;
  late String phoneUser;
  late DateTime? createdUser;
  late String? noteUser;
  late bool Data_Operator;
  late bool Data_Pelanggan;
  late bool Data_Pemasok;
  late bool Data_Pemasukan;
  late bool Data_Pengeluaran;
  late bool Inventory;
  late bool Laporan;
  late bool Pembelian;
  late bool Pendapatan;
  late bool Pengeluaran;
  late bool Penjualan;
  late bool Riwayat_Pembelian;
  late bool Riwayat_Pendapatan;
  late bool Riwayat_Pengeluaran;
  late bool Riwayat_Penjualan;
  late bool Stok;
}
