import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_kategori.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_snack_bar.dart';
import 'package:uuid/uuid.dart';

class UIKategoriButtonKategori extends StatelessWidget {
  final TextEditingController namaKategoriController;
  final VoidCallback resetKategoriForm;
  const UIKategoriButtonKategori({
    super.key,
    required this.namaKategoriController,
    required this.resetKategoriForm,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<InventoryBloc, InventoryState, ModelKategori?>(
      selector: (state) {
        if (state is InventoryLoaded) {
          return state.dataSelectedKategori;
        }
        return null;
      },
      builder: (context, state) {
        return ElevatedButton.icon(
          onPressed: () async {
            if (namaKategoriController.text.trim().isEmpty) {
              customSnackBar(context, "Nama kategori Kosong!");
              return;
            }
            String idkategori = state?.getidKategori ?? const Uuid().v4();
            Map<String, dynamic> pushKategori = {
              "nama_kategori": namaKategoriController.text,
              "id_kategori": idkategori,
              "uid_user": UserSession.ambilUidUser(),
              "id_cabang":
                  (context.read<InventoryBloc>().state as InventoryLoaded)
                      .idCabang,
            };
            context.read<InventoryBloc>().add(
              InvUploadKategori(data: pushKategori),
            );

            resetKategoriForm();
          },
          style: ElevatedButton.styleFrom(
            iconColor: Colors.white,
            backgroundColor: AppColor.primary,
          ),
          icon: const Icon(Icons.check),
          label: Text(
            state == null ? "Simpan" : "Edit",
            style: lv1TextStyleWhite,
          ),
        );
      },
    );
  }
}
