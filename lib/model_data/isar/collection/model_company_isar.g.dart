// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_company_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModelCompanyIsarCollection on Isar {
  IsarCollection<ModelCompanyIsar> get modelCompanyIsars => this.collection();
}

const ModelCompanyIsarSchema = CollectionSchema(
  name: r'ModelCompanyIsar',
  id: -6390537709224535917,
  properties: {
    r'created': PropertySchema(
      id: 0,
      name: r'created',
      type: IsarType.dateTime,
    ),
    r'footer': PropertySchema(
      id: 1,
      name: r'footer',
      type: IsarType.string,
    ),
    r'header': PropertySchema(
      id: 2,
      name: r'header',
      type: IsarType.string,
    ),
    r'listBranch': PropertySchema(
      id: 3,
      name: r'listBranch',
      type: IsarType.objectList,
      target: r'ModelBranchIsar',
    ),
    r'nameCompany': PropertySchema(
      id: 4,
      name: r'nameCompany',
      type: IsarType.string,
    ),
    r'phoneCompany': PropertySchema(
      id: 5,
      name: r'phoneCompany',
      type: IsarType.string,
    )
  },
  estimateSize: _modelCompanyIsarEstimateSize,
  serialize: _modelCompanyIsarSerialize,
  deserialize: _modelCompanyIsarDeserialize,
  deserializeProp: _modelCompanyIsarDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {r'ModelBranchIsar': ModelBranchIsarSchema},
  getId: _modelCompanyIsarGetId,
  getLinks: _modelCompanyIsarGetLinks,
  attach: _modelCompanyIsarAttach,
  version: '3.1.0+1',
);

int _modelCompanyIsarEstimateSize(
  ModelCompanyIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.footer.length * 3;
  bytesCount += 3 + object.header.length * 3;
  bytesCount += 3 + object.listBranch.length * 3;
  {
    final offsets = allOffsets[ModelBranchIsar]!;
    for (var i = 0; i < object.listBranch.length; i++) {
      final value = object.listBranch[i];
      bytesCount +=
          ModelBranchIsarSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.nameCompany.length * 3;
  bytesCount += 3 + object.phoneCompany.length * 3;
  return bytesCount;
}

void _modelCompanyIsarSerialize(
  ModelCompanyIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.created);
  writer.writeString(offsets[1], object.footer);
  writer.writeString(offsets[2], object.header);
  writer.writeObjectList<ModelBranchIsar>(
    offsets[3],
    allOffsets,
    ModelBranchIsarSchema.serialize,
    object.listBranch,
  );
  writer.writeString(offsets[4], object.nameCompany);
  writer.writeString(offsets[5], object.phoneCompany);
}

ModelCompanyIsar _modelCompanyIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelCompanyIsar();
  object.created = reader.readDateTime(offsets[0]);
  object.footer = reader.readString(offsets[1]);
  object.header = reader.readString(offsets[2]);
  object.isarId = id;
  object.listBranch = reader.readObjectList<ModelBranchIsar>(
        offsets[3],
        ModelBranchIsarSchema.deserialize,
        allOffsets,
        ModelBranchIsar(),
      ) ??
      [];
  object.nameCompany = reader.readString(offsets[4]);
  object.phoneCompany = reader.readString(offsets[5]);
  return object;
}

P _modelCompanyIsarDeserializeProp<P>(
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
      return (reader.readObjectList<ModelBranchIsar>(
            offset,
            ModelBranchIsarSchema.deserialize,
            allOffsets,
            ModelBranchIsar(),
          ) ??
          []) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _modelCompanyIsarGetId(ModelCompanyIsar object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _modelCompanyIsarGetLinks(ModelCompanyIsar object) {
  return [];
}

void _modelCompanyIsarAttach(
    IsarCollection<dynamic> col, Id id, ModelCompanyIsar object) {
  object.isarId = id;
}

extension ModelCompanyIsarQueryWhereSort
    on QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QWhere> {
  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModelCompanyIsarQueryWhere
    on QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QWhereClause> {
  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterWhereClause>
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

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterWhereClause>
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
}

extension ModelCompanyIsarQueryFilter
    on QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QFilterCondition> {
  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      createdEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'created',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      createdGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'created',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      createdLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'created',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      createdBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'created',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      footerEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'footer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      footerGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'footer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      footerLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'footer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      footerBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'footer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      footerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'footer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      footerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'footer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      footerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'footer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      footerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'footer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      footerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'footer',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      footerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'footer',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      headerEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'header',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      headerGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'header',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      headerLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'header',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      headerBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'header',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      headerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'header',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      headerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'header',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      headerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'header',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      headerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'header',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      headerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'header',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      headerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'header',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
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

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      listBranchLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listBranch',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      listBranchIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listBranch',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      listBranchIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listBranch',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      listBranchLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listBranch',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      listBranchLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listBranch',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      listBranchLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listBranch',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      nameCompanyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameCompany',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      nameCompanyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nameCompany',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      nameCompanyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nameCompany',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      nameCompanyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nameCompany',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      nameCompanyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nameCompany',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      nameCompanyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nameCompany',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      nameCompanyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nameCompany',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      nameCompanyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nameCompany',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      nameCompanyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameCompany',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      nameCompanyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameCompany',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      phoneCompanyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneCompany',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      phoneCompanyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phoneCompany',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      phoneCompanyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phoneCompany',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      phoneCompanyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phoneCompany',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      phoneCompanyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phoneCompany',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      phoneCompanyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phoneCompany',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      phoneCompanyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phoneCompany',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      phoneCompanyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phoneCompany',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      phoneCompanyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneCompany',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      phoneCompanyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phoneCompany',
        value: '',
      ));
    });
  }
}

