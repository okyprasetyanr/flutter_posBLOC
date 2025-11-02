import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/partner/logic/partner_bloc.dart';
import 'package:flutter_pos/features/partner/logic/partner_event.dart';
import 'package:flutter_pos/features/partner/logic/partner_state.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/template/layout_top_bottom_standart.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_text_field.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class UIPartner extends StatefulWidget {
  const UIPartner({super.key});

  @override
  State<UIPartner> createState() => _UIPartnerState();
}

class _UIPartnerState extends State<UIPartner> {
  final namePartnerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initData();
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
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
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
                            const Icon(Icons.swap_horiz_rounded, size: 25),
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
                              const Icon(Icons.swap_horiz_rounded, size: 25),
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
        ),
        Container(
          padding: const EdgeInsets.only(left: 10),
          width: 150,
          child: BlocSelector<PartnerBloc, PartnerState, bool>(
            selector: (state) => state is PartnerLoading,
            builder: (context, state) {
              return state
                  ? const SpinKitThreeBounce(color: Colors.blue, size: 20.0)
                  : BlocSelector<
                      PartnerBloc,
                      PartnerState,
                      (List<ModelBranch>, String?)
                    >(
                      selector: (state) => state is PartnerLoaded
                          ? (state.dataBranch!, state.selectedIdBranch)
                          : ([], ""),
                      builder: (context, state) {
                        if (state.$1.isEmpty) {
                          return SpinKitThreeBounce(
                            color: Colors.blue,
                            size: 30.0,
                          );
                        }
                        return DropdownButtonFormField<ModelBranch>(
                          style: lv1TextStyle,
                          initialValue: state.$1.firstWhere(
                            (data) => data.getidBranch == state.$2,
                          ),
                          items: state.$1
                              .map(
                                (map) => DropdownMenuItem(
                                  value: map,
                                  child: Text(map.getareaBranch),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            context.read<PartnerBloc>().add(
                              PartnerSelectedBranch(
                                selectedIdBranch: value!.getidBranch,
                              ),
                            );
                          },
                        );
                      },
                    );
            },
          ),
        ),
        Expanded(
          child: BlocSelector<PartnerBloc, PartnerState, bool>(
            selector: (state) => state is PartnerLoading,
            builder: (context, state) {
              return state
                  ? SpinKitThreeBounce(color: Colors.blue, size: 20.0)
                  : BlocSelector<
                      PartnerBloc,
                      PartnerState,
                      (List<ModelPartner>?, String?)
                    >(
                      selector: (state) {
                        if (state is PartnerLoaded) {
                          return (state.dataPartner, state.selectedIdBranch);
                        }
                        return ([], null);
                      },
                      builder: (context, state) {
                        if (state.$1!.isEmpty) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "Data masih Kosong",
                              style: lv1TextStyle,
                            ),
                          );
                        }
                        final dataPartner = state.$1!
                            .where((data) => data.getidBranch == state.$2)
                            .toList();
                        return Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: ListView.builder(
                            itemCount: dataPartner.length,
                            itemBuilder: (context, index) {
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
                                        PartnerSelectedCustomer(
                                          selectedPartner: dataPartner[index],
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 5,
                                        right: 5,
                                        top: 10,
                                        bottom: 10,
                                      ),

                                      child: Text(
                                        "${dataPartner[index].getname}, ${dataPartner[index].getphone}",
                                        style: lv1TextStyle,
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
        Row(
          children: [
            Expanded(
              flex: 2,
              child: BlocListener<PartnerBloc, PartnerState>(
                listenWhen: (previous, current) =>
                    previous is PartnerLoaded &&
                    current is PartnerLoaded &&
                    previous.selectedPartner != current.selectedPartner,
                listener: (context, state) {
                  if (state is PartnerLoaded && state.selectedPartner != null) {
                    namePartnerController.text = state.selectedPartner!.getname;
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
                    return customTextField(
                      "Nama Kontak",
                      namePartnerController,
                      true,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: BlocSelector<PartnerBloc, PartnerState, String?>(
                selector: (state) => state is PartnerLoaded
                    ? state.dataBranch
                          ?.firstWhere(
                            (element) =>
                                element.getidBranch == state.selectedIdBranch,
                          )
                          .getareaBranch
                    : null,
                builder: (context, state) {
                  return customTextField(
                    "Cabang",
                    TextEditingController(text: state ?? ""),
                    false,
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Align(
          alignment: AlignmentGeometry.centerRight,
          child: ElevatedButton.icon(
            onPressed: () {
              final bloc = context.read<PartnerBloc>().state;

              final idPartner = bloc is PartnerLoaded
                  ? bloc.selectedPartner?.getid ?? Uuid().v4().substring(0, 8)
                  : Uuid().v4().substring(0, 8);
              final partner = ModelPartner(
                idBranch: bloc is PartnerLoaded ? bloc.selectedIdBranch! : "",
                id: idPartner,
                name: namePartnerController.text,
                phone: "",
                email: "",
                address: "",
                notes: "",
                balance: 0,
                type: bloc is PartnerLoaded
                    ? bloc.isCustomer
                          ? PartnerType.customer
                          : PartnerType.supplier
                    : PartnerType.customer,
                createdAt: DateFormat('yyyy-MM-dd').format(DateTime.now()),
              );
              context.read<PartnerBloc>().add(
                PartnerUploadDataPartner(partner: partner),
              );
              _resetForm();
            },
            label: Text("Simpan", style: lv05TextStyleWhite),
            icon: Icon(Icons.check_rounded, color: Colors.white),
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(AppColor.primary),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _onRefresh() async {
    await context.read<DataUserRepositoryCache>().initData();
    _initData();
  }

  void _resetForm() {
    namePartnerController.clear();
  }
}
