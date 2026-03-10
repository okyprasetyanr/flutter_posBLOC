// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_transaction_sell_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModelTransactionSellIsarCollection on Isar {
  IsarCollection<ModelTransactionSellIsar> get modelTransactionSellIsars =>
      this.collection();
}

const ModelTransactionSellIsarSchema = CollectionSchema(
  name: r'ModelTransactionSellIsar',
  id: -847885553660025665,
  properties: {
    r'bankName': PropertySchema(
      id: 0,
      name: r'bankName',
      type: IsarType.string,
    ),
    r'billPaid': PropertySchema(
      id: 1,
      name: r'billPaid',
      type: IsarType.double,
    ),
    r'charge': PropertySchema(
      id: 2,
      name: r'charge',
      type: IsarType.long,
    ),
    r'dataSplit': PropertySchema(
      id: 3,
      name: r'dataSplit',
      type: IsarType.objectList,
      target: r'ModelSplitIsar',
    ),
    r'date': PropertySchema(
      id: 4,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'discount': PropertySchema(
      id: 5,
      name: r'discount',
      type: IsarType.long,
    ),
    r'idBranch': PropertySchema(
      id: 6,
      name: r'idBranch',
      type: IsarType.string,
    ),
    r'idOperator': PropertySchema(
      id: 7,
      name: r'idOperator',
      type: IsarType.string,
    ),
    r'idPartner': PropertySchema(
      id: 8,
      name: r'idPartner',
      type: IsarType.string,
    ),
    r'invoice': PropertySchema(
      id: 9,
      name: r'invoice',
      type: IsarType.string,
    ),
    r'itemsOrdered': PropertySchema(
      id: 10,
      name: r'itemsOrdered',
      type: IsarType.objectList,
      target: r'ModelItemOrderedIsar',
    ),
    r'nameOperator': PropertySchema(
      id: 11,
      name: r'nameOperator',
      type: IsarType.string,
    ),
    r'namePartner': PropertySchema(
      id: 12,
      name: r'namePartner',
      type: IsarType.string,
    ),
    r'note': PropertySchema(
      id: 13,
      name: r'note',
      type: IsarType.string,
    ),
    r'paymentMethod': PropertySchema(
      id: 14,
      name: r'paymentMethod',
      type: IsarType.string,
    ),
    r'ppn': PropertySchema(
      id: 15,
      name: r'ppn',
      type: IsarType.long,
    ),
    r'statusTransaction': PropertySchema(
      id: 16,
      name: r'statusTransaction',
      type: IsarType.string,
    ),
    r'subTotal': PropertySchema(
      id: 17,
      name: r'subTotal',
      type: IsarType.double,
    ),
    r'total': PropertySchema(
      id: 18,
      name: r'total',
      type: IsarType.double,
    ),
    r'totalCharge': PropertySchema(
      id: 19,
      name: r'totalCharge',
      type: IsarType.double,
    ),
    r'totalDiscount': PropertySchema(
      id: 20,
      name: r'totalDiscount',
      type: IsarType.double,
    ),
    r'totalItem': PropertySchema(
      id: 21,
      name: r'totalItem',
      type: IsarType.long,
    ),
    r'totalPpn': PropertySchema(
      id: 22,
      name: r'totalPpn',
      type: IsarType.double,
    )
  },
  estimateSize: _modelTransactionSellIsarEstimateSize,
  serialize: _modelTransactionSellIsarSerialize,
  deserialize: _modelTransactionSellIsarDeserialize,
  deserializeProp: _modelTransactionSellIsarDeserializeProp,
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
  embeddedSchemas: {
    r'ModelItemOrderedIsar': ModelItemOrderedIsarSchema,
    r'ModelItemOrderedBatchIsar': ModelItemOrderedBatchIsarSchema,
    r'ModelSplitIsar': ModelSplitIsarSchema
  },
  getId: _modelTransactionSellIsarGetId,
  getLinks: _modelTransactionSellIsarGetLinks,
  attach: _modelTransactionSellIsarAttach,
  version: '3.1.0+1',
);

int _modelTransactionSellIsarEstimateSize(
  ModelTransactionSellIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.bankName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.dataSplit.length * 3;
  {
    final offsets = allOffsets[ModelSplitIsar]!;
    for (var i = 0; i < object.dataSplit.length; i++) {
      final value = object.dataSplit[i];
      bytesCount +=
          ModelSplitIsarSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.idBranch.length * 3;
  {
    final value = object.idOperator;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.idPartner;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.invoice.length * 3;
  bytesCount += 3 + object.itemsOrdered.length * 3;
  {
    final offsets = allOffsets[ModelItemOrderedIsar]!;
    for (var i = 0; i < object.itemsOrdered.length; i++) {
      final value = object.itemsOrdered[i];
      bytesCount +=
          ModelItemOrderedIsarSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  {
    final value = object.nameOperator;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.namePartner;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.note.length * 3;
  bytesCount += 3 + object.paymentMethod.length * 3;
  bytesCount += 3 + object.statusTransaction.length * 3;
  return bytesCount;
}

void _modelTransactionSellIsarSerialize(
  ModelTransactionSellIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bankName);
  writer.writeDouble(offsets[1], object.billPaid);
  writer.writeLong(offsets[2], object.charge);
  writer.writeObjectList<ModelSplitIsar>(
    offsets[3],
    allOffsets,
    ModelSplitIsarSchema.serialize,
    object.dataSplit,
  );
  writer.writeDateTime(offsets[4], object.date);
  writer.writeLong(offsets[5], object.discount);
  writer.writeString(offsets[6], object.idBranch);
  writer.writeString(offsets[7], object.idOperator);
  writer.writeString(offsets[8], object.idPartner);
  writer.writeString(offsets[9], object.invoice);
  writer.writeObjectList<ModelItemOrderedIsar>(
    offsets[10],
    allOffsets,
    ModelItemOrderedIsarSchema.serialize,
    object.itemsOrdered,
  );
  writer.writeString(offsets[11], object.nameOperator);
  writer.writeString(offsets[12], object.namePartner);
  writer.writeString(offsets[13], object.note);
  writer.writeString(offsets[14], object.paymentMethod);
  writer.writeLong(offsets[15], object.ppn);
  writer.writeString(offsets[16], object.statusTransaction);
  writer.writeDouble(offsets[17], object.subTotal);
  writer.writeDouble(offsets[18], object.total);
  writer.writeDouble(offsets[19], object.totalCharge);
  writer.writeDouble(offsets[20], object.totalDiscount);
  writer.writeLong(offsets[21], object.totalItem);
  writer.writeDouble(offsets[22], object.totalPpn);
}

ModelTransactionSellIsar _modelTransactionSellIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelTransactionSellIsar();
  object.bankName = reader.readStringOrNull(offsets[0]);
  object.billPaid = reader.readDouble(offsets[1]);
  object.charge = reader.readLong(offsets[2]);
  object.dataSplit = reader.readObjectList<ModelSplitIsar>(
        offsets[3],
        ModelSplitIsarSchema.deserialize,
        allOffsets,
        ModelSplitIsar(),
      ) ??
      [];
  object.date = reader.readDateTime(offsets[4]);
  object.discount = reader.readLong(offsets[5]);
  object.idBranch = reader.readString(offsets[6]);
  object.idOperator = reader.readStringOrNull(offsets[7]);
  object.idPartner = reader.readStringOrNull(offsets[8]);
  object.invoice = reader.readString(offsets[9]);
  object.isarId = id;
  object.itemsOrdered = reader.readObjectList<ModelItemOrderedIsar>(
        offsets[10],
        ModelItemOrderedIsarSchema.deserialize,
        allOffsets,
        ModelItemOrderedIsar(),
      ) ??
      [];
  object.nameOperator = reader.readStringOrNull(offsets[11]);
  object.namePartner = reader.readStringOrNull(offsets[12]);
  object.note = reader.readString(offsets[13]);
  object.paymentMethod = reader.readString(offsets[14]);
  object.ppn = reader.readLong(offsets[15]);
  object.statusTransaction = reader.readString(offsets[16]);
  object.subTotal = reader.readDouble(offsets[17]);
  object.total = reader.readDouble(offsets[18]);
  object.totalCharge = reader.readDouble(offsets[19]);
  object.totalDiscount = reader.readDouble(offsets[20]);
  object.totalItem = reader.readLong(offsets[21]);
  object.totalPpn = reader.readDouble(offsets[22]);
  return object;
}

P _modelTransactionSellIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readObjectList<ModelSplitIsar>(
            offset,
            ModelSplitIsarSchema.deserialize,
            allOffsets,
            ModelSplitIsar(),
          ) ??
          []) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readObjectList<ModelItemOrderedIsar>(
            offset,
            ModelItemOrderedIsarSchema.deserialize,
            allOffsets,
            ModelItemOrderedIsar(),
          ) ??
          []) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readLong(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readDouble(offset)) as P;
    case 18:
      return (reader.readDouble(offset)) as P;
    case 19:
      return (reader.readDouble(offset)) as P;
    case 20:
      return (reader.readDouble(offset)) as P;
    case 21:
      return (reader.readLong(offset)) as P;
    case 22:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _modelTransactionSellIsarGetId(ModelTransactionSellIsar object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _modelTransactionSellIsarGetLinks(
    ModelTransactionSellIsar object) {
  return [];
}

void _modelTransactionSellIsarAttach(
    IsarCollection<dynamic> col, Id id, ModelTransactionSellIsar object) {
  object.isarId = id;
}

extension ModelTransactionSellIsarByIndex
    on IsarCollection<ModelTransactionSellIsar> {
  Future<ModelTransactionSellIsar?> getByInvoice(String invoice) {
    return getByIndex(r'invoice', [invoice]);
  }

  ModelTransactionSellIsar? getByInvoiceSync(String invoice) {
    return getByIndexSync(r'invoice', [invoice]);
  }

  Future<bool> deleteByInvoice(String invoice) {
    return deleteByIndex(r'invoice', [invoice]);
  }

  bool deleteByInvoiceSync(String invoice) {
    return deleteByIndexSync(r'invoice', [invoice]);
  }

  Future<List<ModelTransactionSellIsar?>> getAllByInvoice(
      List<String> invoiceValues) {
    final values = invoiceValues.map((e) => [e]).toList();
    return getAllByIndex(r'invoice', values);
  }

  List<ModelTransactionSellIsar?> getAllByInvoiceSync(
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

  Future<Id> putByInvoice(ModelTransactionSellIsar object) {
    return putByIndex(r'invoice', object);
  }

  Id putByInvoiceSync(ModelTransactionSellIsar object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'invoice', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByInvoice(List<ModelTransactionSellIsar> objects) {
    return putAllByIndex(r'invoice', objects);
  }

  List<Id> putAllByInvoiceSync(List<ModelTransactionSellIsar> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'invoice', objects, saveLinks: saveLinks);
  }
}

extension ModelTransactionSellIsarQueryWhereSort on QueryBuilder<
    ModelTransactionSellIsar, ModelTransactionSellIsar, QWhere> {
  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterWhere>
      anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModelTransactionSellIsarQueryWhere on QueryBuilder<
    ModelTransactionSellIsar, ModelTransactionSellIsar, QWhereClause> {
  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterWhereClause> isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterWhereClause> isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterWhereClause> invoiceEqualTo(String invoice) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'invoice',
        value: [invoice],
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterWhereClause> idBranchEqualTo(String idBranch) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idBranch',
        value: [idBranch],
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

extension ModelTransactionSellIsarQueryFilter on QueryBuilder<
    ModelTransactionSellIsar, ModelTransactionSellIsar, QFilterCondition> {
  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> bankNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bankName',
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> bankNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bankName',
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> bankNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> bankNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> bankNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> bankNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bankName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> bankNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> bankNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
          QAfterFilterCondition>
      bankNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
          QAfterFilterCondition>
      bankNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bankName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> bankNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bankName',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> bankNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bankName',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> billPaidEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'billPaid',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> billPaidGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'billPaid',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> billPaidLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'billPaid',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> billPaidBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'billPaid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> chargeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'charge',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> chargeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'charge',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> chargeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'charge',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> chargeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'charge',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> dataSplitLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dataSplit',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> dataSplitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dataSplit',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> dataSplitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dataSplit',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> dataSplitLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dataSplit',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> dataSplitLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dataSplit',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> dataSplitLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dataSplit',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> discountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discount',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> discountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discount',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> discountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discount',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> discountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> idBranchIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> idBranchIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> idOperatorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idOperator',
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> idOperatorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idOperator',
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> idOperatorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idOperator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> idOperatorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idOperator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> idOperatorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idOperator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> idOperatorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idOperator',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> idOperatorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idOperator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> idOperatorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idOperator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
          QAfterFilterCondition>
      idOperatorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idOperator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
          QAfterFilterCondition>
      idOperatorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idOperator',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> idOperatorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idOperator',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> idOperatorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idOperator',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> idPartnerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idPartner',
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> idPartnerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idPartner',
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> idPartnerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idPartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> idPartnerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idPartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> idPartnerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idPartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> idPartnerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idPartner',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> idPartnerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idPartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> idPartnerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idPartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
          QAfterFilterCondition>
      idPartnerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idPartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
          QAfterFilterCondition>
      idPartnerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idPartner',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> idPartnerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idPartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> idPartnerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idPartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> invoiceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoice',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> invoiceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'invoice',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> itemsOrderedLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemsOrdered',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> itemsOrderedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemsOrdered',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> itemsOrderedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemsOrdered',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> itemsOrderedLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemsOrdered',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> itemsOrderedLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemsOrdered',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> itemsOrderedLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemsOrdered',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> nameOperatorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nameOperator',
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> nameOperatorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nameOperator',
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> nameOperatorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameOperator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> nameOperatorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nameOperator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> nameOperatorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nameOperator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> nameOperatorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nameOperator',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> nameOperatorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nameOperator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> nameOperatorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nameOperator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
          QAfterFilterCondition>
      nameOperatorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nameOperator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
          QAfterFilterCondition>
      nameOperatorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nameOperator',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> nameOperatorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameOperator',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> nameOperatorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameOperator',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> namePartnerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'namePartner',
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> namePartnerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'namePartner',
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> namePartnerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namePartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> namePartnerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'namePartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> namePartnerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'namePartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> namePartnerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'namePartner',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> namePartnerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'namePartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> namePartnerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'namePartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
          QAfterFilterCondition>
      namePartnerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'namePartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
          QAfterFilterCondition>
      namePartnerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'namePartner',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> namePartnerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namePartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> namePartnerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'namePartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> paymentMethodEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> paymentMethodGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> paymentMethodLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> paymentMethodBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paymentMethod',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> paymentMethodStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> paymentMethodEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
          QAfterFilterCondition>
      paymentMethodContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
          QAfterFilterCondition>
      paymentMethodMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'paymentMethod',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> paymentMethodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> paymentMethodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'paymentMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> ppnEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ppn',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> ppnGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ppn',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> ppnLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ppn',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> ppnBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ppn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
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

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
          QAfterFilterCondition>
      statusTransactionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'statusTransaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
          QAfterFilterCondition>
      statusTransactionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'statusTransaction',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> statusTransactionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusTransaction',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> statusTransactionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'statusTransaction',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> subTotalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> subTotalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> subTotalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> subTotalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subTotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> totalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> totalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> totalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> totalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'total',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> totalChargeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalCharge',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> totalChargeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalCharge',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> totalChargeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalCharge',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> totalChargeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalCharge',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> totalDiscountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalDiscount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> totalDiscountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalDiscount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> totalDiscountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalDiscount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> totalDiscountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalDiscount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> totalItemEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalItem',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> totalItemGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalItem',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> totalItemLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalItem',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> totalItemBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalItem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> totalPpnEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalPpn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> totalPpnGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalPpn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> totalPpnLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalPpn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> totalPpnBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalPpn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension ModelTransactionSellIsarQueryObject on QueryBuilder<
    ModelTransactionSellIsar, ModelTransactionSellIsar, QFilterCondition> {
  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
      QAfterFilterCondition> dataSplitElement(FilterQuery<ModelSplitIsar> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'dataSplit');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar,
          QAfterFilterCondition>
      itemsOrderedElement(FilterQuery<ModelItemOrderedIsar> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'itemsOrdered');
    });
  }
}

extension ModelTransactionSellIsarQueryLinks on QueryBuilder<
    ModelTransactionSellIsar, ModelTransactionSellIsar, QFilterCondition> {}

extension ModelTransactionSellIsarQuerySortBy on QueryBuilder<
    ModelTransactionSellIsar, ModelTransactionSellIsar, QSortBy> {
  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByBankName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByBankNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByBillPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billPaid', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByBillPaidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billPaid', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByCharge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'charge', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByChargeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'charge', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByIdOperator() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idOperator', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByIdOperatorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idOperator', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByIdPartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPartner', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByIdPartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPartner', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByInvoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByInvoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByNameOperator() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameOperator', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByNameOperatorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameOperator', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByNamePartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namePartner', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByNamePartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namePartner', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByPaymentMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByPpn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppn', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByPpnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppn', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByStatusTransaction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusTransaction', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByStatusTransactionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusTransaction', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortBySubTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subTotal', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortBySubTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subTotal', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByTotalCharge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCharge', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByTotalChargeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCharge', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByTotalDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDiscount', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByTotalDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDiscount', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByTotalItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalItem', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByTotalItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalItem', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByTotalPpn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPpn', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      sortByTotalPpnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPpn', Sort.desc);
    });
  }
}

extension ModelTransactionSellIsarQuerySortThenBy on QueryBuilder<
    ModelTransactionSellIsar, ModelTransactionSellIsar, QSortThenBy> {
  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByBankName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByBankNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByBillPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billPaid', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByBillPaidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billPaid', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByCharge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'charge', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByChargeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'charge', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByIdOperator() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idOperator', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByIdOperatorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idOperator', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByIdPartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPartner', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByIdPartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPartner', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByInvoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByInvoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByNameOperator() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameOperator', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByNameOperatorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameOperator', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByNamePartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namePartner', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByNamePartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namePartner', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByPaymentMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByPpn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppn', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByPpnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppn', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByStatusTransaction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusTransaction', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByStatusTransactionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusTransaction', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenBySubTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subTotal', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenBySubTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subTotal', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByTotalCharge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCharge', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByTotalChargeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCharge', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByTotalDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDiscount', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByTotalDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDiscount', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByTotalItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalItem', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByTotalItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalItem', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByTotalPpn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPpn', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QAfterSortBy>
      thenByTotalPpnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPpn', Sort.desc);
    });
  }
}

