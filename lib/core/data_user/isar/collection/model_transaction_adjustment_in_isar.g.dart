// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_transaction_adjustment_in_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModelTransactionAdjustmentInIsarCollection on Isar {
  IsarCollection<ModelTransactionAdjustmentInIsar>
      get modelTransactionAdjustmentInIsars => this.collection();
}

const ModelTransactionAdjustmentInIsarSchema = CollectionSchema(
  name: r'ModelTransactionAdjustmentInIsar',
  id: 4411161682486591486,
  properties: {
    r'buyPriceAfter': PropertySchema(
      id: 0,
      name: r'buyPriceAfter',
      type: IsarType.double,
    ),
    r'buyPriceBefore': PropertySchema(
      id: 1,
      name: r'buyPriceBefore',
      type: IsarType.double,
    ),
    r'date': PropertySchema(
      id: 2,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'expiredDateAfter': PropertySchema(
      id: 3,
      name: r'expiredDateAfter',
      type: IsarType.dateTime,
    ),
    r'expiredDateBefore': PropertySchema(
      id: 4,
      name: r'expiredDateBefore',
      type: IsarType.dateTime,
    ),
    r'idBranch': PropertySchema(
      id: 5,
      name: r'idBranch',
      type: IsarType.string,
    ),
    r'invoice': PropertySchema(
      id: 6,
      name: r'invoice',
      type: IsarType.string,
    ),
    r'itemInvoice': PropertySchema(
      id: 7,
      name: r'itemInvoice',
      type: IsarType.string,
    ),
    r'itemName': PropertySchema(
      id: 8,
      name: r'itemName',
      type: IsarType.string,
    ),
    r'note': PropertySchema(
      id: 9,
      name: r'note',
      type: IsarType.string,
    ),
    r'qty_in_after': PropertySchema(
      id: 10,
      name: r'qty_in_after',
      type: IsarType.double,
    ),
    r'qty_in_before': PropertySchema(
      id: 11,
      name: r'qty_in_before',
      type: IsarType.double,
    ),
    r'sellPriceAfter': PropertySchema(
      id: 12,
      name: r'sellPriceAfter',
      type: IsarType.double,
    ),
    r'sellPriceBefore': PropertySchema(
      id: 13,
      name: r'sellPriceBefore',
      type: IsarType.double,
    )
  },
  estimateSize: _modelTransactionAdjustmentInIsarEstimateSize,
  serialize: _modelTransactionAdjustmentInIsarSerialize,
  deserialize: _modelTransactionAdjustmentInIsarDeserialize,
  deserializeProp: _modelTransactionAdjustmentInIsarDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'invoice': IndexSchema(
      id: -6805838319662201687,
      name: r'invoice',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'invoice',
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
  getId: _modelTransactionAdjustmentInIsarGetId,
  getLinks: _modelTransactionAdjustmentInIsarGetLinks,
  attach: _modelTransactionAdjustmentInIsarAttach,
  version: '3.1.0+1',
);

int _modelTransactionAdjustmentInIsarEstimateSize(
  ModelTransactionAdjustmentInIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.idBranch.length * 3;
  bytesCount += 3 + object.invoice.length * 3;
  bytesCount += 3 + object.itemInvoice.length * 3;
  bytesCount += 3 + object.itemName.length * 3;
  bytesCount += 3 + object.note.length * 3;
  return bytesCount;
}

void _modelTransactionAdjustmentInIsarSerialize(
  ModelTransactionAdjustmentInIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.buyPriceAfter);
  writer.writeDouble(offsets[1], object.buyPriceBefore);
  writer.writeDateTime(offsets[2], object.date);
  writer.writeDateTime(offsets[3], object.expiredDateAfter);
  writer.writeDateTime(offsets[4], object.expiredDateBefore);
  writer.writeString(offsets[5], object.idBranch);
  writer.writeString(offsets[6], object.invoice);
  writer.writeString(offsets[7], object.itemInvoice);
  writer.writeString(offsets[8], object.itemName);
  writer.writeString(offsets[9], object.note);
  writer.writeDouble(offsets[10], object.qty_in_after);
  writer.writeDouble(offsets[11], object.qty_in_before);
  writer.writeDouble(offsets[12], object.sellPriceAfter);
  writer.writeDouble(offsets[13], object.sellPriceBefore);
}

ModelTransactionAdjustmentInIsar _modelTransactionAdjustmentInIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelTransactionAdjustmentInIsar();
  object.buyPriceAfter = reader.readDoubleOrNull(offsets[0]);
  object.buyPriceBefore = reader.readDoubleOrNull(offsets[1]);
  object.date = reader.readDateTime(offsets[2]);
  object.expiredDateAfter = reader.readDateTimeOrNull(offsets[3]);
  object.expiredDateBefore = reader.readDateTimeOrNull(offsets[4]);
  object.idBranch = reader.readString(offsets[5]);
  object.invoice = reader.readString(offsets[6]);
  object.isarId = id;
  object.itemInvoice = reader.readString(offsets[7]);
  object.itemName = reader.readString(offsets[8]);
  object.note = reader.readString(offsets[9]);
  object.qty_in_after = reader.readDoubleOrNull(offsets[10]);
  object.qty_in_before = reader.readDoubleOrNull(offsets[11]);
  object.sellPriceAfter = reader.readDoubleOrNull(offsets[12]);
  object.sellPriceBefore = reader.readDoubleOrNull(offsets[13]);
  return object;
}

P _modelTransactionAdjustmentInIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readDoubleOrNull(offset)) as P;
    case 11:
      return (reader.readDoubleOrNull(offset)) as P;
    case 12:
      return (reader.readDoubleOrNull(offset)) as P;
    case 13:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _modelTransactionAdjustmentInIsarGetId(
    ModelTransactionAdjustmentInIsar object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _modelTransactionAdjustmentInIsarGetLinks(
    ModelTransactionAdjustmentInIsar object) {
  return [];
}

void _modelTransactionAdjustmentInIsarAttach(IsarCollection<dynamic> col, Id id,
    ModelTransactionAdjustmentInIsar object) {
  object.isarId = id;
}

extension ModelTransactionAdjustmentInIsarByIndex
    on IsarCollection<ModelTransactionAdjustmentInIsar> {
  Future<ModelTransactionAdjustmentInIsar?> getByInvoice(String invoice) {
    return getByIndex(r'invoice', [invoice]);
  }

  ModelTransactionAdjustmentInIsar? getByInvoiceSync(String invoice) {
    return getByIndexSync(r'invoice', [invoice]);
  }

  Future<bool> deleteByInvoice(String invoice) {
    return deleteByIndex(r'invoice', [invoice]);
  }

  bool deleteByInvoiceSync(String invoice) {
    return deleteByIndexSync(r'invoice', [invoice]);
  }

  Future<List<ModelTransactionAdjustmentInIsar?>> getAllByInvoice(
      List<String> invoiceValues) {
    final values = invoiceValues.map((e) => [e]).toList();
    return getAllByIndex(r'invoice', values);
  }

  List<ModelTransactionAdjustmentInIsar?> getAllByInvoiceSync(
      List<String> invoiceValues) {
    final values = invoiceValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'invoice', values);
  }

  Future<int> deleteAllByInvoice(List<String> invoiceValues) {
    final values = invoiceValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'invoice', values);
  }

  int deleteAllByInvoiceSync(List<String> invoiceValues) {
    final values = invoiceValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'invoice', values);
  }

  Future<Id> putByInvoice(ModelTransactionAdjustmentInIsar object) {
    return putByIndex(r'invoice', object);
  }

  Id putByInvoiceSync(ModelTransactionAdjustmentInIsar object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'invoice', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByInvoice(
      List<ModelTransactionAdjustmentInIsar> objects) {
    return putAllByIndex(r'invoice', objects);
  }

  List<Id> putAllByInvoiceSync(List<ModelTransactionAdjustmentInIsar> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'invoice', objects, saveLinks: saveLinks);
  }
}

