import 'package:equatable/equatable.dart';
import 'package:flutter_pos/model_data/model_branch.dart';

class ModelCompany extends Equatable {
  final String nameCompany, phoneCompany;
  final DateTime created;
  final List<ModelBranch> listBranch;
  ModelCompany({
    required this.listBranch,
    required this.nameCompany,
    required this.phoneCompany,
    required this.created,
  });

  String get getnameCompany => nameCompany;
  String get getphoneCompany => phoneCompany;
  DateTime get getcreated => created;
  List<ModelBranch> get getListBranch => listBranch;

  @override
  List<Object?> get props => [listBranch, nameCompany, phoneCompany, created];
}
