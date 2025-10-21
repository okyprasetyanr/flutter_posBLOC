import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_text_field.dart';

class UICategoryTextFieldAndBranch extends StatelessWidget {
  final TextEditingController namaKategoriController;
  final VoidCallback resetKategoriForm;
  const UICategoryTextFieldAndBranch({
    super.key,
    required this.namaKategoriController,
    required this.resetKategoriForm,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: BlocListener<InventoryBloc, InventoryState>(
            listenWhen: (previous, current) =>
                previous is InventoryLoaded &&
                current is InventoryLoaded &&
                previous.dataSelectedKategori != current.dataSelectedKategori,
            listener: (context, state) {
              if (state is InventoryLoaded &&
                  state.dataSelectedKategori != null) {
                namaKategoriController.text =
                    state.dataSelectedKategori!.getnameCategory;
              }
            },
            child: customTextField(
              "Nama Kategori",
              namaKategoriController,
              true,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 1,
          child: customTextField(
            "Cabang",
            TextEditingController(
              text: context.select<InventoryBloc, String?>(
                (data) => data.state is InventoryLoaded
                    ? (data.state as InventoryLoaded).daerahCabang
                    : "",
              ),
            ),
            false,
          ),
        ),
      ],
    );
  }
}
