import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/financial/transaction_financial_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/financial/transaction_financial_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/financial/transaction_financial_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_financial.dart';
import 'package:flutter_pos/model_data/model_transaction_financial.dart';
import 'package:flutter_pos/style_and_transition_text/style/icon_size.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/template/layout_top_bottom_standart.dart';
import 'package:flutter_pos/common_widget/widget_animatePage.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_reset.dart';
import 'package:flutter_pos/common_widget/widget_custom_list_gradient.dart';
import 'package:flutter_pos/common_widget/widget_custom_snack_bar.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/common_widget/widget_dropdown_branch.dart';
import 'package:flutter_pos/common_widget/widget_navigation_gesture.dart';

class UITransactionFinancial extends StatefulWidget {
  const UITransactionFinancial({super.key});

  @override
  State<UITransactionFinancial> createState() => _UITransactionFinancialState();
}

class _UITransactionFinancialState extends State<UITransactionFinancial> {
  final isOpen = ValueNotifier<bool>(false);
  final nodes = List.generate(2, (index) => FocusNode());
  final noteController = TextEditingController();
  final amountController = TextEditingController();
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    noteController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() {
    context.read<TransFinancialBloc>().add(TransFinancialGetData());
  }

  @override
  Widget build(BuildContext context) {
    return LayoutTopBottom(
      layoutTop: layoutTop(),
      layoutBottom: layoutBottom(),
      widgetNavigation: navigationGesture(),
      refreshIndicator: refreshIndicator,
    );
  }

