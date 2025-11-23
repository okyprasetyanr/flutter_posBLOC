import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/category_page/top_page/search_and_cabang.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/item_page/bottom_page/button_item.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/item_page/bottom_page/dropdown_category_item.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/item_page/bottom_page/form_field_item.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/item_page/top_page/filters_item.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/item_page/top_page/grid_view_item.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/item_page/top_page/search_and_cabang.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/category_page/bottom_page/button_category.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/category_page/bottom_page/text_field_and_branch.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/category_page/top_page/list_view_category.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/template/layout_top_bottom_standart.dart';
import 'package:flutter_pos/widget/common_widget/widget_animatePage.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_button_reset.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/widget/common_widget/widget_navigation_gesture.dart';

class UIInventory extends StatefulWidget {
  const UIInventory({super.key});

  @override
  State<UIInventory> createState() => _UIInventoryState();
}

class _UIInventoryState extends State<UIInventory> {
  List<FocusNode> nodes = List.generate(1, (_) => FocusNode());
  List<FocusNode> nodesForm = List.generate(3, (_) => FocusNode());

  final selectedIdCategoryItem = ValueNotifier<String?>(null);

  final _formKey = GlobalKey<FormState>();
  final nameItemController = TextEditingController();
  final branchItemController = TextEditingController();
  final priceItemController = TextEditingController();
  final codeBarcodeController = TextEditingController();
  final nameCategoryController = TextEditingController();
  final searchControllerItem = TextEditingController();
  final searchControllerCategory = TextEditingController();
  final isOpen = ValueNotifier<bool>(false);
  final currentPage = ValueNotifier<bool>(true);

  PageController pageControllerTop = PageController();
  PageController pageControllerBottom = PageController();

  @override
  void dispose() {
    if (mounted) {
      isOpen.dispose();
      currentPage.dispose();
      nameItemController.dispose();
      branchItemController.dispose();
      priceItemController.dispose();
      codeBarcodeController.dispose();
      nameCategoryController.dispose();
      pageControllerTop.dispose();
      pageControllerBottom.dispose();
      searchControllerItem.dispose();
      searchControllerCategory.dispose();
    }
    super.dispose();
  }

  void _gotoPage(bool page) {
    int goto = page ? 0 : 1;
    currentPage.value = page;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (pageControllerTop.hasClients && pageControllerBottom.hasClients) {
        pageControllerTop.animateToPage(
          goto,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        pageControllerBottom.animateToPage(
          goto,

          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    final bloc = context.read<InventoryBloc>();
    bloc.add(InventoryFilterItem());
    bloc.add(InventoryGetData());
  }

  Future<void> _onRefresh() async {
    final bloc = context.read<InventoryBloc>();
    bloc.add(InventoryResetItemForm());
    bloc.add(InventoryResetCategoryForm());
    _resetItemForm();
    nameCategoryController.clear();

    await context.read<DataUserRepositoryCache>().initItem();
    await context.read<DataUserRepositoryCache>().initCategory();
    await context.read<DataUserRepositoryCache>().initBatch();

    _initData();
    debugPrint("UI Inventory: initData");
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          Navigator.pop(context);
          context.read<InventoryBloc>().add(InventoryResetCategoryForm());
          context.read<InventoryBloc>().add(InventoryResetItemForm());
        }
      },
      child: LayoutTopBottom(
        refreshIndicator: _onRefresh,
        layoutTop: topLayout(),
        layoutBottom: bottomLayout(),
        widgetNavigation: navigationGesture(),
      ),
    );
  }

