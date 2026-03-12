// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_account_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModelAccountIsarCollection on Isar {
  IsarCollection<ModelAccountIsar> get modelAccountIsars => this.collection();
}

const ModelAccountIsarSchema = CollectionSchema(
  name: r'ModelAccountIsar',
  id: 714799156857134886,
  properties: {
    r'Data_Operator': PropertySchema(
      id: 0,
      name: r'Data_Operator',
      type: IsarType.bool,
    ),
    r'Data_Pelanggan': PropertySchema(
      id: 1,
      name: r'Data_Pelanggan',
      type: IsarType.bool,
    ),
    r'Data_Pemasok': PropertySchema(
      id: 2,
      name: r'Data_Pemasok',
      type: IsarType.bool,
    ),
    r'Data_Pemasukan': PropertySchema(
      id: 3,
      name: r'Data_Pemasukan',
      type: IsarType.bool,
    ),
    r'Data_Pengeluaran': PropertySchema(
      id: 4,
      name: r'Data_Pengeluaran',
      type: IsarType.bool,
    ),
    r'Inventory': PropertySchema(
      id: 5,
      name: r'Inventory',
      type: IsarType.bool,
    ),
    r'Laporan': PropertySchema(
      id: 6,
      name: r'Laporan',
      type: IsarType.bool,
    ),
    r'Pembelian': PropertySchema(
      id: 7,
      name: r'Pembelian',
      type: IsarType.bool,
    ),
    r'Pendapatan': PropertySchema(
      id: 8,
      name: r'Pendapatan',
      type: IsarType.bool,
    ),
    r'Pengeluaran': PropertySchema(
      id: 9,
      name: r'Pengeluaran',
      type: IsarType.bool,
    ),
    r'Penjualan': PropertySchema(
      id: 10,
      name: r'Penjualan',
      type: IsarType.bool,
    ),
    r'Riwayat_Pembelian': PropertySchema(
      id: 11,
      name: r'Riwayat_Pembelian',
      type: IsarType.bool,
    ),
    r'Riwayat_Pendapatan': PropertySchema(
      id: 12,
      name: r'Riwayat_Pendapatan',
      type: IsarType.bool,
    ),
    r'Riwayat_Pengeluaran': PropertySchema(
      id: 13,
      name: r'Riwayat_Pengeluaran',
      type: IsarType.bool,
    ),
    r'Riwayat_Penjualan': PropertySchema(
      id: 14,
      name: r'Riwayat_Penjualan',
      type: IsarType.bool,
    ),
    r'Stok': PropertySchema(
      id: 15,
      name: r'Stok',
      type: IsarType.bool,
    ),
    r'createdUser': PropertySchema(
      id: 16,
      name: r'createdUser',
      type: IsarType.dateTime,
    ),
    r'emailUser': PropertySchema(
      id: 17,
      name: r'emailUser',
      type: IsarType.string,
    ),
    r'idBranchUser': PropertySchema(
      id: 18,
      name: r'idBranchUser',
      type: IsarType.string,
    ),
    r'idUser': PropertySchema(
      id: 19,
      name: r'idUser',
      type: IsarType.string,
    ),
    r'nameUser': PropertySchema(
      id: 20,
      name: r'nameUser',
      type: IsarType.string,
    ),
    r'noteUser': PropertySchema(
      id: 21,
      name: r'noteUser',
      type: IsarType.string,
    ),
    r'phoneUser': PropertySchema(
      id: 22,
      name: r'phoneUser',
      type: IsarType.string,
    ),
    r'roleUser': PropertySchema(
      id: 23,
      name: r'roleUser',
      type: IsarType.string,
    ),
    r'statusUser': PropertySchema(
      id: 24,
      name: r'statusUser',
      type: IsarType.string,
    )
  },
  estimateSize: _modelAccountIsarEstimateSize,
  serialize: _modelAccountIsarSerialize,
  deserialize: _modelAccountIsarDeserialize,
  deserializeProp: _modelAccountIsarDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'idUser': IndexSchema(
      id: 4457735720952084498,
      name: r'idUser',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'idUser',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'idBranchUser': IndexSchema(
      id: 6180158750936657462,
      name: r'idBranchUser',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'idBranchUser',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _modelAccountIsarGetId,
  getLinks: _modelAccountIsarGetLinks,
  attach: _modelAccountIsarAttach,
  version: '3.1.0+1',
);

int _modelAccountIsarEstimateSize(
  ModelAccountIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.emailUser.length * 3;
  {
    final value = object.idBranchUser;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.idUser.length * 3;
  bytesCount += 3 + object.nameUser.length * 3;
  {
    final value = object.noteUser;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.phoneUser.length * 3;
  bytesCount += 3 + object.roleUser.length * 3;
  bytesCount += 3 + object.statusUser.length * 3;
  return bytesCount;
}

void _modelAccountIsarSerialize(
  ModelAccountIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.Data_Operator);
  writer.writeBool(offsets[1], object.Data_Pelanggan);
  writer.writeBool(offsets[2], object.Data_Pemasok);
  writer.writeBool(offsets[3], object.Data_Pemasukan);
  writer.writeBool(offsets[4], object.Data_Pengeluaran);
  writer.writeBool(offsets[5], object.Inventory);
  writer.writeBool(offsets[6], object.Laporan);
  writer.writeBool(offsets[7], object.Pembelian);
  writer.writeBool(offsets[8], object.Pendapatan);
  writer.writeBool(offsets[9], object.Pengeluaran);
  writer.writeBool(offsets[10], object.Penjualan);
  writer.writeBool(offsets[11], object.Riwayat_Pembelian);
  writer.writeBool(offsets[12], object.Riwayat_Pendapatan);
  writer.writeBool(offsets[13], object.Riwayat_Pengeluaran);
  writer.writeBool(offsets[14], object.Riwayat_Penjualan);
  writer.writeBool(offsets[15], object.Stok);
  writer.writeDateTime(offsets[16], object.createdUser);
  writer.writeString(offsets[17], object.emailUser);
  writer.writeString(offsets[18], object.idBranchUser);
  writer.writeString(offsets[19], object.idUser);
  writer.writeString(offsets[20], object.nameUser);
  writer.writeString(offsets[21], object.noteUser);
  writer.writeString(offsets[22], object.phoneUser);
  writer.writeString(offsets[23], object.roleUser);
  writer.writeString(offsets[24], object.statusUser);
}

ModelAccountIsar _modelAccountIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelAccountIsar();
  object.Data_Operator = reader.readBool(offsets[0]);
  object.Data_Pelanggan = reader.readBool(offsets[1]);
  object.Data_Pemasok = reader.readBool(offsets[2]);
  object.Data_Pemasukan = reader.readBool(offsets[3]);
  object.Data_Pengeluaran = reader.readBool(offsets[4]);
  object.Inventory = reader.readBool(offsets[5]);
  object.Laporan = reader.readBool(offsets[6]);
  object.Pembelian = reader.readBool(offsets[7]);
  object.Pendapatan = reader.readBool(offsets[8]);
  object.Pengeluaran = reader.readBool(offsets[9]);
  object.Penjualan = reader.readBool(offsets[10]);
  object.Riwayat_Pembelian = reader.readBool(offsets[11]);
  object.Riwayat_Pendapatan = reader.readBool(offsets[12]);
  object.Riwayat_Pengeluaran = reader.readBool(offsets[13]);
  object.Riwayat_Penjualan = reader.readBool(offsets[14]);
  object.Stok = reader.readBool(offsets[15]);
  object.createdUser = reader.readDateTimeOrNull(offsets[16]);
  object.emailUser = reader.readString(offsets[17]);
  object.idBranchUser = reader.readStringOrNull(offsets[18]);
  object.idUser = reader.readString(offsets[19]);
  object.isarId = id;
  object.nameUser = reader.readString(offsets[20]);
  object.noteUser = reader.readStringOrNull(offsets[21]);
  object.phoneUser = reader.readString(offsets[22]);
  object.roleUser = reader.readString(offsets[23]);
  object.statusUser = reader.readString(offsets[24]);
  return object;
}

P _modelAccountIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readBool(offset)) as P;
    case 15:
      return (reader.readBool(offset)) as P;
    case 16:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 17:
      return (reader.readString(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readString(offset)) as P;
    case 20:
      return (reader.readString(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readString(offset)) as P;
    case 23:
      return (reader.readString(offset)) as P;
    case 24:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _modelAccountIsarGetId(ModelAccountIsar object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _modelAccountIsarGetLinks(ModelAccountIsar object) {
  return [];
}

void _modelAccountIsarAttach(
    IsarCollection<dynamic> col, Id id, ModelAccountIsar object) {
  object.isarId = id;
}

extension ModelAccountIsarByIndex on IsarCollection<ModelAccountIsar> {
  Future<ModelAccountIsar?> getByIdUser(String idUser) {
    return getByIndex(r'idUser', [idUser]);
  }

  ModelAccountIsar? getByIdUserSync(String idUser) {
    return getByIndexSync(r'idUser', [idUser]);
  }

  Future<bool> deleteByIdUser(String idUser) {
    return deleteByIndex(r'idUser', [idUser]);
  }

  bool deleteByIdUserSync(String idUser) {
    return deleteByIndexSync(r'idUser', [idUser]);
  }

  Future<List<ModelAccountIsar?>> getAllByIdUser(List<String> idUserValues) {
    final values = idUserValues.map((e) => [e]).toList();
    return getAllByIndex(r'idUser', values);
  }

  List<ModelAccountIsar?> getAllByIdUserSync(List<String> idUserValues) {
    final values = idUserValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'idUser', values);
  }

  Future<int> deleteAllByIdUser(List<String> idUserValues) {
    final values = idUserValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'idUser', values);
  }

  int deleteAllByIdUserSync(List<String> idUserValues) {
    final values = idUserValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'idUser', values);
  }

  Future<Id> putByIdUser(ModelAccountIsar object) {
    return putByIndex(r'idUser', object);
  }

  Id putByIdUserSync(ModelAccountIsar object, {bool saveLinks = true}) {
    return putByIndexSync(r'idUser', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIdUser(List<ModelAccountIsar> objects) {
    return putAllByIndex(r'idUser', objects);
  }

  List<Id> putAllByIdUserSync(List<ModelAccountIsar> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'idUser', objects, saveLinks: saveLinks);
  }
}

extension ModelAccountIsarQueryWhereSort
    on QueryBuilder<ModelAccountIsar, ModelAccountIsar, QWhere> {
  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModelAccountIsarQueryWhere
    on QueryBuilder<ModelAccountIsar, ModelAccountIsar, QWhereClause> {
  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterWhereClause>
      isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterWhereClause>
      isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterWhereClause>
      idUserEqualTo(String idUser) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idUser',
        value: [idUser],
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterWhereClause>
      idUserNotEqualTo(String idUser) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idUser',
              lower: [],
              upper: [idUser],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idUser',
              lower: [idUser],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idUser',
              lower: [idUser],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idUser',
              lower: [],
              upper: [idUser],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterWhereClause>
      idBranchUserIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idBranchUser',
        value: [null],
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterWhereClause>
      idBranchUserIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'idBranchUser',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterWhereClause>
      idBranchUserEqualTo(String? idBranchUser) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idBranchUser',
        value: [idBranchUser],
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterWhereClause>
      idBranchUserNotEqualTo(String? idBranchUser) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idBranchUser',
              lower: [],
              upper: [idBranchUser],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idBranchUser',
              lower: [idBranchUser],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idBranchUser',
              lower: [idBranchUser],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idBranchUser',
              lower: [],
              upper: [idBranchUser],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ModelAccountIsarQueryFilter
    on QueryBuilder<ModelAccountIsar, ModelAccountIsar, QFilterCondition> {
  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      data_OperatorEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Data_Operator',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      data_PelangganEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Data_Pelanggan',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      data_PemasokEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Data_Pemasok',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      data_PemasukanEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Data_Pemasukan',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      data_PengeluaranEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Data_Pengeluaran',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      inventoryEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Inventory',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      laporanEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Laporan',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      pembelianEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Pembelian',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      pendapatanEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Pendapatan',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      pengeluaranEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Pengeluaran',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      penjualanEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Penjualan',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      riwayat_PembelianEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Riwayat_Pembelian',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      riwayat_PendapatanEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Riwayat_Pendapatan',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      riwayat_PengeluaranEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Riwayat_Pengeluaran',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      riwayat_PenjualanEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Riwayat_Penjualan',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      stokEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Stok',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      createdUserIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdUser',
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      createdUserIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdUser',
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      createdUserEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdUser',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      createdUserGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdUser',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      createdUserLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdUser',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      createdUserBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdUser',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      emailUserEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emailUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      emailUserGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'emailUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      emailUserLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'emailUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      emailUserBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'emailUser',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      emailUserStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'emailUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      emailUserEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'emailUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      emailUserContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'emailUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      emailUserMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'emailUser',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      emailUserIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emailUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      emailUserIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'emailUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      idBranchUserIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idBranchUser',
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      idBranchUserIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idBranchUser',
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      idBranchUserEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idBranchUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      idBranchUserGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idBranchUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      idBranchUserLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idBranchUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      idBranchUserBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idBranchUser',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      idBranchUserStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idBranchUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      idBranchUserEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idBranchUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      idBranchUserContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idBranchUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      idBranchUserMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idBranchUser',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      idBranchUserIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idBranchUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      idBranchUserIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idBranchUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      idUserEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      idUserGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      idUserLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      idUserBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idUser',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      idUserStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      idUserEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      idUserContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      idUserMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idUser',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      idUserIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      idUserIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      nameUserEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      nameUserGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nameUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      nameUserLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nameUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      nameUserBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nameUser',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      nameUserStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nameUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      nameUserEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nameUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      nameUserContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nameUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      nameUserMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nameUser',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      nameUserIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      nameUserIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      noteUserIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'noteUser',
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      noteUserIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'noteUser',
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      noteUserEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'noteUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      noteUserGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'noteUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      noteUserLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'noteUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      noteUserBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'noteUser',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      noteUserStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'noteUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      noteUserEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'noteUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      noteUserContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'noteUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      noteUserMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'noteUser',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      noteUserIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'noteUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      noteUserIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'noteUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      phoneUserEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      phoneUserGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phoneUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      phoneUserLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phoneUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      phoneUserBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phoneUser',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      phoneUserStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phoneUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      phoneUserEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phoneUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      phoneUserContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phoneUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      phoneUserMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phoneUser',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      phoneUserIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      phoneUserIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phoneUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      roleUserEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roleUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      roleUserGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'roleUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      roleUserLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'roleUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      roleUserBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'roleUser',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      roleUserStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'roleUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      roleUserEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'roleUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      roleUserContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'roleUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      roleUserMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'roleUser',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      roleUserIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roleUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      roleUserIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'roleUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      statusUserEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      statusUserGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'statusUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      statusUserLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'statusUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      statusUserBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'statusUser',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      statusUserStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'statusUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      statusUserEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'statusUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      statusUserContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'statusUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      statusUserMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'statusUser',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      statusUserIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterFilterCondition>
      statusUserIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'statusUser',
        value: '',
      ));
    });
  }
}

