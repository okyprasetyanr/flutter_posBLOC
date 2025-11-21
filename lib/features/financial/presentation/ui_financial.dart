import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/financial/logic/financial_bloc.dart';
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
  final nameController = TextEditingController();
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
    nameController.dispose();
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
                text: "Cari",
                onChanged: (value) => context.read<FinancialBloc>().add(
                  FinancialSearch(search: value),
                ),
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
                    selectedIdBranch: (selectedIdBranch) {
                      searchController.clear();
                      context.read<FinancialBloc>().add(
                        FinancialGetData(idBranch: selectedIdBranch),
                      );
                    },
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
                    selectedData: (selectedData) =>
                        context.read<FinancialBloc>().add(
                          FinancialSelectedFinancial(
                            selectedFinancial: selectedData,
                          ),
                        ),
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
        Align(
          alignment: Alignment.centerRight,
          child: customButtonIconReset(
            onPressed: () {
              context.read<FinancialBloc>().add(
                FinancialResetSelectedFinancial(),
              );
              _resetForm();
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: BlocListener<FinancialBloc, FinancialState>(
                listener: (context, state) {
                  if (state is FinancialLoaded) {
                    nameController.text =
                        state.selectedFinancial?.getnameFinancial ?? "";
                  }
                },
                child: customTextField(
                  controller: nameController,
                  enable: true,
                  inputType: TextInputType.text,
                  text: "Nama Kas",
                ),
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
                  edit = state.selectedFinancial != null;
                }
                return edit ? "Edit" : "Simpan";
              }),
              style: lv05TextStyleWhite,
            ),
            onPressed: () {
              final bloc =
                  context.read<FinancialBloc>().state as FinancialLoaded;
              final selectedFinancial = bloc.selectedFinancial;
              final dataFinancial = ModelFinancial(
                type: bloc.isIncome
                    ? FinancialType.income
                    : FinancialType.expense,
                idFinancial: selectedFinancial?.getidFinancial ?? Uuid().v4(),
                nameFinancial: nameController.text,
                idBranch: bloc.idBranch!,
              );
              context.read<FinancialBloc>().add(
                FinancialUploadDataFinancial(financial: dataFinancial),
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              "PANDUAN:\nUntuk hapus Kategori, silahkan geser kiri Kategori yang diinginkan.",
              style: lv05TextStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  void _resetForm() {
    nameController.clear();
  }

  Future<void> refreshIndicator() async {}
}
