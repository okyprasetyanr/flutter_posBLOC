// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_supplier_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModelSupplierIsarCollection on Isar {
  IsarCollection<ModelSupplierIsar> get modelSupplierIsars => this.collection();
}

const ModelSupplierIsarSchema = CollectionSchema(
  name: r'ModelSupplierIsar',
  id: -4621265555104799624,
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
  estimateSize: _modelSupplierIsarEstimateSize,
  serialize: _modelSupplierIsarSerialize,
  deserialize: _modelSupplierIsarDeserialize,
  deserializeProp: _modelSupplierIsarDeserializeProp,
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
  getId: _modelSupplierIsarGetId,
  getLinks: _modelSupplierIsarGetLinks,
  attach: _modelSupplierIsarAttach,
  version: '3.1.0+1',
);

int _modelSupplierIsarEstimateSize(
  ModelSupplierIsar object,
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

void _modelSupplierIsarSerialize(
  ModelSupplierIsar object,
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

ModelSupplierIsar _modelSupplierIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelSupplierIsar();
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

P _modelSupplierIsarDeserializeProp<P>(
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

Id _modelSupplierIsarGetId(ModelSupplierIsar object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _modelSupplierIsarGetLinks(
    ModelSupplierIsar object) {
  return [];
}

void _modelSupplierIsarAttach(
    IsarCollection<dynamic> col, Id id, ModelSupplierIsar object) {
  object.isarId = id;
}

extension ModelSupplierIsarByIndex on IsarCollection<ModelSupplierIsar> {
  Future<ModelSupplierIsar?> getByIdPartner(String idPartner) {
    return getByIndex(r'idPartner', [idPartner]);
  }

  ModelSupplierIsar? getByIdPartnerSync(String idPartner) {
    return getByIndexSync(r'idPartner', [idPartner]);
  }

  Future<bool> deleteByIdPartner(String idPartner) {
    return deleteByIndex(r'idPartner', [idPartner]);
  }

  bool deleteByIdPartnerSync(String idPartner) {
    return deleteByIndexSync(r'idPartner', [idPartner]);
  }

  Future<List<ModelSupplierIsar?>> getAllByIdPartner(
      List<String> idPartnerValues) {
    final values = idPartnerValues.map((e) => [e]).toList();
    return getAllByIndex(r'idPartner', values);
  }

  List<ModelSupplierIsar?> getAllByIdPartnerSync(List<String> idPartnerValues) {
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

  Future<Id> putByIdPartner(ModelSupplierIsar object) {
    return putByIndex(r'idPartner', object);
  }

  Id putByIdPartnerSync(ModelSupplierIsar object, {bool saveLinks = true}) {
    return putByIndexSync(r'idPartner', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIdPartner(List<ModelSupplierIsar> objects) {
    return putAllByIndex(r'idPartner', objects);
  }

  List<Id> putAllByIdPartnerSync(List<ModelSupplierIsar> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'idPartner', objects, saveLinks: saveLinks);
  }
}

extension ModelSupplierIsarQueryWhereSort
    on QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QWhere> {
  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModelSupplierIsarQueryWhere
    on QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QWhereClause> {
  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterWhereClause>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterWhereClause>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterWhereClause>
      idPartnerEqualTo(String idPartner) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idPartner',
        value: [idPartner],
      ));
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterWhereClause>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterWhereClause>
      idBranchEqualTo(String idBranch) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idBranch',
        value: [idBranch],
      ));
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterWhereClause>
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

extension ModelSupplierIsarQueryFilter
    on QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QFilterCondition> {
  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
      dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
      emailPartnerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'emailPartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
      emailPartnerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'emailPartner',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
      emailPartnerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emailPartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
      emailPartnerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'emailPartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
      idBranchContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idBranch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
      idBranchMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idBranch',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
      idBranchIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
      idBranchIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
      idPartnerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idPartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
      idPartnerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idPartner',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
      idPartnerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idPartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
      idPartnerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idPartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
      namePartnerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'namePartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
      namePartnerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'namePartner',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
      namePartnerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namePartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
      namePartnerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'namePartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
      phonePartnerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phonePartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
      phonePartnerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phonePartner',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
      phonePartnerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phonePartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
      phonePartnerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phonePartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
      typePartnerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'typePartner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
      typePartnerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'typePartner',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
      typePartnerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'typePartner',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterFilterCondition>
      typePartnerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'typePartner',
        value: '',
      ));
    });
  }
}

