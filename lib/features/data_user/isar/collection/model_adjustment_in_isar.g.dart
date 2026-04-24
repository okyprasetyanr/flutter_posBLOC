// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_adjustment_in_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModelAdjustmentInIsarCollection on Isar {
  IsarCollection<ModelAdjustmentInIsar> get modelAdjustmentInIsars =>
      this.collection();
}

const ModelAdjustmentInIsarSchema = CollectionSchema(
  name: r'ModelAdjustmentInIsar',
  id: -2851917368383775588,
  properties: {
    r'buyPrice': PropertySchema(
      id: 0,
      name: r'buyPrice',
      type: IsarType.double,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'expiredDate': PropertySchema(
      id: 2,
      name: r'expiredDate',
      type: IsarType.dateTime,
    ),
    r'idBranch': PropertySchema(
      id: 3,
      name: r'idBranch',
      type: IsarType.string,
    ),
    r'invoice': PropertySchema(
      id: 4,
      name: r'invoice',
      type: IsarType.string,
    ),
    r'note': PropertySchema(
      id: 5,
      name: r'note',
      type: IsarType.string,
    ),
    r'qty_in': PropertySchema(
      id: 6,
      name: r'qty_in',
      type: IsarType.double,
    ),
    r'sellPrice': PropertySchema(
      id: 7,
      name: r'sellPrice',
      type: IsarType.double,
    )
  },
  estimateSize: _modelAdjustmentInIsarEstimateSize,
  serialize: _modelAdjustmentInIsarSerialize,
  deserialize: _modelAdjustmentInIsarDeserialize,
  deserializeProp: _modelAdjustmentInIsarDeserializeProp,
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
  getId: _modelAdjustmentInIsarGetId,
  getLinks: _modelAdjustmentInIsarGetLinks,
  attach: _modelAdjustmentInIsarAttach,
  version: '3.1.0+1',
);

int _modelAdjustmentInIsarEstimateSize(
  ModelAdjustmentInIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.idBranch.length * 3;
  bytesCount += 3 + object.invoice.length * 3;
  bytesCount += 3 + object.note.length * 3;
  return bytesCount;
}

void _modelAdjustmentInIsarSerialize(
  ModelAdjustmentInIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.buyPrice);
  writer.writeDateTime(offsets[1], object.date);
  writer.writeDateTime(offsets[2], object.expiredDate);
  writer.writeString(offsets[3], object.idBranch);
  writer.writeString(offsets[4], object.invoice);
  writer.writeString(offsets[5], object.note);
  writer.writeDouble(offsets[6], object.qty_in);
  writer.writeDouble(offsets[7], object.sellPrice);
}

ModelAdjustmentInIsar _modelAdjustmentInIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelAdjustmentInIsar();
  object.buyPrice = reader.readDouble(offsets[0]);
  object.date = reader.readDateTime(offsets[1]);
  object.expiredDate = reader.readDateTime(offsets[2]);
  object.idBranch = reader.readString(offsets[3]);
  object.invoice = reader.readString(offsets[4]);
  object.isarId = id;
  object.note = reader.readString(offsets[5]);
  object.qty_in = reader.readDouble(offsets[6]);
  object.sellPrice = reader.readDouble(offsets[7]);
  return object;
}

