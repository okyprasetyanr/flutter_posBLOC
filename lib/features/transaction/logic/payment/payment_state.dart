import 'package:equatable/equatable.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';

class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentLoaded extends PaymentState with EquatableMixin {
  final List<ModelItemOrdered>? itemOrdered;
  final ModelTransaction? transaction_sell;
  final bool isSell;

  PaymentLoaded({
    required this.itemOrdered,
    required this.isSell,
    required this.transaction_sell,
  });

  PaymentLoaded copyWith({
    List<ModelItemOrdered>? itemOrdered,
    ModelTransaction? transaction_sell,
    bool? isSell,
  }) {
    return PaymentLoaded(
      isSell: isSell ?? this.isSell,
      itemOrdered: itemOrdered ?? itemOrdered,
      transaction_sell: transaction_sell,
    );
  }

  @override
  List<Object?> get props => [transaction_sell, itemOrdered, isSell];
}
