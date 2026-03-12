// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_customer_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModelCustomerIsarCollection on Isar {
  IsarCollection<ModelCustomerIsar> get modelCustomerIsars => this.collection();
}

const ModelCustomerIsarSchema = CollectionSchema(
  name: r'ModelCustomerIsar',
  id: 5720001944910443274,
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
  estimateSize: _modelCustomerIsarEstimateSize,
  serialize: _modelCustomerIsarSerialize,
  deserialize: _modelCustomerIsarDeserialize,
  deserializeProp: _modelCustomerIsarDeserializeProp,
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
  getId: _modelCustomerIsarGetId,
  getLinks: _modelCustomerIsarGetLinks,
  attach: _modelCustomerIsarAttach,
  version: '3.1.0+1',
);

int _modelCustomerIsarEstimateSize(
  ModelCustomerIsar object,
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

void _modelCustomerIsarSerialize(
  ModelCustomerIsar object,
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

ModelCustomerIsar _modelCustomerIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelCustomerIsar();
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

P _modelCustomerIsarDeserializeProp<P>(
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

Id _modelCustomerIsarGetId(ModelCustomerIsar object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _modelCustomerIsarGetLinks(
    ModelCustomerIsar object) {
  return [];
}

void _modelCustomerIsarAttach(
    IsarCollection<dynamic> col, Id id, ModelCustomerIsar object) {
  object.isarId = id;
}

extension ModelCustomerIsarByIndex on IsarCollection<ModelCustomerIsar> {
  Future<ModelCustomerIsar?> getByIdPartner(String idPartner) {
    return getByIndex(r'idPartner', [idPartner]);
  }

  ModelCustomerIsar? getByIdPartnerSync(String idPartner) {
    return getByIndexSync(r'idPartner', [idPartner]);
  }

  Future<bool> deleteByIdPartner(String idPartner) {
    return deleteByIndex(r'idPartner', [idPartner]);
  }

  bool deleteByIdPartnerSync(String idPartner) {
    return deleteByIndexSync(r'idPartner', [idPartner]);
  }

  Future<List<ModelCustomerIsar?>> getAllByIdPartner(
      List<String> idPartnerValues) {
    final values = idPartnerValues.map((e) => [e]).toList();
    return getAllByIndex(r'idPartner', values);
  }

  List<ModelCustomerIsar?> getAllByIdPartnerSync(List<String> idPartnerValues) {
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

  Future<Id> putByIdPartner(ModelCustomerIsar object) {
    return putByIndex(r'idPartner', object);
  }

  Id putByIdPartnerSync(ModelCustomerIsar object, {bool saveLinks = true}) {
    return putByIndexSync(r'idPartner', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIdPartner(List<ModelCustomerIsar> objects) {
    return putAllByIndex(r'idPartner', objects);
  }

  List<Id> putAllByIdPartnerSync(List<ModelCustomerIsar> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'idPartner', objects, saveLinks: saveLinks);
  }
}

extension ModelCustomerIsarQueryWhereSort
    on QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QWhere> {
  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModelCustomerIsarQueryWhere
    on QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QWhereClause> {
  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterWhereClause>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterWhereClause>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterWhereClause>
      idPartnerEqualTo(String idPartner) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idPartner',
        value: [idPartner],
      ));
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterWhereClause>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterWhereClause>
      idBranchEqualTo(String idBranch) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idBranch',
        value: [idBranch],
      ));
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterWhereClause>
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

extension ModelCustomerIsarQueryFilter
    on QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QFilterCondition> {
  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
      dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
      emailPartnerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'emailPartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
      emailPartnerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'emailPartner',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
      emailPartnerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emailPartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
      emailPartnerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'emailPartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
      idBranchContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idBranch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
      idBranchMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idBranch',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
      idBranchIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
      idBranchIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
      idPartnerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idPartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
      idPartnerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idPartner',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
      idPartnerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idPartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
      idPartnerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idPartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
      namePartnerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'namePartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
      namePartnerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'namePartner',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
      namePartnerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namePartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
      namePartnerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'namePartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
      phonePartnerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phonePartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
      phonePartnerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phonePartner',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
      phonePartnerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phonePartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
      phonePartnerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phonePartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
      typePartnerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'typePartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
      typePartnerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'typePartner',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
      typePartnerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'typePartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterFilterCondition>
      typePartnerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'typePartner',
        value: '',
      ));
    });
  }
}

