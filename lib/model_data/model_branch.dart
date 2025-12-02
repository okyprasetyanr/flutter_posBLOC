import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ModelBranch extends Equatable {
  final String _areaBranch, _numTelpBranch, _addressBranch, _idBranch;
  ModelBranch({
    required String nameBranch,
    required String numTelpBranch,
    required String addressBranch,
    required String idBranch,
  }) : _areaBranch = nameBranch,
       _numTelpBranch = numTelpBranch,
       _addressBranch = addressBranch,
       _idBranch = idBranch;

  String get getareaBranch => _areaBranch;
  String get getnumTelpBranch => _numTelpBranch;
  String get getaddressBranch => _addressBranch;
  String get getidBranch => _idBranch;

  set setareaBranch(String value) => _areaBranch;
  set setnumTelpBranch(String value) => _numTelpBranch;
  set setaddressBranch(String value) => _addressBranch;
  set setidBranch(String value) => _idBranch;

  static List<ModelBranch> getDataListBranch(DocumentSnapshot data) {
    Map dataUser = data.data() as Map<String, dynamic>;
    List listbranch = dataUser['list_branch'] ?? [];
    return listbranch
        .map(
          (map) => ModelBranch(
            nameBranch: map['name_branch'],
            numTelpBranch: map['phone_branch'],
            addressBranch: map['address_branch'],
            idBranch: map['id_branch'],
          ),
        )
        .toList();
  }

  @override
  List<Object?> get props => [
    _areaBranch,
    _numTelpBranch,
    _addressBranch,
    _idBranch,
  ];
}
