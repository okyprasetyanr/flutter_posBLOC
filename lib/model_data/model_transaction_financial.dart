class ModelTransactionFinancial {
  final String idTransactionFinancial,
      idBranch,
      idFinancial,
      nameFinancial,
      descriptionTransactionFinancial;
  final DateTime timeTransactionFinancial;
  final double amountTransactionFinancial;

  ModelTransactionFinancial({
    required this.idFinancial,
    required this.nameFinancial,
    required this.idBranch,
    required this.idTransactionFinancial,
    required this.timeTransactionFinancial,
    required this.descriptionTransactionFinancial,
    required this.amountTransactionFinancial,
  });
}