extension ModelAccountIsarQueryObject
    on QueryBuilder<ModelAccountIsar, ModelAccountIsar, QFilterCondition> {}

extension ModelAccountIsarQueryLinks
    on QueryBuilder<ModelAccountIsar, ModelAccountIsar, QFilterCondition> {}

extension ModelAccountIsarQuerySortBy
    on QueryBuilder<ModelAccountIsar, ModelAccountIsar, QSortBy> {
  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByData_Operator() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Operator', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByData_OperatorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Operator', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByData_Pelanggan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pelanggan', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByData_PelangganDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pelanggan', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByData_Pemasok() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pemasok', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByData_PemasokDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pemasok', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByData_Pemasukan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pemasukan', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByData_PemasukanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pemasukan', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByData_Pengeluaran() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pengeluaran', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByData_PengeluaranDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pengeluaran', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByInventory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Inventory', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByInventoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Inventory', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByLaporan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Laporan', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByLaporanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Laporan', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByPembelian() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Pembelian', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByPembelianDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Pembelian', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByPendapatan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Pendapatan', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByPendapatanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Pendapatan', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByPengeluaran() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Pengeluaran', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByPengeluaranDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Pengeluaran', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByPenjualan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Penjualan', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByPenjualanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Penjualan', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByRiwayat_Pembelian() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Pembelian', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByRiwayat_PembelianDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Pembelian', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByRiwayat_Pendapatan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Pendapatan', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByRiwayat_PendapatanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Pendapatan', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByRiwayat_Pengeluaran() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Pengeluaran', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByRiwayat_PengeluaranDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Pengeluaran', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByRiwayat_Penjualan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Penjualan', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByRiwayat_PenjualanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Penjualan', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy> sortByStok() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Stok', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByStokDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Stok', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByCreatedUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdUser', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByCreatedUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdUser', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByEmailUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailUser', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByEmailUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailUser', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByIdBranchUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranchUser', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByIdBranchUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranchUser', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByIdUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUser', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByIdUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUser', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByNameUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameUser', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByNameUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameUser', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByNoteUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noteUser', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByNoteUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noteUser', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByPhoneUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneUser', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByPhoneUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneUser', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByRoleUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roleUser', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByRoleUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roleUser', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByStatusUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusUser', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      sortByStatusUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusUser', Sort.desc);
    });
  }
}