extension ModelTransactionAdjustmentInIsarQueryWhereSort on QueryBuilder<
    ModelTransactionAdjustmentInIsar,
    ModelTransactionAdjustmentInIsar,
    QWhere> {
  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModelTransactionAdjustmentInIsarQueryWhere on QueryBuilder<
    ModelTransactionAdjustmentInIsar,
    ModelTransactionAdjustmentInIsar,
    QWhereClause> {
  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterWhereClause> isarIdNotEqualTo(Id isarId) {
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

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterWhereClause> isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterWhereClause> isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterWhereClause> invoiceEqualTo(String invoice) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'invoice',
        value: [invoice],
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterWhereClause> invoiceNotEqualTo(String invoice) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'invoice',
              lower: [],
              upper: [invoice],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'invoice',
              lower: [invoice],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'invoice',
              lower: [invoice],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'invoice',
              lower: [],
              upper: [invoice],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterWhereClause> idBranchEqualTo(String idBranch) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idBranch',
        value: [idBranch],
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterWhereClause> idBranchNotEqualTo(String idBranch) {
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

extension ModelTransactionAdjustmentInIsarQueryFilter on QueryBuilder<
    ModelTransactionAdjustmentInIsar,
    ModelTransactionAdjustmentInIsar,
    QFilterCondition> {
  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> buyPriceAfterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'buyPriceAfter',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> buyPriceAfterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'buyPriceAfter',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> buyPriceAfterEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'buyPriceAfter',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> buyPriceAfterGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'buyPriceAfter',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> buyPriceAfterLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'buyPriceAfter',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> buyPriceAfterBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'buyPriceAfter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> buyPriceBeforeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'buyPriceBefore',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> buyPriceBeforeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'buyPriceBefore',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> buyPriceBeforeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'buyPriceBefore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> buyPriceBeforeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'buyPriceBefore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> buyPriceBeforeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'buyPriceBefore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> buyPriceBeforeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'buyPriceBefore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterFilterCondition> dateGreaterThan(
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

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterFilterCondition> dateLessThan(
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

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterFilterCondition> dateBetween(
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

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> expiredDateAfterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expiredDateAfter',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> expiredDateAfterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expiredDateAfter',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> expiredDateAfterEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiredDateAfter',
        value: value,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> expiredDateAfterGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expiredDateAfter',
        value: value,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> expiredDateAfterLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expiredDateAfter',
        value: value,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> expiredDateAfterBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expiredDateAfter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> expiredDateBeforeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expiredDateBefore',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> expiredDateBeforeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expiredDateBefore',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> expiredDateBeforeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiredDateBefore',
        value: value,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> expiredDateBeforeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expiredDateBefore',
        value: value,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> expiredDateBeforeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expiredDateBefore',
        value: value,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> expiredDateBeforeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expiredDateBefore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterFilterCondition> idBranchEqualTo(
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

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> idBranchGreaterThan(
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

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterFilterCondition> idBranchLessThan(
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

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterFilterCondition> idBranchBetween(
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

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> idBranchStartsWith(
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

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterFilterCondition> idBranchEndsWith(
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

  QueryBuilder<ModelTransactionAdjustmentInIsar,
          ModelTransactionAdjustmentInIsar, QAfterFilterCondition>
      idBranchContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idBranch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
          ModelTransactionAdjustmentInIsar, QAfterFilterCondition>
      idBranchMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idBranch',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> idBranchIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> idBranchIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterFilterCondition> invoiceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> invoiceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'invoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterFilterCondition> invoiceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'invoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterFilterCondition> invoiceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'invoice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> invoiceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'invoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterFilterCondition> invoiceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'invoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
          ModelTransactionAdjustmentInIsar, QAfterFilterCondition>
      invoiceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'invoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
          ModelTransactionAdjustmentInIsar, QAfterFilterCondition>
      invoiceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'invoice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> invoiceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoice',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> invoiceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'invoice',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> isarIdGreaterThan(
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

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterFilterCondition> isarIdLessThan(
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

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterFilterCondition> isarIdBetween(
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

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> itemInvoiceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemInvoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> itemInvoiceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemInvoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> itemInvoiceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemInvoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> itemInvoiceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemInvoice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> itemInvoiceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemInvoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> itemInvoiceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemInvoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
          ModelTransactionAdjustmentInIsar, QAfterFilterCondition>
      itemInvoiceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemInvoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
          ModelTransactionAdjustmentInIsar, QAfterFilterCondition>
      itemInvoiceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemInvoice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> itemInvoiceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemInvoice',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> itemInvoiceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemInvoice',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterFilterCondition> itemNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> itemNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterFilterCondition> itemNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterFilterCondition> itemNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> itemNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterFilterCondition> itemNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
          ModelTransactionAdjustmentInIsar, QAfterFilterCondition>
      itemNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
          ModelTransactionAdjustmentInIsar, QAfterFilterCondition>
      itemNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> itemNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> itemNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterFilterCondition> noteEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterFilterCondition> noteGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterFilterCondition> noteLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterFilterCondition> noteBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'note',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterFilterCondition> noteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterFilterCondition> noteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
          ModelTransactionAdjustmentInIsar, QAfterFilterCondition>
      noteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
          ModelTransactionAdjustmentInIsar, QAfterFilterCondition>
      noteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'note',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterFilterCondition> noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> qty_in_afterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qty_in_after',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> qty_in_afterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qty_in_after',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> qty_in_afterEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qty_in_after',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> qty_in_afterGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qty_in_after',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> qty_in_afterLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qty_in_after',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> qty_in_afterBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qty_in_after',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> qty_in_beforeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qty_in_before',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> qty_in_beforeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qty_in_before',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> qty_in_beforeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qty_in_before',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> qty_in_beforeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qty_in_before',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> qty_in_beforeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qty_in_before',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> qty_in_beforeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qty_in_before',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> sellPriceAfterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sellPriceAfter',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> sellPriceAfterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sellPriceAfter',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> sellPriceAfterEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sellPriceAfter',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> sellPriceAfterGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sellPriceAfter',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> sellPriceAfterLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sellPriceAfter',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> sellPriceAfterBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sellPriceAfter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> sellPriceBeforeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sellPriceBefore',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> sellPriceBeforeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sellPriceBefore',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> sellPriceBeforeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sellPriceBefore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> sellPriceBeforeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sellPriceBefore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> sellPriceBeforeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sellPriceBefore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterFilterCondition> sellPriceBeforeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sellPriceBefore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension ModelTransactionAdjustmentInIsarQueryObject on QueryBuilder<
    ModelTransactionAdjustmentInIsar,
    ModelTransactionAdjustmentInIsar,
    QFilterCondition> {}

extension ModelTransactionAdjustmentInIsarQueryLinks on QueryBuilder<
    ModelTransactionAdjustmentInIsar,
    ModelTransactionAdjustmentInIsar,
    QFilterCondition> {}

extension ModelTransactionAdjustmentInIsarQuerySortBy on QueryBuilder<
    ModelTransactionAdjustmentInIsar,
    ModelTransactionAdjustmentInIsar,
    QSortBy> {
  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> sortByBuyPriceAfter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buyPriceAfter', Sort.asc);
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterSortBy> sortByBuyPriceAfterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buyPriceAfter', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> sortByBuyPriceBefore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buyPriceBefore', Sort.asc);
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterSortBy> sortByBuyPriceBeforeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buyPriceBefore', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> sortByExpiredDateAfter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiredDateAfter', Sort.asc);
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterSortBy> sortByExpiredDateAfterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiredDateAfter', Sort.desc);
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterSortBy> sortByExpiredDateBefore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiredDateBefore', Sort.asc);
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterSortBy> sortByExpiredDateBeforeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiredDateBefore', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> sortByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> sortByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> sortByInvoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> sortByInvoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> sortByItemInvoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemInvoice', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> sortByItemInvoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemInvoice', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> sortByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> sortByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> sortByQty_in_after() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty_in_after', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> sortByQty_in_afterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty_in_after', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> sortByQty_in_before() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty_in_before', Sort.asc);
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterSortBy> sortByQty_in_beforeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty_in_before', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> sortBySellPriceAfter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellPriceAfter', Sort.asc);
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterSortBy> sortBySellPriceAfterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellPriceAfter', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> sortBySellPriceBefore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellPriceBefore', Sort.asc);
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterSortBy> sortBySellPriceBeforeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellPriceBefore', Sort.desc);
    });
  }
}

extension ModelTransactionAdjustmentInIsarQuerySortThenBy on QueryBuilder<
    ModelTransactionAdjustmentInIsar,
    ModelTransactionAdjustmentInIsar,
    QSortThenBy> {
  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> thenByBuyPriceAfter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buyPriceAfter', Sort.asc);
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterSortBy> thenByBuyPriceAfterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buyPriceAfter', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> thenByBuyPriceBefore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buyPriceBefore', Sort.asc);
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterSortBy> thenByBuyPriceBeforeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buyPriceBefore', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> thenByExpiredDateAfter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiredDateAfter', Sort.asc);
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterSortBy> thenByExpiredDateAfterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiredDateAfter', Sort.desc);
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterSortBy> thenByExpiredDateBefore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiredDateBefore', Sort.asc);
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterSortBy> thenByExpiredDateBeforeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiredDateBefore', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> thenByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> thenByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> thenByInvoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> thenByInvoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> thenByItemInvoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemInvoice', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> thenByItemInvoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemInvoice', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> thenByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> thenByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> thenByQty_in_after() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty_in_after', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> thenByQty_in_afterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty_in_after', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> thenByQty_in_before() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty_in_before', Sort.asc);
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterSortBy> thenByQty_in_beforeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty_in_before', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> thenBySellPriceAfter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellPriceAfter', Sort.asc);
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterSortBy> thenBySellPriceAfterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellPriceAfter', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QAfterSortBy> thenBySellPriceBefore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellPriceBefore', Sort.asc);
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QAfterSortBy> thenBySellPriceBeforeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellPriceBefore', Sort.desc);
    });
  }
}

