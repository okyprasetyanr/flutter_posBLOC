import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/sell/logic/payment/payment_bloc.dart';
import 'package:flutter_pos/features/sell/logic/payment/payment_event.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

class QuickPayWidget extends StatelessWidget {
  final double totalTransaksi;
  final Function(double) onQuickPaySelected;

  const QuickPayWidget({
    Key? key,
    required this.totalTransaksi,
    required this.onQuickPaySelected,
  }) : super(key: key);

  List<double> _generateQuickPayOptions(double total) {
    if (total <= 0) return [];

    List<double> options = [];

    // 1. Opsi
    options.add(total);

    // 2. Opsi
    double roundedUp = (total / 1000).ceil() * 1000;
    if (roundedUp > total && roundedUp <= total + 5000) {
      options.add(roundedUp);
    } else if (roundedUp <= total) {
      options.add(total + 1000);
    }

    // 3.
    if (total < 20000 && !options.contains(20000)) {
      options.add(20000.0);
    } else if (total < 50000 && !options.contains(50000)) {
      options.add(50000.0);
    } else if (total < 75000 && !options.contains(75000)) {
      options.add(75000.0);
    }

    // 4.
    if (total < 100000 && !options.contains(100000)) {
      options.add(100000.0);
    }

    // Filter duplikat, sort, dan ambil 4 opsi pertama yang lebih besar atau sama
    Set<double> uniqueOptions = options.where((o) => o >= total).toSet();
    List<double> sortedOptions = uniqueOptions.toList()..sort();

    // Pastikan Uang Pas (T) selalu di awal
    if (sortedOptions.isNotEmpty && sortedOptions.first != total) {
      sortedOptions.remove(total);
      sortedOptions.insert(0, total);
    }

    return sortedOptions.take(4).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<double> quickPayOptions = _generateQuickPayOptions(totalTransaksi);
    final selectedAmount = ValueNotifier<double>(0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Uang diterima', style: lv05TextStyle),
        const SizedBox(height: 10),
        Wrap(
          spacing: 5,
          runSpacing: 5,
          children: quickPayOptions.map((amount) {
            return ValueListenableBuilder(
              valueListenable: selectedAmount,
              builder: (context, value, child) {
                return OutlinedButton(
                  onPressed: () {
                    selectedAmount.value = amount;
                    context.read<PaymentBloc>().add(
                      PaymentAdjust(billPaid: amount),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: value == amount
                        ? AppColor.primary
                        : Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 5,
                    ),
                    side: const BorderSide(color: Colors.grey, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    formatUang(amount),
                    style: value == amount ? lv05TextStyleWhite : lv05TextStyle,
                  ),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
