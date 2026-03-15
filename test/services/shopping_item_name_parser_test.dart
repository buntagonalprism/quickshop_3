import 'package:flutter_test/flutter_test.dart';
import 'package:quickshop/services/shopping_item_name_parser.dart';

ParsedShoppingItem parse(String itemName) {
  final parser = ShoppingItemNameParser();
  return parser.parse(itemName);
}

void expectParsed(String itemName, ({String p, String q}) expected) {
  final result = parse(itemName);
  expect(result, ParsedShoppingItem(product: expected.p, quantity: expected.q));
}

void main() {
  test('No quantity singular', () {
    expectParsed('Carrot', (p: 'Carrot', q: ''));
  });

  test('No quantity plural', () {
    expectParsed('Carrots', (p: 'Carrots', q: ''));
    expectParsed('Grapes', (p: 'Grapes', q: ''));
  });

  test('Numeric Quantity', () {
    expectParsed('3 Pink Lady Apples', (p: 'Pink Lady Apples', q: '3'));
  });

  test('Singular item', () {
    expectParsed('1 Carrot', (p: 'Carrot', q: '1'));
    expectParsed('A Carrot', (p: 'Carrot', q: 'A'));
    expectParsed('An apple', (p: 'apple', q: 'An'));
    expectParsed('a can of soup', (p: 'soup', q: 'a can of'));
  });

  test('Written Quantity', () {
    expectParsed('Four cucumbers', (p: 'cucumbers', q: 'Four'));
    expectParsed('one large bunch of brocolli', (p: 'large bunch of brocolli', q: 'one'));
  });

  test('Colloquial quantity', () {
    expectParsed('Some apples', (p: 'apples', q: 'Some'));
    expectParsed('A few oranges', (p: 'oranges', q: 'A few'));
  });

  test('Times quantity', () {
    expectParsed('1x avocado', (p: 'avocado', q: '1x'));
  });

  test('Dozen', () {
    expectParsed('a dozen eggs', (p: 'eggs', q: 'a dozen'));
  });

  test('Written unit quantity', () {
    expectParsed(
      'Two Tablespoons of fresh corriander',
      (p: 'fresh corriander', q: 'Two Tablespoons of'),
    );

    expectParsed('Two tbsp of dried corriander', (p: 'dried corriander', q: 'Two tbsp of'));
  });

  test('Numeric unit quantity', () {
    expectParsed('1 teaspoon diced coconut', (p: 'diced coconut', q: '1 teaspoon'));
    expectParsed('2.5 g saffron', (p: 'saffron', q: '2.5 g'));
    expectParsed('1kg bacon', (p: 'bacon', q: '1kg'));
    expectParsed('500g mince beef', (p: 'mince beef', q: '500g'));
  });

  test('Container name', () {
    expectParsed('can of sliced beetroot', (p: 'sliced beetroot', q: 'can of'));
  });

  test('Size of container', () {
    expectParsed('385g can sliced pineapple', (p: 'sliced pineapple', q: '385g can'));
    expectParsed('400 grams jar tomatoes, diced', (p: 'tomatoes, diced', q: '400 grams jar'));
    expectParsed('400g can Diced tomatoes', (p: 'Diced tomatoes', q: '400g can'));
  });

  test('Quantity of container', () {
    expectParsed('2 bottles tomato sauce', (p: 'tomato sauce', q: '2 bottles'));
  });

  test('Quantity of container quantity', () {
    expectParsed('2 packets of three corn cobs', (p: 'corn cobs', q: '2 packets of three'));
  });

  test('Quantity of container size', () {
    expectParsed('3 400g cans of corn kernels', (p: 'corn kernels', q: '3 400g cans of'));
  });

  test('Numeric Fraction', () {
    expectParsed('3/4 cup sugar', (p: 'sugar', q: '3/4 cup'));
  });

  test('Written fractions', () {
    expectParsed('Half a cup of plain flour', (p: 'plain flour', q: 'Half a cup of'));
    expectParsed('Two thirds cup brown sugar', (p: 'brown sugar', q: 'Two thirds cup'));
    expectParsed('One quarter cup Butter, melted', (p: 'Butter, melted', q: 'One quarter cup'));
  });

  test('Multi word fractions', () {
    expectParsed('two and a half cups crushed biscuits', (p: 'crushed biscuits', q: 'two and a half cups'));
    expectParsed('1 2/3 cup self-raising flour', (p: 'self-raising flour', q: '1 2/3 cup'));
  });

  test('Unit conversions', () {
    expectParsed('300g (11 oz) butter', (p: 'butter', q: '300g (11 oz)'));
  });
}
