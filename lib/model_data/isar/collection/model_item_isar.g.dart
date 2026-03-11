// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_item_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModelItemIsarCollection on Isar {
  IsarCollection<ModelItemIsar> get modelItemIsars => this.collection();
}

const ModelItemIsarSchema = CollectionSchema(
  name: r'ModelItemIsar',
  id: 2118382266441228938,
  properties: {
    r'barcode': PropertySchema(
      id: 0,
      name: r'barcode',
      type: IsarType.string,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'idBranch': PropertySchema(
      id: 2,
      name: r'idBranch',
      type: IsarType.string,
    ),
    r'idCategoryItem': PropertySchema(
      id: 3,
      name: r'idCategoryItem',
      type: IsarType.string,
    ),
    r'idItem': PropertySchema(
      id: 4,
      name: r'idItem',
      type: IsarType.string,
    ),
    r'nameItem': PropertySchema(
      id: 5,
      name: r'nameItem',
      type: IsarType.string,
    ),
    r'priceItem': PropertySchema(
      id: 6,
      name: r'priceItem',
      type: IsarType.double,
    ),
    r'priceItemBuybyBatch': PropertySchema(
      id: 7,
      name: r'priceItemBuybyBatch',
      type: IsarType.double,
    ),
    r'priceItemByBatch': PropertySchema(
      id: 8,
      name: r'priceItemByBatch',
      type: IsarType.double,
    ),
    r'qtyItem': PropertySchema(
      id: 9,
      name: r'qtyItem',
      type: IsarType.double,
    ),
    r'statusCondiment': PropertySchema(
      id: 10,
      name: r'statusCondiment',
      type: IsarType.string,
    ),
    r'statusItem': PropertySchema(
      id: 11,
      name: r'statusItem',
      type: IsarType.string,
    ),
    r'urlImage': PropertySchema(
      id: 12,
      name: r'urlImage',
      type: IsarType.string,
    )
  },
  estimateSize: _modelItemIsarEstimateSize,
  serialize: _modelItemIsarSerialize,
  deserialize: _modelItemIsarDeserialize,
  deserializeProp: _modelItemIsarDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'idItem': IndexSchema(
      id: 2935246573255022477,
      name: r'idItem',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'idItem',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'idBranch': IndexSchema(
      id: 4331900883289279112,
      name: r'idBranch',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'idBranch',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _modelItemIsarGetId,
  getLinks: _modelItemIsarGetLinks,
  attach: _modelItemIsarAttach,
  version: '3.1.0+1',
);

int _modelItemIsarEstimateSize(
  ModelItemIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.barcode.length * 3;
  bytesCount += 3 + object.idBranch.length * 3;
  bytesCount += 3 + object.idCategoryItem.length * 3;
  bytesCount += 3 + object.idItem.length * 3;
  bytesCount += 3 + object.nameItem.length * 3;
  bytesCount += 3 + object.statusCondiment.length * 3;
  bytesCount += 3 + object.statusItem.length * 3;
  bytesCount += 3 + object.urlImage.length * 3;
  return bytesCount;
}

void _modelItemIsarSerialize(
  ModelItemIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.barcode);
  writer.writeDateTime(offsets[1], object.date);
  writer.writeString(offsets[2], object.idBranch);
  writer.writeString(offsets[3], object.idCategoryItem);
  writer.writeString(offsets[4], object.idItem);
  writer.writeString(offsets[5], object.nameItem);
  writer.writeDouble(offsets[6], object.priceItem);
  writer.writeDouble(offsets[7], object.priceItemBuybyBatch);
  writer.writeDouble(offsets[8], object.priceItemByBatch);
  writer.writeDouble(offsets[9], object.qtyItem);
  writer.writeString(offsets[10], object.statusCondiment);
  writer.writeString(offsets[11], object.statusItem);
  writer.writeString(offsets[12], object.urlImage);
}

ModelItemIsar _modelItemIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelItemIsar();
  object.barcode = reader.readString(offsets[0]);
  object.date = reader.readDateTime(offsets[1]);
  object.idBranch = reader.readString(offsets[2]);
  object.idCategoryItem = reader.readString(offsets[3]);
  object.idItem = reader.readString(offsets[4]);
  object.isarId = id;
  object.nameItem = reader.readString(offsets[5]);
  object.priceItem = reader.readDouble(offsets[6]);
  object.priceItemBuybyBatch = reader.readDouble(offsets[7]);
  object.priceItemByBatch = reader.readDouble(offsets[8]);
  object.qtyItem = reader.readDouble(offsets[9]);
  object.statusCondiment = reader.readString(offsets[10]);
  object.statusItem = reader.readString(offsets[11]);
  object.urlImage = reader.readString(offsets[12]);
  return object;
}

P _modelItemIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _modelItemIsarGetId(ModelItemIsar object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _modelItemIsarGetLinks(ModelItemIsar object) {
  return [];
}

void _modelItemIsarAttach(
    IsarCollection<dynamic> col, Id id, ModelItemIsar object) {
  object.isarId = id;
}

extension ModelItemIsarByIndex on IsarCollection<ModelItemIsar> {
  Future<ModelItemIsar?> getByIdItem(String idItem) {
    return getByIndex(r'idItem', [idItem]);
  }

  ModelItemIsar? getByIdItemSync(String idItem) {
    return getByIndexSync(r'idItem', [idItem]);
  }

  Future<bool> deleteByIdItem(String idItem) {
    return deleteByIndex(r'idItem', [idItem]);
  }

  bool deleteByIdItemSync(String idItem) {
    return deleteByIndexSync(r'idItem', [idItem]);
  }

  Future<List<ModelItemIsar?>> getAllByIdItem(List<String> idItemValues) {
    final values = idItemValues.map((e) => [e]).toList();
    return getAllByIndex(r'idItem', values);
  }

  List<ModelItemIsar?> getAllByIdItemSync(List<String> idItemValues) {
    final values = idItemValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'idItem', values);
  }

  Future<int> deleteAllByIdItem(List<String> idItemValues) {
    final values = idItemValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'idItem', values);
  }

  int deleteAllByIdItemSync(List<String> idItemValues) {
    final values = idItemValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'idItem', values);
  }

  Future<Id> putByIdItem(ModelItemIsar object) {
    return putByIndex(r'idItem', object);
  }

  Id putByIdItemSync(ModelItemIsar object, {bool saveLinks = true}) {
    return putByIndexSync(r'idItem', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIdItem(List<ModelItemIsar> objects) {
    return putAllByIndex(r'idItem', objects);
  }

  List<Id> putAllByIdItemSync(List<ModelItemIsar> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'idItem', objects, saveLinks: saveLinks);
  }
}

