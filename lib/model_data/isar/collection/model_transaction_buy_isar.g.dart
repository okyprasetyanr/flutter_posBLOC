// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_transaction_buy_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModelTransactionBuyIsarCollection on Isar {
  IsarCollection<ModelTransactionBuyIsar> get modelTransactionBuyIsars =>
      this.collection();
}

const ModelTransactionBuyIsarSchema = CollectionSchema(
  name: r'ModelTransactionBuyIsar',
  id: -8684065946037840552,
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
  estimateSize: _modelTransactionBuyIsarEstimateSize,
  serialize: _modelTransactionBuyIsarSerialize,
  deserialize: _modelTransactionBuyIsarDeserialize,
  deserializeProp: _modelTransactionBuyIsarDeserializeProp,
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
  getId: _modelTransactionBuyIsarGetId,
  getLinks: _modelTransactionBuyIsarGetLinks,
  attach: _modelTransactionBuyIsarAttach,
  version: '3.1.0+1',
);

int _modelTransactionBuyIsarEstimateSize(
  ModelTransactionBuyIsar object,
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

void _modelTransactionBuyIsarSerialize(
  ModelTransactionBuyIsar object,
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

ModelTransactionBuyIsar _modelTransactionBuyIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelTransactionBuyIsar();
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

P _modelTransactionBuyIsarDeserializeProp<P>(
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

Id _modelTransactionBuyIsarGetId(ModelTransactionBuyIsar object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _modelTransactionBuyIsarGetLinks(
    ModelTransactionBuyIsar object) {
  return [];
}

void _modelTransactionBuyIsarAttach(
    IsarCollection<dynamic> col, Id id, ModelTransactionBuyIsar object) {
  object.isarId = id;
}

extension ModelTransactionBuyIsarByIndex
    on IsarCollection<ModelTransactionBuyIsar> {
  Future<ModelTransactionBuyIsar?> getByInvoice(String invoice) {
    return getByIndex(r'invoice', [invoice]);
  }

  ModelTransactionBuyIsar? getByInvoiceSync(String invoice) {
    return getByIndexSync(r'invoice', [invoice]);
  }

  Future<bool> deleteByInvoice(String invoice) {
    return deleteByIndex(r'invoice', [invoice]);
  }

  bool deleteByInvoiceSync(String invoice) {
    return deleteByIndexSync(r'invoice', [invoice]);
  }

  Future<List<ModelTransactionBuyIsar?>> getAllByInvoice(
      List<String> invoiceValues) {
    final values = invoiceValues.map((e) => [e]).toList();
    return getAllByIndex(r'invoice', values);
  }

  List<ModelTransactionBuyIsar?> getAllByInvoiceSync(
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

  Future<Id> putByInvoice(ModelTransactionBuyIsar object) {
    return putByIndex(r'invoice', object);
  }

  Id putByInvoiceSync(ModelTransactionBuyIsar object, {bool saveLinks = true}) {
    return putByIndexSync(r'invoice', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByInvoice(List<ModelTransactionBuyIsar> objects) {
    return putAllByIndex(r'invoice', objects);
  }

  List<Id> putAllByInvoiceSync(List<ModelTransactionBuyIsar> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'invoice', objects, saveLinks: saveLinks);
  }
}

extension ModelTransactionBuyIsarQueryWhereSort
    on QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QWhere> {
  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterWhere>
      anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModelTransactionBuyIsarQueryWhere on QueryBuilder<
    ModelTransactionBuyIsar, ModelTransactionBuyIsar, QWhereClause> {
  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterWhereClause> isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterWhereClause> isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterWhereClause> invoiceEqualTo(String invoice) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'invoice',
        value: [invoice],
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterWhereClause> idBranchEqualTo(String idBranch) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idBranch',
        value: [idBranch],
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

extension ModelTransactionBuyIsarQueryFilter on QueryBuilder<
    ModelTransactionBuyIsar, ModelTransactionBuyIsar, QFilterCondition> {
  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> bankNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bankName',
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> bankNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bankName',
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> bankNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bankName',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> bankNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bankName',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> chargeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'charge',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> discountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discount',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> idBranchIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> idBranchIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> idOperatorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idOperator',
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> idOperatorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idOperator',
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> idOperatorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idOperator',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> idOperatorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idOperator',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> idPartnerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idPartner',
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> idPartnerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idPartner',
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> idPartnerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idPartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> idPartnerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idPartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> invoiceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoice',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> invoiceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'invoice',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> nameOperatorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nameOperator',
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> nameOperatorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nameOperator',
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> nameOperatorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameOperator',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> nameOperatorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameOperator',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> namePartnerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'namePartner',
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> namePartnerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'namePartner',
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> namePartnerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namePartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> namePartnerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'namePartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> paymentMethodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> paymentMethodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'paymentMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> ppnEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ppn',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> statusTransactionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusTransaction',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> statusTransactionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'statusTransaction',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> totalItemEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalItem',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
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

extension ModelTransactionBuyIsarQueryObject on QueryBuilder<
    ModelTransactionBuyIsar, ModelTransactionBuyIsar, QFilterCondition> {
  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
      QAfterFilterCondition> dataSplitElement(FilterQuery<ModelSplitIsar> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'dataSplit');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar,
          QAfterFilterCondition>
      itemsOrderedElement(FilterQuery<ModelItemOrderedIsar> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'itemsOrdered');
    });
  }
}

extension ModelTransactionBuyIsarQueryLinks on QueryBuilder<
    ModelTransactionBuyIsar, ModelTransactionBuyIsar, QFilterCondition> {}

extension ModelTransactionBuyIsarQuerySortBy
    on QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QSortBy> {
  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByBankName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByBankNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByBillPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billPaid', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByBillPaidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billPaid', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByCharge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'charge', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByChargeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'charge', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByIdOperator() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idOperator', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByIdOperatorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idOperator', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByIdPartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPartner', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByIdPartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPartner', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByInvoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByInvoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByNameOperator() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameOperator', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByNameOperatorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameOperator', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByNamePartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namePartner', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByNamePartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namePartner', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByPaymentMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByPpn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppn', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByPpnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppn', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByStatusTransaction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusTransaction', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByStatusTransactionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusTransaction', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortBySubTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subTotal', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortBySubTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subTotal', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByTotalCharge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCharge', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByTotalChargeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCharge', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByTotalDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDiscount', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByTotalDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDiscount', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByTotalItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalItem', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByTotalItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalItem', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByTotalPpn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPpn', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      sortByTotalPpnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPpn', Sort.desc);
    });
  }
}

extension ModelTransactionBuyIsarQuerySortThenBy on QueryBuilder<
    ModelTransactionBuyIsar, ModelTransactionBuyIsar, QSortThenBy> {
  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByBankName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByBankNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByBillPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billPaid', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByBillPaidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billPaid', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByCharge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'charge', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByChargeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'charge', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByIdOperator() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idOperator', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByIdOperatorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idOperator', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByIdPartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPartner', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByIdPartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPartner', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByInvoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByInvoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByNameOperator() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameOperator', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByNameOperatorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameOperator', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByNamePartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namePartner', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByNamePartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namePartner', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByPaymentMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByPpn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppn', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByPpnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppn', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByStatusTransaction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusTransaction', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByStatusTransactionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusTransaction', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenBySubTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subTotal', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenBySubTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subTotal', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByTotalCharge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCharge', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByTotalChargeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCharge', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByTotalDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDiscount', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByTotalDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDiscount', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByTotalItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalItem', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByTotalItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalItem', Sort.desc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByTotalPpn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPpn', Sort.asc);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QAfterSortBy>
      thenByTotalPpnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPpn', Sort.desc);
    });
  }
}

