import 'package:flutter/material.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/connection/authentication_account.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/from_and_to_map/convert_to_map.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_user.dart';
import 'package:flutter_pos/request/push_data.dart';
import 'package:flutter_pos/style_and_transition_text/style/icon_size.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/common_widget/widget_custom_dropdown_filter.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/common_widget/widget_custom_spin_kit.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_field.dart';
import 'package:uuid/uuid.dart';

class ScreenSignup extends StatefulWidget {
  const ScreenSignup({super.key});

  @override
  State<ScreenSignup> createState() => _ScreenSignupState();
}

class _ScreenSignupState extends State<ScreenSignup> {
  final nodes = List.generate(10, (index) => FocusNode());
  final emailCompanyController = TextEditingController();
  final passwordController = TextEditingController();
  final nameCompanyController = TextEditingController();
  final phoneCompanyController = TextEditingController();
  final totalBranch = TotalBranch.values.map((map) => map).toList();

  final _formKey = GlobalKey<FormState>();

  final selectedBranch = ValueNotifier<int>(0);
  final List<TextEditingController> namaBranchControllers = [];
  final List<TextEditingController> addressBranchControllers = [];
  final List<TextEditingController> phoneBranchControllers = [];

  @override
  void dispose() {
    emailCompanyController.dispose();
    passwordController.dispose();
    nameCompanyController.dispose();
    phoneCompanyController.dispose();
    for (var c in namaBranchControllers) {
      c.dispose();
    }
    for (var c in addressBranchControllers) {
      c.dispose();
    }
    for (var c in phoneBranchControllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    updateBranchFields(1);
  }

  void updateBranchFields(int count) {
    if (count > namaBranchControllers.length) {
      for (int i = namaBranchControllers.length; i < count; i++) {
        namaBranchControllers.add(TextEditingController());
        addressBranchControllers.add(TextEditingController());
        phoneBranchControllers.add(TextEditingController());
      }
    } else {
      namaBranchControllers.removeRange(count, namaBranchControllers.length);
      addressBranchControllers.removeRange(
        count,
        addressBranchControllers.length,
      );
      phoneBranchControllers.removeRange(count, phoneBranchControllers.length);
    }

    selectedBranch.value = count;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPropertyColor.white,
      body: SafeArea(
        top: true,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text("Pendaftaran", style: titleTextStyle),
                ),
                customTextField(
                  prefix: const Icon(Icons.email_rounded, size: lv05IconSize),
                  context: context,
                  controller: emailCompanyController,
                  enable: true,
                  index: 0,
                  nodes: nodes,
                  inputType: TextInputType.emailAddress,
                  text: "E-mail",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                customTextField(
                  prefix: const Icon(
                    Icons.password_rounded,
                    size: lv05IconSize,
                  ),
                  context: context,
                  controller: passwordController,
                  enable: true,
                  index: 1,
                  nodes: nodes,
                  inputType: TextInputType.text,
                  text: "Kata Sandi",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      customTextField(
                        prefix: Icon(
                          Icons.add_business_rounded,
                          size: lv05IconSize,
                        ),
                        context: context,
                        controller: nameCompanyController,
                        enable: true,
                        index: 2,
                        nodes: nodes,
                        inputType: TextInputType.text,
                        text: "Nama Usaha",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Tidak boleh kosong!";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: customTextField(
                              prefix: Icon(
                                Icons.phone_iphone_rounded,
                                size: lv05IconSize,
                              ),
                              context: context,
                              controller: phoneCompanyController,
                              enable: true,
                              index: 3,
                              nodes: nodes,
                              inputType: TextInputType.phone,
                              text: "Nomor Usaha",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Tidak boleh kosong!";
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: WidgetDropDownFilter(
                              initialValue: TotalBranch.one,
                              filters: totalBranch,
                              text: "Total Cabang",
                              extension: (extension) => extension.number,
                              selectedValue: (indexFilter) =>
                                  updateBranchFields(indexFilter.number),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Text("Cabang Usaha", style: titleTextStyle),
                ),
                const SizedBox(height: 5),
                ValueListenableBuilder(
                  valueListenable: selectedBranch,
                  builder: (context, value, child) {
                    return Column(
                      children: [
                        ...List.generate(selectedBranch.value, (i) {
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: BoxBorder.all(
                                    width: 1,
                                    color: AppPropertyColor.black,
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text(
                                      "Cabang ${i + 1}",
                                      style: lv1TextStyleBold,
                                    ),
                                    const SizedBox(height: 5),
                                    customTextField(
                                      prefix: Icon(
                                        Icons.add_business_rounded,
                                        size: lv05IconSize,
                                      ),
                                      context: context,
                                      controller: namaBranchControllers[i],
                                      enable: true,
                                      inputType: TextInputType.text,
                                      text: "Nama Cabang ${i + 1}",
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Tidak boleh kosong!";
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    customTextField(
                                      prefix: Icon(
                                        Icons.location_on_rounded,
                                        size: lv05IconSize,
                                      ),
                                      context: context,
                                      controller: addressBranchControllers[i],
                                      enable: true,
                                      inputType: TextInputType.text,
                                      text: "Daerah Cabang ${i + 1}",
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Tidak boleh kosong!";
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    customTextField(
                                      prefix: Icon(
                                        Icons.phone_android_rounded,
                                        size: lv05IconSize,
                                      ),
                                      context: context,
                                      controller: phoneBranchControllers[i],
                                      enable: true,
                                      inputType: TextInputType.number,
                                      text: "Nomor Cabang ${i + 1}",
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Tidak boleh kosong!";
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          );
                        }),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: customButtonIcon(
          backgroundColor: AppPropertyColor.primary,
          icon: const Icon(
            Icons.check_rounded,
            color: AppPropertyColor.white,
            size: lv05IconSize,
          ),
          label: Text("Daftar", style: lv05TextStyleWhite),
          onPressed: () async {
            if (!_formKey.currentState!.validate()) {
              return;
            } else {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return Center(
                    child: customSpinKit(
                      color: AppPropertyColor.white,
                      size: 30,
                    ),
                  );
                },
              );

              final userCredential = await authenticatorAccount(
                context: context,
                email: emailCompanyController.text,
                password: passwordController.text,
                signup: true,
              );

              if (userCredential == null) return Navigator.of(context).pop();

              final uidUser = userCredential.user!.uid;

              final data = ModelUser(
                idBranchUser: null,
                statusUser: StatusData.Aktif,
                createdUser: dateNowYMDBLOC(),
                idUser: null,
                nameUser: nameCompanyController.text,
                emailUser: emailCompanyController.text,
                phoneUser: phoneCompanyController.text,
                roleUser: RoleType.Pemilik,
                permissionsUser: {
                  for (final permission in Permission.values) permission: true,
                },
              );

              await data.pushDataUser();

              final listBranch = [
                for (int i = 0; i < selectedBranch.value; i++)
                  {
                    'id_branch': Uuid().v4().substring(0, 8),
                    'name_branch': namaBranchControllers[i].text,
                    'address_branch': addressBranchControllers[i].text,
                    'phone_branch': phoneBranchControllers[i].text,
                  },
              ];

              await pushWorkerDataBranch(
                collection: 'companies',
                id: uidUser,
                dataBranch: convertToMapCompanySignUp(
                  created: formatDate(date: DateTime.now(), minute: false),
                  nameCompany: nameCompanyController.text,
                  phoneCompany: phoneCompanyController.text,
                  listBranch: listBranch,
                ),
              );

              Navigator.of(context).pop();
            }
          },
        ),
      ),
    );
  }
}
