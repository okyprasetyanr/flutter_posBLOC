// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_counter_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModelCounterIsarCollection on Isar {
  IsarCollection<ModelCounterIsar> get modelCounterIsars => this.collection();
}

const ModelCounterIsarSchema = CollectionSchema(
  name: r'ModelCounterIsar',
  id: 6029640465836626808,
  properties: {
    r'counterBuy': PropertySchema(
      id: 0,
      name: r'counterBuy',
      type: IsarType.long,
    ),
    r'counterExpense': PropertySchema(
      id: 1,
      name: r'counterExpense',
      type: IsarType.long,
    ),
    r'counterIncome': PropertySchema(
      id: 2,
      name: r'counterIncome',
      type: IsarType.long,
    ),
    r'counterSell': PropertySchema(
      id: 3,
      name: r'counterSell',
      type: IsarType.long,
    ),
    r'counterSellSaved': PropertySchema(
      id: 4,
      name: r'counterSellSaved',
      type: IsarType.long,
    ),
    r'idBranch': PropertySchema(
      id: 5,
      name: r'idBranch',
      type: IsarType.string,
    )
  },
  estimateSize: _modelCounterIsarEstimateSize,
  serialize: _modelCounterIsarSerialize,
  deserialize: _modelCounterIsarDeserialize,
  deserializeProp: _modelCounterIsarDeserializeProp,
  idName: r'isarId',
  indexes: {
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
  getId: _modelCounterIsarGetId,
  getLinks: _modelCounterIsarGetLinks,
  attach: _modelCounterIsarAttach,
  version: '3.1.0+1',
);

int _modelCounterIsarEstimateSize(
  ModelCounterIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.idBranch.length * 3;
  return bytesCount;
}

void _modelCounterIsarSerialize(
  ModelCounterIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.counterBuy);
  writer.writeLong(offsets[1], object.counterExpense);
  writer.writeLong(offsets[2], object.counterIncome);
  writer.writeLong(offsets[3], object.counterSell);
  writer.writeLong(offsets[4], object.counterSellSaved);
  writer.writeString(offsets[5], object.idBranch);
}

ModelCounterIsar _modelCounterIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelCounterIsar();
  object.counterBuy = reader.readLong(offsets[0]);
  object.counterExpense = reader.readLong(offsets[1]);
  object.counterIncome = reader.readLong(offsets[2]);
  object.counterSell = reader.readLong(offsets[3]);
  object.counterSellSaved = reader.readLong(offsets[4]);
  object.idBranch = reader.readString(offsets[5]);
  object.isarId = id;
  return object;
}

P _modelCounterIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _modelCounterIsarGetId(ModelCounterIsar object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _modelCounterIsarGetLinks(ModelCounterIsar object) {
  return [];
}

void _modelCounterIsarAttach(
    IsarCollection<dynamic> col, Id id, ModelCounterIsar object) {
  object.isarId = id;
}

extension ModelCounterIsarQueryWhereSort
    on QueryBuilder<ModelCounterIsar, ModelCounterIsar, QWhere> {
  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModelCounterIsarQueryWhere
    on QueryBuilder<ModelCounterIsar, ModelCounterIsar, QWhereClause> {
  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterWhereClause>
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

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterWhereClause>
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

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterWhereClause>
      idBranchEqualTo(String idBranch) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idBranch',
        value: [idBranch],
      ));
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterWhereClause>
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

extension ModelCounterIsarQueryFilter
    on QueryBuilder<ModelCounterIsar, ModelCounterIsar, QFilterCondition> {
  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
      counterBuyEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'counterBuy',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
      counterBuyGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'counterBuy',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
      counterBuyLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'counterBuy',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
      counterBuyBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'counterBuy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
      counterExpenseEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'counterExpense',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
      counterExpenseGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'counterExpense',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
      counterExpenseLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'counterExpense',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
      counterExpenseBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'counterExpense',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
      counterIncomeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'counterIncome',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
      counterIncomeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'counterIncome',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
      counterIncomeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'counterIncome',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
      counterIncomeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'counterIncome',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
      counterSellEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'counterSell',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
      counterSellGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'counterSell',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
      counterSellLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'counterSell',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
      counterSellBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'counterSell',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
      counterSellSavedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'counterSellSaved',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
      counterSellSavedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'counterSellSaved',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
      counterSellSavedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'counterSellSaved',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
      counterSellSavedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'counterSellSaved',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
      idBranchContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idBranch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
      idBranchMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idBranch',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
      idBranchIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
      idBranchIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterFilterCondition>
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
}

extension ModelCounterIsarQueryObject
    on QueryBuilder<ModelCounterIsar, ModelCounterIsar, QFilterCondition> {}

extension ModelCounterIsarQueryLinks
    on QueryBuilder<ModelCounterIsar, ModelCounterIsar, QFilterCondition> {}

extension ModelCounterIsarQuerySortBy
    on QueryBuilder<ModelCounterIsar, ModelCounterIsar, QSortBy> {
  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterSortBy>
      sortByCounterBuy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'counterBuy', Sort.asc);
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterSortBy>
      sortByCounterBuyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'counterBuy', Sort.desc);
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterSortBy>
      sortByCounterExpense() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'counterExpense', Sort.asc);
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterSortBy>
      sortByCounterExpenseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'counterExpense', Sort.desc);
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterSortBy>
      sortByCounterIncome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'counterIncome', Sort.asc);
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterSortBy>
      sortByCounterIncomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'counterIncome', Sort.desc);
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterSortBy>
      sortByCounterSell() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'counterSell', Sort.asc);
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterSortBy>
      sortByCounterSellDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'counterSell', Sort.desc);
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterSortBy>
      sortByCounterSellSaved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'counterSellSaved', Sort.asc);
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterSortBy>
      sortByCounterSellSavedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'counterSellSaved', Sort.desc);
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterSortBy>
      sortByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterSortBy>
      sortByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }
}