  Widget layoutTop() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                customButtonIcon(
                  backgroundColor: AppPropertyColor.primary,
                  icon: const Icon(
                    Icons.menu_rounded,
                    color: AppPropertyColor.white,
                    size: lv2IconSize,
                  ),
                  label: Text("Menu", style: lv05TextStyleWhite),
                  onPressed: () {
                    isOpen.value = !isOpen.value;
                  },
                ),
                const SizedBox(width: 10),
                Text("Kas", style: titleTextStyle),
              ],
            ),
            Spacer(),
            BlocSelector<TransFinancialBloc, TransFinancialState, bool>(
              selector: (state) {
                if (state is TransFinancialLoaded) {
                  return state.isIncome;
                }
                return false;
              },
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => context.read<TransFinancialBloc>().add(
                    TransFinancialStatusFinancial(),
                  ),
                  child: AnimatedContainer(
                    width: 145,
                    height: 30,
                    duration: Duration(microseconds: 500),
                    child: WidgetAnimatePage(
                      change: state,
                      text1: "Pendapatan",
                      text2: "Pengeluaran",
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: customTextField(
                controller: searchController,
                inputType: TextInputType.text,
                text: "Cari",
                enable: true,
                onChanged: (value) => context.read<TransFinancialBloc>().add(
                  TransFinancialSearch(search: value),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child:
                  BlocSelector<TransFinancialBloc, TransFinancialState, String>(
                    selector: (state) => state is TransFinancialLoaded
                        ? state.idBranch ?? ""
                        : "",
                    builder: (context, state) {
                      return WidgetDropdownBranch(
                        idBranch: state,
                        selectedIdBranch: (selectedIdBranch) {
                          context.read<TransFinancialBloc>().add(
                            TransFinancialGetData(idBranch: selectedIdBranch),
                          );
                          _resetForm();
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
                TransFinancialBloc,
                TransFinancialState,
                List<ModelFinancial>?
              >(
                selector: (state) {
                  if (state is TransFinancialLoaded) {
                    return state.filteredData;
                  }
                  return null;
                },
                builder: (context, state) {
                  return state != null
                      ? customListGradient(
                          selectedData: (selectedData) {
                            final data = ModelTransactionFinancial(
                              idFinancial: selectedData.getidFinancial,
                              nameFinancial: selectedData.getnameFinancial,
                              idBranch: selectedData.getidBranch,
                              invoice: "",
                              date: parseDate(date: DateTime.now()),
                              note: "",
                              amount: 0,
                            );
                            context.read<TransFinancialBloc>().add(
                              TransFinancialSelectedFinancial(
                                selectedFinancial: data,
                              ),
                            );
                            debugPrint(
                              "Log UITransactionFinancial: selectedData",
                            );
                          },
                          data: state,
                          getId: (data) => data.getidFinancial,
                          getName: (data) => data.getnameFinancial,
                        )
                      : Text("Data Kosong...", style: lv05TextStyle);
                },
              ),
        ),
      ],
    );
  }

  Widget layoutBottom() {
    final nullKas = "Belum memilih Kas";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('Kas:', style: lv1TextStyleBold),
                BlocSelector<TransFinancialBloc, TransFinancialState, String>(
                  selector: (state) => state is TransFinancialLoaded
                      ? state.selectedFinancial?.getnameFinancial ?? nullKas
                      : nullKas,
                  builder: (context, state) {
                    final isKas = state != nullKas;
                    return Container(
                      margin: EdgeInsets.only(left: isKas ? 10 : 0),
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isKas ? AppPropertyColor.primary : null,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        state,
                        style: isKas ? lv1TextStyleWhite : lv1TextStyle,
                      ),
                    );
                  },
                ),
              ],
            ),

            // RichText(
            //   text: TextSpan(
            //     children: [
            //       TextSpan(
            //         text:
            //             "${context.select<TransFinancialBloc, String>((value) {
            //               final bloc = value.state;
            //               if (bloc is TransFinancialLoaded) {
            //                 return bloc.selectedFinancial?.getnameFinancial ?? nullKas;
            //               }
            //               return nullKas;
            //             })}",
            //         style: lv1TextStyleBold,
            //       ),
            //     ],
            //   ),
            // ),
            customButtonIconReset(
              onPressed: () {
                context.read<TransFinancialBloc>().add(
                  TransFinancialResetSelected(),
                );
                _resetForm();
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        customTextField(
          enable: true,
          nodes: nodes,
          index: 0,
          inputType: TextInputType.text,
          controller: noteController,
          text: "Catatan",
          context: context,
        ),
        Row(
          children: [
            Expanded(
              child: customTextField(
                suffixText: ",00",
                enable: true,
                nodes: nodes,
                index: 1,
                inputType: TextInputType.number,
                controller: amountController,
                text: "Nominal",
                context: context,
                validator: (value) {
                  if (double.tryParse(value.toString()) == 0) {
                    return "Nominal tidak boleh 0";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: customButtonIcon(
                onPressed: () {
                  if ((context.read<TransFinancialBloc>().state
                              as TransFinancialLoaded)
                          .selectedFinancial ==
                      null) {
                    return customSnackBar(
                      context,
                      "Pilih Kas terlebih dahulu!",
                    );
                  }
                  if (amountController.text.isEmpty) {
                    return customSnackBar(context, "Nominal belum terisi!");
                  }

                  context.read<TransFinancialBloc>().add(
                    TransFinancialUploadTrans(
                      amount: amountController.text,
                      note: noteController.text,
                    ),
                  );
                  _resetForm();
                },
                backgroundColor: AppPropertyColor.primary,
                icon: const Icon(
                  Icons.check_rounded,
                  color: AppPropertyColor.white,
                ),
                label: Text("Simpan", style: lv05TextStyleWhite),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _resetForm() {
    noteController.clear();
    amountController.clear();
  }

  Future<void> refreshIndicator() async {
    await context.read<DataUserRepositoryCache>().initFinancial();
    _initData();
  }

  Widget navigationGesture() {
    final contentNavGesture = [
      {
        "id": "sell",
        "toContext": '/sell',
        "text_menu": "Jual-Beli",
        "onTap": () {},
      },
      {
        "id": "transfinancial",
        "toContext": '/transfinancial',
        "text_menu": "Kas",
        "onTap": () {},
      },
    ];

    return NavigationGesture(
      currentPage: "transfinancial",
      attContent: contentNavGesture,
      isOpen: isOpen,
      close: () {
        isOpen.value = false;
      },
    );
  }
}
