import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pos/shared/helper/common_helper/function.dart';
import 'package:hive/hive.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class FirestoreWorker {
  static final _firestore = FirebaseFirestore.instance;
  static final _box = Hive.box('firestoreQueue');

  static Future<void> enqueue(
    String collection,
    String docId,
    Map<String, dynamic> data, {
    String? collection2,
    String? collection3,
    String? collection4,
    String? collection5,
    String? ordered,
    bool nested = false,
    bool transaction = false,
  }) async {
    final id = DateTime.now().millisecondsSinceEpoch.toString();

    await _box.put(id, {
      'collection': collection,
      'collection2': collection2,
      'collection3': collection3,
      'collection4': collection4,
      'collection5': collection5,
      'docId': docId,
      'data': data,
      'nested': nested,
      'transaction': transaction,
    });
    devLog('Log FirestoreWorker: Simpan Hive: $collection/$docId');
  }

  static bool _isProcessingPush = false;

  static Future<void> processQueueHive() async {
    if (_isProcessingPush) {
      devLog('Log FirestoreWorker: Skipped');
      return;
    }

    _isProcessingPush = true;
    try {
      final conn = await Connectivity().checkConnectivity();
      if (conn == ConnectivityResult.none) {
        devLog('Log FirestoreWorker: Skipped Offline');
        _isProcessingPush = false;
        return;
      }

      final box = _box;
      final keys = box.keys.cast<String>().toList()
        ..sort((a, b) => a.compareTo(b));
      if (keys.isEmpty) {
        devLog('Log FirestoreWorker: Hive Kosong');
        _isProcessingPush = false;
        return;
      }

      final writeBatch = _firestore.batch();
      final keysToDelete = <dynamic>[];

      devLog('Log FirestoreWorker: Proses Push ${keys.length}');
      for (var key in keys) {
        final item = box.get(key);
        if (item == null) continue;

        try {
          final docRef = _firestore
              .collection(item['collection'])
              .doc(item['docId']);
          writeBatch.set(docRef, item['data']);
          keysToDelete.add(key);
          devLog(
            'Log FirestoreWorker: Queued ${item['collection']}/${item['docId']}',
          );
        } catch (e) {
          devLog(
            'Log FirestoreWorker: Gagal Queue ${item['collection']}/${item['docId']}: $e',
          );
        }
      }

      await writeBatch.commit();
      for (var key in keysToDelete) {
        await box.delete(key);
      }

      devLog('Log FirestoreWorker: Semua data berhasil dikirim.');
    } catch (e) {
      devLog('Log FirestoreWorker: Error $e');
    } finally {
      _isProcessingPush = false;
    }
  }
}
