// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_transaction_financial_income_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModelTransactionFinancialIncomeIsarCollection on Isar {
  IsarCollection<ModelTransactionFinancialIncomeIsar>
      get modelTransactionFinancialIncomeIsars => this.collection();
}

const ModelTransactionFinancialIncomeIsarSchema = CollectionSchema(
  name: r'ModelTransactionFinancialIncomeIsar',
  id: 4111089664834293755,
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
  estimateSize: _modelTransactionFinancialIncomeIsarEstimateSize,
  serialize: _modelTransactionFinancialIncomeIsarSerialize,
  deserialize: _modelTransactionFinancialIncomeIsarDeserialize,
  deserializeProp: _modelTransactionFinancialIncomeIsarDeserializeProp,
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
  getId: _modelTransactionFinancialIncomeIsarGetId,
  getLinks: _modelTransactionFinancialIncomeIsarGetLinks,
  attach: _modelTransactionFinancialIncomeIsarAttach,
  version: '3.1.0+1',
);

int _modelTransactionFinancialIncomeIsarEstimateSize(
  ModelTransactionFinancialIncomeIsar object,
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

void _modelTransactionFinancialIncomeIsarSerialize(
  ModelTransactionFinancialIncomeIsar object,
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

ModelTransactionFinancialIncomeIsar
    _modelTransactionFinancialIncomeIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelTransactionFinancialIncomeIsar();
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

P _modelTransactionFinancialIncomeIsarDeserializeProp<P>(
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

Id _modelTransactionFinancialIncomeIsarGetId(
    ModelTransactionFinancialIncomeIsar object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _modelTransactionFinancialIncomeIsarGetLinks(
    ModelTransactionFinancialIncomeIsar object) {
  return [];
}

void _modelTransactionFinancialIncomeIsarAttach(IsarCollection<dynamic> col,
    Id id, ModelTransactionFinancialIncomeIsar object) {
  object.isarId = id;
}

extension ModelTransactionFinancialIncomeIsarByIndex
    on IsarCollection<ModelTransactionFinancialIncomeIsar> {
  Future<ModelTransactionFinancialIncomeIsar?> getByInvoice(String invoice) {
    return getByIndex(r'invoice', [invoice]);
  }

  ModelTransactionFinancialIncomeIsar? getByInvoiceSync(String invoice) {
    return getByIndexSync(r'invoice', [invoice]);
  }

  Future<bool> deleteByInvoice(String invoice) {
    return deleteByIndex(r'invoice', [invoice]);
  }

  bool deleteByInvoiceSync(String invoice) {
    return deleteByIndexSync(r'invoice', [invoice]);
  }

  Future<List<ModelTransactionFinancialIncomeIsar?>> getAllByInvoice(
      List<String> invoiceValues) {
    final values = invoiceValues.map((e) => [e]).toList();
    return getAllByIndex(r'invoice', values);
  }

  List<ModelTransactionFinancialIncomeIsar?> getAllByInvoiceSync(
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

  Future<Id> putByInvoice(ModelTransactionFinancialIncomeIsar object) {
    return putByIndex(r'invoice', object);
  }

  Id putByInvoiceSync(ModelTransactionFinancialIncomeIsar object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'invoice', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByInvoice(
      List<ModelTransactionFinancialIncomeIsar> objects) {
    return putAllByIndex(r'invoice', objects);
  }

  List<Id> putAllByInvoiceSync(
      List<ModelTransactionFinancialIncomeIsar> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'invoice', objects, saveLinks: saveLinks);
  }
}

extension ModelTransactionFinancialIncomeIsarQueryWhereSort on QueryBuilder<
    ModelTransactionFinancialIncomeIsar,
    ModelTransactionFinancialIncomeIsar,
    QWhere> {
  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModelTransactionFinancialIncomeIsarQueryWhere on QueryBuilder<
    ModelTransactionFinancialIncomeIsar,
    ModelTransactionFinancialIncomeIsar,
    QWhereClause> {
  QueryBuilder<
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QAfterWhereClause> isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QAfterWhereClause> isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterWhereClause> isarIdBetween(
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QAfterWhereClause> invoiceEqualTo(String invoice) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'invoice',
        value: [invoice],
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QAfterWhereClause> idBranchEqualTo(String idBranch) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idBranch',
        value: [idBranch],
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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

extension ModelTransactionFinancialIncomeIsarQueryFilter on QueryBuilder<
    ModelTransactionFinancialIncomeIsar,
    ModelTransactionFinancialIncomeIsar,
    QFilterCondition> {
  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterFilterCondition> amountEqualTo(
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterFilterCondition> amountBetween(
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QAfterFilterCondition> dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterFilterCondition> dateLessThan(
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

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterFilterCondition> dateBetween(
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
          ModelTransactionFinancialIncomeIsar, QAfterFilterCondition>
      idBranchContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idBranch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
          ModelTransactionFinancialIncomeIsar, QAfterFilterCondition>
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QAfterFilterCondition> idBranchIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QAfterFilterCondition> idBranchIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
          ModelTransactionFinancialIncomeIsar, QAfterFilterCondition>
      idFinancialContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idFinancial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
          ModelTransactionFinancialIncomeIsar, QAfterFilterCondition>
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QAfterFilterCondition> idFinancialIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idFinancial',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QAfterFilterCondition> idFinancialIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idFinancial',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
          ModelTransactionFinancialIncomeIsar, QAfterFilterCondition>
      invoiceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'invoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
          ModelTransactionFinancialIncomeIsar, QAfterFilterCondition>
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QAfterFilterCondition> invoiceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoice',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QAfterFilterCondition> invoiceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'invoice',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QAfterFilterCondition> isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterFilterCondition> isarIdBetween(
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
          ModelTransactionFinancialIncomeIsar, QAfterFilterCondition>
      nameFinancialContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nameFinancial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
          ModelTransactionFinancialIncomeIsar, QAfterFilterCondition>
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QAfterFilterCondition> nameFinancialIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameFinancial',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QAfterFilterCondition> nameFinancialIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameFinancial',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterFilterCondition> noteEqualTo(
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterFilterCondition> noteLessThan(
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

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterFilterCondition> noteBetween(
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterFilterCondition> noteEndsWith(
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

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
          ModelTransactionFinancialIncomeIsar, QAfterFilterCondition>
      noteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
          ModelTransactionFinancialIncomeIsar, QAfterFilterCondition>
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QAfterFilterCondition> noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QAfterFilterCondition> noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
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

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
          ModelTransactionFinancialIncomeIsar, QAfterFilterCondition>
      statusTransactionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'statusTransaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
          ModelTransactionFinancialIncomeIsar, QAfterFilterCondition>
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
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QAfterFilterCondition> statusTransactionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusTransaction',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QAfterFilterCondition> statusTransactionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'statusTransaction',
        value: '',
      ));
    });
  }
}

extension ModelTransactionFinancialIncomeIsarQueryObject on QueryBuilder<
    ModelTransactionFinancialIncomeIsar,
    ModelTransactionFinancialIncomeIsar,
    QFilterCondition> {}

extension ModelTransactionFinancialIncomeIsarQueryLinks on QueryBuilder<
    ModelTransactionFinancialIncomeIsar,
    ModelTransactionFinancialIncomeIsar,
    QFilterCondition> {}

extension ModelTransactionFinancialIncomeIsarQuerySortBy on QueryBuilder<
    ModelTransactionFinancialIncomeIsar,
    ModelTransactionFinancialIncomeIsar,
    QSortBy> {
  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterSortBy> sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterSortBy> sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterSortBy> sortByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterSortBy> sortByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterSortBy> sortByIdFinancial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idFinancial', Sort.asc);
    });
  }

  QueryBuilder<
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QAfterSortBy> sortByIdFinancialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idFinancial', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterSortBy> sortByInvoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterSortBy> sortByInvoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterSortBy> sortByNameFinancial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameFinancial', Sort.asc);
    });
  }

  QueryBuilder<
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QAfterSortBy> sortByNameFinancialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameFinancial', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterSortBy> sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterSortBy> sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QAfterSortBy> sortByStatusTransaction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusTransaction', Sort.asc);
    });
  }

  QueryBuilder<
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QAfterSortBy> sortByStatusTransactionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusTransaction', Sort.desc);
    });
  }
}

