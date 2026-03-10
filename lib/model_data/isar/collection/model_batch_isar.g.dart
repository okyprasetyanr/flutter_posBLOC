// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_batch_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModelBatchIsarCollection on Isar {
  IsarCollection<ModelBatchIsar> get modelBatchIsars => this.collection();
}

const ModelBatchIsarSchema = CollectionSchema(
  name: r'ModelBatchIsar',
  id: 1675452926355056615,
  properties: {
    r'dateBuy': PropertySchema(
      id: 0,
      name: r'dateBuy',
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
    r'itemsBatch': PropertySchema(
      id: 3,
      name: r'itemsBatch',
      type: IsarType.objectList,
      target: r'ModelItemBatchIsar',
    )
  },
  estimateSize: _modelBatchIsarEstimateSize,
  serialize: _modelBatchIsarSerialize,
  deserialize: _modelBatchIsarDeserialize,
  deserializeProp: _modelBatchIsarDeserializeProp,
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
    )
  },
  links: {},
  embeddedSchemas: {r'ModelItemBatchIsar': ModelItemBatchIsarSchema},
  getId: _modelBatchIsarGetId,
  getLinks: _modelBatchIsarGetLinks,
  attach: _modelBatchIsarAttach,
  version: '3.1.0+1',
);

int _modelBatchIsarEstimateSize(
  ModelBatchIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.idBranch.length * 3;
  bytesCount += 3 + object.invoice.length * 3;
  bytesCount += 3 + object.itemsBatch.length * 3;
  {
    final offsets = allOffsets[ModelItemBatchIsar]!;
    for (var i = 0; i < object.itemsBatch.length; i++) {
      final value = object.itemsBatch[i];
      bytesCount +=
          ModelItemBatchIsarSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _modelBatchIsarSerialize(
  ModelBatchIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.dateBuy);
  writer.writeString(offsets[1], object.idBranch);
  writer.writeString(offsets[2], object.invoice);
  writer.writeObjectList<ModelItemBatchIsar>(
    offsets[3],
    allOffsets,
    ModelItemBatchIsarSchema.serialize,
    object.itemsBatch,
  );
}

ModelBatchIsar _modelBatchIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelBatchIsar();
  object.dateBuy = reader.readDateTime(offsets[0]);
  object.idBranch = reader.readString(offsets[1]);
  object.invoice = reader.readString(offsets[2]);
  object.isarId = id;
  object.itemsBatch = reader.readObjectList<ModelItemBatchIsar>(
        offsets[3],
        ModelItemBatchIsarSchema.deserialize,
        allOffsets,
        ModelItemBatchIsar(),
      ) ??
      [];
  return object;
}

P _modelBatchIsarDeserializeProp<P>(
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
      return (reader.readObjectList<ModelItemBatchIsar>(
            offset,
            ModelItemBatchIsarSchema.deserialize,
            allOffsets,
            ModelItemBatchIsar(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _modelBatchIsarGetId(ModelBatchIsar object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _modelBatchIsarGetLinks(ModelBatchIsar object) {
  return [];
}

void _modelBatchIsarAttach(
    IsarCollection<dynamic> col, Id id, ModelBatchIsar object) {
  object.isarId = id;
}

extension ModelBatchIsarByIndex on IsarCollection<ModelBatchIsar> {
  Future<ModelBatchIsar?> getByInvoice(String invoice) {
    return getByIndex(r'invoice', [invoice]);
  }

  ModelBatchIsar? getByInvoiceSync(String invoice) {
    return getByIndexSync(r'invoice', [invoice]);
  }

  Future<bool> deleteByInvoice(String invoice) {
    return deleteByIndex(r'invoice', [invoice]);
  }

  bool deleteByInvoiceSync(String invoice) {
    return deleteByIndexSync(r'invoice', [invoice]);
  }

  Future<List<ModelBatchIsar?>> getAllByInvoice(List<String> invoiceValues) {
    final values = invoiceValues.map((e) => [e]).toList();
    return getAllByIndex(r'invoice', values);
  }

  List<ModelBatchIsar?> getAllByInvoiceSync(List<String> invoiceValues) {
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

  Future<Id> putByInvoice(ModelBatchIsar object) {
    return putByIndex(r'invoice', object);
  }

  Id putByInvoiceSync(ModelBatchIsar object, {bool saveLinks = true}) {
    return putByIndexSync(r'invoice', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByInvoice(List<ModelBatchIsar> objects) {
    return putAllByIndex(r'invoice', objects);
  }

  List<Id> putAllByInvoiceSync(List<ModelBatchIsar> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'invoice', objects, saveLinks: saveLinks);
  }
}

extension ModelBatchIsarQueryWhereSort
    on QueryBuilder<ModelBatchIsar, ModelBatchIsar, QWhere> {
  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModelBatchIsarQueryWhere
    on QueryBuilder<ModelBatchIsar, ModelBatchIsar, QWhereClause> {
  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterWhereClause>
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

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterWhereClause>
      invoiceEqualTo(String invoice) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'invoice',
        value: [invoice],
      ));
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterWhereClause>
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
}

extension ModelBatchIsarQueryFilter
    on QueryBuilder<ModelBatchIsar, ModelBatchIsar, QFilterCondition> {
  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
      dateBuyEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateBuy',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
      dateBuyGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateBuy',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
      dateBuyLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateBuy',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
      dateBuyBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateBuy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
      idBranchContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idBranch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
      idBranchMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idBranch',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
      idBranchIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
      idBranchIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
      invoiceEqualTo(
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

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
      invoiceGreaterThan(
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

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
      invoiceLessThan(
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

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
      invoiceBetween(
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

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
      invoiceStartsWith(
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

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
      invoiceEndsWith(
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

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
      invoiceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'invoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
      invoiceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'invoice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
      invoiceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoice',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
      invoiceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'invoice',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
      itemsBatchLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemsBatch',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
      itemsBatchIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemsBatch',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
      itemsBatchIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemsBatch',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
      itemsBatchLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemsBatch',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
      itemsBatchLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemsBatch',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
      itemsBatchLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemsBatch',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension ModelBatchIsarQueryObject
    on QueryBuilder<ModelBatchIsar, ModelBatchIsar, QFilterCondition> {
  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterFilterCondition>
      itemsBatchElement(FilterQuery<ModelItemBatchIsar> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'itemsBatch');
    });
  }
}

extension ModelBatchIsarQueryLinks
    on QueryBuilder<ModelBatchIsar, ModelBatchIsar, QFilterCondition> {}

extension ModelBatchIsarQuerySortBy
    on QueryBuilder<ModelBatchIsar, ModelBatchIsar, QSortBy> {
  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterSortBy> sortByDateBuy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateBuy', Sort.asc);
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterSortBy>
      sortByDateBuyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateBuy', Sort.desc);
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterSortBy> sortByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterSortBy>
      sortByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterSortBy> sortByInvoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.asc);
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterSortBy>
      sortByInvoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.desc);
    });
  }
}

extension ModelBatchIsarQuerySortThenBy
    on QueryBuilder<ModelBatchIsar, ModelBatchIsar, QSortThenBy> {
  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterSortBy> thenByDateBuy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateBuy', Sort.asc);
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterSortBy>
      thenByDateBuyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateBuy', Sort.desc);
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterSortBy> thenByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterSortBy>
      thenByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterSortBy> thenByInvoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.asc);
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterSortBy>
      thenByInvoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.desc);
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }
}

extension ModelBatchIsarQueryWhereDistinct
    on QueryBuilder<ModelBatchIsar, ModelBatchIsar, QDistinct> {
  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QDistinct> distinctByDateBuy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateBuy');
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QDistinct> distinctByIdBranch(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idBranch', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelBatchIsar, ModelBatchIsar, QDistinct> distinctByInvoice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invoice', caseSensitive: caseSensitive);
    });
  }
}

extension ModelBatchIsarQueryProperty
    on QueryBuilder<ModelBatchIsar, ModelBatchIsar, QQueryProperty> {
  QueryBuilder<ModelBatchIsar, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ModelBatchIsar, DateTime, QQueryOperations> dateBuyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateBuy');
    });
  }

  QueryBuilder<ModelBatchIsar, String, QQueryOperations> idBranchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idBranch');
    });
  }

  QueryBuilder<ModelBatchIsar, String, QQueryOperations> invoiceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invoice');
    });
  }

  QueryBuilder<ModelBatchIsar, List<ModelItemBatchIsar>, QQueryOperations>
      itemsBatchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemsBatch');
    });
  }
}