extension ModelAccountIsarQuerySortThenBy
    on QueryBuilder<ModelAccountIsar, ModelAccountIsar, QSortThenBy> {
  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByData_Operator() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Operator', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByData_OperatorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Operator', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByData_Pelanggan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pelanggan', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByData_PelangganDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pelanggan', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByData_Pemasok() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pemasok', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByData_PemasokDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pemasok', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByData_Pemasukan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pemasukan', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByData_PemasukanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pemasukan', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByData_Pengeluaran() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pengeluaran', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByData_PengeluaranDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pengeluaran', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByInventory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Inventory', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByInventoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Inventory', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByLaporan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Laporan', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByLaporanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Laporan', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByPembelian() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Pembelian', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByPembelianDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Pembelian', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByPendapatan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Pendapatan', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByPendapatanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Pendapatan', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByPengeluaran() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Pengeluaran', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByPengeluaranDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Pengeluaran', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByPenjualan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Penjualan', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByPenjualanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Penjualan', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByRiwayat_Pembelian() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Pembelian', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByRiwayat_PembelianDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Pembelian', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByRiwayat_Pendapatan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Pendapatan', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByRiwayat_PendapatanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Pendapatan', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByRiwayat_Pengeluaran() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Pengeluaran', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByRiwayat_PengeluaranDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Pengeluaran', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByRiwayat_Penjualan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Penjualan', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByRiwayat_PenjualanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Penjualan', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy> thenByStok() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Stok', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByStokDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Stok', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByCreatedUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdUser', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByCreatedUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdUser', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByEmailUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailUser', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByEmailUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailUser', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByIdBranchUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranchUser', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByIdBranchUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranchUser', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByIdUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUser', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByIdUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUser', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByNameUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameUser', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByNameUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameUser', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByNoteUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noteUser', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByNoteUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noteUser', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByPhoneUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneUser', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByPhoneUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneUser', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByRoleUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roleUser', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByRoleUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roleUser', Sort.desc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByStatusUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusUser', Sort.asc);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QAfterSortBy>
      thenByStatusUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusUser', Sort.desc);
    });
  }
}

