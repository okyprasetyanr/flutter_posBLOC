import 'package:flutter_pos/connection/firestore_worker.dart';

Future<void> pushWorkerDataPartner({
  required String collection,
  required String id,
  required Map<String, dynamic> dataPartner,
}) async {
  await FirestoreWorker.enqueue('partner', id, dataPartner);
}
