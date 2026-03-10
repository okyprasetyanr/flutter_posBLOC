// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_category_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModelCategoryIsarCollection on Isar {
  IsarCollection<ModelCategoryIsar> get modelCategoryIsars => this.collection();
}

const ModelCategoryIsarSchema = CollectionSchema(
  name: r'ModelCategoryIsar',
  id: 3226466608635608695,
  properties: {
    r'idBranch': PropertySchema(
      id: 0,
      name: r'idBranch',
      type: IsarType.string,
    ),
    r'idCategory': PropertySchema(
      id: 1,
      name: r'idCategory',
      type: IsarType.string,
    ),
    r'nameCategory': PropertySchema(
      id: 2,
      name: r'nameCategory',
      type: IsarType.string,
    )
  },
  estimateSize: _modelCategoryIsarEstimateSize,
  serialize: _modelCategoryIsarSerialize,
  deserialize: _modelCategoryIsarDeserialize,
  deserializeProp: _modelCategoryIsarDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'idCategory': IndexSchema(
      id: 5957103877246678183,
      name: r'idCategory',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'idCategory',
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
  getId: _modelCategoryIsarGetId,
  getLinks: _modelCategoryIsarGetLinks,
  attach: _modelCategoryIsarAttach,
  version: '3.1.0+1',
);

int _modelCategoryIsarEstimateSize(
  ModelCategoryIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.idBranch.length * 3;
  bytesCount += 3 + object.idCategory.length * 3;
  bytesCount += 3 + object.nameCategory.length * 3;
  return bytesCount;
}

void _modelCategoryIsarSerialize(
  ModelCategoryIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.idBranch);
  writer.writeString(offsets[1], object.idCategory);
  writer.writeString(offsets[2], object.nameCategory);
}

ModelCategoryIsar _modelCategoryIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelCategoryIsar();
  object.idBranch = reader.readString(offsets[0]);
  object.idCategory = reader.readString(offsets[1]);
  object.isarId = id;
  object.nameCategory = reader.readString(offsets[2]);
  return object;
}

P _modelCategoryIsarDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _modelCategoryIsarGetId(ModelCategoryIsar object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _modelCategoryIsarGetLinks(
    ModelCategoryIsar object) {
  return [];
}

void _modelCategoryIsarAttach(
    IsarCollection<dynamic> col, Id id, ModelCategoryIsar object) {
  object.isarId = id;
}

extension ModelCategoryIsarByIndex on IsarCollection<ModelCategoryIsar> {
  Future<ModelCategoryIsar?> getByIdCategory(String idCategory) {
    return getByIndex(r'idCategory', [idCategory]);
  }

  ModelCategoryIsar? getByIdCategorySync(String idCategory) {
    return getByIndexSync(r'idCategory', [idCategory]);
  }

  Future<bool> deleteByIdCategory(String idCategory) {
    return deleteByIndex(r'idCategory', [idCategory]);
  }

  bool deleteByIdCategorySync(String idCategory) {
    return deleteByIndexSync(r'idCategory', [idCategory]);
  }

  Future<List<ModelCategoryIsar?>> getAllByIdCategory(
      List<String> idCategoryValues) {
    final values = idCategoryValues.map((e) => [e]).toList();
    return getAllByIndex(r'idCategory', values);
  }

  List<ModelCategoryIsar?> getAllByIdCategorySync(
      List<String> idCategoryValues) {
    final values = idCategoryValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'idCategory', values);
  }

  Future<int> deleteAllByIdCategory(List<String> idCategoryValues) {
    final values = idCategoryValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'idCategory', values);
  }

  int deleteAllByIdCategorySync(List<String> idCategoryValues) {
    final values = idCategoryValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'idCategory', values);
  }

  Future<Id> putByIdCategory(ModelCategoryIsar object) {
    return putByIndex(r'idCategory', object);
  }

  Id putByIdCategorySync(ModelCategoryIsar object, {bool saveLinks = true}) {
    return putByIndexSync(r'idCategory', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIdCategory(List<ModelCategoryIsar> objects) {
    return putAllByIndex(r'idCategory', objects);
  }

  List<Id> putAllByIdCategorySync(List<ModelCategoryIsar> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'idCategory', objects, saveLinks: saveLinks);
  }
}

