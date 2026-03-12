import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_batch_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_item_isar.dart';
import 'package:flutter_pos/features/data_user/isar/embedded/model_item_batch_isar.dart';
import 'package:flutter_pos/model_data/model_batch.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';

Future<List<ModelItem>> fromIsarItem(List<ModelItemIsar> dataItem) async {
  return await dataItem
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
}

Future<List<ModelItemBatch>> fromIsarItemBatch(
  List<ModelItemBatchIsar> batchItem,
) async {
  return batchItem
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
      .toList();
}

Future<List<ModelBatch>> fromIsarBatch(List<ModelBatchIsar> batch) async {
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
