// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_partner_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModelPartnerIsarCollection on Isar {
  IsarCollection<ModelPartnerIsar> get modelPartnerIsars => this.collection();
}

const ModelPartnerIsarSchema = CollectionSchema(
  name: r'ModelPartnerIsar',
  id: 1790861042924731863,
  properties: {
    r'balancePartner': PropertySchema(
      id: 0,
      name: r'balancePartner',
      type: IsarType.double,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'emailPartner': PropertySchema(
      id: 2,
      name: r'emailPartner',
      type: IsarType.string,
    ),
    r'idBranch': PropertySchema(
      id: 3,
      name: r'idBranch',
      type: IsarType.string,
    ),
    r'idPartner': PropertySchema(
      id: 4,
      name: r'idPartner',
      type: IsarType.string,
    ),
    r'namePartner': PropertySchema(
      id: 5,
      name: r'namePartner',
      type: IsarType.string,
    ),
    r'phonePartner': PropertySchema(
      id: 6,
      name: r'phonePartner',
      type: IsarType.string,
    ),
    r'typePartner': PropertySchema(
      id: 7,
      name: r'typePartner',
      type: IsarType.string,
    )
  },
  estimateSize: _modelPartnerIsarEstimateSize,
  serialize: _modelPartnerIsarSerialize,
  deserialize: _modelPartnerIsarDeserialize,
  deserializeProp: _modelPartnerIsarDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'idPartner': IndexSchema(
      id: -2302069033028856625,
      name: r'idPartner',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'idPartner',
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
  getId: _modelPartnerIsarGetId,
  getLinks: _modelPartnerIsarGetLinks,
  attach: _modelPartnerIsarAttach,
  version: '3.1.0+1',
);

int _modelPartnerIsarEstimateSize(
  ModelPartnerIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.emailPartner.length * 3;
  bytesCount += 3 + object.idBranch.length * 3;
  bytesCount += 3 + object.idPartner.length * 3;
  bytesCount += 3 + object.namePartner.length * 3;
  bytesCount += 3 + object.phonePartner.length * 3;
  bytesCount += 3 + object.typePartner.length * 3;
  return bytesCount;
}

void _modelPartnerIsarSerialize(
  ModelPartnerIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.balancePartner);
  writer.writeDateTime(offsets[1], object.date);
  writer.writeString(offsets[2], object.emailPartner);
  writer.writeString(offsets[3], object.idBranch);
  writer.writeString(offsets[4], object.idPartner);
  writer.writeString(offsets[5], object.namePartner);
  writer.writeString(offsets[6], object.phonePartner);
  writer.writeString(offsets[7], object.typePartner);
}

ModelPartnerIsar _modelPartnerIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelPartnerIsar();
  object.balancePartner = reader.readDouble(offsets[0]);
  object.date = reader.readDateTime(offsets[1]);
  object.emailPartner = reader.readString(offsets[2]);
  object.idBranch = reader.readString(offsets[3]);
  object.idPartner = reader.readString(offsets[4]);
  object.isarId = id;
  object.namePartner = reader.readString(offsets[5]);
  object.phonePartner = reader.readString(offsets[6]);
  object.typePartner = reader.readString(offsets[7]);
  return object;
}

