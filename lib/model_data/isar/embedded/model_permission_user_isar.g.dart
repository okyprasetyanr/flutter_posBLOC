// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_permission_user_isar.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ModelPermissionUserIsarSchema = Schema(
  name: r'ModelPermissionUserIsar',
  id: 4364273337918207311,
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
    )
  },
  estimateSize: _modelPermissionUserIsarEstimateSize,
  serialize: _modelPermissionUserIsarSerialize,
  deserialize: _modelPermissionUserIsarDeserialize,
  deserializeProp: _modelPermissionUserIsarDeserializeProp,
);

int _modelPermissionUserIsarEstimateSize(
  ModelPermissionUserIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _modelPermissionUserIsarSerialize(
  ModelPermissionUserIsar object,
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
}

ModelPermissionUserIsar _modelPermissionUserIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelPermissionUserIsar();
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
  return object;
}

P _modelPermissionUserIsarDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ModelPermissionUserIsarQueryFilter on QueryBuilder<
    ModelPermissionUserIsar, ModelPermissionUserIsar, QFilterCondition> {
  QueryBuilder<ModelPermissionUserIsar, ModelPermissionUserIsar,
      QAfterFilterCondition> data_OperatorEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Data_Operator',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelPermissionUserIsar, ModelPermissionUserIsar,
      QAfterFilterCondition> data_PelangganEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Data_Pelanggan',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelPermissionUserIsar, ModelPermissionUserIsar,
      QAfterFilterCondition> data_PemasokEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Data_Pemasok',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelPermissionUserIsar, ModelPermissionUserIsar,
      QAfterFilterCondition> data_PemasukanEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Data_Pemasukan',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelPermissionUserIsar, ModelPermissionUserIsar,
      QAfterFilterCondition> data_PengeluaranEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Data_Pengeluaran',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelPermissionUserIsar, ModelPermissionUserIsar,
      QAfterFilterCondition> inventoryEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Inventory',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelPermissionUserIsar, ModelPermissionUserIsar,
      QAfterFilterCondition> laporanEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Laporan',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelPermissionUserIsar, ModelPermissionUserIsar,
      QAfterFilterCondition> pembelianEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Pembelian',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelPermissionUserIsar, ModelPermissionUserIsar,
      QAfterFilterCondition> pendapatanEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Pendapatan',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelPermissionUserIsar, ModelPermissionUserIsar,
      QAfterFilterCondition> pengeluaranEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Pengeluaran',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelPermissionUserIsar, ModelPermissionUserIsar,
      QAfterFilterCondition> penjualanEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Penjualan',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelPermissionUserIsar, ModelPermissionUserIsar,
      QAfterFilterCondition> riwayat_PembelianEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Riwayat_Pembelian',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelPermissionUserIsar, ModelPermissionUserIsar,
      QAfterFilterCondition> riwayat_PendapatanEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Riwayat_Pendapatan',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelPermissionUserIsar, ModelPermissionUserIsar,
      QAfterFilterCondition> riwayat_PengeluaranEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Riwayat_Pengeluaran',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelPermissionUserIsar, ModelPermissionUserIsar,
      QAfterFilterCondition> riwayat_PenjualanEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Riwayat_Penjualan',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelPermissionUserIsar, ModelPermissionUserIsar,
      QAfterFilterCondition> stokEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Stok',
        value: value,
      ));
    });
  }
}

extension ModelPermissionUserIsarQueryObject on QueryBuilder<
    ModelPermissionUserIsar, ModelPermissionUserIsar, QFilterCondition> {}