extension ModelTransactionFinancialIncomeIsarQuerySortThenBy on QueryBuilder<
    ModelTransactionFinancialIncomeIsar,
    ModelTransactionFinancialIncomeIsar,
    QSortThenBy> {
  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterSortBy> thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterSortBy> thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterSortBy> thenByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterSortBy> thenByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterSortBy> thenByIdFinancial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idFinancial', Sort.asc);
    });
  }

  QueryBuilder<
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QAfterSortBy> thenByIdFinancialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idFinancial', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterSortBy> thenByInvoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterSortBy> thenByInvoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterSortBy> thenByNameFinancial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameFinancial', Sort.asc);
    });
  }

  QueryBuilder<
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QAfterSortBy> thenByNameFinancialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameFinancial', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterSortBy> thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QAfterSortBy> thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QAfterSortBy> thenByStatusTransaction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusTransaction', Sort.asc);
    });
  }

  QueryBuilder<
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QAfterSortBy> thenByStatusTransactionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusTransaction', Sort.desc);
    });
  }
}

extension ModelTransactionFinancialIncomeIsarQueryWhereDistinct on QueryBuilder<
    ModelTransactionFinancialIncomeIsar,
    ModelTransactionFinancialIncomeIsar,
    QDistinct> {
  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QDistinct> distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QDistinct> distinctByIdBranch({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idBranch', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QDistinct> distinctByIdFinancial({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idFinancial', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QDistinct> distinctByInvoice({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invoice', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QDistinct> distinctByNameFinancial({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameFinancial',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QDistinct> distinctByNote({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<
      ModelTransactionFinancialIncomeIsar,
      ModelTransactionFinancialIncomeIsar,
      QDistinct> distinctByStatusTransaction({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statusTransaction',
          caseSensitive: caseSensitive);
    });
  }
}

extension ModelTransactionFinancialIncomeIsarQueryProperty on QueryBuilder<
    ModelTransactionFinancialIncomeIsar,
    ModelTransactionFinancialIncomeIsar,
    QQueryProperty> {
  QueryBuilder<ModelTransactionFinancialIncomeIsar, int, QQueryOperations>
      isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar, double, QQueryOperations>
      amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar, DateTime, QQueryOperations>
      dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar, String, QQueryOperations>
      idBranchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idBranch');
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar, String, QQueryOperations>
      idFinancialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idFinancial');
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar, String, QQueryOperations>
      invoiceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invoice');
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar, String, QQueryOperations>
      nameFinancialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameFinancial');
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar, String, QQueryOperations>
      noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<ModelTransactionFinancialIncomeIsar, String, QQueryOperations>
      statusTransactionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statusTransaction');
    });
  }
}