extension ModelItemIsarQueryWhereSort
    on QueryBuilder<ModelItemIsar, ModelItemIsar, QWhere> {
  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModelItemIsarQueryWhere
    on QueryBuilder<ModelItemIsar, ModelItemIsar, QWhereClause> {
  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterWhereClause>
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

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterWhereClause> idItemEqualTo(
      String idItem) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idItem',
        value: [idItem],
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterWhereClause>
      idItemNotEqualTo(String idItem) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idItem',
              lower: [],
              upper: [idItem],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idItem',
              lower: [idItem],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idItem',
              lower: [idItem],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idItem',
              lower: [],
              upper: [idItem],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterWhereClause> idBranchEqualTo(
      String idBranch) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idBranch',
        value: [idBranch],
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterWhereClause>
      idBranchNotEqualTo(String idBranch) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idBranch',
              lower: [],
              upper: [idBranch],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idBranch',
              lower: [idBranch],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idBranch',
              lower: [idBranch],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idBranch',
              lower: [],
              upper: [idBranch],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ModelItemIsarQueryFilter
    on QueryBuilder<ModelItemIsar, ModelItemIsar, QFilterCondition> {
  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      barcodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'barcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      barcodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'barcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      barcodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'barcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      barcodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'barcode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      barcodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'barcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      barcodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'barcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      barcodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'barcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      barcodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'barcode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      barcodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'barcode',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      barcodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'barcode',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      idBranchEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idBranch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      idBranchGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idBranch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      idBranchLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idBranch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      idBranchBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idBranch',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      idBranchStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idBranch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      idBranchEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idBranch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      idBranchContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idBranch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      idBranchMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idBranch',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      idBranchIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      idBranchIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      idCategoryItemEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idCategoryItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      idCategoryItemGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idCategoryItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      idCategoryItemLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idCategoryItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      idCategoryItemBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idCategoryItem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      idCategoryItemStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idCategoryItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      idCategoryItemEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idCategoryItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      idCategoryItemContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idCategoryItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      idCategoryItemMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idCategoryItem',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      idCategoryItemIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idCategoryItem',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      idCategoryItemIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idCategoryItem',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      idItemEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      idItemGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      idItemLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      idItemBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idItem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      idItemStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      idItemEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      idItemContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      idItemMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idItem',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      idItemIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idItem',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      idItemIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idItem',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      nameItemEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      nameItemGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nameItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      nameItemLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nameItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      nameItemBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nameItem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      nameItemStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nameItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      nameItemEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nameItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      nameItemContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nameItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      nameItemMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nameItem',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      nameItemIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameItem',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      nameItemIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameItem',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      priceItemEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priceItem',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      priceItemGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'priceItem',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      priceItemLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'priceItem',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      priceItemBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'priceItem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      priceItemBuybyBatchEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priceItemBuybyBatch',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      priceItemBuybyBatchGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'priceItemBuybyBatch',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      priceItemBuybyBatchLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'priceItemBuybyBatch',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      priceItemBuybyBatchBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'priceItemBuybyBatch',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      priceItemByBatchEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priceItemByBatch',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      priceItemByBatchGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'priceItemByBatch',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      priceItemByBatchLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'priceItemByBatch',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      priceItemByBatchBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'priceItemByBatch',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      qtyItemEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyItem',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      qtyItemGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtyItem',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      qtyItemLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtyItem',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      qtyItemBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtyItem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      statusCondimentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusCondiment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      statusCondimentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'statusCondiment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      statusCondimentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'statusCondiment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      statusCondimentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'statusCondiment',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      statusCondimentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'statusCondiment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      statusCondimentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'statusCondiment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      statusCondimentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'statusCondiment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      statusCondimentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'statusCondiment',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      statusCondimentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusCondiment',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      statusCondimentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'statusCondiment',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      statusItemEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      statusItemGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'statusItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      statusItemLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'statusItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      statusItemBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'statusItem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      statusItemStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'statusItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      statusItemEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'statusItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      statusItemContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'statusItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      statusItemMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'statusItem',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      statusItemIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusItem',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      statusItemIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'statusItem',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      urlImageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'urlImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      urlImageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'urlImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      urlImageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'urlImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      urlImageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'urlImage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      urlImageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'urlImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      urlImageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'urlImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      urlImageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'urlImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      urlImageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'urlImage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      urlImageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'urlImage',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterFilterCondition>
      urlImageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'urlImage',
        value: '',
      ));
    });
  }
}

