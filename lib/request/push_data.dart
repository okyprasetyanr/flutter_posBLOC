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

Future<void> pushWorkerDataBranch({
  required String collection,
  required String id,
  required Map<String, dynamic> dataBranch,
}) async {
  await FirestoreWorker.enqueue(collection, id, dataBranch);
  await FirestoreWorker.processQueueHive();
}

Future<void> pushWorkerDataAdjustmentIn({
  required String collection,
  required String id,
  required Map<String, dynamic> dataAdjustmentIn,
}) async {
  await FirestoreWorker.enqueue(collection, id, dataAdjustmentIn);
  await FirestoreWorker.processQueueHive();
}

Future<void> pushWorkerDataBatch({
  required String id,
  required Map<String, dynamic> dataBatch,
}) async {
  await FirestoreWorker.enqueue("batch", id, dataBatch);
  await FirestoreWorker.processQueueHive();
}

Future<void> pushWorkerDataItemBatch({
  required String id,
  required Map<String, dynamic> dataItemBatch,
}) async {
  await FirestoreWorker.enqueue(
    "batch",
    collection2: "items_batch",
    id,
    dataItemBatch,
  );
  await FirestoreWorker.processQueueHive();
}

Future<void> pushWorkerDataAdjustmentOut({
  required String collection,
  required String id,
  required Map<String, dynamic> dataAdjustmentOut,
}) async {
  await FirestoreWorker.enqueue(collection, id, dataAdjustmentOut);
  await FirestoreWorker.processQueueHive();
}
