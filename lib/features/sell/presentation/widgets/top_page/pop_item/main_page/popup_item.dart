import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/sell/logic/sell_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_event.dart';
import 'package:flutter_pos/features/sell/logic/sell_state.dart';
import 'package:flutter_pos/features/sell/presentation/widgets/top_page/pop_item/page_item/page/page_item.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_snack_bar.dart';

class UISellPopUpItem extends StatefulWidget {
  const UISellPopUpItem({super.key});

  @override
  State<UISellPopUpItem> createState() => _UISellPopUpItemState();
}

class _UISellPopUpItemState extends State<UISellPopUpItem> {
  ValueNotifier<bool> popup = ValueNotifier(false);
  ModelItemPesanan? dataselected;
  List<ModelItemPesanan> condiment = [];
  TextEditingController noteController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController customDiscountController = TextEditingController();
  PageController pageController = PageController();
  bool currentPage = true;
  double finalprice = 0;
  List<ModelItemPesanan> itemCondiment = [];

  void _gotoPage(bool page) {
    int goto = page ? 0 : 1;

    if (pageController.hasClients) {
      pageController.animateToPage(
        goto,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }

    setState(() {
      currentPage = page;
    });
  }

  @override
  void dispose() {
    popup.dispose();
    noteController.dispose();
    priceController.dispose();
    customDiscountController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SellBloc, SellState>(
      listener: (context, state) {
        if (state is SellLoaded) {
          if (state.selectedItem == null) {
            return;
          }
          final data = state.selectedItem;
          dataselected = data;
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
              margin: EdgeInsets.only(left: 8, right: 8),
              padding: EdgeInsets.all(10),
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
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: PageView(
                      controller: pageController,
                      children: [
                        SellPopUpPageItem(
                          noteController: noteController,
                          priceController: priceController,
                          customDiscountController: customDiscountController,
                        ),
                        SizedBox(
                          width: 60,
                          height: 260,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      padding: WidgetStatePropertyAll(
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
                                      _gotoPage(!currentPage);
                                    },
                                  ),
                                ),
                              ),

                              SizedBox(height: 10),
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      padding: WidgetStatePropertyAll(
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
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      padding: WidgetStatePropertyAll(
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
                                      context.read<SellBloc>().add(
                                        SellResetSelectedItem(),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                        AppColor.primary,
                                      ),
                                      padding: WidgetStatePropertyAll(
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
                                      context.read<SellBloc>().add(
                                        SellAddOrderedItem(),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
