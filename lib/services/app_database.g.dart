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
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String> token = GeneratedColumn<String>(
      'token', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, token];
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
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ItemSuggestionsRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemSuggestionsRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      token: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}token'])!,
    );
  }

  @override
  $ItemSuggestionsTableTable createAlias(String alias) {
    return $ItemSuggestionsTableTable(attachedDatabase, alias);
  }
}

class ItemSuggestionsRow extends DataClass
    implements Insertable<ItemSuggestionsRow> {
  final int id;
  final String name;
  final String token;
  const ItemSuggestionsRow(
      {required this.id, required this.name, required this.token});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['token'] = Variable<String>(token);
    return map;
  }

  ItemSuggestionsTableCompanion toCompanion(bool nullToAbsent) {
    return ItemSuggestionsTableCompanion(
      id: Value(id),
      name: Value(name),
      token: Value(token),
    );
  }

  factory ItemSuggestionsRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemSuggestionsRow(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      token: serializer.fromJson<String>(json['token']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'token': serializer.toJson<String>(token),
    };
  }

  ItemSuggestionsRow copyWith({int? id, String? name, String? token}) =>
      ItemSuggestionsRow(
        id: id ?? this.id,
        name: name ?? this.name,
        token: token ?? this.token,
      );
  ItemSuggestionsRow copyWithCompanion(ItemSuggestionsTableCompanion data) {
    return ItemSuggestionsRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      token: data.token.present ? data.token.value : this.token,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ItemSuggestionsRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('token: $token')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, token);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemSuggestionsRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.token == this.token);
}

class ItemSuggestionsTableCompanion
    extends UpdateCompanion<ItemSuggestionsRow> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> token;
  const ItemSuggestionsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.token = const Value.absent(),
  });
  ItemSuggestionsTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String token,
  })  : name = Value(name),
        token = Value(token);
  static Insertable<ItemSuggestionsRow> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? token,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (token != null) 'token': token,
    });
  }

  ItemSuggestionsTableCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? token}) {
    return ItemSuggestionsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      token: token ?? this.token,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemSuggestionsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('token: $token')
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
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String> token = GeneratedColumn<String>(
      'token', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, token];
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
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategorySuggestionsRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategorySuggestionsRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      token: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}token'])!,
    );
  }

  @override
  $CategorySuggestionsTableTable createAlias(String alias) {
    return $CategorySuggestionsTableTable(attachedDatabase, alias);
  }
}

class CategorySuggestionsRow extends DataClass
    implements Insertable<CategorySuggestionsRow> {
  final int id;
  final String name;
  final String token;
  const CategorySuggestionsRow(
      {required this.id, required this.name, required this.token});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['token'] = Variable<String>(token);
    return map;
  }

  CategorySuggestionsTableCompanion toCompanion(bool nullToAbsent) {
    return CategorySuggestionsTableCompanion(
      id: Value(id),
      name: Value(name),
      token: Value(token),
    );
  }

  factory CategorySuggestionsRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategorySuggestionsRow(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      token: serializer.fromJson<String>(json['token']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'token': serializer.toJson<String>(token),
    };
  }

  CategorySuggestionsRow copyWith({int? id, String? name, String? token}) =>
      CategorySuggestionsRow(
        id: id ?? this.id,
        name: name ?? this.name,
        token: token ?? this.token,
      );
  CategorySuggestionsRow copyWithCompanion(
      CategorySuggestionsTableCompanion data) {
    return CategorySuggestionsRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      token: data.token.present ? data.token.value : this.token,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategorySuggestionsRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('token: $token')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, token);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategorySuggestionsRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.token == this.token);
}

class CategorySuggestionsTableCompanion
    extends UpdateCompanion<CategorySuggestionsRow> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> token;
  const CategorySuggestionsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.token = const Value.absent(),
  });
  CategorySuggestionsTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String token,
  })  : name = Value(name),
        token = Value(token);
  static Insertable<CategorySuggestionsRow> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? token,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (token != null) 'token': token,
    });
  }

  CategorySuggestionsTableCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? token}) {
    return CategorySuggestionsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      token: token ?? this.token,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategorySuggestionsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('token: $token')
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
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [itemSuggestionsTable, categorySuggestionsTable];
}

typedef $$ItemSuggestionsTableTableCreateCompanionBuilder
    = ItemSuggestionsTableCompanion Function({
  Value<int> id,
  required String name,
  required String token,
});
typedef $$ItemSuggestionsTableTableUpdateCompanionBuilder
    = ItemSuggestionsTableCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> token,
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
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get token => $composableBuilder(
      column: $table.token, builder: (column) => ColumnFilters(column));
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
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get token => $composableBuilder(
      column: $table.token, builder: (column) => ColumnOrderings(column));
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
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get token =>
      $composableBuilder(column: $table.token, builder: (column) => column);
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
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> token = const Value.absent(),
          }) =>
              ItemSuggestionsTableCompanion(
            id: id,
            name: name,
            token: token,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String token,
          }) =>
              ItemSuggestionsTableCompanion.insert(
            id: id,
            name: name,
            token: token,
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
  Value<int> id,
  required String name,
  required String token,
});
typedef $$CategorySuggestionsTableTableUpdateCompanionBuilder
    = CategorySuggestionsTableCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> token,
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
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get token => $composableBuilder(
      column: $table.token, builder: (column) => ColumnFilters(column));
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
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get token => $composableBuilder(
      column: $table.token, builder: (column) => ColumnOrderings(column));
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
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get token =>
      $composableBuilder(column: $table.token, builder: (column) => column);
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
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> token = const Value.absent(),
          }) =>
              CategorySuggestionsTableCompanion(
            id: id,
            name: name,
            token: token,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String token,
          }) =>
              CategorySuggestionsTableCompanion.insert(
            id: id,
            name: name,
            token: token,
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

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ItemSuggestionsTableTableTableManager get itemSuggestionsTable =>
      $$ItemSuggestionsTableTableTableManager(_db, _db.itemSuggestionsTable);
  $$CategorySuggestionsTableTableTableManager get categorySuggestionsTable =>
      $$CategorySuggestionsTableTableTableManager(
          _db, _db.categorySuggestionsTable);
}
