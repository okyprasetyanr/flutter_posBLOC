import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/common_user/partner/logic/partner_bloc.dart';
import 'package:flutter_pos/features/common_user/partner/logic/partner_event.dart';
import 'package:flutter_pos/features/common_user/partner/logic/partner_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/style_and_transition/style/icon_size.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
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
    final bloc = context.read<PartnerBloc>();
    bloc.add(PartnerGetData());
  }

  @override
  Widget build(BuildContext context) {
    return LayoutTopBottom(
      layoutTop: layoutTop(),
      layoutBottom: layoutBottom(),
      widgetNavigation: null,
      refreshIndicator: _onRefresh,
    );
  }

  Widget layoutTop() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Data Kontak", style: titleTextStyle),
            GestureDetector(
              onTap: () {
                context.read<PartnerBloc>().add(PartnerStatusPartner());
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 130,
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                height: 40,
                child: BlocSelector<PartnerBloc, PartnerState, bool>(
                  selector: (state) {
                    if (state is PartnerLoaded) {
                      return state.isCustomer;
                    }
                    return true;
                  },
                  builder: (context, state) {
                    return Stack(
                      children: [
                        AnimatedPositioned(
                          curve: Curves.easeInOut,
                          left: state ? 0 : -200,
                          duration: const Duration(milliseconds: 500),
                          child: Row(
                            children: [
                              Icon(Icons.swap_horiz_rounded, size: lv3IconSize),
                              Text("Pelanggan", style: titleTextStyle),
                            ],
                          ),
                        ),
                        AnimatedPositioned(
                          curve: Curves.easeInOut,
                          left: state ? 300 : 15,
                          duration: const Duration(milliseconds: 500),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.swap_horiz_rounded,
                                  size: lv3IconSize,
                                ),
                                Text("Pemasok", style: titleTextStyle),
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
          ],
        ),
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
                        return Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: ListView.builder(
                            itemCount: state.length,
                            itemBuilder: (context, index) {
                              final partner = state[index];
                              return ShaderMask(
                                shaderCallback: (bounds) {
                                  return LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black,
                                      Colors.black,
                                      Colors.transparent,
                                    ],
                                    stops: [0, 0.02, 0.98, 1],
                                  ).createShader(bounds);
                                },
                                blendMode: BlendMode.dstIn,
                                child: Material(
                                  color: index % 2 == 0
                                      ? const Color.fromARGB(255, 235, 235, 235)
                                      : const Color.fromARGB(
                                          255,
                                          221,
                                          221,
                                          221,
                                        ),
                                  child: InkWell(
                                    onTap: () {
                                      context.read<PartnerBloc>().add(
                                        PartnerSelectedPartner(
                                          selectedPartner: partner,
                                        ),
                                      );
                                    },
                                    child: Dismissible(
                                      key: Key(partner.getid),
                                      direction: DismissDirection.endToStart,
                                      background: Container(
                                        padding: EdgeInsets.only(right: 10),
                                        color: Colors.redAccent,
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      confirmDismiss: (direction) async {
                                        final result = await showDialog<bool>(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text(
                                              "Konfirmasi",
                                              style: lv2TextStyle,
                                            ),
                                            content: Text(
                                              "Hapus Kontak ${partner.getname}?",
                                              style: lv1TextStyle,
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                  context,
                                                  false,
                                                ),
                                                child: Text(
                                                  "Batal",
                                                  style: lv1TextStyle,
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  context
                                                      .read<PartnerBloc>()
                                                      .add(
                                                        PartnerDeletePartner(
                                                          type: partner.gettype,
                                                          id: partner.getid,
                                                        ),
                                                      );
                                                  Navigator.pop(context, true);
                                                },
                                                child: Text(
                                                  "Hapus",
                                                  style: lv1TextStyle,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );

                                        if (result == true) {
                                          return true;
                                        }

                                        return false;
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 5,
                                          right: 5,
                                          top: 10,
                                          bottom: 10,
                                        ),

                                        child: Text(
                                          "${partner.getname}, ${partner.getphone}",
                                          style: lv05TextStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
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
        Align(
          alignment: Alignment.centerRight,
          child: customButtonIconReset(
            onPressed: () {
              context.read<PartnerBloc>().add(PartnerResetSelectedPartner());
              namePartnerController.clear();
              phonePartnerController.clear();
              emailPartnerController.clear();
            },
          ),
        ),
        const SizedBox(height: 15),
        BlocListener<PartnerBloc, PartnerState>(
          listenWhen: (previous, current) =>
              previous is PartnerLoaded &&
              current is PartnerLoaded &&
              previous.selectedPartner != current.selectedPartner,
          listener: (context, state) {
            if (state is PartnerLoaded && state.selectedPartner != null) {
              namePartnerController.text = state.selectedPartner!.getname;
              phonePartnerController.text = state.selectedPartner!.getphone;
              emailPartnerController.text =
                  state.selectedPartner?.getemail ?? "";
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
                  const SizedBox(height: 10),
                  Row(
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
                        child: BlocListener<PartnerBloc, PartnerState>(
                          listenWhen: (previous, current) =>
                              previous is PartnerLoaded &&
                              current is PartnerLoaded &&
                              previous.idBranch != current.idBranch,
                          listener: (context, state) {
                            if (state is PartnerLoaded &&
                                state.idBranch != null) {
                              branchController.text = state.dataBranch!
                                  .firstWhere(
                                    (e) => e.getidBranch == state.idBranch,
                                  )
                                  .getareaBranch;
                            } else {
                              branchController.text = "Mohon Tunggu";
                            }
                          },
                          child: customTextField(
                            controller: branchController,
                            enable: false,
                            inputType: TextInputType.text,
                            text: "Cabang",
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
        Align(
          alignment: AlignmentGeometry.centerRight,
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
              _resetForm();
            },
            icon: Icon(Icons.check_rounded, color: Colors.white),
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
            backgroundColor: AppColor.primary,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
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

  Future<void> _onRefresh() async {
    await context.read<DataUserRepositoryCache>().initData();
    _initData();
  }

  void _resetForm() {
    namePartnerController.clear();
    phonePartnerController.clear();
    emailPartnerController.clear();
  }
}