extension ModelCounterIsarQuerySortThenBy
    on QueryBuilder<ModelCounterIsar, ModelCounterIsar, QSortThenBy> {
  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterSortBy>
      thenByCounterBuy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'counterBuy', Sort.asc);
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterSortBy>
      thenByCounterBuyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'counterBuy', Sort.desc);
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterSortBy>
      thenByCounterExpense() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'counterExpense', Sort.asc);
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterSortBy>
      thenByCounterExpenseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'counterExpense', Sort.desc);
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterSortBy>
      thenByCounterIncome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'counterIncome', Sort.asc);
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterSortBy>
      thenByCounterIncomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'counterIncome', Sort.desc);
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterSortBy>
      thenByCounterSell() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'counterSell', Sort.asc);
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterSortBy>
      thenByCounterSellDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'counterSell', Sort.desc);
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterSortBy>
      thenByCounterSellSaved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'counterSellSaved', Sort.asc);
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterSortBy>
      thenByCounterSellSavedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'counterSellSaved', Sort.desc);
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterSortBy>
      thenByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterSortBy>
      thenByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }
}

extension ModelCounterIsarQueryWhereDistinct
    on QueryBuilder<ModelCounterIsar, ModelCounterIsar, QDistinct> {
  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QDistinct>
      distinctByCounterBuy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'counterBuy');
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QDistinct>
      distinctByCounterExpense() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'counterExpense');
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QDistinct>
      distinctByCounterIncome() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'counterIncome');
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QDistinct>
      distinctByCounterSell() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'counterSell');
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QDistinct>
      distinctByCounterSellSaved() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'counterSellSaved');
    });
  }

  QueryBuilder<ModelCounterIsar, ModelCounterIsar, QDistinct>
      distinctByIdBranch({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idBranch', caseSensitive: caseSensitive);
    });
  }
}

extension ModelCounterIsarQueryProperty
    on QueryBuilder<ModelCounterIsar, ModelCounterIsar, QQueryProperty> {
  QueryBuilder<ModelCounterIsar, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ModelCounterIsar, int, QQueryOperations> counterBuyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'counterBuy');
    });
  }

  QueryBuilder<ModelCounterIsar, int, QQueryOperations>
      counterExpenseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'counterExpense');
    });
  }

  QueryBuilder<ModelCounterIsar, int, QQueryOperations>
      counterIncomeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'counterIncome');
    });
  }

  QueryBuilder<ModelCounterIsar, int, QQueryOperations> counterSellProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'counterSell');
    });
  }

  QueryBuilder<ModelCounterIsar, int, QQueryOperations>
      counterSellSavedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'counterSellSaved');
    });
  }

  QueryBuilder<ModelCounterIsar, String, QQueryOperations> idBranchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idBranch');
    });
  }
}
