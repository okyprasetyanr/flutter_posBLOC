import 'package:flutter/material.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/widget/common_widget/custom_dropdown_filter.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_text_field.dart';

class ScreenSignup extends StatefulWidget {
  const ScreenSignup({super.key});

  @override
  State<ScreenSignup> createState() => _ScreenSignupState();
}

class _ScreenSignupState extends State<ScreenSignup> {
  final nodes = List.generate(10, (index) => FocusNode());
  final emailCompanyController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneCompanyController = TextEditingController();
  final totalBranch = ["1", "2", "3"];

  final selectedBranch = ValueNotifier<int>(0);
  final List<TextEditingController> namaBranchControllers = [];
  final List<TextEditingController> areaBranchControllers = [];
  final List<TextEditingController> phoneBranchControllers = [];

  @override
  void dispose() {
    emailCompanyController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneCompanyController.dispose();
    for (var c in namaBranchControllers) {
      c.dispose();
    }
    for (var c in areaBranchControllers) {
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
        areaBranchControllers.add(TextEditingController());
        phoneBranchControllers.add(TextEditingController());
      }
    } else {
      namaBranchControllers.removeRange(count, namaBranchControllers.length);
      areaBranchControllers.removeRange(count, areaBranchControllers.length);
      phoneBranchControllers.removeRange(count, phoneBranchControllers.length);
    }

    selectedBranch.value = count;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Align(
                alignment: Alignment.center,
                child: Text("Pendaftaran", style: titleTextStyle),
              ),
              customTextField(
                context: context,
                controller: emailCompanyController,
                enable: true,
                index: 0,
                nodes: nodes,
                inputType: TextInputType.emailAddress,
                text: "E-mail",
              ),
              const SizedBox(height: 10),
              customTextField(
                context: context,
                controller: passwordController,
                enable: true,
                index: 1,
                nodes: nodes,
                inputType: TextInputType.text,
                text: "Password",
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text("Informasi Perusahaan", style: titleTextStyle),

                    const SizedBox(height: 10),
                    customTextField(
                      context: context,
                      controller: nameController,
                      enable: true,
                      index: 2,
                      nodes: nodes,
                      inputType: TextInputType.text,
                      text: "Nama Perusahaan",
                    ),

                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: customTextField(
                            context: context,
                            controller: phoneCompanyController,
                            enable: true,
                            index: 3,
                            nodes: nodes,
                            inputType: TextInputType.phone,
                            text: "Nomor Perusahaan",
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: WidgetDropDownFilter(
                            filters: totalBranch,
                            text: "Total Cabang",
                            selectedValue: (indexFilter) => updateBranchFields(
                              int.parse(totalBranch[indexFilter]),
                            ),
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
                child: Text("Cabang Perusahaan", style: titleTextStyle),
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
                                  color: Colors.black,
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
                                    context: context,
                                    controller: namaBranchControllers[i],
                                    enable: true,
                                    index: 4 + i,
                                    nodes: nodes,
                                    inputType: TextInputType.text,
                                    text: "Nama ${i + 1}",
                                  ),
                                  const SizedBox(height: 10),
                                  customTextField(
                                    context: context,
                                    controller: areaBranchControllers[i],
                                    enable: true,
                                    index: 5 + i,
                                    nodes: nodes,
                                    inputType: TextInputType.text,
                                    text: "Daerah ${i + 1}",
                                  ),
                                  const SizedBox(height: 10),
                                  customTextField(
                                    context: context,
                                    controller: phoneBranchControllers[i],
                                    enable: true,
                                    index: 6 + i,
                                    nodes: nodes,
                                    inputType: TextInputType.number,
                                    text: "Nomor ${i + 1}",
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
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10),
        child: customButtonIcon(
          backgroundColor: AppColor.primary,
          icon: Icon(Icons.check_rounded, color: Colors.white),
          label: Text("Daftar", style: lv05TextStyleWhite),
          onPressed: () {},
        ),
      ),
    );
  }
}
