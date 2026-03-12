// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_item_batch_isar.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ModelItemBatchIsarSchema = Schema(
  name: r'ModelItemBatchIsar',
  id: -481869875620581432,
  properties: {
    r'date_buy': PropertySchema(
      id: 0,
      name: r'date_buy',
      type: IsarType.dateTime,
    ),
    r'discountItem': PropertySchema(
      id: 1,
      name: r'discountItem',
      type: IsarType.long,
    ),
    r'expiredDate': PropertySchema(
      id: 2,
      name: r'expiredDate',
      type: IsarType.dateTime,
    ),
    r'idBranch': PropertySchema(
      id: 3,
      name: r'idBranch',
      type: IsarType.string,
    ),
    r'idCategoryItem': PropertySchema(
      id: 4,
      name: r'idCategoryItem',
      type: IsarType.string,
    ),
    r'idItem': PropertySchema(id: 5, name: r'idItem', type: IsarType.string),
    r'idOrdered': PropertySchema(
      id: 6,
      name: r'idOrdered',
      type: IsarType.string,
    ),
    r'invoice': PropertySchema(id: 7, name: r'invoice', type: IsarType.string),
    r'nameItem': PropertySchema(
      id: 8,
      name: r'nameItem',
      type: IsarType.string,
    ),
    r'note': PropertySchema(id: 9, name: r'note', type: IsarType.string),
    r'priceItem': PropertySchema(
      id: 10,
      name: r'priceItem',
      type: IsarType.double,
    ),
    r'priceItemFinal': PropertySchema(
      id: 11,
      name: r'priceItemFinal',
      type: IsarType.double,
    ),
    r'priceitemBuy': PropertySchema(
      id: 12,
      name: r'priceitemBuy',
      type: IsarType.double,
    ),
    r'qtyItem_in': PropertySchema(
      id: 13,
      name: r'qtyItem_in',
      type: IsarType.double,
    ),
    r'qtyItem_out': PropertySchema(
      id: 14,
      name: r'qtyItem_out',
      type: IsarType.double,
    ),
    r'subTotal': PropertySchema(
      id: 15,
      name: r'subTotal',
      type: IsarType.double,
    ),
  },
  estimateSize: _modelItemBatchIsarEstimateSize,
  serialize: _modelItemBatchIsarSerialize,
  deserialize: _modelItemBatchIsarDeserialize,
  deserializeProp: _modelItemBatchIsarDeserializeProp,
);

int _modelItemBatchIsarEstimateSize(
  ModelItemBatchIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.idBranch.length * 3;
  bytesCount += 3 + object.idCategoryItem.length * 3;
  bytesCount += 3 + object.idItem.length * 3;
  bytesCount += 3 + object.idOrdered.length * 3;
  bytesCount += 3 + object.invoice.length * 3;
  bytesCount += 3 + object.nameItem.length * 3;
  bytesCount += 3 + object.note.length * 3;
  return bytesCount;
}

void _modelItemBatchIsarSerialize(
  ModelItemBatchIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.date_buy);
  writer.writeLong(offsets[1], object.discountItem);
  writer.writeDateTime(offsets[2], object.expiredDate);
  writer.writeString(offsets[3], object.idBranch);
  writer.writeString(offsets[4], object.idCategoryItem);
  writer.writeString(offsets[5], object.idItem);
  writer.writeString(offsets[6], object.idOrdered);
  writer.writeString(offsets[7], object.invoice);
  writer.writeString(offsets[8], object.nameItem);
  writer.writeString(offsets[9], object.note);
  writer.writeDouble(offsets[10], object.priceItem);
  writer.writeDouble(offsets[11], object.priceItemFinal);
  writer.writeDouble(offsets[12], object.priceitemBuy);
  writer.writeDouble(offsets[13], object.qtyItem_in);
  writer.writeDouble(offsets[14], object.qtyItem_out);
  writer.writeDouble(offsets[15], object.subTotal);
}

ModelItemBatchIsar _modelItemBatchIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelItemBatchIsar();
  object.date_buy = reader.readDateTime(offsets[0]);
  object.discountItem = reader.readLong(offsets[1]);
  object.expiredDate = reader.readDateTimeOrNull(offsets[2]);
  object.idBranch = reader.readString(offsets[3]);
  object.idCategoryItem = reader.readString(offsets[4]);
  object.idItem = reader.readString(offsets[5]);
  object.idOrdered = reader.readString(offsets[6]);
  object.invoice = reader.readString(offsets[7]);
  object.nameItem = reader.readString(offsets[8]);
  object.note = reader.readString(offsets[9]);
  object.priceItem = reader.readDouble(offsets[10]);
  object.priceItemFinal = reader.readDouble(offsets[11]);
  object.priceitemBuy = reader.readDouble(offsets[12]);
  object.qtyItem_in = reader.readDouble(offsets[13]);
  object.qtyItem_out = reader.readDouble(offsets[14]);
  object.subTotal = reader.readDouble(offsets[15]);
  return object;
}

