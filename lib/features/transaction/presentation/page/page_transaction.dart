import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/core/app_property/app_properties.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/features/transaction/presentation/widgets/pop_item/main_page/popup_item.dart';
import 'package:flutter_pos/core/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/transaction/logic/transaction_bloc.dart';
import 'package:flutter_pos/features/transaction/logic/transaction_event.dart';
import 'package:flutter_pos/features/transaction/logic/transaction_state.dart';
import 'package:flutter_pos/features/transaction/presentation/widgets/top_page/transaction_grid_item.dart';
import 'package:flutter_pos/features/transaction/presentation/widgets/top_page/transaction_list_category.dart';
import 'package:flutter_pos/features/transaction/presentation/widgets/top_page/transaction_saved_cart.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_bottom_sheet.dart';
import 'package:flutter_pos/shared/helper/common_helper/function.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/icon_size.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/shared/widget/template/dynamic_layout_top_bottom.dart';
import 'package:flutter_pos/features/transaction/presentation/widgets/bottom_page/transaction_bottom_page.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_animatePage.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_snack_bar.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_dropdown_branch.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_navigation_gesture.dart';

class PageTransaction extends StatefulWidget {
  const PageTransaction({super.key});

  @override
  State<PageTransaction> createState() => _PageTransactionState();
}

class _PageTransactionState extends State<PageTransaction> {
  final searchController = TextEditingController();
  final isOpen = ValueNotifier<bool>(false);
  double ratioGridView = 0;

  @override
  dispose() {
    searchController.dispose();
    isOpen.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    await Future.wait([
      context.read<DataUserRepositoryCache>().initBatch(),
      context.read<DataUserRepositoryCache>().initItem(),
      context.read<DataUserRepositoryCache>().initPartner(),
    ]);
    context.read<TransactionBloc>().add(TransactionGetData());
  }

  @override
  Widget build(BuildContext context) {
    return LayoutTopBottom(
      layoutTop: layoutTop(),
      layoutBottom: layoutBottom(),
      widgetNavigation: navigationGesture(),
      refreshIndicator: _onRefresh,
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
                  backgroundColor: context.colorTrans,
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
                    label: "Cari...",
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
                      TransactionGetData(changeMode: true),
                    );
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
                              showAt1: 5,
                              showAt2: 0,
                            );
                          },
                        ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 5),
                Expanded(
                  flex: 6,
                  child: SizedBox(height: 27, child: TransactionListCategory()),
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
                        ? const TransactionSavedCart()
                        : SizedBox.shrink();
                  },
                ),
              ],
            ),
            Expanded(child: const TransactionGridItem()),
            BlocListener<TransactionBloc, TransactionState>(
              listenWhen: (prev, curr) =>
                  prev is TransactionLoaded &&
                  curr is TransactionLoaded &&
                  curr.selectedItem != null &&
                  curr.selectedItem!.getidOrdered !=
                      prev.selectedItem?.getidOrdered,
              listener: (context, state) {
                if (state is TransactionLoaded && state.selectedItem != null) {
                  devLog(
                    "Log UITransaction: PopUpItem: SelectedItem: ${state.selectedItem}",
                  );

                  customBottomSheet(
                    context: context,
                    resetItemForm: () {
                      context.read<TransactionBloc>().add(
                        TransactionResetSelectedItem(),
                      );
                    },
                    content: (_) => BlocProvider.value(
                      value: context.read<TransactionBloc>(),
                      child: const UITransactionPopUpItem(),
                    ),
                  );
                }
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
        Padding(
          padding: EdgeInsetsGeometry.only(right: 10, top: 5, bottom: 5),
          child: Row(
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
                          subTotal +=
                              itemOrdered[i].getCondiment[u].getsubTotal;
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
                    color: AppPropertyColor.white,
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsetsGeometry.all(5),
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
        ),

        Divider(color: AppPropertyColor.grey, thickness: 1),
        Expanded(child: const TransactionBottomPage()),
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
      {
        "id": "adjustment",
        "toContext": '/adjustment',
        "text_menu": "Penyesuaian",
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