extension ModelSupplierIsarQueryObject
    on QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QFilterCondition> {}

extension ModelSupplierIsarQueryLinks
    on QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QFilterCondition> {}

extension ModelSupplierIsarQuerySortBy
    on QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QSortBy> {
  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      sortByBalancePartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balancePartner', Sort.asc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      sortByBalancePartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balancePartner', Sort.desc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      sortByEmailPartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailPartner', Sort.asc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      sortByEmailPartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailPartner', Sort.desc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      sortByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      sortByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      sortByIdPartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPartner', Sort.asc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      sortByIdPartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPartner', Sort.desc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      sortByNamePartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namePartner', Sort.asc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      sortByNamePartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namePartner', Sort.desc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      sortByPhonePartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phonePartner', Sort.asc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      sortByPhonePartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phonePartner', Sort.desc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      sortByTypePartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typePartner', Sort.asc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      sortByTypePartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typePartner', Sort.desc);
    });
  }
}

extension ModelSupplierIsarQuerySortThenBy
    on QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QSortThenBy> {
  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      thenByBalancePartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balancePartner', Sort.asc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      thenByBalancePartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balancePartner', Sort.desc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      thenByEmailPartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailPartner', Sort.asc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      thenByEmailPartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailPartner', Sort.desc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      thenByIdBranch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.asc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      thenByIdBranchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranch', Sort.desc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      thenByIdPartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPartner', Sort.asc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      thenByIdPartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPartner', Sort.desc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      thenByNamePartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namePartner', Sort.asc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      thenByNamePartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namePartner', Sort.desc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      thenByPhonePartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phonePartner', Sort.asc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      thenByPhonePartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phonePartner', Sort.desc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      thenByTypePartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typePartner', Sort.asc);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QAfterSortBy>
      thenByTypePartnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typePartner', Sort.desc);
    });
  }
}

extension ModelSupplierIsarQueryWhereDistinct
    on QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QDistinct> {
  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QDistinct>
      distinctByBalancePartner() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'balancePartner');
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QDistinct>
      distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QDistinct>
      distinctByEmailPartner({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'emailPartner', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QDistinct>
      distinctByIdBranch({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idBranch', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QDistinct>
      distinctByIdPartner({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idPartner', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QDistinct>
      distinctByNamePartner({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'namePartner', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QDistinct>
      distinctByPhonePartner({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phonePartner', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QDistinct>
      distinctByTypePartner({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'typePartner', caseSensitive: caseSensitive);
    });
  }
}

extension ModelSupplierIsarQueryProperty
    on QueryBuilder<ModelSupplierIsar, ModelSupplierIsar, QQueryProperty> {
  QueryBuilder<ModelSupplierIsar, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ModelSupplierIsar, double, QQueryOperations>
      balancePartnerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'balancePartner');
    });
  }

  QueryBuilder<ModelSupplierIsar, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<ModelSupplierIsar, String, QQueryOperations>
      emailPartnerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'emailPartner');
    });
  }

  QueryBuilder<ModelSupplierIsar, String, QQueryOperations> idBranchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idBranch');
    });
  }

  QueryBuilder<ModelSupplierIsar, String, QQueryOperations>
      idPartnerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idPartner');
    });
  }

  QueryBuilder<ModelSupplierIsar, String, QQueryOperations>
      namePartnerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'namePartner');
    });
  }

  QueryBuilder<ModelSupplierIsar, String, QQueryOperations>
      phonePartnerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phonePartner');
    });
  }

  QueryBuilder<ModelSupplierIsar, String, QQueryOperations>
      typePartnerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'typePartner');
    });
  }
}
