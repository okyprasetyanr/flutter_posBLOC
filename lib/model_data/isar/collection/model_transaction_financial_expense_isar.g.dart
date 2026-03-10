// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_transaction_financial_expense_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModelTransactionFinancialExpenseIsarCollection on Isar {
  IsarCollection<ModelTransactionFinancialExpenseIsar>
      get modelTransactionFinancialExpenseIsars => this.collection();
}

const ModelTransactionFinancialExpenseIsarSchema = CollectionSchema(
  name: r'ModelTransactionFinancialExpenseIsar',
  id: 8970015188576306710,
  properties: {
    r'amount': PropertySchema(
      id: 0,
      name: r'amount',
      type: IsarType.double,
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
    r'idFinancial': PropertySchema(
      id: 3,
      name: r'idFinancial',
      type: IsarType.string,
    ),
    r'invoice': PropertySchema(
      id: 4,
      name: r'invoice',
      type: IsarType.string,
    ),
    r'nameFinancial': PropertySchema(
      id: 5,
      name: r'nameFinancial',
      type: IsarType.string,
    ),
    r'note': PropertySchema(
      id: 6,
      name: r'note',
      type: IsarType.string,
    ),
    r'statusTransaction': PropertySchema(
      id: 7,
      name: r'statusTransaction',
      type: IsarType.string,
    )
  },
  estimateSize: _modelTransactionFinancialExpenseIsarEstimateSize,
  serialize: _modelTransactionFinancialExpenseIsarSerialize,
  deserialize: _modelTransactionFinancialExpenseIsarDeserialize,
  deserializeProp: _modelTransactionFinancialExpenseIsarDeserializeProp,
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
  getId: _modelTransactionFinancialExpenseIsarGetId,
  getLinks: _modelTransactionFinancialExpenseIsarGetLinks,
  attach: _modelTransactionFinancialExpenseIsarAttach,
  version: '3.1.0+1',
);

int _modelTransactionFinancialExpenseIsarEstimateSize(
  ModelTransactionFinancialExpenseIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.idBranch.length * 3;
  bytesCount += 3 + object.idFinancial.length * 3;
  bytesCount += 3 + object.invoice.length * 3;
  bytesCount += 3 + object.nameFinancial.length * 3;
  bytesCount += 3 + object.note.length * 3;
  bytesCount += 3 + object.statusTransaction.length * 3;
  return bytesCount;
}

void _modelTransactionFinancialExpenseIsarSerialize(
  ModelTransactionFinancialExpenseIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amount);
  writer.writeDateTime(offsets[1], object.date);
  writer.writeString(offsets[2], object.idBranch);
  writer.writeString(offsets[3], object.idFinancial);
  writer.writeString(offsets[4], object.invoice);
  writer.writeString(offsets[5], object.nameFinancial);
  writer.writeString(offsets[6], object.note);
  writer.writeString(offsets[7], object.statusTransaction);
}

ModelTransactionFinancialExpenseIsar
    _modelTransactionFinancialExpenseIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelTransactionFinancialExpenseIsar();
  object.amount = reader.readDouble(offsets[0]);
  object.date = reader.readDateTime(offsets[1]);
  object.idBranch = reader.readString(offsets[2]);
  object.idFinancial = reader.readString(offsets[3]);
  object.invoice = reader.readString(offsets[4]);
  object.isarId = id;
  object.nameFinancial = reader.readString(offsets[5]);
  object.note = reader.readString(offsets[6]);
  object.statusTransaction = reader.readString(offsets[7]);
  return object;
}

P _modelTransactionFinancialExpenseIsarDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _modelTransactionFinancialExpenseIsarGetId(
    ModelTransactionFinancialExpenseIsar object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _modelTransactionFinancialExpenseIsarGetLinks(
    ModelTransactionFinancialExpenseIsar object) {
  return [];
}

void _modelTransactionFinancialExpenseIsarAttach(IsarCollection<dynamic> col,
    Id id, ModelTransactionFinancialExpenseIsar object) {
  object.isarId = id;
}

extension ModelTransactionFinancialExpenseIsarByIndex
    on IsarCollection<ModelTransactionFinancialExpenseIsar> {
  Future<ModelTransactionFinancialExpenseIsar?> getByInvoice(String invoice) {
    return getByIndex(r'invoice', [invoice]);
  }

  ModelTransactionFinancialExpenseIsar? getByInvoiceSync(String invoice) {
    return getByIndexSync(r'invoice', [invoice]);
  }

  Future<bool> deleteByInvoice(String invoice) {
    return deleteByIndex(r'invoice', [invoice]);
  }

  bool deleteByInvoiceSync(String invoice) {
    return deleteByIndexSync(r'invoice', [invoice]);
  }

  Future<List<ModelTransactionFinancialExpenseIsar?>> getAllByInvoice(
      List<String> invoiceValues) {
    final values = invoiceValues.map((e) => [e]).toList();
    return getAllByIndex(r'invoice', values);
  }

  List<ModelTransactionFinancialExpenseIsar?> getAllByInvoiceSync(
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

  Future<Id> putByInvoice(ModelTransactionFinancialExpenseIsar object) {
    return putByIndex(r'invoice', object);
  }

  Id putByInvoiceSync(ModelTransactionFinancialExpenseIsar object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'invoice', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByInvoice(
      List<ModelTransactionFinancialExpenseIsar> objects) {
    return putAllByIndex(r'invoice', objects);
  }

  List<Id> putAllByInvoiceSync(
      List<ModelTransactionFinancialExpenseIsar> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'invoice', objects, saveLinks: saveLinks);
  }
}

extension ModelTransactionFinancialExpenseIsarQueryWhereSort on QueryBuilder<
    ModelTransactionFinancialExpenseIsar,
    ModelTransactionFinancialExpenseIsar,
    QWhere> {
  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModelTransactionFinancialExpenseIsarQueryWhere on QueryBuilder<
    ModelTransactionFinancialExpenseIsar,
    ModelTransactionFinancialExpenseIsar,
    QWhereClause> {
  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
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
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterWhereClause> isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterWhereClause> isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterWhereClause> isarIdBetween(
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
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterWhereClause> invoiceEqualTo(String invoice) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'invoice',
        value: [invoice],
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
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
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterWhereClause> idBranchEqualTo(String idBranch) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idBranch',
        value: [idBranch],
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
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

extension ModelTransactionFinancialExpenseIsarQueryFilter on QueryBuilder<
    ModelTransactionFinancialExpenseIsar,
    ModelTransactionFinancialExpenseIsar,
    QFilterCondition> {
  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> amountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> amountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> amountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> amountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
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

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterFilterCondition> dateLessThan(
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

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterFilterCondition> dateBetween(
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
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
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

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
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

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
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

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
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

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
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

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
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

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
          ModelTransactionFinancialExpenseIsar, QAfterFilterCondition>
      idBranchContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idBranch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
          ModelTransactionFinancialExpenseIsar, QAfterFilterCondition>
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
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> idBranchIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> idBranchIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> idFinancialEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idFinancial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> idFinancialGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idFinancial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> idFinancialLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idFinancial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> idFinancialBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idFinancial',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> idFinancialStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idFinancial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> idFinancialEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idFinancial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
          ModelTransactionFinancialExpenseIsar, QAfterFilterCondition>
      idFinancialContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idFinancial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
          ModelTransactionFinancialExpenseIsar, QAfterFilterCondition>
      idFinancialMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idFinancial',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> idFinancialIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idFinancial',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> idFinancialIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idFinancial',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
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

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
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

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
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

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
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

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
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

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
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

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
          ModelTransactionFinancialExpenseIsar, QAfterFilterCondition>
      invoiceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'invoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
          ModelTransactionFinancialExpenseIsar, QAfterFilterCondition>
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
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> invoiceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoice',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> invoiceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'invoice',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
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

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
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

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
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

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> nameFinancialEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameFinancial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> nameFinancialGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nameFinancial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> nameFinancialLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nameFinancial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> nameFinancialBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nameFinancial',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> nameFinancialStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nameFinancial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> nameFinancialEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nameFinancial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
          ModelTransactionFinancialExpenseIsar, QAfterFilterCondition>
      nameFinancialContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nameFinancial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
          ModelTransactionFinancialExpenseIsar, QAfterFilterCondition>
      nameFinancialMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nameFinancial',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> nameFinancialIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameFinancial',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> nameFinancialIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameFinancial',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterFilterCondition> noteEqualTo(
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

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
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

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterFilterCondition> noteLessThan(
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

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterFilterCondition> noteBetween(
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

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
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

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterFilterCondition> noteEndsWith(
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

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
          ModelTransactionFinancialExpenseIsar, QAfterFilterCondition>
      noteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
          ModelTransactionFinancialExpenseIsar, QAfterFilterCondition>
      noteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'note',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> statusTransactionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusTransaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> statusTransactionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'statusTransaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> statusTransactionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'statusTransaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> statusTransactionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'statusTransaction',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> statusTransactionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'statusTransaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> statusTransactionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'statusTransaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
          ModelTransactionFinancialExpenseIsar, QAfterFilterCondition>
      statusTransactionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'statusTransaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
          ModelTransactionFinancialExpenseIsar, QAfterFilterCondition>
      statusTransactionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'statusTransaction',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> statusTransactionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusTransaction',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterFilterCondition> statusTransactionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'statusTransaction',
        value: '',
      ));
    });
  }
}

extension ModelTransactionFinancialExpenseIsarQueryObject on QueryBuilder<
    ModelTransactionFinancialExpenseIsar,
    ModelTransactionFinancialExpenseIsar,
    QFilterCondition> {}

extension ModelTransactionFinancialExpenseIsarQueryLinks on QueryBuilder<
    ModelTransactionFinancialExpenseIsar,
    ModelTransactionFinancialExpenseIsar,
    QFilterCondition> {}

extension ModelTransactionFinancialExpenseIsarQuerySortBy on QueryBuilder<
    ModelTransactionFinancialExpenseIsar,
    ModelTransactionFinancialExpenseIsar,
    QSortBy> {
  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterSortBy> sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterSortBy> sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterSortBy> sortByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterSortBy> sortByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterSortBy> sortByIdFinancial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idFinancial', Sort.asc);
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterSortBy> sortByIdFinancialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idFinancial', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterSortBy> sortByInvoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterSortBy> sortByInvoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.desc);
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterSortBy> sortByNameFinancial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameFinancial', Sort.asc);
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterSortBy> sortByNameFinancialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameFinancial', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterSortBy> sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterSortBy> sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterSortBy> sortByStatusTransaction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusTransaction', Sort.asc);
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterSortBy> sortByStatusTransactionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusTransaction', Sort.desc);
    });
  }
}

extension ModelTransactionFinancialExpenseIsarQuerySortThenBy on QueryBuilder<
    ModelTransactionFinancialExpenseIsar,
    ModelTransactionFinancialExpenseIsar,
    QSortThenBy> {
  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterSortBy> thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterSortBy> thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterSortBy> thenByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterSortBy> thenByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterSortBy> thenByIdFinancial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idFinancial', Sort.asc);
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterSortBy> thenByIdFinancialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idFinancial', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterSortBy> thenByInvoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterSortBy> thenByInvoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterSortBy> thenByNameFinancial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameFinancial', Sort.asc);
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterSortBy> thenByNameFinancialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameFinancial', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterSortBy> thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QAfterSortBy> thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterSortBy> thenByStatusTransaction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusTransaction', Sort.asc);
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QAfterSortBy> thenByStatusTransactionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusTransaction', Sort.desc);
    });
  }
}

