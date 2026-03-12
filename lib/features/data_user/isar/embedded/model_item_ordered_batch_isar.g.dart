// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_item_ordered_batch_isar.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ModelItemOrderedBatchIsarSchema = Schema(
  name: r'ModelItemOrderedBatchIsar',
  id: -7323358213700302443,
  properties: {
    r'id_item': PropertySchema(
      id: 0,
      name: r'id_item',
      type: IsarType.string,
    ),
    r'id_ordered': PropertySchema(
      id: 1,
      name: r'id_ordered',
      type: IsarType.string,
    ),
    r'invoice': PropertySchema(
      id: 2,
      name: r'invoice',
      type: IsarType.string,
    ),
    r'isNegative': PropertySchema(
      id: 3,
      name: r'isNegative',
      type: IsarType.bool,
    ),
    r'price_item': PropertySchema(
      id: 4,
      name: r'price_item',
      type: IsarType.double,
    ),
    r'price_itemBuy': PropertySchema(
      id: 5,
      name: r'price_itemBuy',
      type: IsarType.double,
    ),
    r'qty_item': PropertySchema(
      id: 6,
      name: r'qty_item',
      type: IsarType.double,
    )
  },
  estimateSize: _modelItemOrderedBatchIsarEstimateSize,
  serialize: _modelItemOrderedBatchIsarSerialize,
  deserialize: _modelItemOrderedBatchIsarDeserialize,
  deserializeProp: _modelItemOrderedBatchIsarDeserializeProp,
);

int _modelItemOrderedBatchIsarEstimateSize(
  ModelItemOrderedBatchIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.id_item.length * 3;
  bytesCount += 3 + object.id_ordered.length * 3;
  bytesCount += 3 + object.invoice.length * 3;
  return bytesCount;
}

void _modelItemOrderedBatchIsarSerialize(
  ModelItemOrderedBatchIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.id_item);
  writer.writeString(offsets[1], object.id_ordered);
  writer.writeString(offsets[2], object.invoice);
  writer.writeBool(offsets[3], object.isNegative);
  writer.writeDouble(offsets[4], object.price_item);
  writer.writeDouble(offsets[5], object.price_itemBuy);
  writer.writeDouble(offsets[6], object.qty_item);
}

ModelItemOrderedBatchIsar _modelItemOrderedBatchIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelItemOrderedBatchIsar();
  object.id_item = reader.readString(offsets[0]);
  object.id_ordered = reader.readString(offsets[1]);
  object.invoice = reader.readString(offsets[2]);
  object.isNegative = reader.readBool(offsets[3]);
  object.price_item = reader.readDouble(offsets[4]);
  object.price_itemBuy = reader.readDouble(offsets[5]);
  object.qty_item = reader.readDouble(offsets[6]);
  return object;
}

P _modelItemOrderedBatchIsarDeserializeProp<P>(
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
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ModelItemOrderedBatchIsarQueryFilter on QueryBuilder<
    ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar, QFilterCondition> {
  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> id_itemEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_item',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> id_itemGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_item',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> id_itemLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_item',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> id_itemBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_item',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> id_itemStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id_item',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> id_itemEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id_item',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
          QAfterFilterCondition>
      id_itemContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id_item',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
          QAfterFilterCondition>
      id_itemMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id_item',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> id_itemIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_item',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> id_itemIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id_item',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> id_orderedEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_ordered',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> id_orderedGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_ordered',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> id_orderedLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_ordered',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> id_orderedBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_ordered',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> id_orderedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id_ordered',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> id_orderedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id_ordered',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
          QAfterFilterCondition>
      id_orderedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id_ordered',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
          QAfterFilterCondition>
      id_orderedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id_ordered',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> id_orderedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_ordered',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> id_orderedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id_ordered',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> invoiceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> invoiceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'invoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> invoiceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'invoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> invoiceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'invoice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> invoiceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'invoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> invoiceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'invoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
          QAfterFilterCondition>
      invoiceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'invoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
          QAfterFilterCondition>
      invoiceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'invoice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> invoiceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoice',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> invoiceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'invoice',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> isNegativeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isNegative',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> price_itemEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'price_item',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> price_itemGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'price_item',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> price_itemLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'price_item',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> price_itemBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'price_item',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> price_itemBuyEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'price_itemBuy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> price_itemBuyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'price_itemBuy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> price_itemBuyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'price_itemBuy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> price_itemBuyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'price_itemBuy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> qty_itemEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qty_item',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> qty_itemGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qty_item',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> qty_itemLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qty_item',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar,
      QAfterFilterCondition> qty_itemBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qty_item',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension ModelItemOrderedBatchIsarQueryObject on QueryBuilder<
    ModelItemOrderedBatchIsar, ModelItemOrderedBatchIsar, QFilterCondition> {}
