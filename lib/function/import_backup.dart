import 'dart:io';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/from_and_to_map/from_map.dart';

class ItemExcelRestoreService {
  final DataUserRepositoryCache repo;

  ItemExcelRestoreService({required this.repo});

  /// ENTRY POINT
  Future<void> restoreFromExcel() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );

    if (result == null) return;

    final bytes =
        result.files.single.bytes ??
        await File(result.files.single.path!).readAsBytes();

    final excel = Excel.decodeBytes(bytes);
    final sheet = excel.tables[excel.tables.keys.first];

    if (sheet == null || sheet.rows.length <= 1) return;

    final headers = sheet.rows.first.map((c) => c?.value.toString()).toList();

    for (int i = 1; i < sheet.rows.length; i++) {
      final row = sheet.rows[i];
      if (row.every((c) => c == null)) continue;

      try {
        final data = _mapRow(headers, row);
        final item = fromMapItem(data, data[FieldDataItem.id_item.name]);
        repo.dataItem.add(item);
      } catch (e) {
        // optional: log error per row
        continue;
      }
    }
  }

  /// ========================
  /// INTERNAL HELPERS
  /// ========================

  Map<String, dynamic> _mapRow(List<String?> headers, List<Data?> row) {
    final Map<String, dynamic> data = {};
    for (int i = 0; i < headers.length; i++) {
      data[headers[i]!] = row.length > i ? row[i]?.value : null;
    }
    return data;
  }
}
