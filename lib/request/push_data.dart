import 'package:flutter_pos/connection/firestore_worker.dart';

Future<void> pushWorkerDataPartner({
  required String collection,
  required String id,
  required Map<String, dynamic> dataPartner,
}) async {
  await FirestoreWorker.enqueue(collection, id, dataPartner);
  await FirestoreWorker.processQueueHive();
}

Future<void> pushWorkerDataFinancial({
  required String collection,
  required String id,
  required Map<String, dynamic> dataTransFinancial,
}) async {
  await FirestoreWorker.enqueue(collection, id, dataTransFinancial);
  await FirestoreWorker.processQueueHive();
}

Future<void> pushWorkerDataUser({
  required String collection,
  required String id,
  required Map<String, dynamic> dataUser,
}) async {
  await FirestoreWorker.enqueue(collection, id, dataUser);
  await FirestoreWorker.processQueueHive();
}
