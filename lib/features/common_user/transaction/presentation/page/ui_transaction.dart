import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/transaction/pop_item/main_page/popup_item.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/transaction/top_page/grid_view_item.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/transaction/top_page/list_view_category.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/transaction/top_page/saved_cart.dart';
import 'package:flutter_pos/function/bottom_sheet.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/style_and_transition_text/style/icon_size.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/template/layout_top_bottom_standart.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/transaction/bottom_page/list_view_ordered_item.dart';
import 'package:flutter_pos/common_widget/widget_animatePage.dart';
import 'package:flutter_pos/common_widget/widget_custom_snack_bar.dart';
import 'package:flutter_pos/common_widget/widget_dropdown_branch.dart';
import 'package:flutter_pos/common_widget/widget_navigation_gesture.dart';

class UITransaction extends StatefulWidget {
  const UITransaction({super.key});

  @override
  State<UITransaction> createState() => _UITransactionState();
}

class _UITransactionState extends State<UITransaction> {
  final searchController = TextEditingController();
  final isOpen = ValueNotifier<bool>(false);
  final sellOrbuy = ValueNotifier<bool>(false);
  double ratioGridView = 0;

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  dispose() {
    sellOrbuy.dispose();
    searchController.dispose();
    isOpen.dispose();
    super.dispose();
  }

  Future<void> initData() async {
    final bloc = context.read<TransactionBloc>();
    final blocValue = bloc.state;
    bloc.add(
      TransactionGetData(
        idBranch: (blocValue is TransactionLoaded) ? blocValue.idBranch : null,
      ),
    );
  }

  Future<void> _onRefresh() async {
    await context.read<DataUserRepositoryCache>().initTransaction();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          Navigator.pop(context);
          context.read<TransactionBloc>().add(TransactionResetOrderedItem());
        }
      },
      child: LayoutTopBottom(
        layoutTop: layoutTop(),
        layoutBottom: layoutBottom(),
        widgetNavigation: navigationGesture(),
        refreshIndicator: _onRefresh,
      ),
    );
  }

  Widget layoutTop() {
    return Stack(
      children: [
        Column(
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
                Expanded(
                  flex: 1,
                  child: customTextField(
                    moreRadius: true,
                    controller: searchController,
                    text: "Cari...",
                    onChanged: (value) => context.read<TransactionBloc>().add(
                      TransactionSearchItem(text: value),
                    ),
                  ),
                ),

                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    if (!UserSession.getStatusFifo()) {
                      return customSnackBar(
                        context,
                        'Hanya dapat dilakukan di fitur FIFO!',
                      );
                    }
                    context.read<TransactionBloc>().add(
                      TransactionStatusTransaction(),
                    );
                    initData();
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: 125,
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    height: 40,
                    child:
                        BlocSelector<TransactionBloc, TransactionState, bool>(
                          selector: (state) {
                            if (state is TransactionLoaded) {
                              return state.isSell;
                            }
                            return true;
                          },
                          builder: (context, state) {
                            return WidgetAnimatePage(
                              change: state,
                              text1: "Penjualan",
                              text2: "Pembelian",
                            );
                          },
                        ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 5),
                Expanded(
                  flex: 6,
                  child: SizedBox(
                    height: 27,
                    child: UITransactionListViewCategory(),
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox(
                  width: 140,
                  child:
                      BlocSelector<TransactionBloc, TransactionState, String>(
                        selector: (state) => state is TransactionLoaded
                            ? state.idBranch ?? ""
                            : "",
                        builder: (context, state) {
                          return WidgetDropdownBranch(
                            idBranch: state,
                            selectedIdBranch: (selectedIdBranch) {
                              context.read<TransactionBloc>().add(
                                TransactionGetData(idBranch: selectedIdBranch),
                              );
                            },
                          );
                        },
                      ),
                ),
                BlocSelector<TransactionBloc, TransactionState, bool>(
                  selector: (state) {
                    if (state is TransactionLoaded) {
                      return state.isSell;
                    }
                    return true;
                  },
                  builder: (context, state) {
                    return state
                        ? const UITransactionSavedCart()
                        : SizedBox.shrink();
                  },
                ),
              ],
            ),
            Expanded(child: UITransactionGridViewItem()),
            BlocListener<TransactionBloc, TransactionState>(
              listenWhen: (prev, curr) =>
                  prev is TransactionLoaded &&
                  curr is TransactionLoaded &&
                  curr.selectedItem != null &&
                  curr.selectedItem!.getidOrdered !=
                      prev.selectedItem?.getidOrdered,
              listener: (context, state) {
                customBottomSheet(
                  context: context,
                  resetItemForm: () {
                    context.read<TransactionBloc>().add(
                      TransactionResetSelectedItem(),
                    );
                  },
                  content: (_) => UITransactionPopUpItem(),
                );
              },
              child: const SizedBox.shrink(),
            ),
          ],
        ),
      ],
    );
  }

  Widget layoutBottom() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocSelector<TransactionBloc, TransactionState, (int, double)>(
              selector: (state) {
                if (state is TransactionLoaded &&
                    state.itemOrdered.isNotEmpty) {
                  final itemOrdered = state.itemOrdered;
                  int itemcount = 0;
                  double subTotal = 0;
                  for (int i = 0; i < itemOrdered.length; i++) {
                    subTotal += itemOrdered[i].getsubTotal;
                    itemcount++;
                    if (itemOrdered[i].getCondiment.isNotEmpty) {
                      for (
                        int u = 0;
                        u < itemOrdered[i].getCondiment.length;
                        u++
                      ) {
                        itemcount++;
                        subTotal += itemOrdered[i].getCondiment[u].getsubTotal;
                      }
                    }
                  }
                  return (itemcount, subTotal);
                }
                return (0, 0);
              },
              builder: (context, state) {
                return Material(
                  elevation: 1,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sub Total:", style: lv05TextStyleBold),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 80,
                          child: Text(
                            "${formatPriceRp(state.$2)}",
                            style: lv05textStylePrice,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Text("Pesanan", style: titleTextStyle),
          ],
        ),
        Divider(color: Colors.grey[400], thickness: 1),
        Expanded(child: TransactionListViewOrderedItem()),
      ],
    );
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
      currentPage: "sell",
      attContent: contentNavGesture,
      isOpen: isOpen,
      close: () {
        isOpen.value = false;
      },
    );
  }
}