extension ModelTransactionFinancialExpenseIsarQueryWhereDistinct
    on QueryBuilder<ModelTransactionFinancialExpenseIsar,
        ModelTransactionFinancialExpenseIsar, QDistinct> {
  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QDistinct> distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QDistinct> distinctByIdBranch({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idBranch', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QDistinct> distinctByIdFinancial({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idFinancial', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QDistinct> distinctByInvoice({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invoice', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QDistinct> distinctByNameFinancial({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameFinancial',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QDistinct> distinctByNote({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<
      ModelTransactionFinancialExpenseIsar,
      ModelTransactionFinancialExpenseIsar,
      QDistinct> distinctByStatusTransaction({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statusTransaction',
          caseSensitive: caseSensitive);
    });
  }
}

extension ModelTransactionFinancialExpenseIsarQueryProperty on QueryBuilder<
    ModelTransactionFinancialExpenseIsar,
    ModelTransactionFinancialExpenseIsar,
    QQueryProperty> {
  QueryBuilder<ModelTransactionFinancialExpenseIsar, int, QQueryOperations>
      isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar, double, QQueryOperations>
      amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar, DateTime, QQueryOperations>
      dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar, String, QQueryOperations>
      idBranchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idBranch');
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar, String, QQueryOperations>
      idFinancialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idFinancial');
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar, String, QQueryOperations>
      invoiceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invoice');
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar, String, QQueryOperations>
      nameFinancialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameFinancial');
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar, String, QQueryOperations>
      noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<ModelTransactionFinancialExpenseIsar, String, QQueryOperations>
      statusTransactionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statusTransaction');
    });
  }
}
