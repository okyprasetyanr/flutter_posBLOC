import 'dart:io';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';

typedef SheetHandler = Future<void> Function(Sheet sheet);

class ExcelRestoreService {
  final File file;
  final Map<String, SheetHandler> handlers;

  ExcelRestoreService({required this.file, required this.handlers});

  Future<void> restore() async {
    debugPrint("Restore START");
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

  final headers = sheet.rows.first
      .map((element) => element?.value.toString())
      .toList();

  for (int i = 1; i < sheet.rows.length; i++) {
    final row = sheet.rows[i];
    if (row.every((element) => element == null)) continue;

    try {
      final map = _mapRow(headers, row);

      if (!nested) {
        final model = fromMap!(map, map[id]);
        if (listDataRepo != null) {
          listDataRepo.add(model);
        } else {
          dataRepo = model;
        }
        debugPrint("Log Restore: Cek Data: $listDataRepo");
      } else {
        getMap!(map);
        debugPrint("Log Restore: Cek Data nested False: $listDataRepo");
      }
    } catch (e) {
      debugPrint("Restore error: $e");
    }
  }
}

Map<String, dynamic> _mapRow(List<String?> headers, List<Data?> row) {
  final Map<String, dynamic> result = {};

  for (int i = 0; i < headers.length; i++) {
    final cell = row.length > i ? row[i]?.value : null;

    if (cell is TextCellValue) {
      result[headers[i]!] = cell.value;
    } else if (cell is IntCellValue) {
      result[headers[i]!] = cell.value;
    } else if (cell is DoubleCellValue) {
      result[headers[i]!] = cell.value;
    } else if (cell is BoolCellValue) {
      result[headers[i]!] = cell.value;
    } else if (cell is TextSpan) {
      result[headers[i]!] = cell.value;
    } else {
      result[headers[i]!] = null;
    }
  }

  return result;
}
