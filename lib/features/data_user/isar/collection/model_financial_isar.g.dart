// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_financial_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModelFinancialIsarCollection on Isar {
  IsarCollection<ModelFinancialIsar> get modelFinancialIsars =>
      this.collection();
}

const ModelFinancialIsarSchema = CollectionSchema(
  name: r'ModelFinancialIsar',
  id: -2248413851824063895,
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
  estimateSize: _modelFinancialIsarEstimateSize,
  serialize: _modelFinancialIsarSerialize,
  deserialize: _modelFinancialIsarDeserialize,
  deserializeProp: _modelFinancialIsarDeserializeProp,
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
  getId: _modelFinancialIsarGetId,
  getLinks: _modelFinancialIsarGetLinks,
  attach: _modelFinancialIsarAttach,
  version: '3.1.0+1',
);

int _modelFinancialIsarEstimateSize(
  ModelFinancialIsar object,
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

void _modelFinancialIsarSerialize(
  ModelFinancialIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.idBranch);
  writer.writeString(offsets[1], object.idFinancial);
  writer.writeString(offsets[2], object.nameFinancial);
  writer.writeString(offsets[3], object.type);
}

ModelFinancialIsar _modelFinancialIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelFinancialIsar();
  object.idBranch = reader.readString(offsets[0]);
  object.idFinancial = reader.readString(offsets[1]);
  object.isarId = id;
  object.nameFinancial = reader.readString(offsets[2]);
  object.type = reader.readString(offsets[3]);
  return object;
}

P _modelFinancialIsarDeserializeProp<P>(
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

Id _modelFinancialIsarGetId(ModelFinancialIsar object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _modelFinancialIsarGetLinks(
    ModelFinancialIsar object) {
  return [];
}

void _modelFinancialIsarAttach(
    IsarCollection<dynamic> col, Id id, ModelFinancialIsar object) {
  object.isarId = id;
}

extension ModelFinancialIsarByIndex on IsarCollection<ModelFinancialIsar> {
  Future<ModelFinancialIsar?> getByIdFinancial(String idFinancial) {
    return getByIndex(r'idFinancial', [idFinancial]);
  }

  ModelFinancialIsar? getByIdFinancialSync(String idFinancial) {
    return getByIndexSync(r'idFinancial', [idFinancial]);
  }

  Future<bool> deleteByIdFinancial(String idFinancial) {
    return deleteByIndex(r'idFinancial', [idFinancial]);
  }

  bool deleteByIdFinancialSync(String idFinancial) {
    return deleteByIndexSync(r'idFinancial', [idFinancial]);
  }

  Future<List<ModelFinancialIsar?>> getAllByIdFinancial(
      List<String> idFinancialValues) {
    final values = idFinancialValues.map((e) => [e]).toList();
    return getAllByIndex(r'idFinancial', values);
  }

  List<ModelFinancialIsar?> getAllByIdFinancialSync(
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

  Future<Id> putByIdFinancial(ModelFinancialIsar object) {
    return putByIndex(r'idFinancial', object);
  }

  Id putByIdFinancialSync(ModelFinancialIsar object, {bool saveLinks = true}) {
    return putByIndexSync(r'idFinancial', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIdFinancial(List<ModelFinancialIsar> objects) {
    return putAllByIndex(r'idFinancial', objects);
  }

  List<Id> putAllByIdFinancialSync(List<ModelFinancialIsar> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'idFinancial', objects, saveLinks: saveLinks);
  }
}

extension ModelFinancialIsarQueryWhereSort
    on QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QWhere> {
  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterWhere>
      anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModelFinancialIsarQueryWhere
    on QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QWhereClause> {
  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterWhereClause>
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

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterWhereClause>
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

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterWhereClause>
      idFinancialEqualTo(String idFinancial) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idFinancial',
        value: [idFinancial],
      ));
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterWhereClause>
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

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterWhereClause>
      idBranchEqualTo(String idBranch) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idBranch',
        value: [idBranch],
      ));
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterWhereClause>
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

extension ModelFinancialIsarQueryFilter
    on QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QFilterCondition> {
  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
      idBranchContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idBranch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
      idBranchMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idBranch',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
      idBranchIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
      idBranchIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
      idFinancialContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idFinancial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
      idFinancialMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idFinancial',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
      idFinancialIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idFinancial',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
      idFinancialIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idFinancial',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
      nameFinancialContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nameFinancial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
      nameFinancialMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nameFinancial',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
      nameFinancialIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameFinancial',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
      nameFinancialIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameFinancial',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension ModelFinancialIsarQueryObject
    on QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QFilterCondition> {}

extension ModelFinancialIsarQueryLinks
    on QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QFilterCondition> {}

extension ModelFinancialIsarQuerySortBy
    on QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QSortBy> {
  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterSortBy>
      sortByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterSortBy>
      sortByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterSortBy>
      sortByIdFinancial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idFinancial', Sort.asc);
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterSortBy>
      sortByIdFinancialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idFinancial', Sort.desc);
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterSortBy>
      sortByNameFinancial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameFinancial', Sort.asc);
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterSortBy>
      sortByNameFinancialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameFinancial', Sort.desc);
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension ModelFinancialIsarQuerySortThenBy
    on QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QSortThenBy> {
  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterSortBy>
      thenByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterSortBy>
      thenByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterSortBy>
      thenByIdFinancial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idFinancial', Sort.asc);
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterSortBy>
      thenByIdFinancialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idFinancial', Sort.desc);
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterSortBy>
      thenByNameFinancial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameFinancial', Sort.asc);
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterSortBy>
      thenByNameFinancialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameFinancial', Sort.desc);
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension ModelFinancialIsarQueryWhereDistinct
    on QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QDistinct> {
  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QDistinct>
      distinctByIdBranch({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idBranch', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QDistinct>
      distinctByIdFinancial({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idFinancial', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QDistinct>
      distinctByNameFinancial({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameFinancial',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QDistinct>
      distinctByType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension ModelFinancialIsarQueryProperty
    on QueryBuilder<ModelFinancialIsar, ModelFinancialIsar, QQueryProperty> {
  QueryBuilder<ModelFinancialIsar, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ModelFinancialIsar, String, QQueryOperations>
      idBranchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idBranch');
    });
  }

  QueryBuilder<ModelFinancialIsar, String, QQueryOperations>
      idFinancialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idFinancial');
    });
  }

  QueryBuilder<ModelFinancialIsar, String, QQueryOperations>
      nameFinancialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameFinancial');
    });
  }

  QueryBuilder<ModelFinancialIsar, String, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