extension ModelTransactionBuyIsarQueryWhereDistinct on QueryBuilder<
    ModelTransactionBuyIsar, ModelTransactionBuyIsar, QDistinct> {
  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QDistinct>
      distinctByBankName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bankName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QDistinct>
      distinctByBillPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'billPaid');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QDistinct>
      distinctByCharge() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'charge');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QDistinct>
      distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QDistinct>
      distinctByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discount');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QDistinct>
      distinctByIdBranch({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idBranch', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QDistinct>
      distinctByIdOperator({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idOperator', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QDistinct>
      distinctByIdPartner({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idPartner', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QDistinct>
      distinctByInvoice({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invoice', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QDistinct>
      distinctByNameOperator({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameOperator', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QDistinct>
      distinctByNamePartner({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'namePartner', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QDistinct>
      distinctByNote({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QDistinct>
      distinctByPaymentMethod({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paymentMethod',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QDistinct>
      distinctByPpn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ppn');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QDistinct>
      distinctByStatusTransaction({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statusTransaction',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QDistinct>
      distinctBySubTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subTotal');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QDistinct>
      distinctByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'total');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QDistinct>
      distinctByTotalCharge() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalCharge');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QDistinct>
      distinctByTotalDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalDiscount');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QDistinct>
      distinctByTotalItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalItem');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, ModelTransactionBuyIsar, QDistinct>
      distinctByTotalPpn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalPpn');
    });
  }
}

extension ModelTransactionBuyIsarQueryProperty on QueryBuilder<
    ModelTransactionBuyIsar, ModelTransactionBuyIsar, QQueryProperty> {
  QueryBuilder<ModelTransactionBuyIsar, int, QQueryOperations>
      isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, String?, QQueryOperations>
      bankNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bankName');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, double, QQueryOperations>
      billPaidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'billPaid');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, int, QQueryOperations>
      chargeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'charge');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, List<ModelSplitIsar>, QQueryOperations>
      dataSplitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dataSplit');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, DateTime, QQueryOperations>
      dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, int, QQueryOperations>
      discountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discount');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, String, QQueryOperations>
      idBranchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idBranch');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, String?, QQueryOperations>
      idOperatorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idOperator');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, String?, QQueryOperations>
      idPartnerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idPartner');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, String, QQueryOperations>
      invoiceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invoice');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, List<ModelItemOrderedIsar>,
      QQueryOperations> itemsOrderedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemsOrdered');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, String?, QQueryOperations>
      nameOperatorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameOperator');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, String?, QQueryOperations>
      namePartnerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'namePartner');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, String, QQueryOperations>
      noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, String, QQueryOperations>
      paymentMethodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paymentMethod');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, int, QQueryOperations> ppnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ppn');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, String, QQueryOperations>
      statusTransactionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statusTransaction');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, double, QQueryOperations>
      subTotalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subTotal');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, double, QQueryOperations>
      totalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'total');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, double, QQueryOperations>
      totalChargeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalCharge');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, double, QQueryOperations>
      totalDiscountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalDiscount');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, int, QQueryOperations>
      totalItemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalItem');
    });
  }

  QueryBuilder<ModelTransactionBuyIsar, double, QQueryOperations>
      totalPpnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalPpn');
    });
  }
}
