// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_user_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModelUserIsarCollection on Isar {
  IsarCollection<ModelUserIsar> get modelUserIsars => this.collection();
}

const ModelUserIsarSchema = CollectionSchema(
  name: r'ModelUserIsar',
  id: 9150131632075427021,
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
  estimateSize: _modelUserIsarEstimateSize,
  serialize: _modelUserIsarSerialize,
  deserialize: _modelUserIsarDeserialize,
  deserializeProp: _modelUserIsarDeserializeProp,
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
  getId: _modelUserIsarGetId,
  getLinks: _modelUserIsarGetLinks,
  attach: _modelUserIsarAttach,
  version: '3.1.0+1',
);

int _modelUserIsarEstimateSize(
  ModelUserIsar object,
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

void _modelUserIsarSerialize(
  ModelUserIsar object,
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

ModelUserIsar _modelUserIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelUserIsar();
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

P _modelUserIsarDeserializeProp<P>(
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

Id _modelUserIsarGetId(ModelUserIsar object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _modelUserIsarGetLinks(ModelUserIsar object) {
  return [];
}

void _modelUserIsarAttach(
    IsarCollection<dynamic> col, Id id, ModelUserIsar object) {
  object.isarId = id;
}

extension ModelUserIsarByIndex on IsarCollection<ModelUserIsar> {
  Future<ModelUserIsar?> getByIdUser(String idUser) {
    return getByIndex(r'idUser', [idUser]);
  }

  ModelUserIsar? getByIdUserSync(String idUser) {
    return getByIndexSync(r'idUser', [idUser]);
  }

  Future<bool> deleteByIdUser(String idUser) {
    return deleteByIndex(r'idUser', [idUser]);
  }

  bool deleteByIdUserSync(String idUser) {
    return deleteByIndexSync(r'idUser', [idUser]);
  }

  Future<List<ModelUserIsar?>> getAllByIdUser(List<String> idUserValues) {
    final values = idUserValues.map((e) => [e]).toList();
    return getAllByIndex(r'idUser', values);
  }

  List<ModelUserIsar?> getAllByIdUserSync(List<String> idUserValues) {
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

  Future<Id> putByIdUser(ModelUserIsar object) {
    return putByIndex(r'idUser', object);
  }

  Id putByIdUserSync(ModelUserIsar object, {bool saveLinks = true}) {
    return putByIndexSync(r'idUser', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIdUser(List<ModelUserIsar> objects) {
    return putAllByIndex(r'idUser', objects);
  }

  List<Id> putAllByIdUserSync(List<ModelUserIsar> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'idUser', objects, saveLinks: saveLinks);
  }
}

extension ModelUserIsarQueryWhereSort
    on QueryBuilder<ModelUserIsar, ModelUserIsar, QWhere> {
  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModelUserIsarQueryWhere
    on QueryBuilder<ModelUserIsar, ModelUserIsar, QWhereClause> {
  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterWhereClause>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterWhereClause> idUserEqualTo(
      String idUser) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idUser',
        value: [idUser],
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterWhereClause>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterWhereClause>
      idBranchUserIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idBranchUser',
        value: [null],
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterWhereClause>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterWhereClause>
      idBranchUserEqualTo(String? idBranchUser) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idBranchUser',
        value: [idBranchUser],
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterWhereClause>
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

extension ModelUserIsarQueryFilter
    on QueryBuilder<ModelUserIsar, ModelUserIsar, QFilterCondition> {
  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      data_OperatorEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Data_Operator',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      data_PelangganEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Data_Pelanggan',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      data_PemasokEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Data_Pemasok',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      data_PemasukanEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Data_Pemasukan',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      data_PengeluaranEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Data_Pengeluaran',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      inventoryEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Inventory',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      laporanEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Laporan',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      pembelianEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Pembelian',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      pendapatanEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Pendapatan',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      pengeluaranEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Pengeluaran',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      penjualanEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Penjualan',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      riwayat_PembelianEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Riwayat_Pembelian',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      riwayat_PendapatanEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Riwayat_Pendapatan',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      riwayat_PengeluaranEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Riwayat_Pengeluaran',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      riwayat_PenjualanEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Riwayat_Penjualan',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition> stokEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Stok',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      createdUserIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdUser',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      createdUserIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdUser',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      createdUserEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdUser',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      emailUserContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'emailUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      emailUserMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'emailUser',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      emailUserIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emailUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      emailUserIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'emailUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idBranchUserIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idBranchUser',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idBranchUserIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idBranchUser',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idBranchUserContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idBranchUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idBranchUserMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idBranchUser',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idBranchUserIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idBranchUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idBranchUserIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idBranchUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idUserContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idUserMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idUser',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idUserIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idUserIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      nameUserContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nameUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      nameUserMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nameUser',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      nameUserIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      nameUserIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      noteUserIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'noteUser',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      noteUserIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'noteUser',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      noteUserContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'noteUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      noteUserMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'noteUser',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      noteUserIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'noteUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      noteUserIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'noteUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      phoneUserContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phoneUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      phoneUserMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phoneUser',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      phoneUserIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      phoneUserIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phoneUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      roleUserContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'roleUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      roleUserMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'roleUser',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      roleUserIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roleUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      roleUserIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'roleUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      statusUserContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'statusUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      statusUserMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'statusUser',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      statusUserIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      statusUserIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'statusUser',
        value: '',
      ));
    });
  }
}

extension ModelUserIsarQueryObject
    on QueryBuilder<ModelUserIsar, ModelUserIsar, QFilterCondition> {}

extension ModelUserIsarQueryLinks
    on QueryBuilder<ModelUserIsar, ModelUserIsar, QFilterCondition> {}

extension ModelUserIsarQuerySortBy
    on QueryBuilder<ModelUserIsar, ModelUserIsar, QSortBy> {
  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByData_Operator() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Operator', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByData_OperatorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Operator', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByData_Pelanggan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pelanggan', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByData_PelangganDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pelanggan', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByData_Pemasok() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pemasok', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByData_PemasokDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pemasok', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByData_Pemasukan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pemasukan', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByData_PemasukanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pemasukan', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByData_Pengeluaran() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pengeluaran', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByData_PengeluaranDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pengeluaran', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> sortByInventory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Inventory', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByInventoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Inventory', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> sortByLaporan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Laporan', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> sortByLaporanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Laporan', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> sortByPembelian() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Pembelian', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByPembelianDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Pembelian', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> sortByPendapatan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Pendapatan', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByPendapatanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Pendapatan', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> sortByPengeluaran() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Pengeluaran', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByPengeluaranDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Pengeluaran', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> sortByPenjualan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Penjualan', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByPenjualanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Penjualan', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByRiwayat_Pembelian() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Pembelian', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByRiwayat_PembelianDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Pembelian', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByRiwayat_Pendapatan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Pendapatan', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByRiwayat_PendapatanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Pendapatan', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByRiwayat_Pengeluaran() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Pengeluaran', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByRiwayat_PengeluaranDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Pengeluaran', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByRiwayat_Penjualan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Penjualan', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByRiwayat_PenjualanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Penjualan', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> sortByStok() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Stok', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> sortByStokDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Stok', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> sortByCreatedUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByCreatedUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> sortByEmailUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByEmailUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByIdBranchUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranchUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByIdBranchUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranchUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> sortByIdUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> sortByIdUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> sortByNameUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByNameUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> sortByNoteUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noteUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByNoteUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noteUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> sortByPhoneUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByPhoneUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> sortByRoleUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roleUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByRoleUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roleUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> sortByStatusUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByStatusUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusUser', Sort.desc);
    });
  }
}

