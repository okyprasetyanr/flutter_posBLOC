// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_item_ordered_isar.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ModelItemOrderedIsarSchema = Schema(
  name: r'ModelItemOrderedIsar',
  id: 7937740860170519296,
  properties: {
    r'condiment': PropertySchema(
      id: 0,
      name: r'condiment',
      type: IsarType.objectList,
      target: r'ModelItemOrderedIsar',
    ),
    r'dateBuy': PropertySchema(
      id: 1,
      name: r'dateBuy',
      type: IsarType.dateTime,
    ),
    r'discountItem': PropertySchema(
      id: 2,
      name: r'discountItem',
      type: IsarType.long,
    ),
    r'expiredDate': PropertySchema(
      id: 3,
      name: r'expiredDate',
      type: IsarType.dateTime,
    ),
    r'idBranch': PropertySchema(
      id: 4,
      name: r'idBranch',
      type: IsarType.string,
    ),
    r'idCategoryItem': PropertySchema(
      id: 5,
      name: r'idCategoryItem',
      type: IsarType.string,
    ),
    r'idItem': PropertySchema(
      id: 6,
      name: r'idItem',
      type: IsarType.string,
    ),
    r'idOrdered': PropertySchema(
      id: 7,
      name: r'idOrdered',
      type: IsarType.string,
    ),
    r'invoice': PropertySchema(
      id: 8,
      name: r'invoice',
      type: IsarType.string,
    ),
    r'itemOrderedBatch': PropertySchema(
      id: 9,
      name: r'itemOrderedBatch',
      type: IsarType.objectList,
      target: r'ModelItemOrderedBatchIsar',
    ),
    r'nameItem': PropertySchema(
      id: 10,
      name: r'nameItem',
      type: IsarType.string,
    ),
    r'note': PropertySchema(
      id: 11,
      name: r'note',
      type: IsarType.string,
    ),
    r'priceItem': PropertySchema(
      id: 12,
      name: r'priceItem',
      type: IsarType.double,
    ),
    r'priceItemBuy': PropertySchema(
      id: 13,
      name: r'priceItemBuy',
      type: IsarType.double,
    ),
    r'priceItemFinal': PropertySchema(
      id: 14,
      name: r'priceItemFinal',
      type: IsarType.double,
    ),
    r'qtyItem': PropertySchema(
      id: 15,
      name: r'qtyItem',
      type: IsarType.double,
    ),
    r'subTotal': PropertySchema(
      id: 16,
      name: r'subTotal',
      type: IsarType.double,
    )
  },
  estimateSize: _modelItemOrderedIsarEstimateSize,
  serialize: _modelItemOrderedIsarSerialize,
  deserialize: _modelItemOrderedIsarDeserialize,
  deserializeProp: _modelItemOrderedIsarDeserializeProp,
);

