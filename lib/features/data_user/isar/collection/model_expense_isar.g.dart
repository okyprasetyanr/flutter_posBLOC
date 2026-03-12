// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_expense_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModelExpenseIsarCollection on Isar {
  IsarCollection<ModelExpenseIsar> get modelExpenseIsars => this.collection();
}

const ModelExpenseIsarSchema = CollectionSchema(
  name: r'ModelExpenseIsar',
  id: 659519096382396271,
  properties: {
    r'idBranch': PropertySchema(
      id: 0,
      name: r'idBranch',
      type: IsarType.string,
    ),
    r'idFinancial': PropertySchema(
      id: 1,
      name: r'idFinancial',
      type: IsarType.string,
    ),
    r'nameFinancial': PropertySchema(
      id: 2,
      name: r'nameFinancial',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 3,
      name: r'type',
      type: IsarType.string,
    )
  },
  estimateSize: _modelExpenseIsarEstimateSize,
  serialize: _modelExpenseIsarSerialize,
  deserialize: _modelExpenseIsarDeserialize,
  deserializeProp: _modelExpenseIsarDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'idFinancial': IndexSchema(
      id: -3746839348244172506,
      name: r'idFinancial',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'idFinancial',
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
  getId: _modelExpenseIsarGetId,
  getLinks: _modelExpenseIsarGetLinks,
  attach: _modelExpenseIsarAttach,
  version: '3.1.0+1',
);

int _modelExpenseIsarEstimateSize(
  ModelExpenseIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.idBranch.length * 3;
  bytesCount += 3 + object.idFinancial.length * 3;
  bytesCount += 3 + object.nameFinancial.length * 3;
  bytesCount += 3 + object.type.length * 3;
  return bytesCount;
}

void _modelExpenseIsarSerialize(
  ModelExpenseIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.idBranch);
  writer.writeString(offsets[1], object.idFinancial);
  writer.writeString(offsets[2], object.nameFinancial);
  writer.writeString(offsets[3], object.type);
}

ModelExpenseIsar _modelExpenseIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelExpenseIsar();
  object.idBranch = reader.readString(offsets[0]);
  object.idFinancial = reader.readString(offsets[1]);
  object.isarId = id;
  object.nameFinancial = reader.readString(offsets[2]);
  object.type = reader.readString(offsets[3]);
  return object;
}

P _modelExpenseIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _modelExpenseIsarGetId(ModelExpenseIsar object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _modelExpenseIsarGetLinks(ModelExpenseIsar object) {
  return [];
}

void _modelExpenseIsarAttach(
    IsarCollection<dynamic> col, Id id, ModelExpenseIsar object) {
  object.isarId = id;
}

extension ModelExpenseIsarByIndex on IsarCollection<ModelExpenseIsar> {
  Future<ModelExpenseIsar?> getByIdFinancial(String idFinancial) {
    return getByIndex(r'idFinancial', [idFinancial]);
  }

  ModelExpenseIsar? getByIdFinancialSync(String idFinancial) {
    return getByIndexSync(r'idFinancial', [idFinancial]);
  }

  Future<bool> deleteByIdFinancial(String idFinancial) {
    return deleteByIndex(r'idFinancial', [idFinancial]);
  }

  bool deleteByIdFinancialSync(String idFinancial) {
    return deleteByIndexSync(r'idFinancial', [idFinancial]);
  }

  Future<List<ModelExpenseIsar?>> getAllByIdFinancial(
      List<String> idFinancialValues) {
    final values = idFinancialValues.map((e) => [e]).toList();
    return getAllByIndex(r'idFinancial', values);
  }

  List<ModelExpenseIsar?> getAllByIdFinancialSync(
      List<String> idFinancialValues) {
    final values = idFinancialValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'idFinancial', values);
  }

  Future<int> deleteAllByIdFinancial(List<String> idFinancialValues) {
    final values = idFinancialValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'idFinancial', values);
  }

  int deleteAllByIdFinancialSync(List<String> idFinancialValues) {
    final values = idFinancialValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'idFinancial', values);
  }

  Future<Id> putByIdFinancial(ModelExpenseIsar object) {
    return putByIndex(r'idFinancial', object);
  }

  Id putByIdFinancialSync(ModelExpenseIsar object, {bool saveLinks = true}) {
    return putByIndexSync(r'idFinancial', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIdFinancial(List<ModelExpenseIsar> objects) {
    return putAllByIndex(r'idFinancial', objects);
  }

  List<Id> putAllByIdFinancialSync(List<ModelExpenseIsar> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'idFinancial', objects, saveLinks: saveLinks);
  }
}

