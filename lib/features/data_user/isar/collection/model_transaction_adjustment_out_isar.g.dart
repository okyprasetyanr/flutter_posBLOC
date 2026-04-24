// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_transaction_adjustment_out_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModelTransactionAdjustmentOutIsarCollection on Isar {
  IsarCollection<ModelTransactionAdjustmentOutIsar>
      get modelTransactionAdjustmentOutIsars => this.collection();
}

const ModelTransactionAdjustmentOutIsarSchema = CollectionSchema(
  name: r'ModelTransactionAdjustmentOutIsar',
  id: -4708619675374574185,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'idBranch': PropertySchema(
      id: 1,
      name: r'idBranch',
      type: IsarType.string,
    ),
    r'invoice': PropertySchema(
      id: 2,
      name: r'invoice',
      type: IsarType.string,
    ),
    r'itemInvoice': PropertySchema(
      id: 3,
      name: r'itemInvoice',
      type: IsarType.string,
    ),
    r'itemName': PropertySchema(
      id: 4,
      name: r'itemName',
      type: IsarType.string,
    ),
    r'note': PropertySchema(
      id: 5,
      name: r'note',
      type: IsarType.string,
    ),
    r'qty_out_after': PropertySchema(
      id: 6,
      name: r'qty_out_after',
      type: IsarType.double,
    ),
    r'qty_out_before': PropertySchema(
      id: 7,
      name: r'qty_out_before',
      type: IsarType.double,
    )
  },
  estimateSize: _modelTransactionAdjustmentOutIsarEstimateSize,
  serialize: _modelTransactionAdjustmentOutIsarSerialize,
  deserialize: _modelTransactionAdjustmentOutIsarDeserialize,
  deserializeProp: _modelTransactionAdjustmentOutIsarDeserializeProp,
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
  getId: _modelTransactionAdjustmentOutIsarGetId,
  getLinks: _modelTransactionAdjustmentOutIsarGetLinks,
  attach: _modelTransactionAdjustmentOutIsarAttach,
  version: '3.1.0+1',
);

int _modelTransactionAdjustmentOutIsarEstimateSize(
  ModelTransactionAdjustmentOutIsar object,
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

void _modelTransactionAdjustmentOutIsarSerialize(
  ModelTransactionAdjustmentOutIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.date);
  writer.writeString(offsets[1], object.idBranch);
  writer.writeString(offsets[2], object.invoice);
  writer.writeString(offsets[3], object.itemInvoice);
  writer.writeString(offsets[4], object.itemName);
  writer.writeString(offsets[5], object.note);
  writer.writeDouble(offsets[6], object.qty_out_after);
  writer.writeDouble(offsets[7], object.qty_out_before);
}

ModelTransactionAdjustmentOutIsar _modelTransactionAdjustmentOutIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelTransactionAdjustmentOutIsar();
  object.date = reader.readDateTime(offsets[0]);
  object.idBranch = reader.readString(offsets[1]);
  object.invoice = reader.readString(offsets[2]);
  object.isarId = id;
  object.itemInvoice = reader.readString(offsets[3]);
  object.itemName = reader.readString(offsets[4]);
  object.note = reader.readString(offsets[5]);
  object.qty_out_after = reader.readDoubleOrNull(offsets[6]);
  object.qty_out_before = reader.readDoubleOrNull(offsets[7]);
  return object;
}

P _modelTransactionAdjustmentOutIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _modelTransactionAdjustmentOutIsarGetId(
    ModelTransactionAdjustmentOutIsar object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _modelTransactionAdjustmentOutIsarGetLinks(
    ModelTransactionAdjustmentOutIsar object) {
  return [];
}

void _modelTransactionAdjustmentOutIsarAttach(IsarCollection<dynamic> col,
    Id id, ModelTransactionAdjustmentOutIsar object) {
  object.isarId = id;
}

extension ModelTransactionAdjustmentOutIsarByIndex
    on IsarCollection<ModelTransactionAdjustmentOutIsar> {
  Future<ModelTransactionAdjustmentOutIsar?> getByInvoice(String invoice) {
    return getByIndex(r'invoice', [invoice]);
  }

  ModelTransactionAdjustmentOutIsar? getByInvoiceSync(String invoice) {
    return getByIndexSync(r'invoice', [invoice]);
  }

  Future<bool> deleteByInvoice(String invoice) {
    return deleteByIndex(r'invoice', [invoice]);
  }

  bool deleteByInvoiceSync(String invoice) {
    return deleteByIndexSync(r'invoice', [invoice]);
  }

  Future<List<ModelTransactionAdjustmentOutIsar?>> getAllByInvoice(
      List<String> invoiceValues) {
    final values = invoiceValues.map((e) => [e]).toList();
    return getAllByIndex(r'invoice', values);
  }

  List<ModelTransactionAdjustmentOutIsar?> getAllByInvoiceSync(
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

  Future<Id> putByInvoice(ModelTransactionAdjustmentOutIsar object) {
    return putByIndex(r'invoice', object);
  }

  Id putByInvoiceSync(ModelTransactionAdjustmentOutIsar object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'invoice', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByInvoice(
      List<ModelTransactionAdjustmentOutIsar> objects) {
    return putAllByIndex(r'invoice', objects);
  }

  List<Id> putAllByInvoiceSync(List<ModelTransactionAdjustmentOutIsar> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'invoice', objects, saveLinks: saveLinks);
  }
}

extension ModelTransactionAdjustmentOutIsarQueryWhereSort on QueryBuilder<
    ModelTransactionAdjustmentOutIsar,
    ModelTransactionAdjustmentOutIsar,
    QWhere> {
  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModelTransactionAdjustmentOutIsarQueryWhere on QueryBuilder<
    ModelTransactionAdjustmentOutIsar,
    ModelTransactionAdjustmentOutIsar,
    QWhereClause> {
  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
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
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterWhereClause> isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterWhereClause> isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterWhereClause> isarIdBetween(
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
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterWhereClause> invoiceEqualTo(String invoice) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'invoice',
        value: [invoice],
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
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
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterWhereClause> idBranchEqualTo(String idBranch) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idBranch',
        value: [idBranch],
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
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

extension ModelTransactionAdjustmentOutIsarQueryFilter on QueryBuilder<
    ModelTransactionAdjustmentOutIsar,
    ModelTransactionAdjustmentOutIsar,
    QFilterCondition> {
  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterFilterCondition> dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterFilterCondition> dateGreaterThan(
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

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterFilterCondition> dateLessThan(
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

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterFilterCondition> dateBetween(
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

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterFilterCondition> idBranchEqualTo(
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
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
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
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
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

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterFilterCondition> idBranchBetween(
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
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
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
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
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

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
          ModelTransactionAdjustmentOutIsar, QAfterFilterCondition>
      idBranchContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idBranch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
          ModelTransactionAdjustmentOutIsar, QAfterFilterCondition>
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
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterFilterCondition> idBranchIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterFilterCondition> idBranchIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterFilterCondition> invoiceEqualTo(
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
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
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

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterFilterCondition> invoiceLessThan(
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

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterFilterCondition> invoiceBetween(
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
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
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

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterFilterCondition> invoiceEndsWith(
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

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
          ModelTransactionAdjustmentOutIsar, QAfterFilterCondition>
      invoiceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'invoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
          ModelTransactionAdjustmentOutIsar, QAfterFilterCondition>
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
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterFilterCondition> invoiceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoice',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterFilterCondition> invoiceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'invoice',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterFilterCondition> isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
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

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterFilterCondition> isarIdLessThan(
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

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterFilterCondition> isarIdBetween(
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
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
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
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
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
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
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
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
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
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
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
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
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

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
          ModelTransactionAdjustmentOutIsar, QAfterFilterCondition>
      itemInvoiceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemInvoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
          ModelTransactionAdjustmentOutIsar, QAfterFilterCondition>
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
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterFilterCondition> itemInvoiceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemInvoice',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterFilterCondition> itemInvoiceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemInvoice',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterFilterCondition> itemNameEqualTo(
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
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
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

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterFilterCondition> itemNameLessThan(
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

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterFilterCondition> itemNameBetween(
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
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
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

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterFilterCondition> itemNameEndsWith(
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

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
          ModelTransactionAdjustmentOutIsar, QAfterFilterCondition>
      itemNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
          ModelTransactionAdjustmentOutIsar, QAfterFilterCondition>
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
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterFilterCondition> itemNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterFilterCondition> itemNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterFilterCondition> noteEqualTo(
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

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterFilterCondition> noteGreaterThan(
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

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterFilterCondition> noteLessThan(
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

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterFilterCondition> noteBetween(
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

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterFilterCondition> noteStartsWith(
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

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterFilterCondition> noteEndsWith(
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

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
          ModelTransactionAdjustmentOutIsar, QAfterFilterCondition>
      noteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
          ModelTransactionAdjustmentOutIsar, QAfterFilterCondition>
      noteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'note',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterFilterCondition> noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterFilterCondition> noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterFilterCondition> qty_out_afterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qty_out_after',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterFilterCondition> qty_out_afterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qty_out_after',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterFilterCondition> qty_out_afterEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qty_out_after',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterFilterCondition> qty_out_afterGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qty_out_after',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterFilterCondition> qty_out_afterLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qty_out_after',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterFilterCondition> qty_out_afterBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qty_out_after',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterFilterCondition> qty_out_beforeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qty_out_before',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterFilterCondition> qty_out_beforeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qty_out_before',
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterFilterCondition> qty_out_beforeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qty_out_before',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterFilterCondition> qty_out_beforeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qty_out_before',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterFilterCondition> qty_out_beforeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qty_out_before',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterFilterCondition> qty_out_beforeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qty_out_before',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension ModelTransactionAdjustmentOutIsarQueryObject on QueryBuilder<
    ModelTransactionAdjustmentOutIsar,
    ModelTransactionAdjustmentOutIsar,
    QFilterCondition> {}

extension ModelTransactionAdjustmentOutIsarQueryLinks on QueryBuilder<
    ModelTransactionAdjustmentOutIsar,
    ModelTransactionAdjustmentOutIsar,
    QFilterCondition> {}

extension ModelTransactionAdjustmentOutIsarQuerySortBy on QueryBuilder<
    ModelTransactionAdjustmentOutIsar,
    ModelTransactionAdjustmentOutIsar,
    QSortBy> {
  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterSortBy> sortByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterSortBy> sortByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterSortBy> sortByInvoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterSortBy> sortByInvoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterSortBy> sortByItemInvoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemInvoice', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterSortBy> sortByItemInvoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemInvoice', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterSortBy> sortByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterSortBy> sortByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterSortBy> sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterSortBy> sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterSortBy> sortByQty_out_after() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty_out_after', Sort.asc);
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterSortBy> sortByQty_out_afterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty_out_after', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterSortBy> sortByQty_out_before() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty_out_before', Sort.asc);
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterSortBy> sortByQty_out_beforeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty_out_before', Sort.desc);
    });
  }
}

extension ModelTransactionAdjustmentOutIsarQuerySortThenBy on QueryBuilder<
    ModelTransactionAdjustmentOutIsar,
    ModelTransactionAdjustmentOutIsar,
    QSortThenBy> {
  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterSortBy> thenByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterSortBy> thenByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterSortBy> thenByInvoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterSortBy> thenByInvoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterSortBy> thenByItemInvoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemInvoice', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterSortBy> thenByItemInvoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemInvoice', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterSortBy> thenByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterSortBy> thenByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterSortBy> thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterSortBy> thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterSortBy> thenByQty_out_after() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty_out_after', Sort.asc);
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterSortBy> thenByQty_out_afterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty_out_after', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QAfterSortBy> thenByQty_out_before() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty_out_before', Sort.asc);
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QAfterSortBy> thenByQty_out_beforeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty_out_before', Sort.desc);
    });
  }
}

extension ModelTransactionAdjustmentOutIsarQueryWhereDistinct on QueryBuilder<
    ModelTransactionAdjustmentOutIsar,
    ModelTransactionAdjustmentOutIsar,
    QDistinct> {
  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QDistinct> distinctByIdBranch({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idBranch', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QDistinct> distinctByInvoice({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invoice', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QDistinct> distinctByItemInvoice({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemInvoice', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QDistinct> distinctByItemName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<
      ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar,
      QDistinct> distinctByNote({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QDistinct> distinctByQty_out_after() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qty_out_after');
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar,
      ModelTransactionAdjustmentOutIsar, QDistinct> distinctByQty_out_before() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qty_out_before');
    });
  }
}

extension ModelTransactionAdjustmentOutIsarQueryProperty on QueryBuilder<
    ModelTransactionAdjustmentOutIsar,
    ModelTransactionAdjustmentOutIsar,
    QQueryProperty> {
  QueryBuilder<ModelTransactionAdjustmentOutIsar, int, QQueryOperations>
      isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar, DateTime, QQueryOperations>
      dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar, String, QQueryOperations>
      idBranchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idBranch');
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar, String, QQueryOperations>
      invoiceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invoice');
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar, String, QQueryOperations>
      itemInvoiceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemInvoice');
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar, String, QQueryOperations>
      itemNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemName');
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar, String, QQueryOperations>
      noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar, double?, QQueryOperations>
      qty_out_afterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qty_out_after');
    });
  }

  QueryBuilder<ModelTransactionAdjustmentOutIsar, double?, QQueryOperations>
      qty_out_beforeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qty_out_before');
    });
  }
}
