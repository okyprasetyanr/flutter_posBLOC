import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class FirestoreWorker {
  static final _firestore = FirebaseFirestore.instance;
  static final _box = Hive.box('firestoreQueue');

  static Future<void> enqueue(
    String collection,
    String docId,
    Map<String, dynamic> data,
  ) async {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    await _box.put(id, {
      'collection': collection,
      'docId': docId,
      'data': data,
    });
    debugPrint('Log FirestoreWorker: Simpan Hive: $collection/$docId');
  }

  static bool _isProcessingPush = false;

  static Future<void> processQueueHive() async {
    if (_isProcessingPush) {
      debugPrint('Log FirestoreWorker: Skipped');
      return;
    }

    _isProcessingPush = true;
    try {
      final conn = await Connectivity().checkConnectivity();
      if (conn == ConnectivityResult.none) {
        debugPrint('Log FirestoreWorker: Skipped Offline');
        _isProcessingPush = false;
        return;
      }

      final box = _box;
      final keys = box.keys.toList();

      if (keys.isEmpty) {
        debugPrint('Log FirestoreWorker: Hive Kosong');
        _isProcessingPush = false;
        return;
      }

      debugPrint('Log FirestoreWorker: Proses Push ${keys.length}');
      for (var key in keys) {
        final item = box.get(key);
        if (item == null) continue;

        try {
          await _firestore
              .collection(item['collection'])
              .doc(item['docId'])
              .set(item['data']);
          await box.delete(key);
          debugPrint(
            'Log FirestoreWorker: Terkirim ${item['collection']}/${item['docId']}',
          );
        } catch (e) {
          debugPrint(
            'Log FirestoreWorker: Gagal ${item['collection']}/${item['docId']}: $e',
          );
        }
      }
    } catch (e) {
      debugPrint('Log FirestoreWorker: Error $e');
    } finally {
      _isProcessingPush = false;
    }
  }
}
