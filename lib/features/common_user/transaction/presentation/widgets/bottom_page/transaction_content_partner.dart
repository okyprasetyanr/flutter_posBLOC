import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction_state.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/style_and_transition_text/style/icon_size.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/style_and_transition_text/transition_navigator/transition_up_down.dart';
import 'package:flutter_pos/template/dynamic_stl_for_color_wrapper.dart';

class TransactionContentPartner extends StatelessWidget {
  final ScrollController scrollController;
  const TransactionContentPartner({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Pilih Kontak", style: lv1TextStyleBold),

        Expanded(
          child:
              BlocSelector<
                TransactionBloc,
                TransactionState,
                List<ModelPartner>?
              >(
                selector: (state) {
                  if (state is TransactionLoaded) {
                    return state.dataPartner ?? const [];
                  }
                  return const [];
                },
                builder: (context, state) {
                  return ListView.builder(
                    controller: scrollController,
                    itemCount: state!.length,
                    itemBuilder: (context, index) {
                      return DynamicColorWrapper(
                        colorSelector: (context) => context.colorTrans,
                        builder: (context, color) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: color,
                              child: Icon(
                                Icons.person,
                                size: lv2IconSize,
                                color: AppPropertyColor.white,
                              ),
                            ),
                            title: Text(
                              state[index].getnamePartner,
                              style: lv05TextStyle,
                            ),
                            subtitle: Text(
                              "${state[index].getphonePartner}",
                              style: lv05TextStyle,
                            ),
                            onTap: () {
                              context.read<TransactionBloc>().add(
                                TransactionSelectedPartner(
                                  selectedPartner: state[index],
                                ),
                              );
                              Navigator.pop(context);
                            },
                          );
                        },
                      );
                    },
                  );
                },
              ),
        ),
        DynamicColorWrapper(
          colorSelector: (context) => context.colorTrans,
          builder: (context, color) {
            return customButtonIcon(
              backgroundColor: color,
              icon: const Icon(Icons.add, color: AppPropertyColor.white),
              label: Text("Tambah Kontak Baru", style: lv05TextStyleWhite),
              onPressed: () async {
                navUpDownTransition(
                  context,
                  '/partner',
                  false,
                  arguments:
                      (context.read<TransactionBloc>().state
                              as TransactionLoaded)
                          .isSell,
                );
              },
            );
          },
        ),
      ],
    );
  }
}
