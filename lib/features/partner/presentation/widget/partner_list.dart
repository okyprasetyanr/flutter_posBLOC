import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_list_gradient.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_spin_kit.dart';
import 'package:flutter_pos/features/partner/logic/partner_bloc.dart';
import 'package:flutter_pos/features/partner/logic/partner_event.dart';
import 'package:flutter_pos/features/partner/logic/partner_state.dart';
import 'package:flutter_pos/features/partner/model/model_partner.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/style_font_size.dart';

class PartnerList extends StatelessWidget {
  const PartnerList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PartnerBloc, PartnerState, bool>(
      selector: (state) => state is PartnerLoading,
      builder: (context, state) {
        return state
            ? customSpinKit()
            : BlocSelector<PartnerBloc, PartnerState, List<ModelPartner>>(
                selector: (state) {
                  if (state is PartnerLoaded) {
                    return state.filteredPartner ?? [];
                  }
                  return [];
                },
                builder: (context, state) {
                  if (state.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text("Data masih Kosong", style: lv05TextStyle),
                    );
                  }
                  return customListGradient(
                    data: state,
                    deleteData: (deleteData) {
                      context.read<PartnerBloc>().add(
                        PartnerDeletePartner(
                          type: deleteData.gettypePartner,
                          id: deleteData.getidPartner,
                        ),
                      );
                    },
                    getId: (data) => data.getidPartner,
                    getName: (data) => data.getnamePartner,
                    selectedData: (selectedData) =>
                        context.read<PartnerBloc>().add(
                          PartnerSelectedPartner(selectedPartner: selectedData),
                        ),
                  );
                },
              );
      },
    );
  }
}