extension ModelCompanyIsarQueryObject
    on QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QFilterCondition> {
  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterFilterCondition>
      listBranchElement(FilterQuery<ModelBranchIsar> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'listBranch');
    });
  }
}

extension ModelCompanyIsarQueryLinks
    on QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QFilterCondition> {}

extension ModelCompanyIsarQuerySortBy
    on QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QSortBy> {
  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterSortBy>
      sortByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.asc);
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterSortBy>
      sortByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.desc);
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterSortBy>
      sortByFooter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'footer', Sort.asc);
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterSortBy>
      sortByFooterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'footer', Sort.desc);
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterSortBy>
      sortByHeader() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'header', Sort.asc);
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterSortBy>
      sortByHeaderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'header', Sort.desc);
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterSortBy>
      sortByNameCompany() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameCompany', Sort.asc);
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterSortBy>
      sortByNameCompanyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameCompany', Sort.desc);
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterSortBy>
      sortByPhoneCompany() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneCompany', Sort.asc);
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterSortBy>
      sortByPhoneCompanyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneCompany', Sort.desc);
    });
  }
}

extension ModelCompanyIsarQuerySortThenBy
    on QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QSortThenBy> {
  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterSortBy>
      thenByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.asc);
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterSortBy>
      thenByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.desc);
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterSortBy>
      thenByFooter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'footer', Sort.asc);
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterSortBy>
      thenByFooterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'footer', Sort.desc);
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterSortBy>
      thenByHeader() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'header', Sort.asc);
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterSortBy>
      thenByHeaderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'header', Sort.desc);
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterSortBy>
      thenByNameCompany() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameCompany', Sort.asc);
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterSortBy>
      thenByNameCompanyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameCompany', Sort.desc);
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterSortBy>
      thenByPhoneCompany() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneCompany', Sort.asc);
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QAfterSortBy>
      thenByPhoneCompanyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneCompany', Sort.desc);
    });
  }
}

extension ModelCompanyIsarQueryWhereDistinct
    on QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QDistinct> {
  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QDistinct>
      distinctByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'created');
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QDistinct> distinctByFooter(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'footer', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QDistinct> distinctByHeader(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'header', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QDistinct>
      distinctByNameCompany({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameCompany', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QDistinct>
      distinctByPhoneCompany({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phoneCompany', caseSensitive: caseSensitive);
    });
  }
}

extension ModelCompanyIsarQueryProperty
    on QueryBuilder<ModelCompanyIsar, ModelCompanyIsar, QQueryProperty> {
  QueryBuilder<ModelCompanyIsar, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ModelCompanyIsar, DateTime, QQueryOperations> createdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'created');
    });
  }

  QueryBuilder<ModelCompanyIsar, String, QQueryOperations> footerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'footer');
    });
  }

  QueryBuilder<ModelCompanyIsar, String, QQueryOperations> headerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'header');
    });
  }

  QueryBuilder<ModelCompanyIsar, List<ModelBranchIsar>, QQueryOperations>
      listBranchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'listBranch');
    });
  }

  QueryBuilder<ModelCompanyIsar, String, QQueryOperations>
      nameCompanyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameCompany');
    });
  }

  QueryBuilder<ModelCompanyIsar, String, QQueryOperations>
      phoneCompanyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phoneCompany');
    });
  }
}