P _modelItemBatchIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
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
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    case 13:
      return (reader.readDouble(offset)) as P;
    case 14:
      return (reader.readDouble(offset)) as P;
    case 15:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ModelItemBatchIsarQueryFilter
    on QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QFilterCondition> {
  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  date_buyEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'date_buy', value: value),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  date_buyGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'date_buy',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  date_buyLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'date_buy',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  date_buyBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'date_buy',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  discountItemEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'discountItem', value: value),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  discountItemGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'discountItem',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  discountItemLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'discountItem',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  discountItemBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'discountItem',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  expiredDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'expiredDate'),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  expiredDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'expiredDate'),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  expiredDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'expiredDate', value: value),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  expiredDateGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'expiredDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  expiredDateLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'expiredDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  expiredDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'expiredDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idBranchEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'idBranch',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idBranchGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'idBranch',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idBranchLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'idBranch',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idBranchBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'idBranch',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idBranchStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'idBranch',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idBranchEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'idBranch',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idBranchContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'idBranch',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idBranchMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'idBranch',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idBranchIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'idBranch', value: ''),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idBranchIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'idBranch', value: ''),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idCategoryItemEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'idCategoryItem',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idCategoryItemGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'idCategoryItem',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idCategoryItemLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'idCategoryItem',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idCategoryItemBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'idCategoryItem',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idCategoryItemStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'idCategoryItem',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idCategoryItemEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'idCategoryItem',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idCategoryItemContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'idCategoryItem',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idCategoryItemMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'idCategoryItem',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idCategoryItemIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'idCategoryItem', value: ''),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idCategoryItemIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'idCategoryItem', value: ''),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idItemEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'idItem',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idItemGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'idItem',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idItemLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'idItem',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idItemBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'idItem',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idItemStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'idItem',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idItemEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'idItem',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idItemContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'idItem',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idItemMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'idItem',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idItemIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'idItem', value: ''),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idItemIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'idItem', value: ''),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idOrderedEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'idOrdered',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idOrderedGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'idOrdered',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idOrderedLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'idOrdered',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idOrderedBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'idOrdered',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idOrderedStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'idOrdered',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idOrderedEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'idOrdered',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idOrderedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'idOrdered',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idOrderedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'idOrdered',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idOrderedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'idOrdered', value: ''),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  idOrderedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'idOrdered', value: ''),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  invoiceEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'invoice',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  invoiceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'invoice',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  invoiceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'invoice',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  invoiceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'invoice',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  invoiceStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'invoice',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  invoiceEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'invoice',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  invoiceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'invoice',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  invoiceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'invoice',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  invoiceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'invoice', value: ''),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  invoiceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'invoice', value: ''),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  nameItemEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'nameItem',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  nameItemGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'nameItem',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  nameItemLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'nameItem',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  nameItemBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'nameItem',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  nameItemStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'nameItem',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  nameItemEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'nameItem',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  nameItemContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'nameItem',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  nameItemMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'nameItem',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  nameItemIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'nameItem', value: ''),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  nameItemIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'nameItem', value: ''),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  noteEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  noteGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  noteLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  noteBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'note',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  noteStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  noteEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  noteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  noteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'note',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'note', value: ''),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'note', value: ''),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  priceItemEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'priceItem',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  priceItemGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'priceItem',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  priceItemLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'priceItem',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  priceItemBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'priceItem',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  priceItemFinalEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'priceItemFinal',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  priceItemFinalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'priceItemFinal',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  priceItemFinalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'priceItemFinal',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  priceItemFinalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'priceItemFinal',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  priceitemBuyEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'priceitemBuy',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  priceitemBuyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'priceitemBuy',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  priceitemBuyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'priceitemBuy',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  priceitemBuyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'priceitemBuy',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  qtyItem_inEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'qtyItem_in',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  qtyItem_inGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'qtyItem_in',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  qtyItem_inLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'qtyItem_in',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  qtyItem_inBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'qtyItem_in',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  qtyItem_outEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'qtyItem_out',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  qtyItem_outGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'qtyItem_out',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  qtyItem_outLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'qtyItem_out',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  qtyItem_outBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'qtyItem_out',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  subTotalEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'subTotal',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  subTotalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'subTotal',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  subTotalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'subTotal',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QAfterFilterCondition>
  subTotalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'subTotal',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }
}

extension ModelItemBatchIsarQueryObject
    on QueryBuilder<ModelItemBatchIsar, ModelItemBatchIsar, QFilterCondition> {}
