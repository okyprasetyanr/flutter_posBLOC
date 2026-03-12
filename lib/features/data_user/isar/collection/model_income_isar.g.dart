// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_income_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModelIncomeIsarCollection on Isar {
  IsarCollection<ModelIncomeIsar> get modelIncomeIsars => this.collection();
}

const ModelIncomeIsarSchema = CollectionSchema(
  name: r'ModelIncomeIsar',
  id: -2012724509743442600,
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
  estimateSize: _modelIncomeIsarEstimateSize,
  serialize: _modelIncomeIsarSerialize,
  deserialize: _modelIncomeIsarDeserialize,
  deserializeProp: _modelIncomeIsarDeserializeProp,
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
  getId: _modelIncomeIsarGetId,
  getLinks: _modelIncomeIsarGetLinks,
  attach: _modelIncomeIsarAttach,
  version: '3.1.0+1',
);

int _modelIncomeIsarEstimateSize(
  ModelIncomeIsar object,
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

void _modelIncomeIsarSerialize(
  ModelIncomeIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.idBranch);
  writer.writeString(offsets[1], object.idFinancial);
  writer.writeString(offsets[2], object.nameFinancial);
  writer.writeString(offsets[3], object.type);
}

ModelIncomeIsar _modelIncomeIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelIncomeIsar();
  object.idBranch = reader.readString(offsets[0]);
  object.idFinancial = reader.readString(offsets[1]);
  object.isarId = id;
  object.nameFinancial = reader.readString(offsets[2]);
  object.type = reader.readString(offsets[3]);
  return object;
}

P _modelIncomeIsarDeserializeProp<P>(
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

Id _modelIncomeIsarGetId(ModelIncomeIsar object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _modelIncomeIsarGetLinks(ModelIncomeIsar object) {
  return [];
}

void _modelIncomeIsarAttach(
    IsarCollection<dynamic> col, Id id, ModelIncomeIsar object) {
  object.isarId = id;
}

extension ModelIncomeIsarByIndex on IsarCollection<ModelIncomeIsar> {
  Future<ModelIncomeIsar?> getByIdFinancial(String idFinancial) {
    return getByIndex(r'idFinancial', [idFinancial]);
  }

  ModelIncomeIsar? getByIdFinancialSync(String idFinancial) {
    return getByIndexSync(r'idFinancial', [idFinancial]);
  }

  Future<bool> deleteByIdFinancial(String idFinancial) {
    return deleteByIndex(r'idFinancial', [idFinancial]);
  }

  bool deleteByIdFinancialSync(String idFinancial) {
    return deleteByIndexSync(r'idFinancial', [idFinancial]);
  }

  Future<List<ModelIncomeIsar?>> getAllByIdFinancial(
      List<String> idFinancialValues) {
    final values = idFinancialValues.map((e) => [e]).toList();
    return getAllByIndex(r'idFinancial', values);
  }

  List<ModelIncomeIsar?> getAllByIdFinancialSync(
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

  Future<Id> putByIdFinancial(ModelIncomeIsar object) {
    return putByIndex(r'idFinancial', object);
  }

  Id putByIdFinancialSync(ModelIncomeIsar object, {bool saveLinks = true}) {
    return putByIndexSync(r'idFinancial', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIdFinancial(List<ModelIncomeIsar> objects) {
    return putAllByIndex(r'idFinancial', objects);
  }

  List<Id> putAllByIdFinancialSync(List<ModelIncomeIsar> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'idFinancial', objects, saveLinks: saveLinks);
  }
}

extension ModelIncomeIsarQueryWhereSort
    on QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QWhere> {
  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModelIncomeIsarQueryWhere
    on QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QWhereClause> {
  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterWhereClause>
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

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterWhereClause>
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

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterWhereClause>
      idFinancialEqualTo(String idFinancial) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idFinancial',
        value: [idFinancial],
      ));
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterWhereClause>
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

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterWhereClause>
      idBranchEqualTo(String idBranch) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idBranch',
        value: [idBranch],
      ));
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterWhereClause>
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

extension ModelIncomeIsarQueryFilter
    on QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QFilterCondition> {
  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
      idBranchContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idBranch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
      idBranchMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idBranch',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
      idBranchIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
      idBranchIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
      idFinancialContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idFinancial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
      idFinancialMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idFinancial',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
      idFinancialIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idFinancial',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
      idFinancialIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idFinancial',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
      nameFinancialContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nameFinancial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
      nameFinancialMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nameFinancial',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
      nameFinancialIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameFinancial',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
      nameFinancialIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameFinancial',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension ModelIncomeIsarQueryObject
    on QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QFilterCondition> {}

extension ModelIncomeIsarQueryLinks
    on QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QFilterCondition> {}

extension ModelIncomeIsarQuerySortBy
    on QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QSortBy> {
  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterSortBy>
      sortByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterSortBy>
      sortByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterSortBy>
      sortByIdFinancial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idFinancial', Sort.asc);
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterSortBy>
      sortByIdFinancialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idFinancial', Sort.desc);
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterSortBy>
      sortByNameFinancial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameFinancial', Sort.asc);
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterSortBy>
      sortByNameFinancialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameFinancial', Sort.desc);
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension ModelIncomeIsarQuerySortThenBy
    on QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QSortThenBy> {
  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterSortBy>
      thenByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterSortBy>
      thenByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterSortBy>
      thenByIdFinancial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idFinancial', Sort.asc);
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterSortBy>
      thenByIdFinancialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idFinancial', Sort.desc);
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterSortBy>
      thenByNameFinancial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameFinancial', Sort.asc);
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterSortBy>
      thenByNameFinancialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameFinancial', Sort.desc);
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension ModelIncomeIsarQueryWhereDistinct
    on QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QDistinct> {
  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QDistinct> distinctByIdBranch(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idBranch', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QDistinct>
      distinctByIdFinancial({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idFinancial', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QDistinct>
      distinctByNameFinancial({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameFinancial',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension ModelIncomeIsarQueryProperty
    on QueryBuilder<ModelIncomeIsar, ModelIncomeIsar, QQueryProperty> {
  QueryBuilder<ModelIncomeIsar, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ModelIncomeIsar, String, QQueryOperations> idBranchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idBranch');
    });
  }

  QueryBuilder<ModelIncomeIsar, String, QQueryOperations>
      idFinancialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idFinancial');
    });
  }

  QueryBuilder<ModelIncomeIsar, String, QQueryOperations>
      nameFinancialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameFinancial');
    });
  }

  QueryBuilder<ModelIncomeIsar, String, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
