class ModelExpiredItemBatch {
  final String nameItem, idItem;
  double totalExpired;
  final List<String> invoiceList;

  ModelExpiredItemBatch({
    required this.nameItem,
    required this.idItem,
    required this.totalExpired,
    required this.invoiceList,
  });

  String get getNameItem => nameItem;
  String get getidItem => idItem;
  double get gettotalExpired => totalExpired;
  List<String> get getInvoiceList => invoiceList;

  ModelExpiredItemBatch copyWith({
    String? nameItem,
    String? idItem,
    double? totalExpired,
    List<String>? invoiceList,
  }) {
    return ModelExpiredItemBatch(
      nameItem: nameItem ?? this.nameItem,
      idItem: idItem ?? this.idItem,
      totalExpired: totalExpired ?? this.totalExpired,
      invoiceList: invoiceList ?? this.invoiceList,
    );
  }
}
