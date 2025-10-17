import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ModelCabang extends Equatable {
  final String _areaBranch, _numTelpBranch, _addressBranch, _idBranch;
  ModelCabang({
    required String areaBranch,
    required String numTelpBranch,
    required String addressBranch,
    required String idBranch,
  }) : _areaBranch = areaBranch,
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

  static List<ModelCabang> getDataListCabang(DocumentSnapshot data) {
    Map dataUser = data.data() as Map<String, dynamic>;
    List listcabang = dataUser['cabang'] ?? [];
    return listcabang
        .map(
          (map) => ModelCabang(
            areaBranch: map['daerah_cabang'],
            numTelpBranch: map['no_telephone_cabang'],
            addressBranch: map['alamat_cabang'],
            idBranch: map['id_cabang'],
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