P _modelPartnerIsarDeserializeProp<P>(
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

Id _modelPartnerIsarGetId(ModelPartnerIsar object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _modelPartnerIsarGetLinks(ModelPartnerIsar object) {
  return [];
}

void _modelPartnerIsarAttach(
    IsarCollection<dynamic> col, Id id, ModelPartnerIsar object) {
  object.isarId = id;
}

extension ModelPartnerIsarByIndex on IsarCollection<ModelPartnerIsar> {
  Future<ModelPartnerIsar?> getByIdPartner(String idPartner) {
    return getByIndex(r'idPartner', [idPartner]);
  }

  ModelPartnerIsar? getByIdPartnerSync(String idPartner) {
    return getByIndexSync(r'idPartner', [idPartner]);
  }

  Future<bool> deleteByIdPartner(String idPartner) {
    return deleteByIndex(r'idPartner', [idPartner]);
  }

  bool deleteByIdPartnerSync(String idPartner) {
    return deleteByIndexSync(r'idPartner', [idPartner]);
  }

  Future<List<ModelPartnerIsar?>> getAllByIdPartner(
      List<String> idPartnerValues) {
    final values = idPartnerValues.map((e) => [e]).toList();
    return getAllByIndex(r'idPartner', values);
  }

  List<ModelPartnerIsar?> getAllByIdPartnerSync(List<String> idPartnerValues) {
    final values = idPartnerValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'idPartner', values);
  }

  Future<int> deleteAllByIdPartner(List<String> idPartnerValues) {
    final values = idPartnerValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'idPartner', values);
  }

  int deleteAllByIdPartnerSync(List<String> idPartnerValues) {
    final values = idPartnerValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'idPartner', values);
  }

  Future<Id> putByIdPartner(ModelPartnerIsar object) {
    return putByIndex(r'idPartner', object);
  }

  Id putByIdPartnerSync(ModelPartnerIsar object, {bool saveLinks = true}) {
    return putByIndexSync(r'idPartner', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIdPartner(List<ModelPartnerIsar> objects) {
    return putAllByIndex(r'idPartner', objects);
  }

  List<Id> putAllByIdPartnerSync(List<ModelPartnerIsar> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'idPartner', objects, saveLinks: saveLinks);
  }
}

