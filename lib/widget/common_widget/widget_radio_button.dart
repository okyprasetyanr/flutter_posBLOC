import 'package:flutter/material.dart';

class SelectableRadioTile<T> extends StatelessWidget {
  final T value;
  final T? selectedValue;
  final String title;
  final ValueChanged<T?> onChanged;

  const SelectableRadioTile({
    super.key,
    required this.value,
    required this.selectedValue,
    required this.title,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == selectedValue;

    return InkWell(
      onTap: () => onChanged(value),
      child: Row(
        children: [
          Radio<T>(value: value),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
