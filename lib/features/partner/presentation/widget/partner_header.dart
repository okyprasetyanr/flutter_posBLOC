import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_spin_kit.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_dropdown_branch.dart';
import 'package:flutter_pos/features/partner/logic/partner_bloc.dart';
import 'package:flutter_pos/features/partner/logic/partner_event.dart';
import 'package:flutter_pos/features/partner/logic/partner_state.dart';

class PartnerHeader extends StatefulWidget {
  const PartnerHeader({super.key});

  @override
  State<PartnerHeader> createState() => _PartnerHeaderState();
}

class _PartnerHeaderState extends State<PartnerHeader> {
  final searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: customTextField(
            controller: searchController,
            enable: true,
            label: "Cari",
            inputType: TextInputType.text,
            onChanged: (value) =>
                context.read<PartnerBloc>().add(PartnerSearch(search: value)),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.only(left: 10),
          width: 150,
          child: BlocSelector<PartnerBloc, PartnerState, bool>(
            selector: (state) => state is PartnerLoading,
            builder: (context, state) {
              return state
                  ? customSpinKit()
                  : BlocSelector<PartnerBloc, PartnerState, String>(
                      selector: (state) =>
                          state is PartnerLoaded ? state.idBranch ?? "" : "",
                      builder: (context, state) {
                        return WidgetDropdownBranch(
                          idBranch: state,
                          selectedIdBranch: (selectedIdBranch) {
                            searchController.clear();
                            context.read<PartnerBloc>().add(
                              PartnerSelectedBranch(idBranch: selectedIdBranch),
                            );
                          },
                        );
                      },
                    );
            },
          ),
        ),
      ],
    );
  }
}
