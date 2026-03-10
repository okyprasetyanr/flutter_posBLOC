// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_user_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModelUserIsarCollection on Isar {
  IsarCollection<ModelUserIsar> get modelUserIsars => this.collection();
}

const ModelUserIsarSchema = CollectionSchema(
  name: r'ModelUserIsar',
  id: 9150131632075427021,
  properties: {
    r'createdUser': PropertySchema(
      id: 0,
      name: r'createdUser',
      type: IsarType.dateTime,
    ),
    r'emailUser': PropertySchema(
      id: 1,
      name: r'emailUser',
      type: IsarType.string,
    ),
    r'idBranchUser': PropertySchema(
      id: 2,
      name: r'idBranchUser',
      type: IsarType.string,
    ),
    r'idUser': PropertySchema(
      id: 3,
      name: r'idUser',
      type: IsarType.string,
    ),
    r'nameUser': PropertySchema(
      id: 4,
      name: r'nameUser',
      type: IsarType.string,
    ),
    r'noteUser': PropertySchema(
      id: 5,
      name: r'noteUser',
      type: IsarType.string,
    ),
    r'permissionsUser': PropertySchema(
      id: 6,
      name: r'permissionsUser',
      type: IsarType.objectList,
      target: r'ModelPermissionUserIsar',
    ),
    r'phoneUser': PropertySchema(
      id: 7,
      name: r'phoneUser',
      type: IsarType.string,
    ),
    r'roleUser': PropertySchema(
      id: 8,
      name: r'roleUser',
      type: IsarType.string,
    ),
    r'statusUser': PropertySchema(
      id: 9,
      name: r'statusUser',
      type: IsarType.string,
    )
  },
  estimateSize: _modelUserIsarEstimateSize,
  serialize: _modelUserIsarSerialize,
  deserialize: _modelUserIsarDeserialize,
  deserializeProp: _modelUserIsarDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'idUser': IndexSchema(
      id: 4457735720952084498,
      name: r'idUser',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'idUser',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'idBranchUser': IndexSchema(
      id: 6180158750936657462,
      name: r'idBranchUser',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'idBranchUser',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'ModelPermissionUserIsar': ModelPermissionUserIsarSchema},
  getId: _modelUserIsarGetId,
  getLinks: _modelUserIsarGetLinks,
  attach: _modelUserIsarAttach,
  version: '3.1.0+1',
);

int _modelUserIsarEstimateSize(
  ModelUserIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.emailUser.length * 3;
  {
    final value = object.idBranchUser;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.idUser.length * 3;
  bytesCount += 3 + object.nameUser.length * 3;
  {
    final value = object.noteUser;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.permissionsUser.length * 3;
  {
    final offsets = allOffsets[ModelPermissionUserIsar]!;
    for (var i = 0; i < object.permissionsUser.length; i++) {
      final value = object.permissionsUser[i];
      bytesCount += ModelPermissionUserIsarSchema.estimateSize(
          value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.phoneUser.length * 3;
  bytesCount += 3 + object.roleUser.length * 3;
  bytesCount += 3 + object.statusUser.length * 3;
  return bytesCount;
}

void _modelUserIsarSerialize(
  ModelUserIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdUser);
  writer.writeString(offsets[1], object.emailUser);
  writer.writeString(offsets[2], object.idBranchUser);
  writer.writeString(offsets[3], object.idUser);
  writer.writeString(offsets[4], object.nameUser);
  writer.writeString(offsets[5], object.noteUser);
  writer.writeObjectList<ModelPermissionUserIsar>(
    offsets[6],
    allOffsets,
    ModelPermissionUserIsarSchema.serialize,
    object.permissionsUser,
  );
  writer.writeString(offsets[7], object.phoneUser);
  writer.writeString(offsets[8], object.roleUser);
  writer.writeString(offsets[9], object.statusUser);
}

ModelUserIsar _modelUserIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelUserIsar();
  object.createdUser = reader.readDateTimeOrNull(offsets[0]);
  object.emailUser = reader.readString(offsets[1]);
  object.idBranchUser = reader.readStringOrNull(offsets[2]);
  object.idUser = reader.readString(offsets[3]);
  object.isarId = id;
  object.nameUser = reader.readString(offsets[4]);
  object.noteUser = reader.readStringOrNull(offsets[5]);
  object.permissionsUser = reader.readObjectList<ModelPermissionUserIsar>(
        offsets[6],
        ModelPermissionUserIsarSchema.deserialize,
        allOffsets,
        ModelPermissionUserIsar(),
      ) ??
      [];
  object.phoneUser = reader.readString(offsets[7]);
  object.roleUser = reader.readString(offsets[8]);
  object.statusUser = reader.readString(offsets[9]);
  return object;
}

P _modelUserIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readObjectList<ModelPermissionUserIsar>(
            offset,
            ModelPermissionUserIsarSchema.deserialize,
            allOffsets,
            ModelPermissionUserIsar(),
          ) ??
          []) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _modelUserIsarGetId(ModelUserIsar object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _modelUserIsarGetLinks(ModelUserIsar object) {
  return [];
}

void _modelUserIsarAttach(
    IsarCollection<dynamic> col, Id id, ModelUserIsar object) {
  object.isarId = id;
}

extension ModelUserIsarByIndex on IsarCollection<ModelUserIsar> {
  Future<ModelUserIsar?> getByIdUser(String idUser) {
    return getByIndex(r'idUser', [idUser]);
  }

  ModelUserIsar? getByIdUserSync(String idUser) {
    return getByIndexSync(r'idUser', [idUser]);
  }

  Future<bool> deleteByIdUser(String idUser) {
    return deleteByIndex(r'idUser', [idUser]);
  }

  bool deleteByIdUserSync(String idUser) {
    return deleteByIndexSync(r'idUser', [idUser]);
  }

  Future<List<ModelUserIsar?>> getAllByIdUser(List<String> idUserValues) {
    final values = idUserValues.map((e) => [e]).toList();
    return getAllByIndex(r'idUser', values);
  }

  List<ModelUserIsar?> getAllByIdUserSync(List<String> idUserValues) {
    final values = idUserValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'idUser', values);
  }

  Future<int> deleteAllByIdUser(List<String> idUserValues) {
    final values = idUserValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'idUser', values);
  }

  int deleteAllByIdUserSync(List<String> idUserValues) {
    final values = idUserValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'idUser', values);
  }

  Future<Id> putByIdUser(ModelUserIsar object) {
    return putByIndex(r'idUser', object);
  }

  Id putByIdUserSync(ModelUserIsar object, {bool saveLinks = true}) {
    return putByIndexSync(r'idUser', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIdUser(List<ModelUserIsar> objects) {
    return putAllByIndex(r'idUser', objects);
  }

  List<Id> putAllByIdUserSync(List<ModelUserIsar> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'idUser', objects, saveLinks: saveLinks);
  }
}

extension ModelUserIsarQueryWhereSort
    on QueryBuilder<ModelUserIsar, ModelUserIsar, QWhere> {
  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModelUserIsarQueryWhere
    on QueryBuilder<ModelUserIsar, ModelUserIsar, QWhereClause> {
  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterWhereClause>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterWhereClause> idUserEqualTo(
      String idUser) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idUser',
        value: [idUser],
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterWhereClause>
      idUserNotEqualTo(String idUser) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idUser',
              lower: [],
              upper: [idUser],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idUser',
              lower: [idUser],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idUser',
              lower: [idUser],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idUser',
              lower: [],
              upper: [idUser],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterWhereClause>
      idBranchUserIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idBranchUser',
        value: [null],
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterWhereClause>
      idBranchUserIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'idBranchUser',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterWhereClause>
      idBranchUserEqualTo(String? idBranchUser) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idBranchUser',
        value: [idBranchUser],
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterWhereClause>
      idBranchUserNotEqualTo(String? idBranchUser) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idBranchUser',
              lower: [],
              upper: [idBranchUser],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idBranchUser',
              lower: [idBranchUser],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idBranchUser',
              lower: [idBranchUser],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idBranchUser',
              lower: [],
              upper: [idBranchUser],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ModelUserIsarQueryFilter
    on QueryBuilder<ModelUserIsar, ModelUserIsar, QFilterCondition> {
  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      createdUserIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdUser',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      createdUserIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdUser',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      createdUserEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdUser',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      createdUserGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdUser',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      createdUserLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdUser',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      createdUserBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdUser',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      emailUserEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emailUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      emailUserGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'emailUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      emailUserLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'emailUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      emailUserBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'emailUser',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      emailUserStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'emailUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      emailUserEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'emailUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      emailUserContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'emailUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      emailUserMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'emailUser',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      emailUserIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emailUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      emailUserIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'emailUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idBranchUserIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idBranchUser',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idBranchUserIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idBranchUser',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idBranchUserEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idBranchUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idBranchUserGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idBranchUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idBranchUserLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idBranchUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idBranchUserBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idBranchUser',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idBranchUserStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idBranchUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idBranchUserEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idBranchUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idBranchUserContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idBranchUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idBranchUserMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idBranchUser',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idBranchUserIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idBranchUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idBranchUserIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idBranchUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idUserEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idUserGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idUserLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idUserBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idUser',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idUserStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idUserEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idUserContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idUserMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idUser',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idUserIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      idUserIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      nameUserEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      nameUserGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nameUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      nameUserLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nameUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      nameUserBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nameUser',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      nameUserStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nameUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      nameUserEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nameUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      nameUserContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nameUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      nameUserMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nameUser',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      nameUserIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      nameUserIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      noteUserIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'noteUser',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      noteUserIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'noteUser',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      noteUserEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'noteUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      noteUserGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'noteUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      noteUserLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'noteUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      noteUserBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'noteUser',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      noteUserStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'noteUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      noteUserEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'noteUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      noteUserContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'noteUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      noteUserMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'noteUser',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      noteUserIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'noteUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      noteUserIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'noteUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      permissionsUserLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'permissionsUser',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      permissionsUserIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'permissionsUser',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      permissionsUserIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'permissionsUser',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      permissionsUserLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'permissionsUser',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      permissionsUserLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'permissionsUser',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      permissionsUserLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'permissionsUser',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      phoneUserEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      phoneUserGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phoneUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      phoneUserLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phoneUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      phoneUserBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phoneUser',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      phoneUserStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phoneUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      phoneUserEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phoneUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      phoneUserContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phoneUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      phoneUserMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phoneUser',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      phoneUserIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      phoneUserIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phoneUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      roleUserEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roleUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      roleUserGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'roleUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      roleUserLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'roleUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      roleUserBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'roleUser',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      roleUserStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'roleUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      roleUserEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'roleUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      roleUserContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'roleUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      roleUserMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'roleUser',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      roleUserIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roleUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      roleUserIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'roleUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      statusUserEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      statusUserGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'statusUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      statusUserLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'statusUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      statusUserBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'statusUser',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      statusUserStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'statusUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      statusUserEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'statusUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      statusUserContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'statusUser',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      statusUserMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'statusUser',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      statusUserIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusUser',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      statusUserIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'statusUser',
        value: '',
      ));
    });
  }
}