extension ModelUserIsarQuerySortThenBy
    on QueryBuilder<ModelUserIsar, ModelUserIsar, QSortThenBy> {
  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByData_Operator() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Operator', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByData_OperatorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Operator', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByData_Pelanggan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pelanggan', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByData_PelangganDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pelanggan', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByData_Pemasok() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pemasok', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByData_PemasokDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pemasok', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByData_Pemasukan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pemasukan', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByData_PemasukanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pemasukan', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByData_Pengeluaran() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pengeluaran', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByData_PengeluaranDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Data_Pengeluaran', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> thenByInventory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Inventory', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByInventoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Inventory', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> thenByLaporan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Laporan', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> thenByLaporanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Laporan', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> thenByPembelian() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Pembelian', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByPembelianDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Pembelian', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> thenByPendapatan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Pendapatan', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByPendapatanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Pendapatan', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> thenByPengeluaran() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Pengeluaran', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByPengeluaranDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Pengeluaran', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> thenByPenjualan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Penjualan', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByPenjualanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Penjualan', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByRiwayat_Pembelian() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Pembelian', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByRiwayat_PembelianDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Pembelian', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByRiwayat_Pendapatan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Pendapatan', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByRiwayat_PendapatanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Pendapatan', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByRiwayat_Pengeluaran() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Pengeluaran', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByRiwayat_PengeluaranDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Pengeluaran', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByRiwayat_Penjualan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Penjualan', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByRiwayat_PenjualanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Riwayat_Penjualan', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> thenByStok() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Stok', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> thenByStokDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Stok', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> thenByCreatedUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByCreatedUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> thenByEmailUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByEmailUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByIdBranchUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranchUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByIdBranchUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranchUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> thenByIdUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> thenByIdUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> thenByNameUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByNameUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> thenByNoteUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noteUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByNoteUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noteUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> thenByPhoneUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByPhoneUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> thenByRoleUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roleUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByRoleUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roleUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> thenByStatusUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByStatusUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusUser', Sort.desc);
    });
  }
}

