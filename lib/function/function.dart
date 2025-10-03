import 'package:flutter/material.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

String formatUang(String nominal) {
  final nominalfinal = nominal
      .replaceAll("R", "")
      .replaceAll(".", "")
      .replaceAll(",", "")
      .replaceAll("R", "");
  final format = NumberFormat.currency(
    locale: 'id',
    decimalDigits: 2,
    symbol: 'Rp',
  );
  final convertnominal = double.tryParse(nominalfinal);
  return format.format(convertnominal);
}

String formatQty(double qty) {
  final format = NumberFormat("##.##");
  return format.format(qty);
}

Map<String, dynamic> convertToMap(Widget toContext, String text) {
  return {'toContext': toContext, 'text_menu': text};
}

class UserSession {
  static DataUserRepositoryCache? repo;
  static String? uidUser;

  static Future<void> init(DataUserRepositoryCache repo) async {
    final pref = await SharedPreferences.getInstance();
    uidUser = pref.getString("uid_user");
    await repo.initData();
  }

  static String? ambilUidUser() {
    return uidUser;
  }
}

Map<String, dynamic> convertToMapItem(ModelItem data) {
  return {
    'uid_user': data.getuidUser,
    'nama_item': data.getnamaItem,
    'harga_item': data.gethargaItem,
    'id_item': data.getidItem,
    'id_kategori': data.getidKategoriItem,
    'status_condiment': data.getstatusCondiment,
    'url_gambar': data.geturlGambar,
    'qty_item': data.getqtyitem,
    'id_cabang': data.getidCabang,
    'barcode': data.getBarcode,
    'status_item': data.getStatusItem,
    'tanggal_item': data.getTanggalItem,
  };
}