extension ModelExpenseIsarQueryWhereSort
    on QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QWhere> {
  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModelExpenseIsarQueryWhere
    on QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QWhereClause> {
  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterWhereClause>
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

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterWhereClause>
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

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterWhereClause>
      idFinancialEqualTo(String idFinancial) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idFinancial',
        value: [idFinancial],
      ));
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterWhereClause>
      idFinancialNotEqualTo(String idFinancial) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idFinancial',
              lower: [],
              upper: [idFinancial],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idFinancial',
              lower: [idFinancial],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idFinancial',
              lower: [idFinancial],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idFinancial',
              lower: [],
              upper: [idFinancial],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterWhereClause>
      idBranchEqualTo(String idBranch) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idBranch',
        value: [idBranch],
      ));
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterWhereClause>
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

extension ModelExpenseIsarQueryFilter
    on QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QFilterCondition> {
  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      idBranchContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idBranch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      idBranchMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idBranch',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      idBranchIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      idBranchIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      idFinancialEqualTo(
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

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      idFinancialGreaterThan(
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

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      idFinancialLessThan(
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

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      idFinancialBetween(
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

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      idFinancialStartsWith(
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

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      idFinancialEndsWith(
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

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      idFinancialContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idFinancial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      idFinancialMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idFinancial',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      idFinancialIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idFinancial',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      idFinancialIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idFinancial',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      nameFinancialEqualTo(
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

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      nameFinancialGreaterThan(
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

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      nameFinancialLessThan(
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

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      nameFinancialBetween(
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

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      nameFinancialStartsWith(
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

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      nameFinancialEndsWith(
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

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      nameFinancialContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nameFinancial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      nameFinancialMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nameFinancial',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      nameFinancialIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameFinancial',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      nameFinancialIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameFinancial',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension ModelExpenseIsarQueryObject
    on QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QFilterCondition> {}

extension ModelExpenseIsarQueryLinks
    on QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QFilterCondition> {}

extension ModelExpenseIsarQuerySortBy
    on QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QSortBy> {
  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterSortBy>
      sortByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterSortBy>
      sortByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterSortBy>
      sortByIdFinancial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idFinancial', Sort.asc);
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterSortBy>
      sortByIdFinancialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idFinancial', Sort.desc);
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterSortBy>
      sortByNameFinancial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameFinancial', Sort.asc);
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterSortBy>
      sortByNameFinancialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameFinancial', Sort.desc);
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension ModelExpenseIsarQuerySortThenBy
    on QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QSortThenBy> {
  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterSortBy>
      thenByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterSortBy>
      thenByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterSortBy>
      thenByIdFinancial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idFinancial', Sort.asc);
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterSortBy>
      thenByIdFinancialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idFinancial', Sort.desc);
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterSortBy>
      thenByNameFinancial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameFinancial', Sort.asc);
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterSortBy>
      thenByNameFinancialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameFinancial', Sort.desc);
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension ModelExpenseIsarQueryWhereDistinct
    on QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QDistinct> {
  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QDistinct>
      distinctByIdBranch({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idBranch', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QDistinct>
      distinctByIdFinancial({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idFinancial', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QDistinct>
      distinctByNameFinancial({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameFinancial',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension ModelExpenseIsarQueryProperty
    on QueryBuilder<ModelExpenseIsar, ModelExpenseIsar, QQueryProperty> {
  QueryBuilder<ModelExpenseIsar, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ModelExpenseIsar, String, QQueryOperations> idBranchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idBranch');
    });
  }

  QueryBuilder<ModelExpenseIsar, String, QQueryOperations>
      idFinancialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idFinancial');
    });
  }

  QueryBuilder<ModelExpenseIsar, String, QQueryOperations>
      nameFinancialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameFinancial');
    });
  }

  QueryBuilder<ModelExpenseIsar, String, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