extension ModelTransactionAdjustmentInIsarQueryWhereDistinct on QueryBuilder<
    ModelTransactionAdjustmentInIsar,
    ModelTransactionAdjustmentInIsar,
    QDistinct> {
  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QDistinct> distinctByBuyPriceAfter() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'buyPriceAfter');
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QDistinct> distinctByBuyPriceBefore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'buyPriceBefore');
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QDistinct> distinctByExpiredDateAfter() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expiredDateAfter');
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QDistinct> distinctByExpiredDateBefore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expiredDateBefore');
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QDistinct> distinctByIdBranch({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idBranch', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QDistinct> distinctByInvoice({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invoice', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QDistinct> distinctByItemInvoice({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemInvoice', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QDistinct> distinctByItemName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar,
      QDistinct> distinctByNote({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QDistinct> distinctByQty_in_after() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qty_in_after');
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QDistinct> distinctByQty_in_before() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qty_in_before');
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QDistinct> distinctBySellPriceAfter() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sellPriceAfter');
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar,
      ModelTransactionAdjustmentInIsar, QDistinct> distinctBySellPriceBefore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sellPriceBefore');
    });
  }
}

extension ModelTransactionAdjustmentInIsarQueryProperty on QueryBuilder<
    ModelTransactionAdjustmentInIsar,
    ModelTransactionAdjustmentInIsar,
    QQueryProperty> {
  QueryBuilder<ModelTransactionAdjustmentInIsar, int, QQueryOperations>
      isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar, double?, QQueryOperations>
      buyPriceAfterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'buyPriceAfter');
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar, double?, QQueryOperations>
      buyPriceBeforeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'buyPriceBefore');
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar, DateTime, QQueryOperations>
      dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar, DateTime?, QQueryOperations>
      expiredDateAfterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expiredDateAfter');
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar, DateTime?, QQueryOperations>
      expiredDateBeforeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expiredDateBefore');
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar, String, QQueryOperations>
      idBranchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idBranch');
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar, String, QQueryOperations>
      invoiceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invoice');
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar, String, QQueryOperations>
      itemInvoiceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemInvoice');
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar, String, QQueryOperations>
      itemNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemName');
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar, String, QQueryOperations>
      noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar, double?, QQueryOperations>
      qty_in_afterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qty_in_after');
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar, double?, QQueryOperations>
      qty_in_beforeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qty_in_before');
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar, double?, QQueryOperations>
      sellPriceAfterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sellPriceAfter');
    });
  }

  QueryBuilder<ModelTransactionAdjustmentInIsar, double?, QQueryOperations>
      sellPriceBeforeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sellPriceBefore');
    });
  }
}