extension ModelCategoryIsarQueryWhereSort
    on QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QWhere> {
  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModelCategoryIsarQueryWhere
    on QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QWhereClause> {
  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterWhereClause>
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

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterWhereClause>
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

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterWhereClause>
      idCategoryEqualTo(String idCategory) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idCategory',
        value: [idCategory],
      ));
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterWhereClause>
      idCategoryNotEqualTo(String idCategory) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idCategory',
              lower: [],
              upper: [idCategory],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idCategory',
              lower: [idCategory],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idCategory',
              lower: [idCategory],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idCategory',
              lower: [],
              upper: [idCategory],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterWhereClause>
      idBranchEqualTo(String idBranch) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idBranch',
        value: [idBranch],
      ));
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterWhereClause>
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

extension ModelCategoryIsarQueryFilter
    on QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QFilterCondition> {
  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
      idBranchContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idBranch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
      idBranchMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idBranch',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
      idBranchIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
      idBranchIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
      idCategoryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
      idCategoryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
      idCategoryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
      idCategoryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idCategory',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
      idCategoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
      idCategoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
      idCategoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
      idCategoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idCategory',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
      idCategoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
      idCategoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
      nameCategoryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
      nameCategoryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nameCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
      nameCategoryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nameCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
      nameCategoryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nameCategory',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
      nameCategoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nameCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
      nameCategoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nameCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
      nameCategoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nameCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
      nameCategoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nameCategory',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
      nameCategoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterFilterCondition>
      nameCategoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameCategory',
        value: '',
      ));
    });
  }
}

extension ModelCategoryIsarQueryObject
    on QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QFilterCondition> {}

extension ModelCategoryIsarQueryLinks
    on QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QFilterCondition> {}

extension ModelCategoryIsarQuerySortBy
    on QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QSortBy> {
  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterSortBy>
      sortByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterSortBy>
      sortByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterSortBy>
      sortByIdCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCategory', Sort.asc);
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterSortBy>
      sortByIdCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCategory', Sort.desc);
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterSortBy>
      sortByNameCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameCategory', Sort.asc);
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterSortBy>
      sortByNameCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameCategory', Sort.desc);
    });
  }
}

extension ModelCategoryIsarQuerySortThenBy
    on QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QSortThenBy> {
  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterSortBy>
      thenByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterSortBy>
      thenByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterSortBy>
      thenByIdCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCategory', Sort.asc);
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterSortBy>
      thenByIdCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCategory', Sort.desc);
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterSortBy>
      thenByNameCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameCategory', Sort.asc);
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QAfterSortBy>
      thenByNameCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameCategory', Sort.desc);
    });
  }
}

extension ModelCategoryIsarQueryWhereDistinct
    on QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QDistinct> {
  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QDistinct>
      distinctByIdBranch({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idBranch', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QDistinct>
      distinctByIdCategory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idCategory', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QDistinct>
      distinctByNameCategory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameCategory', caseSensitive: caseSensitive);
    });
  }
}

extension ModelCategoryIsarQueryProperty
    on QueryBuilder<ModelCategoryIsar, ModelCategoryIsar, QQueryProperty> {
  QueryBuilder<ModelCategoryIsar, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ModelCategoryIsar, String, QQueryOperations> idBranchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idBranch');
    });
  }

  QueryBuilder<ModelCategoryIsar, String, QQueryOperations>
      idCategoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idCategory');
    });
  }

  QueryBuilder<ModelCategoryIsar, String, QQueryOperations>
      nameCategoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameCategory');
    });
  }
}