extension ModelItemIsarQueryObject
    on QueryBuilder<ModelItemIsar, ModelItemIsar, QFilterCondition> {}

extension ModelItemIsarQueryLinks
    on QueryBuilder<ModelItemIsar, ModelItemIsar, QFilterCondition> {}

extension ModelItemIsarQuerySortBy
    on QueryBuilder<ModelItemIsar, ModelItemIsar, QSortBy> {
  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy> sortByBarcode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barcode', Sort.asc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy> sortByBarcodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barcode', Sort.desc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy> sortByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy>
      sortByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy>
      sortByIdCategoryItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCategoryItem', Sort.asc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy>
      sortByIdCategoryItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCategoryItem', Sort.desc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy> sortByIdItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idItem', Sort.asc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy> sortByIdItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idItem', Sort.desc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy> sortByNameItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameItem', Sort.asc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy>
      sortByNameItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameItem', Sort.desc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy> sortByPriceItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceItem', Sort.asc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy>
      sortByPriceItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceItem', Sort.desc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy>
      sortByPriceItemBuybyBatch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceItemBuybyBatch', Sort.asc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy>
      sortByPriceItemBuybyBatchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceItemBuybyBatch', Sort.desc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy>
      sortByPriceItemByBatch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceItemByBatch', Sort.asc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy>
      sortByPriceItemByBatchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceItemByBatch', Sort.desc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy> sortByQtyItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyItem', Sort.asc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy> sortByQtyItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyItem', Sort.desc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy>
      sortByStatusCondiment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusCondiment', Sort.asc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy>
      sortByStatusCondimentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusCondiment', Sort.desc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy> sortByStatusItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusItem', Sort.asc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy>
      sortByStatusItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusItem', Sort.desc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy> sortByUrlImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'urlImage', Sort.asc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy>
      sortByUrlImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'urlImage', Sort.desc);
    });
  }
}

