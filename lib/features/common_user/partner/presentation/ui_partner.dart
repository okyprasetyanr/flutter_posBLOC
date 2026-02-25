import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_animatePage.dart';
import 'package:flutter_pos/common_widget/widget_custom_list_gradient.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_branch.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/common_user/partner/logic/partner_bloc.dart';
import 'package:flutter_pos/features/common_user/partner/logic/partner_event.dart';
import 'package:flutter_pos/features/common_user/partner/logic/partner_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/template/layout_top_bottom_standart.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_reset.dart';
import 'package:flutter_pos/common_widget/widget_custom_spin_kit.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/common_widget/widget_dropdown_branch.dart';

class UIPartner extends StatefulWidget {
  const UIPartner({super.key});

  @override
  State<UIPartner> createState() => _UIPartnerState();
}

class _UIPartnerState extends State<UIPartner> {
  final namePartnerController = TextEditingController();
  final phonePartnerController = TextEditingController();
  final emailPartnerController = TextEditingController();
  final searchController = TextEditingController();
  final branchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List<FocusNode> nodes = List.generate(4, (_) => FocusNode());

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  void dispose() {
    searchController.dispose();
    namePartnerController.dispose();
    emailPartnerController.dispose();
    phonePartnerController.dispose();
    branchController.dispose();
    super.dispose();
  }

  Future<void> _initData() async {
    context.read<PartnerBloc>().add(PartnerGetData());
  }

  @override
  Widget build(BuildContext context) {
    return LayoutTopBottom(
      layoutTop: layoutTop(),
      layoutBottom: layoutBottom(),
      widgetNavigation: null,
      refreshIndicator: _onRefresh,
      title: "Data Kontak",
      color: context.colorPartner,
      contentAppBar: GestureDetector(
        onTap: () {
          context.read<PartnerBloc>().add(PartnerStatusPartner());
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: 123,
          height: 27,
          child: BlocSelector<PartnerBloc, PartnerState, bool>(
            selector: (state) {
              if (state is PartnerLoaded) {
                return state.isCustomer;
              }
              return true;
            },
            builder: (context, state) {
              return WidgetAnimatePage(
                change: state,
                text1: "Pelanggan",
                text2: "Pemasok",
                showAt1: 0,
                showAt2: 13,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget layoutTop() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: customTextField(
                controller: searchController,
                enable: true,
                text: "Cari",
                inputType: TextInputType.text,
                onChanged: (value) => context.read<PartnerBloc>().add(
                  PartnerSearch(search: value),
                ),
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
                          selector: (state) => state is PartnerLoaded
                              ? state.idBranch ?? ""
                              : "",
                          builder: (context, state) {
                            return WidgetDropdownBranch(
                              idBranch: state,
                              selectedIdBranch: (selectedIdBranch) {
                                searchController.clear();
                                context.read<PartnerBloc>().add(
                                  PartnerSelectedBranch(
                                    idBranch: selectedIdBranch,
                                  ),
                                );
                              },
                            );
                          },
                        );
                },
              ),
            ),
          ],
        ),
        Expanded(
          child: BlocSelector<PartnerBloc, PartnerState, bool>(
            selector: (state) => state is PartnerLoading,
            builder: (context, state) {
              return state
                  ? customSpinKit()
                  : BlocSelector<PartnerBloc, PartnerState, List<ModelPartner>>(
                      selector: (state) {
                        if (state is PartnerLoaded) {
                          return state.filteredPartner ?? [];
                        }
                        return [];
                      },
                      builder: (context, state) {
                        if (state.isEmpty) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "Data masih Kosong",
                              style: lv05TextStyle,
                            ),
                          );
                        }
                        return customListGradient(
                          data: state,
                          deleteData: (deleteData) {
                            context.read<PartnerBloc>().add(
                              PartnerDeletePartner(
                                type: deleteData.gettype,
                                id: deleteData.getid,
                              ),
                            );
                            Navigator.pop(context, true);
                          },
                          getId: (data) => data.getid,
                          getName: (data) => data.getname,
                          selectedData: (selectedData) =>
                              context.read<PartnerBloc>().add(
                                PartnerSelectedPartner(
                                  selectedPartner: selectedData,
                                ),
                              ),
                        );
                      },
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Form Data:", style: lv1TextStyleBold),
            Align(
              alignment: Alignment.centerRight,
              child: customButtonIconReset(
                onPressed: () => context.read<PartnerBloc>().add(
                  PartnerResetSelectedPartner(),
                ),
                color: context.colorPartner,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        BlocListener<PartnerBloc, PartnerState>(
          listenWhen: (previous, current) =>
              previous is PartnerLoaded &&
              current is PartnerLoaded &&
              previous.selectedPartner != current.selectedPartner,
          listener: (context, state) {
            if (state is PartnerLoaded) {
              if (state.selectedPartner != null) {
                namePartnerController.text = state.selectedPartner!.getname;
                phonePartnerController.text = state.selectedPartner!.getphone;
                emailPartnerController.text =
                    state.selectedPartner?.getemail ?? "";
              } else if (state.selectedPartner == null) {
                namePartnerController.clear();
                phonePartnerController.clear();
                emailPartnerController.clear();
              }
            }
          },
          child: BlocSelector<PartnerBloc, PartnerState, bool>(
            selector: (state) {
              if (state is PartnerLoaded) {
                return state.isCustomer;
              }
              return true;
            },
            builder: (context, state) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Form(
                          key: _formKey,
                          child: customTextField(
                            index: 0,
                            nodes: nodes,
                            inputType: TextInputType.text,
                            context: context,
                            text: "Nama Kontak",
                            controller: namePartnerController,
                            enable: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Nama tidak Boleh Kosong";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),

                      Expanded(
                        child: customTextField(
                          index: 1,
                          nodes: nodes,
                          context: context,
                          text: "Nomor Kontak",
                          controller: phonePartnerController,
                          enable: true,
                          inputType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: customTextField(
                          index: 2,
                          nodes: nodes,
                          context: context,
                          text: "E-mail",
                          controller: emailPartnerController,
                          enable: true,
                          inputType: TextInputType.emailAddress,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: customTextBranch<PartnerBloc, PartnerState>(
                          context,
                          result: (state) {
                            if (state is PartnerLoaded) {
                              return state.dataBranch
                                      ?.firstWhere(
                                        (element) =>
                                            element.getidBranch ==
                                            state.idBranch,
                                      )
                                      .getareaBranch ??
                                  "";
                            }
                            return "";
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Align(
                alignment: Alignment.center,
                child: Text(AppPropertyText.ManualDelete, style: lv05TextStyle),
              ),
            ),
            Expanded(
              flex: 2,
              child: customButtonIcon(
                onPressed: () {
                  debugPrint(
                    "UIPartner: date: ${parseDate(date: formatDate(date: DateTime.now()))},",
                  );
                  context.read<PartnerBloc>().add(
                    PartnerUploadDataPartner(
                      email: emailPartnerController.text,
                      name: namePartnerController.text,
                      phone: phonePartnerController.text,
                    ),
                  );
                },
                icon: const Icon(
                  Icons.check_rounded,
                  color: AppPropertyColor.white,
                ),
                label: Text(
                  context.select<PartnerBloc, String>((value) {
                    final bloc = value.state;
                    if (bloc is PartnerLoaded) {
                      return bloc.selectedPartner != null ? "Edit" : "Simpan";
                    }
                    return "Simpan";
                  }),
                  style: lv05TextStyleWhite,
                ),
                backgroundColor: context.colorPartner,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _onRefresh() async {
    await context.read<DataUserRepositoryCache>().initPartner();
    _initData();
  }
}
