enum FieldDataCompany {
  id_company,
  name_company,
  phone_company,
  footer,
  header,
  created_company,
  list_branch,
}

enum FieldDataUser {
  id_user,
  status_user,
  name_user,
  email_user,
  phone_user,
  role_user,
  uid_owner,
  id_branch,
  permissions_user,
  created_user,
  note_user,
}

enum FieldDataItem {
  id_item,
  uid_owner,
  name_item,
  price_item,
  price_item_buy,
  id_category,
  status_condiment,
  url_image,
  qty_item,
  id_branch,
  barcode,
  status_item,
  date,
}

enum FieldDataCategory { id_category, name_category, id_branch, uid_owner }

enum FieldDataPartner {
  id_partner,
  id_branch,
  uid_owner,
  name_partner,
  phone_partner,
  email_partner,
  balance_partner,
  type,
  date,
}

enum FieldDataFinancial {
  name_financial,
  id_branch,
  id_financial,
  type,
  uid_owner,
}

enum FieldDataTransaction {
  invoice,
  id_branch,
  uid_owner,
  bank_name,
  bill_paid,
  note,
  total_charge,
  total_discount,
  total_ppn,
  payment_method,
  date,
  name_partner,
  id_partner,
  name_operator,
  id_operator,
  discount,
  ppn,
  total_item,
  sub_total,
  charge,
  total,
  status_transaction,
}

enum FieldDataTransFinancial {
  status_transaction,
  id_financial,
  id_branch,
  name_financial,
  note,
  date,
  amount,
  uid_owner,
}

enum FieldDataSplit { payment_debit_name, payment_total, payment_name, invoice }

enum FieldDataItemOrdered {
  invoice,
  id_ordered,
  uid_owner,
  id_branch,
  name_item,
  id_item,
  id_condiment,
  qty_item,
  discount_item,
  price_item,
  price_item_final,
  price_item_buy,
  sub_total,
  id_category_item,
  note,
}

enum FieldDataItemBatch {
  invoice,
  name_item,
  id_branch,
  id_item,
  id_category_item,
  note,
  date_buy,
  expired_date,
  discount_item,
  qty_item_in,
  qty_item_out,
  price_item,
  price_itemBuy,
  sub_total,
  price_item_final,
}

enum FieldDataItemOrderedBatch {
  id_ordered,
  id_item,
  invoice,
  qty_item,
  price_item,
  price_itemBuy,
}

enum FieldDataBatch { uid_owner, id_branch, date_buy }

enum FieldDataCounter {
  counter_sell,
  counter_sell_saved,
  counter_buy,
  counter_income,
  counter_expense,
}

enum FieldDataListBranch {
  name_branch,
  phone_branch,
  address_branch,
  id_branch,
}

enum ListForDatabase { Item, Transaksi, Kontak, Kas, Operator }

enum ListDataHeaderExcel {
  Akun,
  Usaha,
  Item,
  Kategori,
  Pelanggan,
  Pemasok,
  Pendapatan,
  Pengeluaran,
  Operator,
  Riwayat_Penjualan,
  Riwayat_Pembayaran_Split,
  Riwayat_Penjualan_Item,
  Riwayat_Penjualan_Tambahan,
  Riwayat_Pembelian,
  Riwayat_Pembelian_Item,
  Riwayat_Pendapatan,
  Riwayat_Pengeluaran,
}

enum ListStatusTransactionFinancial { All, Sukses, Batal }

enum ListStatusTransaction { All, Sukses, Tersimpan, Revisi, Batal }

extension ListStatusTransactionX on ListStatusTransaction {
  static ListStatusTransaction fromString(String value) {
    return ListStatusTransaction.values.firstWhere(
      (element) => element.name == value,
    );
  }
}

enum FilterTypeItem { All, Condiment, Normal }

enum StatusData { Aktif, Nonaktif }

extension StatusDataX on StatusData {
  static StatusData fromString(String value) {
    return StatusData.values.firstWhere((element) => element.name == value);
  }
}

enum FilterItem { A_Z, Z_A, Terbaru, Terlama, Stock_Plus, Stock_Minus }

extension FilterItemX on FilterItem {
  String get label {
    switch (this) {
      case FilterItem.A_Z:
        return "A-Z";
      case FilterItem.Z_A:
        return "Z-A";
      case FilterItem.Terbaru:
        return "Terbaru";
      case FilterItem.Terlama:
        return "Terlama";
      case FilterItem.Stock_Plus:
        return "Stock +";
      case FilterItem.Stock_Minus:
        return "Stock -";
    }
  }
}

enum TotalBranch { one, two, three }

extension TotalBranchX on TotalBranch {
  int get number {
    switch (this) {
      case TotalBranch.one:
        return 1;
      case TotalBranch.two:
        return 2;
      case TotalBranch.three:
        return 3;
    }
  }
}

enum RoleType { All, Pemilik, Kasir, Admin }

extension RoleTypeX on RoleType {
  static RoleType? fromString(String value) {
    try {
      return RoleType.values.firstWhere((e) => e.name == value);
    } catch (_) {
      return null;
    }
  }

  static RoleType? fromId(int value) {
    try {
      return RoleType.values.firstWhere((element) => element.id == value);
    } catch (_) {
      return null;
    }
  }
}

extension RoleTypeExt on RoleType {
  int get id {
    switch (this) {
      case RoleType.All:
        return 0;
      case RoleType.Pemilik:
        return 1;
      case RoleType.Kasir:
        return 2;
      case RoleType.Admin:
        return 3;
    }
  }
}

enum Permission {
  Stok,
  Inventory,
  Penjualan,
  Pembelian,
  Pendapatan,
  Pengeluaran,
  Data_Pelanggan,
  Data_Pemasok,
  Data_Pemasukan,
  Data_Pengeluaran,
  Data_Operator,
  Riwayat_Penjualan,
  Riwayat_Pembelian,
  Riwayat_Pendapatan,
  Riwayat_Pengeluaran,
  Laporan,
}

enum ResetPasswordStatus { idle, loading, success, failure }