int _modelItemOrderedIsarEstimateSize(
  ModelItemOrderedIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.condiment.length * 3;
  {
    final offsets = allOffsets[ModelItemOrderedIsar]!;
    for (var i = 0; i < object.condiment.length; i++) {
      final value = object.condiment[i];
      bytesCount +=
          ModelItemOrderedIsarSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.idBranch.length * 3;
  bytesCount += 3 + object.idCategoryItem.length * 3;
  bytesCount += 3 + object.idItem.length * 3;
  bytesCount += 3 + object.idOrdered.length * 3;
  {
    final value = object.invoice;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.itemOrderedBatch.length * 3;
  {
    final offsets = allOffsets[ModelItemOrderedBatchIsar]!;
    for (var i = 0; i < object.itemOrderedBatch.length; i++) {
      final value = object.itemOrderedBatch[i];
      bytesCount += ModelItemOrderedBatchIsarSchema.estimateSize(
          value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.nameItem.length * 3;
  bytesCount += 3 + object.note.length * 3;
  return bytesCount;
}

void _modelItemOrderedIsarSerialize(
  ModelItemOrderedIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<ModelItemOrderedIsar>(
    offsets[0],
    allOffsets,
    ModelItemOrderedIsarSchema.serialize,
    object.condiment,
  );
  writer.writeDateTime(offsets[1], object.dateBuy);
  writer.writeLong(offsets[2], object.discountItem);
  writer.writeDateTime(offsets[3], object.expiredDate);
  writer.writeString(offsets[4], object.idBranch);
  writer.writeString(offsets[5], object.idCategoryItem);
  writer.writeString(offsets[6], object.idItem);
  writer.writeString(offsets[7], object.idOrdered);
  writer.writeString(offsets[8], object.invoice);
  writer.writeObjectList<ModelItemOrderedBatchIsar>(
    offsets[9],
    allOffsets,
    ModelItemOrderedBatchIsarSchema.serialize,
    object.itemOrderedBatch,
  );
  writer.writeString(offsets[10], object.nameItem);
  writer.writeString(offsets[11], object.note);
  writer.writeDouble(offsets[12], object.priceItem);
  writer.writeDouble(offsets[13], object.priceItemBuy);
  writer.writeDouble(offsets[14], object.priceItemFinal);
  writer.writeDouble(offsets[15], object.qtyItem);
  writer.writeDouble(offsets[16], object.subTotal);
}

ModelItemOrderedIsar _modelItemOrderedIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelItemOrderedIsar();
  object.condiment = reader.readObjectList<ModelItemOrderedIsar>(
        offsets[0],
        ModelItemOrderedIsarSchema.deserialize,
        allOffsets,
        ModelItemOrderedIsar(),
      ) ??
      [];
  object.dateBuy = reader.readDateTimeOrNull(offsets[1]);
  object.discountItem = reader.readLong(offsets[2]);
  object.expiredDate = reader.readDateTimeOrNull(offsets[3]);
  object.idBranch = reader.readString(offsets[4]);
  object.idCategoryItem = reader.readString(offsets[5]);
  object.idItem = reader.readString(offsets[6]);
  object.idOrdered = reader.readString(offsets[7]);
  object.invoice = reader.readStringOrNull(offsets[8]);
  object.itemOrderedBatch = reader.readObjectList<ModelItemOrderedBatchIsar>(
        offsets[9],
        ModelItemOrderedBatchIsarSchema.deserialize,
        allOffsets,
        ModelItemOrderedBatchIsar(),
      ) ??
      [];
  object.nameItem = reader.readString(offsets[10]);
  object.note = reader.readString(offsets[11]);
  object.priceItem = reader.readDouble(offsets[12]);
  object.priceItemBuy = reader.readDouble(offsets[13]);
  object.priceItemFinal = reader.readDouble(offsets[14]);
  object.qtyItem = reader.readDouble(offsets[15]);
  object.subTotal = reader.readDouble(offsets[16]);
  return object;
}

P _modelItemOrderedIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<ModelItemOrderedIsar>(
            offset,
            ModelItemOrderedIsarSchema.deserialize,
            allOffsets,
            ModelItemOrderedIsar(),
          ) ??
          []) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readObjectList<ModelItemOrderedBatchIsar>(
            offset,
            ModelItemOrderedBatchIsarSchema.deserialize,
            allOffsets,
            ModelItemOrderedBatchIsar(),
          ) ??
          []) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    case 13:
      return (reader.readDouble(offset)) as P;
    case 14:
      return (reader.readDouble(offset)) as P;
    case 15:
      return (reader.readDouble(offset)) as P;
    case 16:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ModelItemOrderedIsarQueryFilter on QueryBuilder<ModelItemOrderedIsar,
    ModelItemOrderedIsar, QFilterCondition> {
  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> condimentLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'condiment',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> condimentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'condiment',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> condimentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'condiment',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> condimentLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'condiment',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> condimentLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'condiment',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> condimentLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'condiment',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> dateBuyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateBuy',
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> dateBuyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateBuy',
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> dateBuyEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateBuy',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> dateBuyGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateBuy',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> dateBuyLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateBuy',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> dateBuyBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateBuy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> discountItemEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountItem',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> discountItemGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discountItem',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> discountItemLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discountItem',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> discountItemBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discountItem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> expiredDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expiredDate',
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> expiredDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expiredDate',
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> expiredDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiredDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> expiredDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expiredDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> expiredDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expiredDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> expiredDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expiredDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idBranchEqualTo(
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

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idBranchGreaterThan(
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

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idBranchLessThan(
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

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idBranchBetween(
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

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idBranchStartsWith(
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

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idBranchEndsWith(
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

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
          QAfterFilterCondition>
      idBranchContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idBranch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
          QAfterFilterCondition>
      idBranchMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idBranch',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idBranchIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idBranchIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idBranch',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idCategoryItemEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idCategoryItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idCategoryItemGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idCategoryItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idCategoryItemLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idCategoryItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idCategoryItemBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idCategoryItem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idCategoryItemStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idCategoryItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idCategoryItemEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idCategoryItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
          QAfterFilterCondition>
      idCategoryItemContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idCategoryItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
          QAfterFilterCondition>
      idCategoryItemMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idCategoryItem',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idCategoryItemIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idCategoryItem',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idCategoryItemIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idCategoryItem',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idItemEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idItemGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idItemLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idItemBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idItem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idItemStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idItemEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
          QAfterFilterCondition>
      idItemContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
          QAfterFilterCondition>
      idItemMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idItem',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idItemIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idItem',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idItemIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idItem',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idOrderedEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idOrdered',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idOrderedGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idOrdered',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idOrderedLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idOrdered',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idOrderedBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idOrdered',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idOrderedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idOrdered',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idOrderedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idOrdered',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
          QAfterFilterCondition>
      idOrderedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idOrdered',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
          QAfterFilterCondition>
      idOrderedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idOrdered',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idOrderedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idOrdered',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> idOrderedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idOrdered',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> invoiceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'invoice',
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> invoiceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'invoice',
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> invoiceEqualTo(
    String? value, {
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

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> invoiceGreaterThan(
    String? value, {
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

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> invoiceLessThan(
    String? value, {
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

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> invoiceBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
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

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
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

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
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

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
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

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> invoiceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoice',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> invoiceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'invoice',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> itemOrderedBatchLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemOrderedBatch',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> itemOrderedBatchIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemOrderedBatch',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> itemOrderedBatchIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemOrderedBatch',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> itemOrderedBatchLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemOrderedBatch',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> itemOrderedBatchLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemOrderedBatch',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> itemOrderedBatchLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemOrderedBatch',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> nameItemEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> nameItemGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nameItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> nameItemLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nameItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> nameItemBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nameItem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> nameItemStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nameItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> nameItemEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nameItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
          QAfterFilterCondition>
      nameItemContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nameItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
          QAfterFilterCondition>
      nameItemMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nameItem',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> nameItemIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameItem',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> nameItemIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameItem',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> noteEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> noteGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> noteLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> noteBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'note',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> noteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> noteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
          QAfterFilterCondition>
      noteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
          QAfterFilterCondition>
      noteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'note',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> priceItemEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priceItem',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> priceItemGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'priceItem',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> priceItemLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'priceItem',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> priceItemBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'priceItem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> priceItemBuyEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priceItemBuy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> priceItemBuyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'priceItemBuy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> priceItemBuyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'priceItemBuy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> priceItemBuyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'priceItemBuy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> priceItemFinalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priceItemFinal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> priceItemFinalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'priceItemFinal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> priceItemFinalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'priceItemFinal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> priceItemFinalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'priceItemFinal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> qtyItemEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyItem',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> qtyItemGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtyItem',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> qtyItemLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtyItem',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> qtyItemBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtyItem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> subTotalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> subTotalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> subTotalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
      QAfterFilterCondition> subTotalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subTotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension ModelItemOrderedIsarQueryObject on QueryBuilder<ModelItemOrderedIsar,
    ModelItemOrderedIsar, QFilterCondition> {
  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
          QAfterFilterCondition>
      condimentElement(FilterQuery<ModelItemOrderedIsar> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'condiment');
    });
  }

  QueryBuilder<ModelItemOrderedIsar, ModelItemOrderedIsar,
          QAfterFilterCondition>
      itemOrderedBatchElement(FilterQuery<ModelItemOrderedBatchIsar> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'itemOrderedBatch');
    });
  }
}
