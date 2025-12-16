import 'package:equatable/equatable.dart';
import 'package:flutter_pos/model_data/model_branch.dart';

class ModelCompany extends Equatable {
  final String nameCompany, phoneCompany;
  final DateTime created;
  final List<ModelBranch> listBranch;
  final String header;
  final String footer;
  ModelCompany({
    this.header = "",
    this.footer = "",
    required this.listBranch,
    required this.nameCompany,
    required this.phoneCompany,
    required this.created,
  });

  String get getHeader => header;
  String get getFooter => footer;
  String get getnameCompany => nameCompany;
  String get getphoneCompany => phoneCompany;
  DateTime get getcreated => created;
  List<ModelBranch> get getListBranch => listBranch;

  ModelCompany copyWith({String? header, String? footer}) {
    return ModelCompany(
      listBranch: this.listBranch,
      nameCompany: this.nameCompany,
      phoneCompany: this.phoneCompany,
      created: this.created,
      footer: footer ?? this.footer,
      header: header ?? this.header,
    );
  }

  @override
  List<Object?> get props => [
    listBranch,
    nameCompany,
    phoneCompany,
    created,
    header,
    footer,
  ];
}