extension ModelCustomerIsarQueryObject
    on QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QFilterCondition> {}

extension ModelCustomerIsarQueryLinks
    on QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QFilterCondition> {}

extension ModelCustomerIsarQuerySortBy
    on QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QSortBy> {
  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      sortByBalancePartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balancePartner', Sort.asc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      sortByBalancePartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balancePartner', Sort.desc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      sortByEmailPartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailPartner', Sort.asc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      sortByEmailPartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailPartner', Sort.desc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      sortByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      sortByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      sortByIdPartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPartner', Sort.asc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      sortByIdPartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPartner', Sort.desc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      sortByNamePartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namePartner', Sort.asc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      sortByNamePartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namePartner', Sort.desc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      sortByPhonePartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phonePartner', Sort.asc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      sortByPhonePartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phonePartner', Sort.desc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      sortByTypePartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typePartner', Sort.asc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      sortByTypePartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typePartner', Sort.desc);
    });
  }
}

extension ModelCustomerIsarQuerySortThenBy
    on QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QSortThenBy> {
  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      thenByBalancePartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balancePartner', Sort.asc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      thenByBalancePartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balancePartner', Sort.desc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      thenByEmailPartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailPartner', Sort.asc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      thenByEmailPartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailPartner', Sort.desc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      thenByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      thenByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      thenByIdPartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPartner', Sort.asc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      thenByIdPartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPartner', Sort.desc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      thenByNamePartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namePartner', Sort.asc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      thenByNamePartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namePartner', Sort.desc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      thenByPhonePartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phonePartner', Sort.asc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      thenByPhonePartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phonePartner', Sort.desc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      thenByTypePartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typePartner', Sort.asc);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QAfterSortBy>
      thenByTypePartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typePartner', Sort.desc);
    });
  }
}

extension ModelCustomerIsarQueryWhereDistinct
    on QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QDistinct> {
  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QDistinct>
      distinctByBalancePartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'balancePartner');
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QDistinct>
      distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QDistinct>
      distinctByEmailPartner({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'emailPartner', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QDistinct>
      distinctByIdBranch({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idBranch', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QDistinct>
      distinctByIdPartner({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idPartner', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QDistinct>
      distinctByNamePartner({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'namePartner', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QDistinct>
      distinctByPhonePartner({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phonePartner', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QDistinct>
      distinctByTypePartner({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'typePartner', caseSensitive: caseSensitive);
    });
  }
}

extension ModelCustomerIsarQueryProperty
    on QueryBuilder<ModelCustomerIsar, ModelCustomerIsar, QQueryProperty> {
  QueryBuilder<ModelCustomerIsar, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ModelCustomerIsar, double, QQueryOperations>
      balancePartnerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'balancePartner');
    });
  }

  QueryBuilder<ModelCustomerIsar, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<ModelCustomerIsar, String, QQueryOperations>
      emailPartnerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'emailPartner');
    });
  }

  QueryBuilder<ModelCustomerIsar, String, QQueryOperations> idBranchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idBranch');
    });
  }

  QueryBuilder<ModelCustomerIsar, String, QQueryOperations>
      idPartnerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idPartner');
    });
  }

  QueryBuilder<ModelCustomerIsar, String, QQueryOperations>
      namePartnerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'namePartner');
    });
  }

  QueryBuilder<ModelCustomerIsar, String, QQueryOperations>
      phonePartnerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phonePartner');
    });
  }

  QueryBuilder<ModelCustomerIsar, String, QQueryOperations>
      typePartnerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'typePartner');
    });
  }
}
