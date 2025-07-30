// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ItemSuggestionsTableTable extends ItemSuggestionsTable
    with TableInfo<$ItemSuggestionsTableTable, ItemSuggestionsRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemSuggestionsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 30),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameLowerMeta =
      const VerificationMeta('nameLower');
  @override
  late final GeneratedColumn<String> nameLower = GeneratedColumn<String>(
      'name_lower', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoriesMeta =
      const VerificationMeta('categories');
  @override
  late final GeneratedColumn<String> categories = GeneratedColumn<String>(
      'categories', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, nameLower, categories];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ItemSuggestions';
  @override
  VerificationContext validateIntegrity(Insertable<ItemSuggestionsRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('name_lower')) {
      context.handle(_nameLowerMeta,
          nameLower.isAcceptableOrUnknown(data['name_lower']!, _nameLowerMeta));
    } else if (isInserting) {
      context.missing(_nameLowerMeta);
    }
    if (data.containsKey('categories')) {
      context.handle(
          _categoriesMeta,
          categories.isAcceptableOrUnknown(
              data['categories']!, _categoriesMeta));
    } else if (isInserting) {
      context.missing(_categoriesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ItemSuggestionsRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemSuggestionsRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      nameLower: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_lower'])!,
      categories: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}categories'])!,
    );
  }

  @override
  $ItemSuggestionsTableTable createAlias(String alias) {
    return $ItemSuggestionsTableTable(attachedDatabase, alias);
  }
}

class ItemSuggestionsRow extends DataClass
    implements Insertable<ItemSuggestionsRow> {
  final String id;
  final String name;
  final String nameLower;
  final String categories;
  const ItemSuggestionsRow(
      {required this.id,
      required this.name,
      required this.nameLower,
      required this.categories});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['name_lower'] = Variable<String>(nameLower);
    map['categories'] = Variable<String>(categories);
    return map;
  }

  ItemSuggestionsTableCompanion toCompanion(bool nullToAbsent) {
    return ItemSuggestionsTableCompanion(
      id: Value(id),
      name: Value(name),
      nameLower: Value(nameLower),
      categories: Value(categories),
    );
  }

  factory ItemSuggestionsRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemSuggestionsRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      nameLower: serializer.fromJson<String>(json['nameLower']),
      categories: serializer.fromJson<String>(json['categories']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'nameLower': serializer.toJson<String>(nameLower),
      'categories': serializer.toJson<String>(categories),
    };
  }

  ItemSuggestionsRow copyWith(
          {String? id, String? name, String? nameLower, String? categories}) =>
      ItemSuggestionsRow(
        id: id ?? this.id,
        name: name ?? this.name,
        nameLower: nameLower ?? this.nameLower,
        categories: categories ?? this.categories,
      );
  ItemSuggestionsRow copyWithCompanion(ItemSuggestionsTableCompanion data) {
    return ItemSuggestionsRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      nameLower: data.nameLower.present ? data.nameLower.value : this.nameLower,
      categories:
          data.categories.present ? data.categories.value : this.categories,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ItemSuggestionsRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameLower: $nameLower, ')
          ..write('categories: $categories')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, nameLower, categories);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemSuggestionsRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.nameLower == this.nameLower &&
          other.categories == this.categories);
}

class ItemSuggestionsTableCompanion
    extends UpdateCompanion<ItemSuggestionsRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> nameLower;
  final Value<String> categories;
  final Value<int> rowid;
  const ItemSuggestionsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nameLower = const Value.absent(),
    this.categories = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ItemSuggestionsTableCompanion.insert({
    required String id,
    required String name,
    required String nameLower,
    required String categories,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        nameLower = Value(nameLower),
        categories = Value(categories);
  static Insertable<ItemSuggestionsRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? nameLower,
    Expression<String>? categories,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (nameLower != null) 'name_lower': nameLower,
      if (categories != null) 'categories': categories,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ItemSuggestionsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? nameLower,
      Value<String>? categories,
      Value<int>? rowid}) {
    return ItemSuggestionsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      nameLower: nameLower ?? this.nameLower,
      categories: categories ?? this.categories,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nameLower.present) {
      map['name_lower'] = Variable<String>(nameLower.value);
    }
    if (categories.present) {
      map['categories'] = Variable<String>(categories.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemSuggestionsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameLower: $nameLower, ')
          ..write('categories: $categories, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CategorySuggestionsTableTable extends CategorySuggestionsTable
    with TableInfo<$CategorySuggestionsTableTable, CategorySuggestionsRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategorySuggestionsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 30),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameLowerMeta =
      const VerificationMeta('nameLower');
  @override
  late final GeneratedColumn<String> nameLower = GeneratedColumn<String>(
      'name_lower', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, nameLower];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'CategorySuggestions';
  @override
  VerificationContext validateIntegrity(
      Insertable<CategorySuggestionsRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('name_lower')) {
      context.handle(_nameLowerMeta,
          nameLower.isAcceptableOrUnknown(data['name_lower']!, _nameLowerMeta));
    } else if (isInserting) {
      context.missing(_nameLowerMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CategorySuggestionsRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategorySuggestionsRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      nameLower: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_lower'])!,
    );
  }

  @override
  $CategorySuggestionsTableTable createAlias(String alias) {
    return $CategorySuggestionsTableTable(attachedDatabase, alias);
  }
}

class CategorySuggestionsRow extends DataClass
    implements Insertable<CategorySuggestionsRow> {
  final String id;
  final String name;
  final String nameLower;
  const CategorySuggestionsRow(
      {required this.id, required this.name, required this.nameLower});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['name_lower'] = Variable<String>(nameLower);
    return map;
  }

  CategorySuggestionsTableCompanion toCompanion(bool nullToAbsent) {
    return CategorySuggestionsTableCompanion(
      id: Value(id),
      name: Value(name),
      nameLower: Value(nameLower),
    );
  }

  factory CategorySuggestionsRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategorySuggestionsRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      nameLower: serializer.fromJson<String>(json['nameLower']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'nameLower': serializer.toJson<String>(nameLower),
    };
  }

  CategorySuggestionsRow copyWith(
          {String? id, String? name, String? nameLower}) =>
      CategorySuggestionsRow(
        id: id ?? this.id,
        name: name ?? this.name,
        nameLower: nameLower ?? this.nameLower,
      );
  CategorySuggestionsRow copyWithCompanion(
      CategorySuggestionsTableCompanion data) {
    return CategorySuggestionsRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      nameLower: data.nameLower.present ? data.nameLower.value : this.nameLower,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategorySuggestionsRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameLower: $nameLower')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, nameLower);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategorySuggestionsRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.nameLower == this.nameLower);
}

