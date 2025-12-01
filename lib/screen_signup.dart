import 'package:flutter/material.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
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

  int selectedBranch = 0;
  final List<TextEditingController> branchControllers = [];

  @override
  void dispose() {
    emailCompanyController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneCompanyController.dispose();
    for (var c in branchControllers) {
      c.dispose();
    }
    super.dispose();
  }

  void updateBranchFields(int count) {
    if (count > branchControllers.length) {
      for (int i = branchControllers.length; i < count; i++) {
        branchControllers.add(TextEditingController());
      }
    } else {
      branchControllers.removeRange(count, branchControllers.length);
    }

    setState(() => selectedBranch = count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
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
          const SizedBox(height: 10),
          customTextField(
            context: context,
            controller: nameController,
            enable: true,
            index: 2,
            nodes: nodes,
            inputType: TextInputType.text,
            text: "Name",
          ),

          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: customTextField(
                  context: context,
                  controller: phoneCompanyController,
                  enable: true,
                  index: 3,
                  nodes: nodes,
                  inputType: TextInputType.phone,
                  text: "Phone",
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: "Total Cabang"),
                  items: totalBranch
                      .map(
                        (map) => DropdownMenuItem(
                          value: map,
                          child: Text(map, style: lv05TextStyle),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) updateBranchFields(int.parse(value));
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
          ...List.generate(selectedBranch, (i) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: customTextField(
                context: context,
                controller: branchControllers[i],
                enable: true,
                index: 4 + i,
                nodes: nodes,
                inputType: TextInputType.text,
                text: "Nama Cabang ${i + 1}",
              ),
            );
          }),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10),
        child: customButtonIcon(
          backgroundColor: AppColor.primary,
          icon: Icon(Icons.check_rounded),
          label: Text("Daftar", style: lv05TextStyle),
          onPressed: () {},
        ),
      ),
    );
  }
}
