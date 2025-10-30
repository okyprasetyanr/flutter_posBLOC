import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/sell/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/sell/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/features/sell/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/features/sell/presentation/widgets/transaction/top_page/pop_item/page_condiment/page_condiment.dart';
import 'package:flutter_pos/features/sell/presentation/widgets/transaction/top_page/pop_item/page_item/page/page_item.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';

class UITransactionPopUpItem extends StatefulWidget {
  const UITransactionPopUpItem({super.key});

  @override
  State<UITransactionPopUpItem> createState() => _UITransactionPopUpItemState();
}

class _UITransactionPopUpItemState extends State<UITransactionPopUpItem> {
  ValueNotifier<bool> popup = ValueNotifier(false);
  PageController pageController = PageController();
  ModelItemOrdered? dataselected;
  ValueNotifier<bool> currentPage = ValueNotifier(true);

  void _gotoPage(bool page) {
    int goto = page ? 0 : 1;
    if (pageController.hasClients) {
      pageController.animateToPage(
        goto,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
    currentPage.value = page;
  }

  @override
  void dispose() {
    popup.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionBloc, TransactionState>(
      listener: (context, state) {
        if (state is TransactionLoaded) {
          final data = state.selectedItem;
          popup.value = data != null ? true : false;
        }
      },
      child: ValueListenableBuilder<bool>(
        valueListenable: popup,
        builder: (_, isVisible, __) {
          return AnimatedPositioned(
            top: isVisible ? 60 : 800,
            left: 0,
            right: 0,
            bottom: 0,
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 500),
            child: Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              padding: const EdgeInsets.only(
                top: 5,
                bottom: 0,
                right: 5,
                left: 5,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurStyle: BlurStyle.outer,
                    offset: Offset(0, 0),
                    spreadRadius: 5,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  PageView(
                    controller: pageController,
                    children: [
                      SellPopUpPageItem(),
                      UITransactionPopUpPageCondiment(),
                    ],
                  ),

                  Positioned(
                    bottom: 0,
                    left: 20,
                    right: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade600,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18),
                        ),
                      ),
                      padding: const EdgeInsets.only(top: 1, left: 5, right: 5),
                      width: 300,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  padding: const WidgetStatePropertyAll(
                                    EdgeInsets.all(10),
                                  ),
                                  backgroundColor: WidgetStatePropertyAll(
                                    const Color.fromARGB(255, 255, 154, 72),
                                  ),
                                  shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(15),
                                    ),
                                  ),
                                ),
                                child: Icon(
                                  Icons.fastfood_rounded,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                onPressed: () {
                                  _gotoPage(!currentPage.value);
                                },
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  padding: const WidgetStatePropertyAll(
                                    EdgeInsets.all(10),
                                  ),
                                  backgroundColor: WidgetStatePropertyAll(
                                    const Color.fromARGB(255, 255, 89, 78),
                                  ),
                                  shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(15),
                                    ),
                                  ),
                                ),
                                child: Icon(
                                  Icons.delete_forever_rounded,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                onPressed: () {
                                  popup.value = !isVisible;
                                  context.read<TransactionBloc>().add(
                                    TransactionDeleteItemOrdered(),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  padding: const WidgetStatePropertyAll(
                                    EdgeInsets.all(10),
                                  ),
                                  backgroundColor: WidgetStatePropertyAll(
                                    Colors.red,
                                  ),
                                  shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(15),
                                    ),
                                  ),
                                ),
                                child: Icon(
                                  Icons.close_rounded,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                onPressed: () {
                                  popup.value = false;
                                  context.read<TransactionBloc>().add(
                                    TransactionResetSelectedItem(),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: const WidgetStatePropertyAll(
                                    AppColor.primary,
                                  ),
                                  padding: const WidgetStatePropertyAll(
                                    EdgeInsets.all(10),
                                  ),
                                  shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(15),
                                    ),
                                  ),
                                ),
                                child: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                onPressed: () {
                                  ;
                                  popup.value = !isVisible;
                                  context.read<TransactionBloc>().add(
                                    TransactionAddOrderedItem(),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
