import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/model_data/isar/collection/model_user_isar.dart';
import 'package:flutter_pos/model_data/model_user.dart';
import 'package:flutter_pos/service/isar_service.dart';
import 'package:isar/isar.dart';

Future<List<ModelUser>> getUserIsar() async {
  final allUser = await isar.modelUserIsars.where().findAll();

  return allUser.map((e) {
    return ModelUser(
      idUser: e.idUser,
      nameUser: e.nameUser,
      emailUser: e.emailUser,
      phoneUser: e.phoneUser,
      roleUser: RoleTypeX.fromString(e.roleUser)!,
      idBranchUser: e.idBranchUser,
      createdUser: e.createdUser,
      noteUser: e.noteUser,
      statusUser: StatusDataX.fromString(e.statusUser),
      permissionsUser: {
        Permission.Stok: e.Stok,
        Permission.Inventory: e.Inventory,
        Permission.Penjualan: e.Penjualan,
        Permission.Pembelian: e.Pembelian,
        Permission.Pendapatan: e.Pendapatan,
        Permission.Pengeluaran: e.Pengeluaran,
        Permission.Data_Pelanggan: e.Data_Pelanggan,
        Permission.Data_Pemasok: e.Data_Pemasok,
        Permission.Data_Pemasukan: e.Data_Pemasukan,
        Permission.Data_Pengeluaran: e.Data_Pengeluaran,
        Permission.Data_Operator: e.Data_Operator,
        Permission.Riwayat_Penjualan: e.Riwayat_Penjualan,
        Permission.Riwayat_Pembelian: e.Riwayat_Pembelian,
        Permission.Riwayat_Pendapatan: e.Riwayat_Pendapatan,
        Permission.Riwayat_Pengeluaran: e.Riwayat_Pengeluaran,
        Permission.Laporan: e.Laporan,
      },
    );
  }).toList();
}
