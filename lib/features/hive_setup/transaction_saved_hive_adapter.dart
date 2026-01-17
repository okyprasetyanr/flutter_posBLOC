import 'package:flutter_pos/features/hive_setup/model_transaction_save.dart';
import 'package:hive/hive.dart';

class TransactionSavedHiveAdapter extends TypeAdapter<TransactionSavedHive> {
  @override
  final int typeId = 1;

  @override
  TransactionSavedHive read(BinaryReader reader) {
    final invoice = reader.readString();
    final dataMap = Map<String, dynamic>.from(reader.readMap());
    final createdAt = DateTime.fromMillisecondsSinceEpoch(reader.readInt());

    return TransactionSavedHive(
      invoice: invoice,
      datatransactionSaved: dataMap,
      createdAt: createdAt,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionSavedHive obj) {
    writer.writeString(obj.invoice);
    writer.writeMap(obj.datatransactionSaved);
    writer.writeInt(obj.createdAt.millisecondsSinceEpoch);
  }
}