extension ModelAccountIsarQueryWhereDistinct
    on QueryBuilder<ModelAccountIsar, ModelAccountIsar, QDistinct> {
  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QDistinct>
      distinctByData_Operator() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Data_Operator');
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QDistinct>
      distinctByData_Pelanggan() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Data_Pelanggan');
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QDistinct>
      distinctByData_Pemasok() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Data_Pemasok');
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QDistinct>
      distinctByData_Pemasukan() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Data_Pemasukan');
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QDistinct>
      distinctByData_Pengeluaran() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Data_Pengeluaran');
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QDistinct>
      distinctByInventory() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Inventory');
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QDistinct>
      distinctByLaporan() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Laporan');
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QDistinct>
      distinctByPembelian() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Pembelian');
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QDistinct>
      distinctByPendapatan() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Pendapatan');
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QDistinct>
      distinctByPengeluaran() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Pengeluaran');
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QDistinct>
      distinctByPenjualan() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Penjualan');
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QDistinct>
      distinctByRiwayat_Pembelian() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Riwayat_Pembelian');
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QDistinct>
      distinctByRiwayat_Pendapatan() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Riwayat_Pendapatan');
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QDistinct>
      distinctByRiwayat_Pengeluaran() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Riwayat_Pengeluaran');
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QDistinct>
      distinctByRiwayat_Penjualan() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Riwayat_Penjualan');
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QDistinct> distinctByStok() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Stok');
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QDistinct>
      distinctByCreatedUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdUser');
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QDistinct>
      distinctByEmailUser({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'emailUser', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QDistinct>
      distinctByIdBranchUser({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idBranchUser', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QDistinct> distinctByIdUser(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idUser', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QDistinct>
      distinctByNameUser({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameUser', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QDistinct>
      distinctByNoteUser({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'noteUser', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QDistinct>
      distinctByPhoneUser({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phoneUser', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QDistinct>
      distinctByRoleUser({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roleUser', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelAccountIsar, ModelAccountIsar, QDistinct>
      distinctByStatusUser({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statusUser', caseSensitive: caseSensitive);
    });
  }
}

extension ModelAccountIsarQueryProperty
    on QueryBuilder<ModelAccountIsar, ModelAccountIsar, QQueryProperty> {
  QueryBuilder<ModelAccountIsar, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ModelAccountIsar, bool, QQueryOperations>
      Data_OperatorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Data_Operator');
    });
  }

  QueryBuilder<ModelAccountIsar, bool, QQueryOperations>
      Data_PelangganProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Data_Pelanggan');
    });
  }

  QueryBuilder<ModelAccountIsar, bool, QQueryOperations>
      Data_PemasokProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Data_Pemasok');
    });
  }

  QueryBuilder<ModelAccountIsar, bool, QQueryOperations>
      Data_PemasukanProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Data_Pemasukan');
    });
  }

  QueryBuilder<ModelAccountIsar, bool, QQueryOperations>
      Data_PengeluaranProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Data_Pengeluaran');
    });
  }

  QueryBuilder<ModelAccountIsar, bool, QQueryOperations> InventoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Inventory');
    });
  }

  QueryBuilder<ModelAccountIsar, bool, QQueryOperations> LaporanProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Laporan');
    });
  }

  QueryBuilder<ModelAccountIsar, bool, QQueryOperations> PembelianProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Pembelian');
    });
  }

  QueryBuilder<ModelAccountIsar, bool, QQueryOperations> PendapatanProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Pendapatan');
    });
  }

  QueryBuilder<ModelAccountIsar, bool, QQueryOperations> PengeluaranProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Pengeluaran');
    });
  }

  QueryBuilder<ModelAccountIsar, bool, QQueryOperations> PenjualanProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Penjualan');
    });
  }

  QueryBuilder<ModelAccountIsar, bool, QQueryOperations>
      Riwayat_PembelianProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Riwayat_Pembelian');
    });
  }

  QueryBuilder<ModelAccountIsar, bool, QQueryOperations>
      Riwayat_PendapatanProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Riwayat_Pendapatan');
    });
  }

  QueryBuilder<ModelAccountIsar, bool, QQueryOperations>
      Riwayat_PengeluaranProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Riwayat_Pengeluaran');
    });
  }

  QueryBuilder<ModelAccountIsar, bool, QQueryOperations>
      Riwayat_PenjualanProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Riwayat_Penjualan');
    });
  }

  QueryBuilder<ModelAccountIsar, bool, QQueryOperations> StokProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Stok');
    });
  }

  QueryBuilder<ModelAccountIsar, DateTime?, QQueryOperations>
      createdUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdUser');
    });
  }

  QueryBuilder<ModelAccountIsar, String, QQueryOperations> emailUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'emailUser');
    });
  }

  QueryBuilder<ModelAccountIsar, String?, QQueryOperations>
      idBranchUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idBranchUser');
    });
  }

  QueryBuilder<ModelAccountIsar, String, QQueryOperations> idUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idUser');
    });
  }

  QueryBuilder<ModelAccountIsar, String, QQueryOperations> nameUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameUser');
    });
  }

  QueryBuilder<ModelAccountIsar, String?, QQueryOperations> noteUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'noteUser');
    });
  }

  QueryBuilder<ModelAccountIsar, String, QQueryOperations> phoneUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phoneUser');
    });
  }

  QueryBuilder<ModelAccountIsar, String, QQueryOperations> roleUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roleUser');
    });
  }

  QueryBuilder<ModelAccountIsar, String, QQueryOperations>
      statusUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statusUser');
    });
  }
}
