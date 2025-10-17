import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_snack_bar.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class UIInventoryButtonItem extends StatelessWidget {
  final TextEditingController namaItemController;
  final TextEditingController hargaItemController;
  final TextEditingController kodeBarcodeController;
  final VoidCallback resetItemForm;
  const UIInventoryButtonItem({
    super.key,
    required this.namaItemController,
    required this.hargaItemController,
    required this.kodeBarcodeController,
    required this.resetItemForm,
  });

  @override
  Widget build(BuildContext context) {
    String? selectedKategori = context.select<InventoryBloc, String?>(
      (bloc) => bloc.state is InventoryLoaded
          ? (bloc.state as InventoryLoaded)
                .dataSelectedKategoriItem
                ?.getidCategory
          : null,
    );

    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {},
            label: Text("Hapus", style: lv0TextStyleRED),
            icon: Icon(Icons.delete, color: Colors.white),
            style: ElevatedButton.styleFrom(elevation: 4),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              if (namaItemController.text.isEmpty ||
                  hargaItemController.text.isEmpty ||
                  kodeBarcodeController.text.isEmpty ||
                  selectedKategori == null) {
                customSnackBar(context, "Data belum lengkap!");
              } else {
                final bloc = context.read<InventoryBloc>().state;
                if (bloc is InventoryLoaded) {
                  String idUser = bloc.dataSelectedItem == null
                      ? Uuid().v4()
                      : bloc.dataSelectedItem!.getidItem;
                  final data = ModelItem(
                    qtyItem: 0,
                    uidUser: UserSession.uidUser!,
                    nameItem: namaItemController.text,
                    idItem: idUser,
                    priceItem: double.tryParse(hargaItemController.text)!,
                    idCategoryItem: selectedKategori,
                    statusCondiment: bloc.condimentForm,
                    urlImage: "",
                    idBranch: bloc.idCabang!,
                    barcode: kodeBarcodeController.text,
                    statusItem: true,
                    dateItem: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                  );
                  context.read<InventoryBloc>().add(InvUploadItem(data: data));

                  resetItemForm();
                }
              }
            },
            label: BlocSelector<InventoryBloc, InventoryState, String?>(
              selector: (state) {
                if (state is InventoryLoaded) {
                  return state.dataSelectedItem != null ? "Edit" : "Simpan";
                }
                return "Simpan";
              },
              builder: (context, state) {
                return Text(state!, style: lv1TextStyleWhite);
              },
            ),

            icon: Icon(Icons.save, color: Colors.white),
            style: ElevatedButton.styleFrom(
              elevation: 4,
              backgroundColor: AppColor.primary,
            ),
          ),
        ),
      ],
    );
  }
}
