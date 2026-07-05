import 'package:equatable/equatable.dart';
import 'package:flutter_pos/function/function.dart';

class ModelDateExpired with EquatableMixin {
  final String? dayExpired;
  final String? monthExpired;
  final String? yearExpired;

  ModelDateExpired({
    required this.dayExpired,
    required this.monthExpired,
    required this.yearExpired,
  });

  DateTime toDateTime() {
    return parseDate(
      date: "$dayExpired-$monthExpired-$yearExpired",
      minute: false,
    );
  }

  @override
  List<Object?> get props => [dayExpired, monthExpired, yearExpired];
}