extension ModelUserIsarQueryObject
    on QueryBuilder<ModelUserIsar, ModelUserIsar, QFilterCondition> {
  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterFilterCondition>
      permissionsUserElement(FilterQuery<ModelPermissionUserIsar> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'permissionsUser');
    });
  }
}

extension ModelUserIsarQueryLinks
    on QueryBuilder<ModelUserIsar, ModelUserIsar, QFilterCondition> {}

extension ModelUserIsarQuerySortBy
    on QueryBuilder<ModelUserIsar, ModelUserIsar, QSortBy> {
  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> sortByCreatedUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByCreatedUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> sortByEmailUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByEmailUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByIdBranchUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranchUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByIdBranchUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranchUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> sortByIdUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> sortByIdUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> sortByNameUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByNameUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> sortByNoteUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noteUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByNoteUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noteUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> sortByPhoneUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByPhoneUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> sortByRoleUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roleUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByRoleUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roleUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> sortByStatusUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      sortByStatusUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusUser', Sort.desc);
    });
  }
}

extension ModelUserIsarQuerySortThenBy
    on QueryBuilder<ModelUserIsar, ModelUserIsar, QSortThenBy> {
  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> thenByCreatedUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByCreatedUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> thenByEmailUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByEmailUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByIdBranchUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranchUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByIdBranchUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBranchUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> thenByIdUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> thenByIdUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> thenByNameUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByNameUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> thenByNoteUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noteUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByNoteUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noteUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> thenByPhoneUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByPhoneUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> thenByRoleUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roleUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByRoleUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roleUser', Sort.desc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy> thenByStatusUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusUser', Sort.asc);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QAfterSortBy>
      thenByStatusUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusUser', Sort.desc);
    });
  }
}

