class BatchEvent {}

class BatchGetData extends BatchEvent {
  final String? idBranch;

  BatchGetData({this.idBranch});
}

class BatchSelectedIdItem extends BatchEvent {
  final String selectedIdItem;

  BatchSelectedIdItem({required this.selectedIdItem});
}

class BatchReset extends BatchEvent {}

class BatchSearchItem extends BatchEvent {
  final String search;

  BatchSearchItem({required this.search});
}
