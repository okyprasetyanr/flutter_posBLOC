import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_account_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_company_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_user_isar.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/model_data/model_company.dart';
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

Future<ModelCompany> getCompanyIsar() async {
  final company = await isar.modelCompanyIsars.where().findFirst();
  return ModelCompany(
    listBranch: company!.listBranch
        .map(
          (e) => ModelBranch(
            nameBranch: e.nameBranch,
            numTelpBranch: e.numTelpBranch,
            addressBranch: e.addressBranch,
            idBranch: e.idBranch,
          ),
        )
        .toList(),
    footer: company.footer,
    header: company.header,
    nameCompany: company.nameCompany,
    phoneCompany: company.phoneCompany,
    created: company.created,
  );
}

Future<ModelUser> getAccountIsar() async {
  final account = await isar.modelAccountIsars.where().findFirst();
  return ModelUser(
    nameUser: account!.nameUser,
    emailUser: account.emailUser,
    phoneUser: account.phoneUser,
    roleUser: RoleTypeX.fromString(account.roleUser)!,
    permissionsUser: {
      Permission.Stok: account.Stok,
      Permission.Inventory: account.Inventory,
      Permission.Penjualan: account.Penjualan,
      Permission.Pembelian: account.Pembelian,
      Permission.Pendapatan: account.Pendapatan,
      Permission.Pengeluaran: account.Pengeluaran,
      Permission.Data_Pelanggan: account.Data_Pelanggan,
      Permission.Data_Pemasok: account.Data_Pemasok,
      Permission.Data_Pemasukan: account.Data_Pemasukan,
      Permission.Data_Pengeluaran: account.Data_Pengeluaran,
      Permission.Data_Operator: account.Data_Operator,
      Permission.Riwayat_Penjualan: account.Riwayat_Penjualan,
      Permission.Riwayat_Pembelian: account.Riwayat_Pembelian,
      Permission.Riwayat_Pendapatan: account.Riwayat_Pendapatan,
      Permission.Riwayat_Pengeluaran: account.Riwayat_Pengeluaran,
      Permission.Laporan: account.Laporan,
    },
  );
}

Future<List<ModelBranch>> getListBranchIsar() async {
  final company = await getCompanyIsar();
  return company.getListBranch;
}
