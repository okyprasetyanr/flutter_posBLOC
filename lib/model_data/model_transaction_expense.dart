class ModelTransactionExpense {
  final String id;
  final DateTime time;
  final String description;
  final double amount;

  ModelTransactionExpense({
    required this.id,
    required this.time,
    required this.description,
    required this.amount,
  });
}
