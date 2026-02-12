import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quickshop/data/app_database.dart';

void main() {
  late AppDatabase database;
  int id = 0;

  setUp(() {
    id = 0;
    database = AppDatabase(
      QueryExecutorConfig(
        DatabaseConnection(
          NativeDatabase.memory(),
          closeStreamsSynchronously: true,
        ),
      ),
    );
  });
  tearDown(() async {
    await database.close();
  });

  ItemHistoryRow createItem(String name, String category, [int usageCount = 1]) {
    return ItemHistoryRow(
      id: (id++).toString(),
      name: name,
      nameLower: name.toLowerCase(),
      lastUsed: DateTime.now().millisecondsSinceEpoch,
      usageCount: usageCount,
      category: category,
    );
  }

  test('Item history can be inserted and queried', () async {
    await database.itemHistoryDao.insert([createItem('Bread', 'Bakery')]);

    final items = await database.itemHistoryDao.query('bread');
    expect(items.length, 1);
    expect(items.first.name, 'Bread');
  });

  test('Search results are case insensitive', () async {
    await database.itemHistoryDao.insert([createItem('Milk', 'Dairy')]);

    final items = await database.itemHistoryDao.query('mILK');
    expect(items.length, 1);
    expect(items.first.name, 'Milk');
  });

  test('Items match query by start of any word', () async {
    await database.itemHistoryDao.insert([
      createItem('Apple Juice', 'Beverages'),
      createItem('Candied Apple', 'Desserts'),
    ]);

    final items = await database.itemHistoryDao.query('app');
    expect(items.length, 2);
    expect(items.map((e) => e.name).toSet(), {'Apple Juice', 'Candied Apple'});
  });

  test('Items do not match if query is not at the start of any word', () async {
    await database.itemHistoryDao.insert([
      createItem('Apple Juice', 'Beverages'),
      createItem('Pulled Pork', 'Desserts'),
      createItem('Lemonade', 'Beverages'),
    ]);

    final items = await database.itemHistoryDao.query('le');
    expect(items.length, 1);
    expect(items.first.name, 'Lemonade');
  });

  test('Multi-word queries match items where each query word has a matching word', () async {
    await database.itemHistoryDao.insert([
      createItem('Chocolate Cake', 'Desserts'),
      createItem('Vanilla Ice Cream Cake', 'Desserts'),
      createItem('Chocolate Chip Cookies', 'Desserts'),
      createItem('Brownie - Chocolate Caramel', 'Desserts'),
    ]);

    final items = await database.itemHistoryDao.query('chocolate ca');
    expect(items.length, 2);
    expect(items.map((e) => e.name).toSet(), {'Chocolate Cake', 'Brownie - Chocolate Caramel'});
  });

  test('Multi-word queries do not match items where words appear out of order', () async {
    await database.itemHistoryDao.insert([
      createItem('Chocolate Cake', 'Desserts'),
      createItem('Chocolate Chip Cookie Cake', 'Desserts'),
      createItem('Cake with Chocolate Chips', 'Desserts'),
      createItem('Brownie - Chocolate Caramel', 'Desserts'),
    ]);

    final items = await database.itemHistoryDao.query('chocolate ca');
    expect(items.length, 2);
    expect(items.map((e) => e.name).toSet(), {'Chocolate Cake', 'Brownie - Chocolate Caramel'});
  });

  test('Items are sorted by usage count, then by name', () async {
    await database.itemHistoryDao.insert([
      createItem('Banana Bread', 'Bakery', 5),
      createItem('Bread Pudding', 'Desserts', 5),
      createItem('Blueberry Muffin', 'Bakery', 1),
      createItem('Sliced Bread', 'Bakery', 1),
      createItem('Bread', 'Bread', 24),
    ]);

    final items = await database.itemHistoryDao.query('b');
    expect(items.length, 5);
    expect(items.map((e) => e.name).toList(), [
      'Bread',
      'Banana Bread',
      'Bread Pudding',
      'Blueberry Muffin',
      'Sliced Bread',
    ]);
  });
}