extension ModelPartnerIsarQueryWhereSort
    on QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QWhere> {
  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModelPartnerIsarQueryWhere
    on QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QWhereClause> {
  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterWhereClause>
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

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterWhereClause>
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

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterWhereClause>
      idPartnerEqualTo(String idPartner) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idPartner',
        value: [idPartner],
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterWhereClause>
      idPartnerNotEqualTo(String idPartner) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idPartner',
              lower: [],
              upper: [idPartner],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idPartner',
              lower: [idPartner],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idPartner',
              lower: [idPartner],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idPartner',
              lower: [],
              upper: [idPartner],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterWhereClause>
      idBranchEqualTo(String idBranch) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idBranch',
        value: [idBranch],
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterWhereClause>
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

extension ModelPartnerIsarQueryFilter
    on QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QFilterCondition> {
  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      balancePartnerEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'balancePartner',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      balancePartnerGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'balancePartner',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      balancePartnerLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'balancePartner',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      balancePartnerBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'balancePartner',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      dateGreaterThan(
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

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      dateLessThan(
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

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      dateBetween(
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

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      emailPartnerEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emailPartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      emailPartnerGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'emailPartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      emailPartnerLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'emailPartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      emailPartnerBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'emailPartner',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      emailPartnerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'emailPartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      emailPartnerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'emailPartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      emailPartnerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'emailPartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      emailPartnerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'emailPartner',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      emailPartnerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emailPartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      emailPartnerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'emailPartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      idBranchContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idBranch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      idBranchMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idBranch',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      idBranchIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      idBranchIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      idPartnerEqualTo(
    String value, {
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

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      idPartnerGreaterThan(
    String value, {
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

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      idPartnerLessThan(
    String value, {
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

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      idPartnerBetween(
    String lower,
    String upper, {
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

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      idPartnerStartsWith(
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

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      idPartnerEndsWith(
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

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      idPartnerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idPartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      idPartnerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idPartner',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      idPartnerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idPartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      idPartnerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idPartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      namePartnerEqualTo(
    String value, {
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

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      namePartnerGreaterThan(
    String value, {
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

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      namePartnerLessThan(
    String value, {
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

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      namePartnerBetween(
    String lower,
    String upper, {
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

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      namePartnerStartsWith(
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

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      namePartnerEndsWith(
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

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      namePartnerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'namePartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      namePartnerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'namePartner',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      namePartnerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namePartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      namePartnerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'namePartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      phonePartnerEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phonePartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      phonePartnerGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phonePartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      phonePartnerLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phonePartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      phonePartnerBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phonePartner',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      phonePartnerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phonePartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      phonePartnerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phonePartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      phonePartnerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phonePartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      phonePartnerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phonePartner',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      phonePartnerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phonePartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      phonePartnerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phonePartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      typePartnerEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'typePartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      typePartnerGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'typePartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      typePartnerLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'typePartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      typePartnerBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'typePartner',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      typePartnerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'typePartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      typePartnerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'typePartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      typePartnerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'typePartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      typePartnerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'typePartner',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      typePartnerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'typePartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterFilterCondition>
      typePartnerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'typePartner',
        value: '',
      ));
    });
  }
}

extension ModelPartnerIsarQueryObject
    on QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QFilterCondition> {}

extension ModelPartnerIsarQueryLinks
    on QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QFilterCondition> {}

extension ModelPartnerIsarQuerySortBy
    on QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QSortBy> {
  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      sortByBalancePartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balancePartner', Sort.asc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      sortByBalancePartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balancePartner', Sort.desc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      sortByEmailPartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailPartner', Sort.asc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      sortByEmailPartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailPartner', Sort.desc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      sortByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      sortByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      sortByIdPartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPartner', Sort.asc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      sortByIdPartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPartner', Sort.desc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      sortByNamePartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namePartner', Sort.asc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      sortByNamePartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namePartner', Sort.desc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      sortByPhonePartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phonePartner', Sort.asc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      sortByPhonePartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phonePartner', Sort.desc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      sortByTypePartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typePartner', Sort.asc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      sortByTypePartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typePartner', Sort.desc);
    });
  }
}

extension ModelPartnerIsarQuerySortThenBy
    on QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QSortThenBy> {
  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      thenByBalancePartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balancePartner', Sort.asc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      thenByBalancePartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balancePartner', Sort.desc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      thenByEmailPartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailPartner', Sort.asc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      thenByEmailPartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailPartner', Sort.desc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      thenByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      thenByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      thenByIdPartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPartner', Sort.asc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      thenByIdPartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPartner', Sort.desc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      thenByNamePartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namePartner', Sort.asc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      thenByNamePartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namePartner', Sort.desc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      thenByPhonePartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phonePartner', Sort.asc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      thenByPhonePartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phonePartner', Sort.desc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      thenByTypePartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typePartner', Sort.asc);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QAfterSortBy>
      thenByTypePartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typePartner', Sort.desc);
    });
  }
}

extension ModelPartnerIsarQueryWhereDistinct
    on QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QDistinct> {
  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QDistinct>
      distinctByBalancePartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'balancePartner');
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QDistinct>
      distinctByEmailPartner({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'emailPartner', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QDistinct>
      distinctByIdBranch({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idBranch', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QDistinct>
      distinctByIdPartner({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idPartner', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QDistinct>
      distinctByNamePartner({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'namePartner', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QDistinct>
      distinctByPhonePartner({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phonePartner', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QDistinct>
      distinctByTypePartner({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'typePartner', caseSensitive: caseSensitive);
    });
  }
}

extension ModelPartnerIsarQueryProperty
    on QueryBuilder<ModelPartnerIsar, ModelPartnerIsar, QQueryProperty> {
  QueryBuilder<ModelPartnerIsar, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ModelPartnerIsar, double, QQueryOperations>
      balancePartnerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'balancePartner');
    });
  }

  QueryBuilder<ModelPartnerIsar, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<ModelPartnerIsar, String, QQueryOperations>
      emailPartnerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'emailPartner');
    });
  }

  QueryBuilder<ModelPartnerIsar, String, QQueryOperations> idBranchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idBranch');
    });
  }

  QueryBuilder<ModelPartnerIsar, String, QQueryOperations> idPartnerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idPartner');
    });
  }

  QueryBuilder<ModelPartnerIsar, String, QQueryOperations>
      namePartnerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'namePartner');
    });
  }

  QueryBuilder<ModelPartnerIsar, String, QQueryOperations>
      phonePartnerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phonePartner');
    });
  }

  QueryBuilder<ModelPartnerIsar, String, QQueryOperations>
      typePartnerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'typePartner');
    });
  }
}