extension ModelUserIsarQueryWhereDistinct
    on QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct> {
  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct>
      distinctByCreatedUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdUser');
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct> distinctByEmailUser(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'emailUser', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct> distinctByIdBranchUser(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idBranchUser', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct> distinctByIdUser(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idUser', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct> distinctByNameUser(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameUser', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct> distinctByNoteUser(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'noteUser', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct> distinctByPhoneUser(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phoneUser', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct> distinctByRoleUser(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roleUser', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelUserIsar, ModelUserIsar, QDistinct> distinctByStatusUser(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statusUser', caseSensitive: caseSensitive);
    });
  }
}

extension ModelUserIsarQueryProperty
    on QueryBuilder<ModelUserIsar, ModelUserIsar, QQueryProperty> {
  QueryBuilder<ModelUserIsar, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ModelUserIsar, DateTime?, QQueryOperations>
      createdUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdUser');
    });
  }

  QueryBuilder<ModelUserIsar, String, QQueryOperations> emailUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'emailUser');
    });
  }

  QueryBuilder<ModelUserIsar, String?, QQueryOperations>
      idBranchUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idBranchUser');
    });
  }

  QueryBuilder<ModelUserIsar, String, QQueryOperations> idUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idUser');
    });
  }

  QueryBuilder<ModelUserIsar, String, QQueryOperations> nameUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameUser');
    });
  }

  QueryBuilder<ModelUserIsar, String?, QQueryOperations> noteUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'noteUser');
    });
  }

  QueryBuilder<ModelUserIsar, List<ModelPermissionUserIsar>, QQueryOperations>
      permissionsUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'permissionsUser');
    });
  }

  QueryBuilder<ModelUserIsar, String, QQueryOperations> phoneUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phoneUser');
    });
  }

  QueryBuilder<ModelUserIsar, String, QQueryOperations> roleUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roleUser');
    });
  }

  QueryBuilder<ModelUserIsar, String, QQueryOperations> statusUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statusUser');
    });
  }
}
