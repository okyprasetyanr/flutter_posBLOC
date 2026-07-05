import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/common_user/operator/presentation/widget/operator_button.dart';
import 'package:flutter_pos/features/common_user/operator/presentation/widget/operator_filter.dart';
import 'package:flutter_pos/features/common_user/operator/presentation/widget/operator_form.dart';
import 'package:flutter_pos/features/common_user/operator/presentation/widget/operator_form_type_status_permission.dart';
import 'package:flutter_pos/features/common_user/operator/presentation/widget/operator_header.dart';
import 'package:flutter_pos/features/common_user/operator/presentation/widget/operator_list.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/common_user/operator/logic/operator_bloc.dart';
import 'package:flutter_pos/features/common_user/operator/logic/operator_event.dart';
import 'package:flutter_pos/features/data_user/isar/action/get/get_data_isar_all.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/template/dynamic_layout_top_bottom.dart';

class UIOperator extends StatefulWidget {
  const UIOperator({super.key});

  @override
  State<UIOperator> createState() => _UIOperatorState();
}

class _UIOperatorState extends State<UIOperator> {
  final nodes = List.generate(5, (index) => FocusNode());
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final noteController = TextEditingController();
  final branchController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    emailController.dispose();
    noteController.dispose();
    branchController.dispose();
    super.dispose();
  }

  bool isOwner = false;
  @override
  void initState() {
    _initRole();
    super.initState();
  }

  Future<void> _initRole() async {
    final dataAccount = await getAllAccountIsar();
    isOwner = dataAccount.getIdUser == UserSession.uid_owner;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutTopBottom(
      layoutTop: layoutTop(),
      layoutBottom: layoutBottom(),
      widgetNavigation: null,
      refreshIndicator: refreshIndicator,
      title: "Data Operator",
    );
  }

  Widget layoutTop() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        OperatorHeader(),
        const SizedBox(height: 10),
        OperatorFilter(isOwner: isOwner),
        Expanded(child: OperatorList()),
      ],
    );
  }

  Widget layoutBottom() {
    return Column(
      children: [
        const SizedBox(height: 5),
        Expanded(
          child: OperatorForm(
            nameController: nameController,
            phoneController: phoneController,
            emailController: emailController,
            noteController: noteController,
            passwordController: passwordController,
            formKey: _formKey,
            nodes: nodes,
          ),
        ),
        OperatorFormTypeStatusPermission(),
        OperatorButton(
          nameController: nameController,
          phoneController: phoneController,
          emailController: emailController,
          noteController: noteController,
          passwordController: passwordController,
          formKey: _formKey,
        ),
      ],
    );
  }

  Future<void> refreshIndicator() async {
    await context.read<DataUserRepositoryCache>().initUser();
    context.read<OperatorBloc>().add(OperatorGetData());
  }
}