extension ModelTransactionSellIsarQueryWhereDistinct on QueryBuilder<
    ModelTransactionSellIsar, ModelTransactionSellIsar, QDistinct> {
  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QDistinct>
      distinctByBankName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bankName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QDistinct>
      distinctByBillPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'billPaid');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QDistinct>
      distinctByCharge() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'charge');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QDistinct>
      distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QDistinct>
      distinctByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discount');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QDistinct>
      distinctByIdBranch({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idBranch', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QDistinct>
      distinctByIdOperator({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idOperator', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QDistinct>
      distinctByIdPartner({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idPartner', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QDistinct>
      distinctByInvoice({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invoice', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QDistinct>
      distinctByNameOperator({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameOperator', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QDistinct>
      distinctByNamePartner({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'namePartner', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QDistinct>
      distinctByNote({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QDistinct>
      distinctByPaymentMethod({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paymentMethod',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QDistinct>
      distinctByPpn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ppn');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QDistinct>
      distinctByStatusTransaction({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statusTransaction',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QDistinct>
      distinctBySubTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subTotal');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QDistinct>
      distinctByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'total');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QDistinct>
      distinctByTotalCharge() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalCharge');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QDistinct>
      distinctByTotalDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalDiscount');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QDistinct>
      distinctByTotalItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalItem');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, ModelTransactionSellIsar, QDistinct>
      distinctByTotalPpn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalPpn');
    });
  }
}

extension ModelTransactionSellIsarQueryProperty on QueryBuilder<
    ModelTransactionSellIsar, ModelTransactionSellIsar, QQueryProperty> {
  QueryBuilder<ModelTransactionSellIsar, int, QQueryOperations>
      isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, String?, QQueryOperations>
      bankNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bankName');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, double, QQueryOperations>
      billPaidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'billPaid');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, int, QQueryOperations>
      chargeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'charge');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, List<ModelSplitIsar>, QQueryOperations>
      dataSplitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dataSplit');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, DateTime, QQueryOperations>
      dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, int, QQueryOperations>
      discountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discount');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, String, QQueryOperations>
      idBranchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idBranch');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, String?, QQueryOperations>
      idOperatorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idOperator');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, String?, QQueryOperations>
      idPartnerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idPartner');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, String, QQueryOperations>
      invoiceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invoice');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, List<ModelItemOrderedIsar>,
      QQueryOperations> itemsOrderedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemsOrdered');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, String?, QQueryOperations>
      nameOperatorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameOperator');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, String?, QQueryOperations>
      namePartnerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'namePartner');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, String, QQueryOperations>
      noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, String, QQueryOperations>
      paymentMethodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paymentMethod');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, int, QQueryOperations> ppnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ppn');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, String, QQueryOperations>
      statusTransactionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statusTransaction');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, double, QQueryOperations>
      subTotalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subTotal');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, double, QQueryOperations>
      totalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'total');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, double, QQueryOperations>
      totalChargeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalCharge');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, double, QQueryOperations>
      totalDiscountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalDiscount');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, int, QQueryOperations>
      totalItemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalItem');
    });
  }

  QueryBuilder<ModelTransactionSellIsar, double, QQueryOperations>
      totalPpnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalPpn');
    });
  }
}
