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

      final writeBatch = _firestore.batch();
      final keysToDelete = <dynamic>[];

      debugPrint('Log FirestoreWorker: Proses Push ${keys.length}');
      for (var key in keys) {
        final item = box.get(key);
        if (item == null) continue;

        try {
          final docRef = _firestore
              .collection(item['collection'])
              .doc(item['docId']);
          writeBatch.set(docRef, item['data']);
          keysToDelete.add(key);
          debugPrint(
            'Log FirestoreWorker: Queued ${item['collection']}/${item['docId']}',
          );
        } catch (e) {
          debugPrint(
            'Log FirestoreWorker: Gagal Queue ${item['collection']}/${item['docId']}: $e',
          );
        }
      }

      await writeBatch.commit();
      for (var key in keysToDelete) {
        await box.delete(key);
      }

      debugPrint('Log FirestoreWorker: Semua data berhasil dikirim.');
    } catch (e) {
      debugPrint('Log FirestoreWorker: Error $e');
    } finally {
      _isProcessingPush = false;
    }
  }
}
