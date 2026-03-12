// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_split_isar.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ModelSplitIsarSchema = Schema(
  name: r'ModelSplitIsar',
  id: -8243970956386450515,
  properties: {
    r'paymentDebitName': PropertySchema(
      id: 0,
      name: r'paymentDebitName',
      type: IsarType.string,
    ),
    r'paymentInvoice': PropertySchema(
      id: 1,
      name: r'paymentInvoice',
      type: IsarType.string,
    ),
    r'paymentName': PropertySchema(
      id: 2,
      name: r'paymentName',
      type: IsarType.string,
    ),
    r'paymentTotal': PropertySchema(
      id: 3,
      name: r'paymentTotal',
      type: IsarType.double,
    )
  },
  estimateSize: _modelSplitIsarEstimateSize,
  serialize: _modelSplitIsarSerialize,
  deserialize: _modelSplitIsarDeserialize,
  deserializeProp: _modelSplitIsarDeserializeProp,
);

int _modelSplitIsarEstimateSize(
  ModelSplitIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.paymentDebitName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.paymentInvoice.length * 3;
  bytesCount += 3 + object.paymentName.length * 3;
  return bytesCount;
}

void _modelSplitIsarSerialize(
  ModelSplitIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.paymentDebitName);
  writer.writeString(offsets[1], object.paymentInvoice);
  writer.writeString(offsets[2], object.paymentName);
  writer.writeDouble(offsets[3], object.paymentTotal);
}

ModelSplitIsar _modelSplitIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelSplitIsar();
  object.paymentDebitName = reader.readStringOrNull(offsets[0]);
  object.paymentInvoice = reader.readString(offsets[1]);
  object.paymentName = reader.readString(offsets[2]);
  object.paymentTotal = reader.readDouble(offsets[3]);
  return object;
}

P _modelSplitIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ModelSplitIsarQueryFilter
    on QueryBuilder<ModelSplitIsar, ModelSplitIsar, QFilterCondition> {
  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentDebitNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'paymentDebitName',
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentDebitNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'paymentDebitName',
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentDebitNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentDebitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentDebitNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paymentDebitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentDebitNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paymentDebitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentDebitNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paymentDebitName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentDebitNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'paymentDebitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentDebitNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'paymentDebitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentDebitNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'paymentDebitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentDebitNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'paymentDebitName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentDebitNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentDebitName',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentDebitNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'paymentDebitName',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentInvoiceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentInvoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentInvoiceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paymentInvoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentInvoiceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paymentInvoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentInvoiceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paymentInvoice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentInvoiceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'paymentInvoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentInvoiceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'paymentInvoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentInvoiceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'paymentInvoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentInvoiceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'paymentInvoice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentInvoiceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentInvoice',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentInvoiceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'paymentInvoice',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paymentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paymentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paymentName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'paymentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'paymentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'paymentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'paymentName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentName',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'paymentName',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentTotalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentTotalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paymentTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentTotalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paymentTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelSplitIsar, ModelSplitIsar, QAfterFilterCondition>
      paymentTotalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paymentTotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension ModelSplitIsarQueryObject
    on QueryBuilder<ModelSplitIsar, ModelSplitIsar, QFilterCondition> {}
