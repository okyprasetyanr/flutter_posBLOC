import 'dart:io';
import 'package:excel/excel.dart';
import 'package:flutter_pos/shared/helper/common_helper/function.dart';

typedef SheetHandler = Future<void> Function(Sheet sheet);

class ExcelRestoreService {
  final File file;
  final Map<String, SheetHandler> handlers;

  ExcelRestoreService({required this.file, required this.handlers});

  Future<void> restore() async {
    devLog("Log ExcelRestore: Restore START");
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
  Function(Map<String, dynamic> data, String id)? fromMap,
  void Function(Map<String, dynamic> data)? getMap,
}) async {
  if (sheet.rows.length <= 1) return;

  final headers = sheet.rows.first
      .map((element) => element?.value.toString())
      .toList();

  for (int i = 1; i < sheet.rows.length; i++) {
    final row = sheet.rows[i];
    if (row.every((element) => element == null)) continue;

    final map = _mapRow(headers, row);

    if (fromMap != null) {
      await fromMap(map, map[id]);
      devLog("Log Restore: Cek Data: $map");
    }

    if (getMap != null) {
      getMap(map);
      devLog("Log Restore: Cek Data nested: $map");
    }
  }
}

Map<String, dynamic> _mapRow(List<String?> headers, List<Data?> row) {
  final Map<String, dynamic> result = {};

  for (int i = 0; i < headers.length; i++) {
    if (headers[i] == null) continue;

    final cellValue = row.length > i ? row[i]?.value : null;

    if (cellValue == null) {
      result[headers[i]!] = null;
      continue;
    }

    if (cellValue is TextCellValue) {
      result[headers[i]!] = cellValue.value.toString();
    } else if (cellValue is IntCellValue) {
      result[headers[i]!] = cellValue.value;
    } else if (cellValue is DoubleCellValue) {
      result[headers[i]!] = cellValue.value;
    } else if (cellValue is BoolCellValue) {
      result[headers[i]!] = cellValue.value;
    } else if (cellValue is DateCellValue) {
      result[headers[i]!] = cellValue.toString();
    } else {
      result[headers[i]!] = cellValue.toString();
    }
  }

  return result;
}