class CategorySuggestionsTableCompanion
    extends UpdateCompanion<CategorySuggestionsRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> nameLower;
  final Value<int> rowid;
  const CategorySuggestionsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nameLower = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategorySuggestionsTableCompanion.insert({
    required String id,
    required String name,
    required String nameLower,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        nameLower = Value(nameLower);
  static Insertable<CategorySuggestionsRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? nameLower,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (nameLower != null) 'name_lower': nameLower,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategorySuggestionsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? nameLower,
      Value<int>? rowid}) {
    return CategorySuggestionsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      nameLower: nameLower ?? this.nameLower,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nameLower.present) {
      map['name_lower'] = Variable<String>(nameLower.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategorySuggestionsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameLower: $nameLower, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ItemHistoryTableTable extends ItemHistoryTable
    with TableInfo<$ItemHistoryTableTable, ItemHistoryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemHistoryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 30),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameLowerMeta =
      const VerificationMeta('nameLower');
  @override
  late final GeneratedColumn<String> nameLower = GeneratedColumn<String>(
      'name_lower', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastUsedMeta =
      const VerificationMeta('lastUsed');
  @override
  late final GeneratedColumn<int> lastUsed = GeneratedColumn<int>(
      'last_used', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _usageCountMeta =
      const VerificationMeta('usageCount');
  @override
  late final GeneratedColumn<int> usageCount = GeneratedColumn<int>(
      'usage_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _categoriesMeta =
      const VerificationMeta('categories');
  @override
  late final GeneratedColumn<String> categories = GeneratedColumn<String>(
      'categories', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, nameLower, lastUsed, usageCount, categories];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ItemHistory';
  @override
  VerificationContext validateIntegrity(Insertable<ItemHistoryRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('name_lower')) {
      context.handle(_nameLowerMeta,
          nameLower.isAcceptableOrUnknown(data['name_lower']!, _nameLowerMeta));
    } else if (isInserting) {
      context.missing(_nameLowerMeta);
    }
    if (data.containsKey('last_used')) {
      context.handle(_lastUsedMeta,
          lastUsed.isAcceptableOrUnknown(data['last_used']!, _lastUsedMeta));
    } else if (isInserting) {
      context.missing(_lastUsedMeta);
    }
    if (data.containsKey('usage_count')) {
      context.handle(
          _usageCountMeta,
          usageCount.isAcceptableOrUnknown(
              data['usage_count']!, _usageCountMeta));
    } else if (isInserting) {
      context.missing(_usageCountMeta);
    }
    if (data.containsKey('categories')) {
      context.handle(
          _categoriesMeta,
          categories.isAcceptableOrUnknown(
              data['categories']!, _categoriesMeta));
    } else if (isInserting) {
      context.missing(_categoriesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ItemHistoryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemHistoryRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      nameLower: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_lower'])!,
      lastUsed: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_used'])!,
      usageCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}usage_count'])!,
      categories: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}categories'])!,
    );
  }

  @override
  $ItemHistoryTableTable createAlias(String alias) {
    return $ItemHistoryTableTable(attachedDatabase, alias);
  }
}

class ItemHistoryRow extends DataClass implements Insertable<ItemHistoryRow> {
  final String id;
  final String name;
  final String nameLower;
  final int lastUsed;
  final int usageCount;
  final String categories;
  const ItemHistoryRow(
      {required this.id,
      required this.name,
      required this.nameLower,
      required this.lastUsed,
      required this.usageCount,
      required this.categories});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['name_lower'] = Variable<String>(nameLower);
    map['last_used'] = Variable<int>(lastUsed);
    map['usage_count'] = Variable<int>(usageCount);
    map['categories'] = Variable<String>(categories);
    return map;
  }

  ItemHistoryTableCompanion toCompanion(bool nullToAbsent) {
    return ItemHistoryTableCompanion(
      id: Value(id),
      name: Value(name),
      nameLower: Value(nameLower),
      lastUsed: Value(lastUsed),
      usageCount: Value(usageCount),
      categories: Value(categories),
    );
  }

  factory ItemHistoryRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemHistoryRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      nameLower: serializer.fromJson<String>(json['nameLower']),
      lastUsed: serializer.fromJson<int>(json['lastUsed']),
      usageCount: serializer.fromJson<int>(json['usageCount']),
      categories: serializer.fromJson<String>(json['categories']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'nameLower': serializer.toJson<String>(nameLower),
      'lastUsed': serializer.toJson<int>(lastUsed),
      'usageCount': serializer.toJson<int>(usageCount),
      'categories': serializer.toJson<String>(categories),
    };
  }

  ItemHistoryRow copyWith(
          {String? id,
          String? name,
          String? nameLower,
          int? lastUsed,
          int? usageCount,
          String? categories}) =>
      ItemHistoryRow(
        id: id ?? this.id,
        name: name ?? this.name,
        nameLower: nameLower ?? this.nameLower,
        lastUsed: lastUsed ?? this.lastUsed,
        usageCount: usageCount ?? this.usageCount,
        categories: categories ?? this.categories,
      );
  ItemHistoryRow copyWithCompanion(ItemHistoryTableCompanion data) {
    return ItemHistoryRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      nameLower: data.nameLower.present ? data.nameLower.value : this.nameLower,
      lastUsed: data.lastUsed.present ? data.lastUsed.value : this.lastUsed,
      usageCount:
          data.usageCount.present ? data.usageCount.value : this.usageCount,
      categories:
          data.categories.present ? data.categories.value : this.categories,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ItemHistoryRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameLower: $nameLower, ')
          ..write('lastUsed: $lastUsed, ')
          ..write('usageCount: $usageCount, ')
          ..write('categories: $categories')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, nameLower, lastUsed, usageCount, categories);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemHistoryRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.nameLower == this.nameLower &&
          other.lastUsed == this.lastUsed &&
          other.usageCount == this.usageCount &&
          other.categories == this.categories);
}