extension ModelItemIsarQuerySortThenBy
    on QueryBuilder<ModelItemIsar, ModelItemIsar, QSortThenBy> {
  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy> thenByBarcode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barcode', Sort.asc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy> thenByBarcodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barcode', Sort.desc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy> thenByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy>
      thenByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy>
      thenByIdCategoryItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCategoryItem', Sort.asc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy>
      thenByIdCategoryItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCategoryItem', Sort.desc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy> thenByIdItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idItem', Sort.asc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy> thenByIdItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idItem', Sort.desc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy> thenByNameItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameItem', Sort.asc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy>
      thenByNameItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameItem', Sort.desc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy> thenByPriceItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceItem', Sort.asc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy>
      thenByPriceItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceItem', Sort.desc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy>
      thenByPriceItemBuybyBatch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceItemBuybyBatch', Sort.asc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy>
      thenByPriceItemBuybyBatchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceItemBuybyBatch', Sort.desc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy>
      thenByPriceItemByBatch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceItemByBatch', Sort.asc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy>
      thenByPriceItemByBatchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceItemByBatch', Sort.desc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy> thenByQtyItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyItem', Sort.asc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy> thenByQtyItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyItem', Sort.desc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy>
      thenByStatusCondiment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusCondiment', Sort.asc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy>
      thenByStatusCondimentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusCondiment', Sort.desc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy> thenByStatusItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusItem', Sort.asc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy>
      thenByStatusItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusItem', Sort.desc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy> thenByUrlImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'urlImage', Sort.asc);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QAfterSortBy>
      thenByUrlImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'urlImage', Sort.desc);
    });
  }
}

extension ModelItemIsarQueryWhereDistinct
    on QueryBuilder<ModelItemIsar, ModelItemIsar, QDistinct> {
  QueryBuilder<ModelItemIsar, ModelItemIsar, QDistinct> distinctByBarcode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'barcode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QDistinct> distinctByIdBranch(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idBranch', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QDistinct>
      distinctByIdCategoryItem({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idCategoryItem',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QDistinct> distinctByIdItem(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idItem', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QDistinct> distinctByNameItem(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameItem', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QDistinct> distinctByPriceItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priceItem');
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QDistinct>
      distinctByPriceItemBuybyBatch() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priceItemBuybyBatch');
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QDistinct>
      distinctByPriceItemByBatch() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priceItemByBatch');
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QDistinct> distinctByQtyItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtyItem');
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QDistinct>
      distinctByStatusCondiment({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statusCondiment',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QDistinct> distinctByStatusItem(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statusItem', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelItemIsar, ModelItemIsar, QDistinct> distinctByUrlImage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'urlImage', caseSensitive: caseSensitive);
    });
  }
}

extension ModelItemIsarQueryProperty
    on QueryBuilder<ModelItemIsar, ModelItemIsar, QQueryProperty> {
  QueryBuilder<ModelItemIsar, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ModelItemIsar, String, QQueryOperations> barcodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'barcode');
    });
  }

  QueryBuilder<ModelItemIsar, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<ModelItemIsar, String, QQueryOperations> idBranchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idBranch');
    });
  }

  QueryBuilder<ModelItemIsar, String, QQueryOperations>
      idCategoryItemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idCategoryItem');
    });
  }

  QueryBuilder<ModelItemIsar, String, QQueryOperations> idItemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idItem');
    });
  }

  QueryBuilder<ModelItemIsar, String, QQueryOperations> nameItemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameItem');
    });
  }

  QueryBuilder<ModelItemIsar, double, QQueryOperations> priceItemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priceItem');
    });
  }

  QueryBuilder<ModelItemIsar, double, QQueryOperations>
      priceItemBuybyBatchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priceItemBuybyBatch');
    });
  }

  QueryBuilder<ModelItemIsar, double, QQueryOperations>
      priceItemByBatchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priceItemByBatch');
    });
  }

  QueryBuilder<ModelItemIsar, double, QQueryOperations> qtyItemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtyItem');
    });
  }

  QueryBuilder<ModelItemIsar, String, QQueryOperations>
      statusCondimentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statusCondiment');
    });
  }

  QueryBuilder<ModelItemIsar, String, QQueryOperations> statusItemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statusItem');
    });
  }

  QueryBuilder<ModelItemIsar, String, QQueryOperations> urlImageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'urlImage');
    });
  }
}
