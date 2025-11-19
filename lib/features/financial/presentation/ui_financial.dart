import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/financial/logic/financal_bloc.dart';
import 'package:flutter_pos/features/financial/logic/financial_event.dart';
import 'package:flutter_pos/features/financial/logic/financial_state.dart';
import 'package:flutter_pos/model_data/model_financial.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/template/layout_top_bottom_standart.dart';
import 'package:flutter_pos/widget/common_widget/widget_animatePage.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_button_reset.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_list_gradient.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_spin_kit.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/widget/common_widget/widget_dropdown_branch.dart';
import 'package:uuid/uuid.dart';

class UiFinancial extends StatefulWidget {
  const UiFinancial({super.key});

  @override
  State<UiFinancial> createState() => _UiFinancialState();
}

class _UiFinancialState extends State<UiFinancial> {
  final nameFinancialController = TextEditingController();
  final searchController = TextEditingController();

  final List<FocusNode> nodes = List.generate(3, (_) => FocusNode());

  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() {
    context.read<FinancialBloc>().add(
      FinancialGetData(isIncome: null, idBranch: null),
    );
  }

  @override
  void dispose() {
    nameFinancialController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutTopBottom(
      layoutTop: layoutTop(),
      layoutBottom: layoutBottom(),
      widgetNavigation: null,
      refreshIndicator: refreshIndicator,
    );
  }

  Widget layoutTop() {
    return Column(
      children: [
        customButtonIconReset(
          onPressed: () {
            context.read<FinancialBloc>().add(
              FinancialResetSelectedFinancial(),
            );
            searchController.clear();
            nameFinancialController.clear();
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Data Kas", style: titleTextStyle),
            SizedBox(
              width: 80,
              height: 40,
              child: BlocSelector<FinancialBloc, FinancialState, bool>(
                selector: (state) {
                  if (state is FinancialLoaded) {
                    return state.isIncome;
                  }
                  return true;
                },
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      context.read<FinancialBloc>().add(FinancialIsIncome());
                    },
                    child: WidgetAnimatePage(
                      change: state,
                      text1: "Pendapatan",
                      text2: "Pengeluaran",
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: customTextField(
                controller: searchController,
                enable: true,
                inputType: TextInputType.text,
                text: "Search",
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: BlocSelector<FinancialBloc, FinancialState, String>(
                selector: (state) =>
                    state is FinancialLoaded ? state.idBranch ?? "" : "",
                builder: (context, state) {
                  return WidgetDropdownBranch(
                    idBranch: state,
                    selectedIdBranch: (selectedIdBranch) {},
                  );
                },
              ),
            ),
          ],
        ),
        Expanded(
          child:
              BlocSelector<
                FinancialBloc,
                FinancialState,
                List<ModelFinancial>?
              >(
                selector: (state) {
                  if (state is FinancialLoaded) {
                    return state.filteredFinancial;
                  }
                  return null;
                },
                builder: (context, state) {
                  if (state == null) {
                    return customSpinKit();
                  }
                  return customListGradient(
                    data: state,
                    getId: (data) => data.getidFinancial,
                    getName: (data) => data.getnameFinancial,
                  );
                },
              ),
        ),
      ],
    );
  }

  Widget layoutBottom() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: customTextField(
                controller: nameFinancialController,
                enable: true,
                inputType: TextInputType.text,
                text: "Nama Kas",
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: customTextField(
                controller: TextEditingController(
                  text:
                      "${context.select<FinancialBloc, String?>((value) {
                        final state = value.state;
                        if (state is FinancialLoaded && state.idBranch != null) {
                          return state.dataBranch!.firstWhere((element) => element.getidBranch == state.idBranch).getareaBranch;
                        }
                        return "Mohon Tunggu...";
                      })!}",
                ),
                enable: false,
                inputType: TextInputType.text,
                text: "Cabang",
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: customButtonIcon(
            backgroundColor: AppColor.primary,
            icon: Icon(Icons.check_rounded, color: Colors.white),
            label: Text(
              context.select<FinancialBloc, String>((value) {
                final state = value.state;
                bool edit = false;
                if (state is FinancialLoaded) {
                  edit = state.seletcedFinancial != null;
                }
                return edit ? "Edit" : "Simpan";
              }),
              style: lv05TextStyleWhite,
            ),
            onPressed: () {
              final bloc =
                  context.read<FinancialBloc>().state as FinancialLoaded;
              final selectedFinancial = bloc.seletcedFinancial;
              final dataFinancial = ModelFinancial(
                type: bloc.isIncome
                    ? FinancialType.income
                    : FinancialType.expense,
                idFinancial: selectedFinancial?.getidFinancial ?? Uuid().v4(),
                nameFinancial: nameFinancialController.text,
                idBranch: bloc.idBranch!,
              );
              context.read<FinancialBloc>().add(
                FinancialUploadDataFinancial(financial: dataFinancial),
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> refreshIndicator() async {}
}