class ItemHistoryTableCompanion extends UpdateCompanion<ItemHistoryRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> nameLower;
  final Value<int> lastUsed;
  final Value<int> usageCount;
  final Value<String> categories;
  final Value<int> rowid;
  const ItemHistoryTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nameLower = const Value.absent(),
    this.lastUsed = const Value.absent(),
    this.usageCount = const Value.absent(),
    this.categories = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ItemHistoryTableCompanion.insert({
    required String id,
    required String name,
    required String nameLower,
    required int lastUsed,
    required int usageCount,
    required String categories,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        nameLower = Value(nameLower),
        lastUsed = Value(lastUsed),
        usageCount = Value(usageCount),
        categories = Value(categories);
  static Insertable<ItemHistoryRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? nameLower,
    Expression<int>? lastUsed,
    Expression<int>? usageCount,
    Expression<String>? categories,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (nameLower != null) 'name_lower': nameLower,
      if (lastUsed != null) 'last_used': lastUsed,
      if (usageCount != null) 'usage_count': usageCount,
      if (categories != null) 'categories': categories,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ItemHistoryTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? nameLower,
      Value<int>? lastUsed,
      Value<int>? usageCount,
      Value<String>? categories,
      Value<int>? rowid}) {
    return ItemHistoryTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      nameLower: nameLower ?? this.nameLower,
      lastUsed: lastUsed ?? this.lastUsed,
      usageCount: usageCount ?? this.usageCount,
      categories: categories ?? this.categories,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nameLower.present) {
      map['name_lower'] = Variable<String>(nameLower.value);
    }
    if (lastUsed.present) {
      map['last_used'] = Variable<int>(lastUsed.value);
    }
    if (usageCount.present) {
      map['usage_count'] = Variable<int>(usageCount.value);
    }
    if (categories.present) {
      map['categories'] = Variable<String>(categories.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemHistoryTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameLower: $nameLower, ')
          ..write('lastUsed: $lastUsed, ')
          ..write('usageCount: $usageCount, ')
          ..write('categories: $categories, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CategoryHistoryTableTable extends CategoryHistoryTable
    with TableInfo<$CategoryHistoryTableTable, CategoryHistoryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryHistoryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 30),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameLowerMeta =
      const VerificationMeta('nameLower');
  @override
  late final GeneratedColumn<String> nameLower = GeneratedColumn<String>(
      'name_lower', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastUsedMeta =
      const VerificationMeta('lastUsed');
  @override
  late final GeneratedColumn<int> lastUsed = GeneratedColumn<int>(
      'last_used', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _usageCountMeta =
      const VerificationMeta('usageCount');
  @override
  late final GeneratedColumn<int> usageCount = GeneratedColumn<int>(
      'usage_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, nameLower, lastUsed, usageCount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'CategoryHistory';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryHistoryRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('name_lower')) {
      context.handle(_nameLowerMeta,
          nameLower.isAcceptableOrUnknown(data['name_lower']!, _nameLowerMeta));
    } else if (isInserting) {
      context.missing(_nameLowerMeta);
    }
    if (data.containsKey('last_used')) {
      context.handle(_lastUsedMeta,
          lastUsed.isAcceptableOrUnknown(data['last_used']!, _lastUsedMeta));
    } else if (isInserting) {
      context.missing(_lastUsedMeta);
    }
    if (data.containsKey('usage_count')) {
      context.handle(
          _usageCountMeta,
          usageCount.isAcceptableOrUnknown(
              data['usage_count']!, _usageCountMeta));
    } else if (isInserting) {
      context.missing(_usageCountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CategoryHistoryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryHistoryRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      nameLower: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_lower'])!,
      lastUsed: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_used'])!,
      usageCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}usage_count'])!,
    );
  }

  @override
  $CategoryHistoryTableTable createAlias(String alias) {
    return $CategoryHistoryTableTable(attachedDatabase, alias);
  }
}

class CategoryHistoryRow extends DataClass
    implements Insertable<CategoryHistoryRow> {
  final String id;
  final String name;
  final String nameLower;
  final int lastUsed;
  final int usageCount;
  const CategoryHistoryRow(
      {required this.id,
      required this.name,
      required this.nameLower,
      required this.lastUsed,
      required this.usageCount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['name_lower'] = Variable<String>(nameLower);
    map['last_used'] = Variable<int>(lastUsed);
    map['usage_count'] = Variable<int>(usageCount);
    return map;
  }

  CategoryHistoryTableCompanion toCompanion(bool nullToAbsent) {
    return CategoryHistoryTableCompanion(
      id: Value(id),
      name: Value(name),
      nameLower: Value(nameLower),
      lastUsed: Value(lastUsed),
      usageCount: Value(usageCount),
    );
  }

  factory CategoryHistoryRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryHistoryRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      nameLower: serializer.fromJson<String>(json['nameLower']),
      lastUsed: serializer.fromJson<int>(json['lastUsed']),
      usageCount: serializer.fromJson<int>(json['usageCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'nameLower': serializer.toJson<String>(nameLower),
      'lastUsed': serializer.toJson<int>(lastUsed),
      'usageCount': serializer.toJson<int>(usageCount),
    };
  }

  CategoryHistoryRow copyWith(
          {String? id,
          String? name,
          String? nameLower,
          int? lastUsed,
          int? usageCount}) =>
      CategoryHistoryRow(
        id: id ?? this.id,
        name: name ?? this.name,
        nameLower: nameLower ?? this.nameLower,
        lastUsed: lastUsed ?? this.lastUsed,
        usageCount: usageCount ?? this.usageCount,
      );
  CategoryHistoryRow copyWithCompanion(CategoryHistoryTableCompanion data) {
    return CategoryHistoryRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      nameLower: data.nameLower.present ? data.nameLower.value : this.nameLower,
      lastUsed: data.lastUsed.present ? data.lastUsed.value : this.lastUsed,
      usageCount:
          data.usageCount.present ? data.usageCount.value : this.usageCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryHistoryRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameLower: $nameLower, ')
          ..write('lastUsed: $lastUsed, ')
          ..write('usageCount: $usageCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, nameLower, lastUsed, usageCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryHistoryRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.nameLower == this.nameLower &&
          other.lastUsed == this.lastUsed &&
          other.usageCount == this.usageCount);
}

class CategoryHistoryTableCompanion
    extends UpdateCompanion<CategoryHistoryRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> nameLower;
  final Value<int> lastUsed;
  final Value<int> usageCount;
  final Value<int> rowid;
  const CategoryHistoryTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nameLower = const Value.absent(),
    this.lastUsed = const Value.absent(),
    this.usageCount = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoryHistoryTableCompanion.insert({
    required String id,
    required String name,
    required String nameLower,
    required int lastUsed,
    required int usageCount,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        nameLower = Value(nameLower),
        lastUsed = Value(lastUsed),
        usageCount = Value(usageCount);
  static Insertable<CategoryHistoryRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? nameLower,
    Expression<int>? lastUsed,
    Expression<int>? usageCount,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (nameLower != null) 'name_lower': nameLower,
      if (lastUsed != null) 'last_used': lastUsed,
      if (usageCount != null) 'usage_count': usageCount,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoryHistoryTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? nameLower,
      Value<int>? lastUsed,
      Value<int>? usageCount,
      Value<int>? rowid}) {
    return CategoryHistoryTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      nameLower: nameLower ?? this.nameLower,
      lastUsed: lastUsed ?? this.lastUsed,
      usageCount: usageCount ?? this.usageCount,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nameLower.present) {
      map['name_lower'] = Variable<String>(nameLower.value);
    }
    if (lastUsed.present) {
      map['last_used'] = Variable<int>(lastUsed.value);
    }
    if (usageCount.present) {
      map['usage_count'] = Variable<int>(usageCount.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryHistoryTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameLower: $nameLower, ')
          ..write('lastUsed: $lastUsed, ')
          ..write('usageCount: $usageCount, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TokenTableTable extends TokenTable
    with TableInfo<$TokenTableTable, TokenRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TokenTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
      'type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _stringIdMeta =
      const VerificationMeta('stringId');
  @override
  late final GeneratedColumn<String> stringId = GeneratedColumn<String>(
      'string_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _intIdMeta = const VerificationMeta('intId');
  @override
  late final GeneratedColumn<int> intId = GeneratedColumn<int>(
      'int_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String> token = GeneratedColumn<String>(
      'token', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [type, stringId, intId, token];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'Tokens';
  @override
  VerificationContext validateIntegrity(Insertable<TokenRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('string_id')) {
      context.handle(_stringIdMeta,
          stringId.isAcceptableOrUnknown(data['string_id']!, _stringIdMeta));
    }
    if (data.containsKey('int_id')) {
      context.handle(
          _intIdMeta, intId.isAcceptableOrUnknown(data['int_id']!, _intIdMeta));
    }
    if (data.containsKey('token')) {
      context.handle(
          _tokenMeta, token.isAcceptableOrUnknown(data['token']!, _tokenMeta));
    } else if (isInserting) {
      context.missing(_tokenMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {type, stringId, intId, token};
  @override
  TokenRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TokenRow(
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!,
      stringId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}string_id']),
      intId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}int_id']),
      token: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}token'])!,
    );
  }

  @override
  $TokenTableTable createAlias(String alias) {
    return $TokenTableTable(attachedDatabase, alias);
  }
}

class TokenRow extends DataClass implements Insertable<TokenRow> {
  final int type;
  final String? stringId;
  final int? intId;
  final String token;
  const TokenRow(
      {required this.type, this.stringId, this.intId, required this.token});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['type'] = Variable<int>(type);
    if (!nullToAbsent || stringId != null) {
      map['string_id'] = Variable<String>(stringId);
    }
    if (!nullToAbsent || intId != null) {
      map['int_id'] = Variable<int>(intId);
    }
    map['token'] = Variable<String>(token);
    return map;
  }

  TokenTableCompanion toCompanion(bool nullToAbsent) {
    return TokenTableCompanion(
      type: Value(type),
      stringId: stringId == null && nullToAbsent
          ? const Value.absent()
          : Value(stringId),
      intId:
          intId == null && nullToAbsent ? const Value.absent() : Value(intId),
      token: Value(token),
    );
  }

  factory TokenRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TokenRow(
      type: serializer.fromJson<int>(json['type']),
      stringId: serializer.fromJson<String?>(json['stringId']),
      intId: serializer.fromJson<int?>(json['intId']),
      token: serializer.fromJson<String>(json['token']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'type': serializer.toJson<int>(type),
      'stringId': serializer.toJson<String?>(stringId),
      'intId': serializer.toJson<int?>(intId),
      'token': serializer.toJson<String>(token),
    };
  }

  TokenRow copyWith(
          {int? type,
          Value<String?> stringId = const Value.absent(),
          Value<int?> intId = const Value.absent(),
          String? token}) =>
      TokenRow(
        type: type ?? this.type,
        stringId: stringId.present ? stringId.value : this.stringId,
        intId: intId.present ? intId.value : this.intId,
        token: token ?? this.token,
      );
  TokenRow copyWithCompanion(TokenTableCompanion data) {
    return TokenRow(
      type: data.type.present ? data.type.value : this.type,
      stringId: data.stringId.present ? data.stringId.value : this.stringId,
      intId: data.intId.present ? data.intId.value : this.intId,
      token: data.token.present ? data.token.value : this.token,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TokenRow(')
          ..write('type: $type, ')
          ..write('stringId: $stringId, ')
          ..write('intId: $intId, ')
          ..write('token: $token')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(type, stringId, intId, token);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TokenRow &&
          other.type == this.type &&
          other.stringId == this.stringId &&
          other.intId == this.intId &&
          other.token == this.token);
}

class TokenTableCompanion extends UpdateCompanion<TokenRow> {
  final Value<int> type;
  final Value<String?> stringId;
  final Value<int?> intId;
  final Value<String> token;
  final Value<int> rowid;
  const TokenTableCompanion({
    this.type = const Value.absent(),
    this.stringId = const Value.absent(),
    this.intId = const Value.absent(),
    this.token = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TokenTableCompanion.insert({
    required int type,
    this.stringId = const Value.absent(),
    this.intId = const Value.absent(),
    required String token,
    this.rowid = const Value.absent(),
  })  : type = Value(type),
        token = Value(token);
  static Insertable<TokenRow> custom({
    Expression<int>? type,
    Expression<String>? stringId,
    Expression<int>? intId,
    Expression<String>? token,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (type != null) 'type': type,
      if (stringId != null) 'string_id': stringId,
      if (intId != null) 'int_id': intId,
      if (token != null) 'token': token,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TokenTableCompanion copyWith(
      {Value<int>? type,
      Value<String?>? stringId,
      Value<int?>? intId,
      Value<String>? token,
      Value<int>? rowid}) {
    return TokenTableCompanion(
      type: type ?? this.type,
      stringId: stringId ?? this.stringId,
      intId: intId ?? this.intId,
      token: token ?? this.token,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (stringId.present) {
      map['string_id'] = Variable<String>(stringId.value);
    }
    if (intId.present) {
      map['int_id'] = Variable<int>(intId.value);
    }
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TokenTableCompanion(')
          ..write('type: $type, ')
          ..write('stringId: $stringId, ')
          ..write('intId: $intId, ')
          ..write('token: $token, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LoadProgressTableTable extends LoadProgressTable
    with TableInfo<$LoadProgressTableTable, LoadProgressRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LoadProgressTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
      'type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _retrievedUntilMeta =
      const VerificationMeta('retrievedUntil');
  @override
  late final GeneratedColumn<int> retrievedUntil = GeneratedColumn<int>(
      'retrieved_until', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [type, retrievedUntil];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'LoadProgress';
  @override
  VerificationContext validateIntegrity(Insertable<LoadProgressRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('retrieved_until')) {
      context.handle(
          _retrievedUntilMeta,
          retrievedUntil.isAcceptableOrUnknown(
              data['retrieved_until']!, _retrievedUntilMeta));
    } else if (isInserting) {
      context.missing(_retrievedUntilMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {type};
  @override
  LoadProgressRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LoadProgressRow(
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!,
      retrievedUntil: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}retrieved_until'])!,
    );
  }

  @override
  $LoadProgressTableTable createAlias(String alias) {
    return $LoadProgressTableTable(attachedDatabase, alias);
  }
}

class LoadProgressRow extends DataClass implements Insertable<LoadProgressRow> {
  final int type;
  final int retrievedUntil;
  const LoadProgressRow({required this.type, required this.retrievedUntil});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['type'] = Variable<int>(type);
    map['retrieved_until'] = Variable<int>(retrievedUntil);
    return map;
  }

  LoadProgressTableCompanion toCompanion(bool nullToAbsent) {
    return LoadProgressTableCompanion(
      type: Value(type),
      retrievedUntil: Value(retrievedUntil),
    );
  }

  factory LoadProgressRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LoadProgressRow(
      type: serializer.fromJson<int>(json['type']),
      retrievedUntil: serializer.fromJson<int>(json['retrievedUntil']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'type': serializer.toJson<int>(type),
      'retrievedUntil': serializer.toJson<int>(retrievedUntil),
    };
  }

  LoadProgressRow copyWith({int? type, int? retrievedUntil}) => LoadProgressRow(
        type: type ?? this.type,
        retrievedUntil: retrievedUntil ?? this.retrievedUntil,
      );
  LoadProgressRow copyWithCompanion(LoadProgressTableCompanion data) {
    return LoadProgressRow(
      type: data.type.present ? data.type.value : this.type,
      retrievedUntil: data.retrievedUntil.present
          ? data.retrievedUntil.value
          : this.retrievedUntil,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LoadProgressRow(')
          ..write('type: $type, ')
          ..write('retrievedUntil: $retrievedUntil')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(type, retrievedUntil);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoadProgressRow &&
          other.type == this.type &&
          other.retrievedUntil == this.retrievedUntil);
}

class LoadProgressTableCompanion extends UpdateCompanion<LoadProgressRow> {
  final Value<int> type;
  final Value<int> retrievedUntil;
  const LoadProgressTableCompanion({
    this.type = const Value.absent(),
    this.retrievedUntil = const Value.absent(),
  });
  LoadProgressTableCompanion.insert({
    this.type = const Value.absent(),
    required int retrievedUntil,
  }) : retrievedUntil = Value(retrievedUntil);
  static Insertable<LoadProgressRow> custom({
    Expression<int>? type,
    Expression<int>? retrievedUntil,
  }) {
    return RawValuesInsertable({
      if (type != null) 'type': type,
      if (retrievedUntil != null) 'retrieved_until': retrievedUntil,
    });
  }

  LoadProgressTableCompanion copyWith(
      {Value<int>? type, Value<int>? retrievedUntil}) {
    return LoadProgressTableCompanion(
      type: type ?? this.type,
      retrievedUntil: retrievedUntil ?? this.retrievedUntil,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (retrievedUntil.present) {
      map['retrieved_until'] = Variable<int>(retrievedUntil.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LoadProgressTableCompanion(')
          ..write('type: $type, ')
          ..write('retrievedUntil: $retrievedUntil')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ItemSuggestionsTableTable itemSuggestionsTable =
      $ItemSuggestionsTableTable(this);
  late final $CategorySuggestionsTableTable categorySuggestionsTable =
      $CategorySuggestionsTableTable(this);
  late final $ItemHistoryTableTable itemHistoryTable =
      $ItemHistoryTableTable(this);
  late final $CategoryHistoryTableTable categoryHistoryTable =
      $CategoryHistoryTableTable(this);
  late final $TokenTableTable tokenTable = $TokenTableTable(this);
  late final $LoadProgressTableTable loadProgressTable =
      $LoadProgressTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        itemSuggestionsTable,
        categorySuggestionsTable,
        itemHistoryTable,
        categoryHistoryTable,
        tokenTable,
        loadProgressTable
      ];
}

typedef $$ItemSuggestionsTableTableCreateCompanionBuilder
    = ItemSuggestionsTableCompanion Function({
  required String id,
  required String name,
  required String nameLower,
  required String categories,
  Value<int> rowid,
});
typedef $$ItemSuggestionsTableTableUpdateCompanionBuilder
    = ItemSuggestionsTableCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> nameLower,
  Value<String> categories,
  Value<int> rowid,
});

class $$ItemSuggestionsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ItemSuggestionsTableTable> {
  $$ItemSuggestionsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameLower => $composableBuilder(
      column: $table.nameLower, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get categories => $composableBuilder(
      column: $table.categories, builder: (column) => ColumnFilters(column));
}

class $$ItemSuggestionsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ItemSuggestionsTableTable> {
  $$ItemSuggestionsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameLower => $composableBuilder(
      column: $table.nameLower, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categories => $composableBuilder(
      column: $table.categories, builder: (column) => ColumnOrderings(column));
}

class $$ItemSuggestionsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ItemSuggestionsTableTable> {
  $$ItemSuggestionsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get nameLower =>
      $composableBuilder(column: $table.nameLower, builder: (column) => column);

  GeneratedColumn<String> get categories => $composableBuilder(
      column: $table.categories, builder: (column) => column);
}

class $$ItemSuggestionsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ItemSuggestionsTableTable,
    ItemSuggestionsRow,
    $$ItemSuggestionsTableTableFilterComposer,
    $$ItemSuggestionsTableTableOrderingComposer,
    $$ItemSuggestionsTableTableAnnotationComposer,
    $$ItemSuggestionsTableTableCreateCompanionBuilder,
    $$ItemSuggestionsTableTableUpdateCompanionBuilder,
    (
      ItemSuggestionsRow,
      BaseReferences<_$AppDatabase, $ItemSuggestionsTableTable,
          ItemSuggestionsRow>
    ),
    ItemSuggestionsRow,
    PrefetchHooks Function()> {
  $$ItemSuggestionsTableTableTableManager(
      _$AppDatabase db, $ItemSuggestionsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ItemSuggestionsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ItemSuggestionsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ItemSuggestionsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> nameLower = const Value.absent(),
            Value<String> categories = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ItemSuggestionsTableCompanion(
            id: id,
            name: name,
            nameLower: nameLower,
            categories: categories,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String nameLower,
            required String categories,
            Value<int> rowid = const Value.absent(),
          }) =>
              ItemSuggestionsTableCompanion.insert(
            id: id,
            name: name,
            nameLower: nameLower,
            categories: categories,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ItemSuggestionsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $ItemSuggestionsTableTable,
        ItemSuggestionsRow,
        $$ItemSuggestionsTableTableFilterComposer,
        $$ItemSuggestionsTableTableOrderingComposer,
        $$ItemSuggestionsTableTableAnnotationComposer,
        $$ItemSuggestionsTableTableCreateCompanionBuilder,
        $$ItemSuggestionsTableTableUpdateCompanionBuilder,
        (
          ItemSuggestionsRow,
          BaseReferences<_$AppDatabase, $ItemSuggestionsTableTable,
              ItemSuggestionsRow>
        ),
        ItemSuggestionsRow,
        PrefetchHooks Function()>;
typedef $$CategorySuggestionsTableTableCreateCompanionBuilder
    = CategorySuggestionsTableCompanion Function({
  required String id,
  required String name,
  required String nameLower,
  Value<int> rowid,
});
typedef $$CategorySuggestionsTableTableUpdateCompanionBuilder
    = CategorySuggestionsTableCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> nameLower,
  Value<int> rowid,
});

class $$CategorySuggestionsTableTableFilterComposer
    extends Composer<_$AppDatabase, $CategorySuggestionsTableTable> {
  $$CategorySuggestionsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameLower => $composableBuilder(
      column: $table.nameLower, builder: (column) => ColumnFilters(column));
}

class $$CategorySuggestionsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CategorySuggestionsTableTable> {
  $$CategorySuggestionsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameLower => $composableBuilder(
      column: $table.nameLower, builder: (column) => ColumnOrderings(column));
}

class $$CategorySuggestionsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategorySuggestionsTableTable> {
  $$CategorySuggestionsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get nameLower =>
      $composableBuilder(column: $table.nameLower, builder: (column) => column);
}

class $$CategorySuggestionsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategorySuggestionsTableTable,
    CategorySuggestionsRow,
    $$CategorySuggestionsTableTableFilterComposer,
    $$CategorySuggestionsTableTableOrderingComposer,
    $$CategorySuggestionsTableTableAnnotationComposer,
    $$CategorySuggestionsTableTableCreateCompanionBuilder,
    $$CategorySuggestionsTableTableUpdateCompanionBuilder,
    (
      CategorySuggestionsRow,
      BaseReferences<_$AppDatabase, $CategorySuggestionsTableTable,
          CategorySuggestionsRow>
    ),
    CategorySuggestionsRow,
    PrefetchHooks Function()> {
  $$CategorySuggestionsTableTableTableManager(
      _$AppDatabase db, $CategorySuggestionsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategorySuggestionsTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$CategorySuggestionsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategorySuggestionsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> nameLower = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CategorySuggestionsTableCompanion(
            id: id,
            name: name,
            nameLower: nameLower,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String nameLower,
            Value<int> rowid = const Value.absent(),
          }) =>
              CategorySuggestionsTableCompanion.insert(
            id: id,
            name: name,
            nameLower: nameLower,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CategorySuggestionsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $CategorySuggestionsTableTable,
        CategorySuggestionsRow,
        $$CategorySuggestionsTableTableFilterComposer,
        $$CategorySuggestionsTableTableOrderingComposer,
        $$CategorySuggestionsTableTableAnnotationComposer,
        $$CategorySuggestionsTableTableCreateCompanionBuilder,
        $$CategorySuggestionsTableTableUpdateCompanionBuilder,
        (
          CategorySuggestionsRow,
          BaseReferences<_$AppDatabase, $CategorySuggestionsTableTable,
              CategorySuggestionsRow>
        ),
        CategorySuggestionsRow,
        PrefetchHooks Function()>;
typedef $$ItemHistoryTableTableCreateCompanionBuilder
    = ItemHistoryTableCompanion Function({
  required String id,
  required String name,
  required String nameLower,
  required int lastUsed,
  required int usageCount,
  required String categories,
  Value<int> rowid,
});
typedef $$ItemHistoryTableTableUpdateCompanionBuilder
    = ItemHistoryTableCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> nameLower,
  Value<int> lastUsed,
  Value<int> usageCount,
  Value<String> categories,
  Value<int> rowid,
});

class $$ItemHistoryTableTableFilterComposer
    extends Composer<_$AppDatabase, $ItemHistoryTableTable> {
  $$ItemHistoryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameLower => $composableBuilder(
      column: $table.nameLower, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lastUsed => $composableBuilder(
      column: $table.lastUsed, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get usageCount => $composableBuilder(
      column: $table.usageCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get categories => $composableBuilder(
      column: $table.categories, builder: (column) => ColumnFilters(column));
}

class $$ItemHistoryTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ItemHistoryTableTable> {
  $$ItemHistoryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameLower => $composableBuilder(
      column: $table.nameLower, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lastUsed => $composableBuilder(
      column: $table.lastUsed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get usageCount => $composableBuilder(
      column: $table.usageCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categories => $composableBuilder(
      column: $table.categories, builder: (column) => ColumnOrderings(column));
}

class $$ItemHistoryTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ItemHistoryTableTable> {
  $$ItemHistoryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get nameLower =>
      $composableBuilder(column: $table.nameLower, builder: (column) => column);

  GeneratedColumn<int> get lastUsed =>
      $composableBuilder(column: $table.lastUsed, builder: (column) => column);

  GeneratedColumn<int> get usageCount => $composableBuilder(
      column: $table.usageCount, builder: (column) => column);

  GeneratedColumn<String> get categories => $composableBuilder(
      column: $table.categories, builder: (column) => column);
}

class $$ItemHistoryTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ItemHistoryTableTable,
    ItemHistoryRow,
    $$ItemHistoryTableTableFilterComposer,
    $$ItemHistoryTableTableOrderingComposer,
    $$ItemHistoryTableTableAnnotationComposer,
    $$ItemHistoryTableTableCreateCompanionBuilder,
    $$ItemHistoryTableTableUpdateCompanionBuilder,
    (
      ItemHistoryRow,
      BaseReferences<_$AppDatabase, $ItemHistoryTableTable, ItemHistoryRow>
    ),
    ItemHistoryRow,
    PrefetchHooks Function()> {
  $$ItemHistoryTableTableTableManager(
      _$AppDatabase db, $ItemHistoryTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ItemHistoryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ItemHistoryTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ItemHistoryTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> nameLower = const Value.absent(),
            Value<int> lastUsed = const Value.absent(),
            Value<int> usageCount = const Value.absent(),
            Value<String> categories = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ItemHistoryTableCompanion(
            id: id,
            name: name,
            nameLower: nameLower,
            lastUsed: lastUsed,
            usageCount: usageCount,
            categories: categories,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String nameLower,
            required int lastUsed,
            required int usageCount,
            required String categories,
            Value<int> rowid = const Value.absent(),
          }) =>
              ItemHistoryTableCompanion.insert(
            id: id,
            name: name,
            nameLower: nameLower,
            lastUsed: lastUsed,
            usageCount: usageCount,
            categories: categories,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ItemHistoryTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ItemHistoryTableTable,
    ItemHistoryRow,
    $$ItemHistoryTableTableFilterComposer,
    $$ItemHistoryTableTableOrderingComposer,
    $$ItemHistoryTableTableAnnotationComposer,
    $$ItemHistoryTableTableCreateCompanionBuilder,
    $$ItemHistoryTableTableUpdateCompanionBuilder,
    (
      ItemHistoryRow,
      BaseReferences<_$AppDatabase, $ItemHistoryTableTable, ItemHistoryRow>
    ),
    ItemHistoryRow,
    PrefetchHooks Function()>;
typedef $$CategoryHistoryTableTableCreateCompanionBuilder
    = CategoryHistoryTableCompanion Function({
  required String id,
  required String name,
  required String nameLower,
  required int lastUsed,
  required int usageCount,
  Value<int> rowid,
});
typedef $$CategoryHistoryTableTableUpdateCompanionBuilder
    = CategoryHistoryTableCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> nameLower,
  Value<int> lastUsed,
  Value<int> usageCount,
  Value<int> rowid,
});

class $$CategoryHistoryTableTableFilterComposer
    extends Composer<_$AppDatabase, $CategoryHistoryTableTable> {
  $$CategoryHistoryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameLower => $composableBuilder(
      column: $table.nameLower, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lastUsed => $composableBuilder(
      column: $table.lastUsed, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get usageCount => $composableBuilder(
      column: $table.usageCount, builder: (column) => ColumnFilters(column));
}

class $$CategoryHistoryTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoryHistoryTableTable> {
  $$CategoryHistoryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameLower => $composableBuilder(
      column: $table.nameLower, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lastUsed => $composableBuilder(
      column: $table.lastUsed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get usageCount => $composableBuilder(
      column: $table.usageCount, builder: (column) => ColumnOrderings(column));
}

class $$CategoryHistoryTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoryHistoryTableTable> {
  $$CategoryHistoryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get nameLower =>
      $composableBuilder(column: $table.nameLower, builder: (column) => column);

  GeneratedColumn<int> get lastUsed =>
      $composableBuilder(column: $table.lastUsed, builder: (column) => column);

  GeneratedColumn<int> get usageCount => $composableBuilder(
      column: $table.usageCount, builder: (column) => column);
}

class $$CategoryHistoryTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoryHistoryTableTable,
    CategoryHistoryRow,
    $$CategoryHistoryTableTableFilterComposer,
    $$CategoryHistoryTableTableOrderingComposer,
    $$CategoryHistoryTableTableAnnotationComposer,
    $$CategoryHistoryTableTableCreateCompanionBuilder,
    $$CategoryHistoryTableTableUpdateCompanionBuilder,
    (
      CategoryHistoryRow,
      BaseReferences<_$AppDatabase, $CategoryHistoryTableTable,
          CategoryHistoryRow>
    ),
    CategoryHistoryRow,
    PrefetchHooks Function()> {
  $$CategoryHistoryTableTableTableManager(
      _$AppDatabase db, $CategoryHistoryTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryHistoryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoryHistoryTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoryHistoryTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> nameLower = const Value.absent(),
            Value<int> lastUsed = const Value.absent(),
            Value<int> usageCount = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoryHistoryTableCompanion(
            id: id,
            name: name,
            nameLower: nameLower,
            lastUsed: lastUsed,
            usageCount: usageCount,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String nameLower,
            required int lastUsed,
            required int usageCount,
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoryHistoryTableCompanion.insert(
            id: id,
            name: name,
            nameLower: nameLower,
            lastUsed: lastUsed,
            usageCount: usageCount,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CategoryHistoryTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $CategoryHistoryTableTable,
        CategoryHistoryRow,
        $$CategoryHistoryTableTableFilterComposer,
        $$CategoryHistoryTableTableOrderingComposer,
        $$CategoryHistoryTableTableAnnotationComposer,
        $$CategoryHistoryTableTableCreateCompanionBuilder,
        $$CategoryHistoryTableTableUpdateCompanionBuilder,
        (
          CategoryHistoryRow,
          BaseReferences<_$AppDatabase, $CategoryHistoryTableTable,
              CategoryHistoryRow>
        ),
        CategoryHistoryRow,
        PrefetchHooks Function()>;
typedef $$TokenTableTableCreateCompanionBuilder = TokenTableCompanion Function({
  required int type,
  Value<String?> stringId,
  Value<int?> intId,
  required String token,
  Value<int> rowid,
});
typedef $$TokenTableTableUpdateCompanionBuilder = TokenTableCompanion Function({
  Value<int> type,
  Value<String?> stringId,
  Value<int?> intId,
  Value<String> token,
  Value<int> rowid,
});

class $$TokenTableTableFilterComposer
    extends Composer<_$AppDatabase, $TokenTableTable> {
  $$TokenTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get stringId => $composableBuilder(
      column: $table.stringId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get intId => $composableBuilder(
      column: $table.intId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get token => $composableBuilder(
      column: $table.token, builder: (column) => ColumnFilters(column));
}

class $$TokenTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TokenTableTable> {
  $$TokenTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get stringId => $composableBuilder(
      column: $table.stringId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get intId => $composableBuilder(
      column: $table.intId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get token => $composableBuilder(
      column: $table.token, builder: (column) => ColumnOrderings(column));
}

class $$TokenTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TokenTableTable> {
  $$TokenTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get stringId =>
      $composableBuilder(column: $table.stringId, builder: (column) => column);

  GeneratedColumn<int> get intId =>
      $composableBuilder(column: $table.intId, builder: (column) => column);

  GeneratedColumn<String> get token =>
      $composableBuilder(column: $table.token, builder: (column) => column);
}

class $$TokenTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TokenTableTable,
    TokenRow,
    $$TokenTableTableFilterComposer,
    $$TokenTableTableOrderingComposer,
    $$TokenTableTableAnnotationComposer,
    $$TokenTableTableCreateCompanionBuilder,
    $$TokenTableTableUpdateCompanionBuilder,
    (TokenRow, BaseReferences<_$AppDatabase, $TokenTableTable, TokenRow>),
    TokenRow,
    PrefetchHooks Function()> {
  $$TokenTableTableTableManager(_$AppDatabase db, $TokenTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TokenTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TokenTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TokenTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> type = const Value.absent(),
            Value<String?> stringId = const Value.absent(),
            Value<int?> intId = const Value.absent(),
            Value<String> token = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TokenTableCompanion(
            type: type,
            stringId: stringId,
            intId: intId,
            token: token,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int type,
            Value<String?> stringId = const Value.absent(),
            Value<int?> intId = const Value.absent(),
            required String token,
            Value<int> rowid = const Value.absent(),
          }) =>
              TokenTableCompanion.insert(
            type: type,
            stringId: stringId,
            intId: intId,
            token: token,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TokenTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TokenTableTable,
    TokenRow,
    $$TokenTableTableFilterComposer,
    $$TokenTableTableOrderingComposer,
    $$TokenTableTableAnnotationComposer,
    $$TokenTableTableCreateCompanionBuilder,
    $$TokenTableTableUpdateCompanionBuilder,
    (TokenRow, BaseReferences<_$AppDatabase, $TokenTableTable, TokenRow>),
    TokenRow,
    PrefetchHooks Function()>;
typedef $$LoadProgressTableTableCreateCompanionBuilder
    = LoadProgressTableCompanion Function({
  Value<int> type,
  required int retrievedUntil,
});
typedef $$LoadProgressTableTableUpdateCompanionBuilder
    = LoadProgressTableCompanion Function({
  Value<int> type,
  Value<int> retrievedUntil,
});

class $$LoadProgressTableTableFilterComposer
    extends Composer<_$AppDatabase, $LoadProgressTableTable> {
  $$LoadProgressTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get retrievedUntil => $composableBuilder(
      column: $table.retrievedUntil,
      builder: (column) => ColumnFilters(column));
}

class $$LoadProgressTableTableOrderingComposer
    extends Composer<_$AppDatabase, $LoadProgressTableTable> {
  $$LoadProgressTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get retrievedUntil => $composableBuilder(
      column: $table.retrievedUntil,
      builder: (column) => ColumnOrderings(column));
}

class $$LoadProgressTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $LoadProgressTableTable> {
  $$LoadProgressTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get retrievedUntil => $composableBuilder(
      column: $table.retrievedUntil, builder: (column) => column);
}

class $$LoadProgressTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LoadProgressTableTable,
    LoadProgressRow,
    $$LoadProgressTableTableFilterComposer,
    $$LoadProgressTableTableOrderingComposer,
    $$LoadProgressTableTableAnnotationComposer,
    $$LoadProgressTableTableCreateCompanionBuilder,
    $$LoadProgressTableTableUpdateCompanionBuilder,
    (
      LoadProgressRow,
      BaseReferences<_$AppDatabase, $LoadProgressTableTable, LoadProgressRow>
    ),
    LoadProgressRow,
    PrefetchHooks Function()> {
  $$LoadProgressTableTableTableManager(
      _$AppDatabase db, $LoadProgressTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LoadProgressTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LoadProgressTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LoadProgressTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> type = const Value.absent(),
            Value<int> retrievedUntil = const Value.absent(),
          }) =>
              LoadProgressTableCompanion(
            type: type,
            retrievedUntil: retrievedUntil,
          ),
          createCompanionCallback: ({
            Value<int> type = const Value.absent(),
            required int retrievedUntil,
          }) =>
              LoadProgressTableCompanion.insert(
            type: type,
            retrievedUntil: retrievedUntil,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LoadProgressTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LoadProgressTableTable,
    LoadProgressRow,
    $$LoadProgressTableTableFilterComposer,
    $$LoadProgressTableTableOrderingComposer,
    $$LoadProgressTableTableAnnotationComposer,
    $$LoadProgressTableTableCreateCompanionBuilder,
    $$LoadProgressTableTableUpdateCompanionBuilder,
    (
      LoadProgressRow,
      BaseReferences<_$AppDatabase, $LoadProgressTableTable, LoadProgressRow>
    ),
    LoadProgressRow,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ItemSuggestionsTableTableTableManager get itemSuggestionsTable =>
      $$ItemSuggestionsTableTableTableManager(_db, _db.itemSuggestionsTable);
  $$CategorySuggestionsTableTableTableManager get categorySuggestionsTable =>
      $$CategorySuggestionsTableTableTableManager(
          _db, _db.categorySuggestionsTable);
  $$ItemHistoryTableTableTableManager get itemHistoryTable =>
      $$ItemHistoryTableTableTableManager(_db, _db.itemHistoryTable);
  $$CategoryHistoryTableTableTableManager get categoryHistoryTable =>
      $$CategoryHistoryTableTableTableManager(_db, _db.categoryHistoryTable);
  $$TokenTableTableTableManager get tokenTable =>
      $$TokenTableTableTableManager(_db, _db.tokenTable);
  $$LoadProgressTableTableTableManager get loadProgressTable =>
      $$LoadProgressTableTableTableManager(_db, _db.loadProgressTable);
}