extension ModelUserIsarQueryWhereDistinct
    on QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct> {
  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct>
      distinctByData_Operator() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Data_Operator');
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct>
      distinctByData_Pelanggan() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Data_Pelanggan');
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct>
      distinctByData_Pemasok() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Data_Pemasok');
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct>
      distinctByData_Pemasukan() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Data_Pemasukan');
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct>
      distinctByData_Pengeluaran() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Data_Pengeluaran');
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct> distinctByInventory() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Inventory');
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct> distinctByLaporan() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Laporan');
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct> distinctByPembelian() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Pembelian');
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct> distinctByPendapatan() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Pendapatan');
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct>
      distinctByPengeluaran() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Pengeluaran');
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct> distinctByPenjualan() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Penjualan');
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct>
      distinctByRiwayat_Pembelian() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Riwayat_Pembelian');
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct>
      distinctByRiwayat_Pendapatan() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Riwayat_Pendapatan');
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct>
      distinctByRiwayat_Pengeluaran() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Riwayat_Pengeluaran');
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct>
      distinctByRiwayat_Penjualan() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Riwayat_Penjualan');
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct> distinctByStok() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Stok');
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct>
      distinctByCreatedUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdUser');
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct> distinctByEmailUser(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'emailUser', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct> distinctByIdBranchUser(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idBranchUser', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct> distinctByIdUser(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idUser', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct> distinctByNameUser(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameUser', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct> distinctByNoteUser(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'noteUser', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct> distinctByPhoneUser(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phoneUser', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct> distinctByRoleUser(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roleUser', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct> distinctByStatusUser(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statusUser', caseSensitive: caseSensitive);
    });
  }
}

extension ModelUserIsarQueryProperty
    on QueryBuilder<ModelUserIsar, ModelUserIsar, QQueryProperty> {
  QueryBuilder<ModelUserIsar, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ModelUserIsar, bool, QQueryOperations> Data_OperatorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Data_Operator');
    });
  }

  QueryBuilder<ModelUserIsar, bool, QQueryOperations> Data_PelangganProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Data_Pelanggan');
    });
  }

  QueryBuilder<ModelUserIsar, bool, QQueryOperations> Data_PemasokProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Data_Pemasok');
    });
  }

  QueryBuilder<ModelUserIsar, bool, QQueryOperations> Data_PemasukanProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Data_Pemasukan');
    });
  }

  QueryBuilder<ModelUserIsar, bool, QQueryOperations>
      Data_PengeluaranProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Data_Pengeluaran');
    });
  }

  QueryBuilder<ModelUserIsar, bool, QQueryOperations> InventoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Inventory');
    });
  }

  QueryBuilder<ModelUserIsar, bool, QQueryOperations> LaporanProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Laporan');
    });
  }

  QueryBuilder<ModelUserIsar, bool, QQueryOperations> PembelianProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Pembelian');
    });
  }

  QueryBuilder<ModelUserIsar, bool, QQueryOperations> PendapatanProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Pendapatan');
    });
  }

  QueryBuilder<ModelUserIsar, bool, QQueryOperations> PengeluaranProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Pengeluaran');
    });
  }

  QueryBuilder<ModelUserIsar, bool, QQueryOperations> PenjualanProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Penjualan');
    });
  }

  QueryBuilder<ModelUserIsar, bool, QQueryOperations>
      Riwayat_PembelianProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Riwayat_Pembelian');
    });
  }

  QueryBuilder<ModelUserIsar, bool, QQueryOperations>
      Riwayat_PendapatanProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Riwayat_Pendapatan');
    });
  }

  QueryBuilder<ModelUserIsar, bool, QQueryOperations>
      Riwayat_PengeluaranProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Riwayat_Pengeluaran');
    });
  }

  QueryBuilder<ModelUserIsar, bool, QQueryOperations>
      Riwayat_PenjualanProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Riwayat_Penjualan');
    });
  }

  QueryBuilder<ModelUserIsar, bool, QQueryOperations> StokProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Stok');
    });
  }

  QueryBuilder<ModelUserIsar, DateTime?, QQueryOperations>
      createdUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdUser');
    });
  }

  QueryBuilder<ModelUserIsar, String, QQueryOperations> emailUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'emailUser');
    });
  }

  QueryBuilder<ModelUserIsar, String?, QQueryOperations>
      idBranchUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idBranchUser');
    });
  }

  QueryBuilder<ModelUserIsar, String, QQueryOperations> idUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idUser');
    });
  }

  QueryBuilder<ModelUserIsar, String, QQueryOperations> nameUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameUser');
    });
  }

  QueryBuilder<ModelUserIsar, String?, QQueryOperations> noteUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'noteUser');
    });
  }

  QueryBuilder<ModelUserIsar, String, QQueryOperations> phoneUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phoneUser');
    });
  }

  QueryBuilder<ModelUserIsar, String, QQueryOperations> roleUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roleUser');
    });
  }

  QueryBuilder<ModelUserIsar, String, QQueryOperations> statusUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statusUser');
    });
  }
}
