import 'package:cloud_firestore/cloud_firestore.dart';
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
    print('✅ Data queued for $collection/$docId');
  }

  static Future<void> processQueue() async {
    final conn = await Connectivity().checkConnectivity();
    if (conn == ConnectivityResult.none) return; // offline, skip dulu

    final keys = _box.keys.toList();
    for (var key in keys) {
      final item = _box.get(key);
      try {
        await _firestore
            .collection(item['collection'])
            .doc(item['docId'])
            .set(item['data']);
        await _box.delete(key);
        print('✅ Sent ${item['collection']}/${item['docId']}');
      } catch (e) {
        print('❌ Failed to send: $e');
      }
    }
  }
}
