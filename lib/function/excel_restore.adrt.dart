import 'dart:io';
import 'package:excel/excel.dart';

typedef SheetHandler = Future<void> Function(Sheet sheet);

class ExcelRestoreService {
  final File file;
  final Map<String, SheetHandler> handlers;

  ExcelRestoreService({required this.file, required this.handlers});

  Future<void> restore() async {
    final bytes = await file.readAsBytes();
    final excel = Excel.decodeBytes(bytes);

    for (final entry in excel.tables.entries) {
      final handler = handlers[entry.key];
      if (handler != null) {
        await handler(entry.value);
      }
    }
  }
}

Future<void> restoreSheet<T>({
  required Sheet sheet,
  required String id,
  List<T>? listDataRepo,
  T? dataRepo,
  T Function(Map<String, dynamic> data, String id)? fromMap,
  void Function(Map<String, dynamic> data)? getMap,
  bool nested = false,
}) async {
  if (sheet.rows.length <= 1) return;

  final headers = sheet.rows.first.map((e) => e?.value.toString()).toList();

  for (int i = 1; i < sheet.rows.length; i++) {
    final row = sheet.rows[i];
    if (row.every((e) => e == null)) continue;

    try {
      final map = _mapRow(headers, row);
      if (!nested) {
        final model = fromMap!(map, map[id]);
        listDataRepo != null ? listDataRepo.add(model) : dataRepo = model;
      } else {
        return getMap!(fromMap!(map, map[id]) as Map<String, dynamic>);
      }
    } catch (_) {}
  }
}

Map<String, dynamic> _mapRow(List<String?> headers, List<Data?> row) {
  final Map<String, dynamic> result = {};
  for (int i = 0; i < headers.length; i++) {
    result[headers[i]!] = row.length > i ? row[i]?.value : null;
  }
  return result;
}
