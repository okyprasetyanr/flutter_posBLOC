import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/transaction/pop_item/page_condiment/page_condiment.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/transaction/pop_item/page_item/page/page_item.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/style_and_transition_text/style/icon_size.dart';

class UITransactionPopUpItem extends StatefulWidget {
  const UITransactionPopUpItem({super.key});

  @override
  State<UITransactionPopUpItem> createState() => _UITransactionPopUpItemState();
}

class _UITransactionPopUpItemState extends State<UITransactionPopUpItem> {
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
    currentPage.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                PageView(
                  controller: pageController,
                  children: [
                    TransactionPopUpPageItem(),
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
                          child:
                              BlocSelector<
                                TransactionBloc,
                                TransactionState,
                                bool
                              >(
                                selector: (state) {
                                  if (state is TransactionLoaded) {
                                    return state.isSell;
                                  }
                                  return true;
                                },
                                builder: (context, state) {
                                  return state
                                      ? ElevatedButton(
                                          style: ButtonStyle(
                                            padding:
                                                const WidgetStatePropertyAll(
                                                  EdgeInsets.all(10),
                                                ),
                                            backgroundColor:
                                                WidgetStatePropertyAll(
                                                  const Color.fromARGB(
                                                    255,
                                                    255,
                                                    154,
                                                    72,
                                                  ),
                                                ),
                                            shape: WidgetStatePropertyAll(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.fastfood_rounded,
                                            color: Colors.white,
                                            size: lv2IconSize,
                                          ),
                                          onPressed: () {
                                            _gotoPage(!currentPage.value);
                                          },
                                        )
                                      : const SizedBox.shrink();
                                },
                              ),
                        ),

                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
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
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            child: Icon(
                              Icons.delete_forever_rounded,
                              color: Colors.white,
                              size: lv2IconSize,
                            ),
                            onPressed: () {
                              context.read<TransactionBloc>().add(
                                TransactionDeleteItemOrdered(),
                              );
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
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
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            child: Icon(
                              Icons.close_rounded,
                              color: Colors.white,
                              size: lv2IconSize,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              context.read<TransactionBloc>().add(
                                TransactionResetSelectedItem(),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: const WidgetStatePropertyAll(
                                AppPropertyColor.primary,
                              ),
                              padding: const WidgetStatePropertyAll(
                                EdgeInsets.all(10),
                              ),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            child: Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                              size: lv2IconSize,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              context.read<TransactionBloc>().add(
                                TransactionAddOrderedItem(),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
