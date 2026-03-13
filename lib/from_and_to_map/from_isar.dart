import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/data_user/isar/action/get/get_data_isar_by.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_batch_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_item_isar.dart';
import 'package:flutter_pos/features/data_user/isar/embedded/model_item_batch_isar.dart';
import 'package:flutter_pos/model_data/model_batch.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';

Future<List<ModelItem>> fromIsarItem(
  List<ModelItemIsar> dataItem,
  String idBranch,
) async {
  final finalDataItem = await dataItem
      .map(
        (element) => ModelItem(
          qtyItem: element.qtyItem,
          nameItem: element.nameItem,
          idItem: element.idItem,
          priceItem: element.priceItem,
          priceItemByBatch: element.priceItemByBatch,
          priceItemBuybyBatch: element.priceItemBuybyBatch,
          idCategoryItem: element.idCategoryItem,
          statusCondiment: StatusDataX.fromString(element.statusCondiment),
          urlImage: element.urlImage,
          idBranch: element.idBranch,
          barcode: element.barcode,
          statusItem: StatusDataX.fromString(element.statusItem),
          date: element.date,
        ),
      )
      .toList();
  for (int i = 0; i < finalDataItem.length; i++) {
    final item = finalDataItem[i];
    double qty = item.getqtyItem;
    final batch = await getBatchIsar(idBranch);
    final allBatchItems = batch
        .expand((batch) => batch.getitems_batch)
        .where((element) => element.getidItem == item.getidItem);

    for (final itemBatch in allBatchItems) {
      qty += itemBatch.getqtyItem_in - itemBatch.getqtyItem_out;
    }
    finalDataItem[i] = item.copyWith(qtyItem: qty);
  }
  return finalDataItem;
}

ModelItemBatch fromIsarItemBatch(ModelItemBatchIsar batchItem) {
  return ModelItemBatch(
    priceitemBuy: batchItem.priceitemBuy,
    invoice: batchItem.invoice,
    nameItem: batchItem.nameItem,
    idBranch: batchItem.idBranch,
    idItem: batchItem.idItem,
    idOrdered: batchItem.idOrdered,
    idCategoryItem: batchItem.idCategoryItem,
    note: batchItem.note,
    date_buy: batchItem.date_buy,
    expiredDate: batchItem.expiredDate,
    discountItem: batchItem.discountItem,
    qtyItem_in: batchItem.qtyItem_in,
    qtyItem_out: batchItem.qtyItem_out,
    priceItem: batchItem.priceItem,
    subTotal: batchItem.subTotal,
    priceItemFinal: batchItem.priceItemFinal,
  );
}

Future<List<ModelBatch>> fromIsarBatchToList(List<ModelBatchIsar> batch) async {
  return await batch
      .map(
        (e) => ModelBatch(
          invoice: e.invoice,
          idBranch: e.idBranch,
          date_buy: e.dateBuy,
          items_batch: e.itemsBatch
              .map(
                (item) => ModelItemBatch(
                  priceitemBuy: item.priceitemBuy,
                  invoice: item.invoice,
                  nameItem: item.nameItem,
                  idBranch: item.idBranch,
                  idItem: item.idItem,
                  idOrdered: item.idOrdered,
                  idCategoryItem: item.idCategoryItem,
                  note: item.note,
                  date_buy: item.date_buy,
                  expiredDate: item.expiredDate,
                  discountItem: item.discountItem,
                  qtyItem_in: item.qtyItem_in,
                  qtyItem_out: item.qtyItem_out,
                  priceItem: item.priceItem,
                  subTotal: item.subTotal,
                  priceItemFinal: item.priceItemFinal,
                ),
              )
              .toList(),
        ),
      )
      .toList();
}

ModelBatch fromIsarBatch(ModelBatchIsar batch) {
  return ModelBatch(
    invoice: batch.invoice,
    idBranch: batch.idBranch,
    date_buy: batch.dateBuy,
    items_batch: batch.itemsBatch
        .map(
          (item) => ModelItemBatch(
            priceitemBuy: item.priceitemBuy,
            invoice: item.invoice,
            nameItem: item.nameItem,
            idBranch: item.idBranch,
            idItem: item.idItem,
            idOrdered: item.idOrdered,
            idCategoryItem: item.idCategoryItem,
            note: item.note,
            date_buy: item.date_buy,
            expiredDate: item.expiredDate,
            discountItem: item.discountItem,
            qtyItem_in: item.qtyItem_in,
            qtyItem_out: item.qtyItem_out,
            priceItem: item.priceItem,
            subTotal: item.subTotal,
            priceItemFinal: item.priceItemFinal,
          ),
        )
        .toList(),
  );
}