P _modelAdjustmentInIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _modelAdjustmentInIsarGetId(ModelAdjustmentInIsar object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _modelAdjustmentInIsarGetLinks(
    ModelAdjustmentInIsar object) {
  return [];
}

void _modelAdjustmentInIsarAttach(
    IsarCollection<dynamic> col, Id id, ModelAdjustmentInIsar object) {
  object.isarId = id;
}

extension ModelAdjustmentInIsarByIndex
    on IsarCollection<ModelAdjustmentInIsar> {
  Future<ModelAdjustmentInIsar?> getByInvoice(String invoice) {
    return getByIndex(r'invoice', [invoice]);
  }

  ModelAdjustmentInIsar? getByInvoiceSync(String invoice) {
    return getByIndexSync(r'invoice', [invoice]);
  }

  Future<bool> deleteByInvoice(String invoice) {
    return deleteByIndex(r'invoice', [invoice]);
  }

  bool deleteByInvoiceSync(String invoice) {
    return deleteByIndexSync(r'invoice', [invoice]);
  }

  Future<List<ModelAdjustmentInIsar?>> getAllByInvoice(
      List<String> invoiceValues) {
    final values = invoiceValues.map((e) => [e]).toList();
    return getAllByIndex(r'invoice', values);
  }

  List<ModelAdjustmentInIsar?> getAllByInvoiceSync(List<String> invoiceValues) {
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

  Future<Id> putByInvoice(ModelAdjustmentInIsar object) {
    return putByIndex(r'invoice', object);
  }

  Id putByInvoiceSync(ModelAdjustmentInIsar object, {bool saveLinks = true}) {
    return putByIndexSync(r'invoice', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByInvoice(List<ModelAdjustmentInIsar> objects) {
    return putAllByIndex(r'invoice', objects);
  }

  List<Id> putAllByInvoiceSync(List<ModelAdjustmentInIsar> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'invoice', objects, saveLinks: saveLinks);
  }
}

extension ModelAdjustmentInIsarQueryWhereSort
    on QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QWhere> {
  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterWhere>
      anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModelAdjustmentInIsarQueryWhere on QueryBuilder<ModelAdjustmentInIsar,
    ModelAdjustmentInIsar, QWhereClause> {
  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterWhereClause>
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

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterWhereClause>
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

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterWhereClause>
      invoiceEqualTo(String invoice) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'invoice',
        value: [invoice],
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterWhereClause>
      invoiceNotEqualTo(String invoice) {
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

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterWhereClause>
      idBranchEqualTo(String idBranch) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idBranch',
        value: [idBranch],
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterWhereClause>
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

extension ModelAdjustmentInIsarQueryFilter on QueryBuilder<
    ModelAdjustmentInIsar, ModelAdjustmentInIsar, QFilterCondition> {
  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> buyPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'buyPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> buyPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'buyPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> buyPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'buyPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> buyPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'buyPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> dateGreaterThan(
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

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> dateLessThan(
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

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> dateBetween(
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

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> expiredDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiredDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> expiredDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expiredDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> expiredDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expiredDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> expiredDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expiredDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> idBranchEqualTo(
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

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
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

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> idBranchLessThan(
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

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> idBranchBetween(
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

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
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

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> idBranchEndsWith(
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

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
          QAfterFilterCondition>
      idBranchContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idBranch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
          QAfterFilterCondition>
      idBranchMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idBranch',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> idBranchIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> idBranchIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> invoiceEqualTo(
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

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
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

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> invoiceLessThan(
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

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> invoiceBetween(
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

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
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

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> invoiceEndsWith(
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

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
          QAfterFilterCondition>
      invoiceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'invoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
          QAfterFilterCondition>
      invoiceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'invoice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> invoiceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoice',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> invoiceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'invoice',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
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

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> isarIdLessThan(
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

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> isarIdBetween(
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

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> noteEqualTo(
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

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> noteGreaterThan(
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

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> noteLessThan(
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

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> noteBetween(
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

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> noteStartsWith(
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

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> noteEndsWith(
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

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
          QAfterFilterCondition>
      noteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
          QAfterFilterCondition>
      noteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'note',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> qty_inEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qty_in',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> qty_inGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qty_in',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> qty_inLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qty_in',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> qty_inBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qty_in',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> sellPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sellPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> sellPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sellPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> sellPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sellPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar,
      QAfterFilterCondition> sellPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sellPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension ModelAdjustmentInIsarQueryObject on QueryBuilder<
    ModelAdjustmentInIsar, ModelAdjustmentInIsar, QFilterCondition> {}

extension ModelAdjustmentInIsarQueryLinks on QueryBuilder<ModelAdjustmentInIsar,
    ModelAdjustmentInIsar, QFilterCondition> {}

extension ModelAdjustmentInIsarQuerySortBy
    on QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QSortBy> {
  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      sortByBuyPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buyPrice', Sort.asc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      sortByBuyPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buyPrice', Sort.desc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      sortByExpiredDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiredDate', Sort.asc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      sortByExpiredDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiredDate', Sort.desc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      sortByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      sortByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      sortByInvoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.asc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      sortByInvoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.desc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      sortByQty_in() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty_in', Sort.asc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      sortByQty_inDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty_in', Sort.desc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      sortBySellPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellPrice', Sort.asc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      sortBySellPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellPrice', Sort.desc);
    });
  }
}

extension ModelAdjustmentInIsarQuerySortThenBy
    on QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QSortThenBy> {
  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      thenByBuyPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buyPrice', Sort.asc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      thenByBuyPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buyPrice', Sort.desc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      thenByExpiredDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiredDate', Sort.asc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      thenByExpiredDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiredDate', Sort.desc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      thenByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      thenByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      thenByInvoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.asc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      thenByInvoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.desc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      thenByQty_in() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty_in', Sort.asc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      thenByQty_inDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty_in', Sort.desc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      thenBySellPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellPrice', Sort.asc);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QAfterSortBy>
      thenBySellPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellPrice', Sort.desc);
    });
  }
}

extension ModelAdjustmentInIsarQueryWhereDistinct
    on QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QDistinct> {
  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QDistinct>
      distinctByBuyPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'buyPrice');
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QDistinct>
      distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QDistinct>
      distinctByExpiredDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expiredDate');
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QDistinct>
      distinctByIdBranch({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idBranch', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QDistinct>
      distinctByInvoice({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invoice', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QDistinct>
      distinctByNote({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QDistinct>
      distinctByQty_in() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qty_in');
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, ModelAdjustmentInIsar, QDistinct>
      distinctBySellPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sellPrice');
    });
  }
}

extension ModelAdjustmentInIsarQueryProperty on QueryBuilder<
    ModelAdjustmentInIsar, ModelAdjustmentInIsar, QQueryProperty> {
  QueryBuilder<ModelAdjustmentInIsar, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, double, QQueryOperations>
      buyPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'buyPrice');
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, DateTime, QQueryOperations>
      dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, DateTime, QQueryOperations>
      expiredDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expiredDate');
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, String, QQueryOperations>
      idBranchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idBranch');
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, String, QQueryOperations>
      invoiceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invoice');
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, String, QQueryOperations> noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, double, QQueryOperations>
      qty_inProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qty_in');
    });
  }

  QueryBuilder<ModelAdjustmentInIsar, double, QQueryOperations>
      sellPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sellPrice');
    });
  }
}
