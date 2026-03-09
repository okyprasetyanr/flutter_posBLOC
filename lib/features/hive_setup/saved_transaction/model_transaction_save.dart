import 'package:hive/hive.dart';

class TransactionSavedHive extends HiveObject {
  final String invoice;

  final Map<String, dynamic> datatransactionSaved;

  final DateTime createdAt;

  TransactionSavedHive({
    required this.invoice,
    required this.datatransactionSaved,
    required this.createdAt,
  });

  @override
  String toString() =>
      'Invoice: $invoice, CreatedAt: $createdAt, Data: $datatransactionSaved';
}