  Widget topLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                isOpen.value = !isOpen.value;
              },
              label: Text("Menu", style: lv05TextStyleWhite),
              icon: Icon(Icons.menu_rounded, color: Colors.white, size: 20),
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                ),
                minimumSize: const WidgetStatePropertyAll(Size(0, 0)),
                padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                ),
                backgroundColor: WidgetStatePropertyAll(AppColor.primary),
              ),
            ),

            GestureDetector(
              onTap: () {
                _gotoPage(!currentPage.value);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 150,
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                height: 40,
                child: ValueListenableBuilder(
                  valueListenable: currentPage,
                  builder: (context, value, child) {
                    return WidgetAnimatePage(
                      change: value,
                      text1: "Inventory",
                      text2: "Kategori",
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: PageView(
            controller: pageControllerTop,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIInventorySearchAndBranchItem(
                    searchControllerCategory: searchControllerCategory,
                    searchControllerItem: searchControllerItem,
                  ),

                  const SizedBox(height: 10),

                  UIFiltersItem(
                    filters: filterItem,
                    statusItem: statusData,
                    filterjenis: filterTypeItem,
                    filterCategory: filterCategory,
                    onFilterChangedCallBack:
                        ({
                          int? filter,
                          int? status,
                          int? filterjenis,
                          int? filterIDCategory,
                        }) {
                          context.read<InventoryBloc>().add(
                            InventoryFilterItem(
                              filter: filter,
                              status: status,
                              filterType: filterjenis,
                              filterByCategory: filterIDCategory,
                            ),
                          );
                        },
                  ),

                  const SizedBox(height: 10),

                  Expanded(child: UIInventoryGridViewItem()),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIInventorySearchAndBranchCategory(
                    searchControllerItem: searchControllerItem,
                    searchControllerCategory: searchControllerCategory,
                  ),
                  const SizedBox(height: 10),
                  Expanded(child: UIInventoryListViewCategory()),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget bottomLayout() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: GestureDetector(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: 250,
              height: 35,
              child: ValueListenableBuilder(
                valueListenable: currentPage,
                builder: (context, value, child) {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      AnimatedPositioned(
                        curve: Curves.easeInOut,
                        right: value ? -250 : 0,
                        top: 4,
                        duration: const Duration(milliseconds: 500),
                        child: customButtonIconReset(
                          onPressed: () {
                            _resetCategoryForm();
                          },
                        ),
                      ),
                      AnimatedPositioned(
                        curve: Curves.easeInOut,
                        right: value ? 0 : -200,
                        top: 0,
                        duration: const Duration(milliseconds: 500),
                        child: customButtonIconReset(
                          onPressed: () {
                            context.read<InventoryBloc>().add(
                              InventoryResetItemForm(),
                            );
                            _resetItemForm();
                          },
                        ),
                      ),
                      AnimatedPositioned(
                        top: 0,
                        curve: Curves.easeInOut,
                        left: value ? 0 : 450,
                        duration: const Duration(milliseconds: 500),
                        child: SizedBox(
                          width: 250,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    label: Text(
                                      "Jenis Item",
                                      style: lv1TextStyle,
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    isDense: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                  style: lv05TextStyle,
                                  initialValue:
                                      filterTypeItem[context
                                          .select<InventoryBloc, int>((value) {
                                            final blocurrentState = value.state;
                                            if (blocurrentState
                                                is InventoryLoaded) {
                                              return blocurrentState
                                                  .indexStatusItem;
                                            }
                                            return 0;
                                          })],
                                  items: filterTypeItem
                                      .map(
                                        (map) => DropdownMenuItem(
                                          value: map,
                                          child: Text(
                                            map,
                                            style: lv05TextStyle,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    context.read<InventoryBloc>().add(
                                      InventoryFilterItem(
                                        filterType: filterTypeItem.indexOf(
                                          value!,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: pageControllerBottom,
            reverse: true,
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      children: [
                        UIInventoryFormFieldItem(
                          nodes: nodesForm,
                          formKey: _formKey,
                          nameItemController: nameItemController,
                          codeBarcodeController: codeBarcodeController,
                          priceItemController: priceItemController,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: DropdownCategoryItem(
                                idCategory: selectedIdCategoryItem,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: customTextField(
                                index: 0,
                                nodes: nodes,
                                inputType: TextInputType.text,
                                context: context,
                                text: "Cabang",
                                controller: TextEditingController(
                                  text: context.select<InventoryBloc, String>(
                                    (value) => value.state is InventoryLoaded
                                        ? (value.state as InventoryLoaded)
                                                  .areaBranch ??
                                              ""
                                        : "",
                                  ),
                                ),
                                enable: false,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Expanded(
                    flex: 2,
                    child: UIInventoryButtonItem(
                      formKey: _formKey,
                      nameItemController: nameItemController,
                      priceItemController: priceItemController,
                      codeBarcodeController: codeBarcodeController,
                      selectedIdCategoryItem: selectedIdCategoryItem,
                      resetItemForm: () {
                        _resetItemForm();
                      },
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  UICategoryTextFieldAndBranch(
                    nameCategoryController: nameCategoryController,
                    resetCategoryForm: _resetCategoryForm,
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: UICategoryButtonCategory(
                      nameCategoryController: nameCategoryController,
                      resetCategoryForm: () => _resetCategoryForm(),
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: Text(
                        "PANDUAN:\nUntuk hapus Kategori, silahkan geser kiri Kategori yang diinginkan.",
                        style: lv05TextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget navigationGesture() {
    final contentNavGesture = [
      {
        "id": "inventory",
        "toContext": "/inventory",
        "text_menu": "Inventori",
        "onTap": () {},
      },
      {
        "id": "batch",
        "toContext": "/batch",
        "text_menu": "Batch",
        "onTap": () {},
      },
    ];

    return NavigationGesture(
      currentPage: "inventory",
      attContent: contentNavGesture,
      isOpen: isOpen,
      close: () {
        isOpen.value = false;
      },
    );
  }

  Widget rowContentAnim(Icon iconContent, Text textCOntent) {
    return Row(children: [iconContent, textCOntent]);
  }

  void _resetItemForm() {
    _formKey.currentState!.reset();
    final bloc = context.read<InventoryBloc>();
    bloc.add(InventoryResetItemForm());
    nameItemController.clear();
    priceItemController.clear();
    codeBarcodeController.clear();
  }

  void _resetCategoryForm() {
    context.read<InventoryBloc>().add(InventoryResetCategoryForm());
    nameCategoryController.clear();
  }
}
