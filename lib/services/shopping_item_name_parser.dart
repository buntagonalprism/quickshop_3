import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:words_to_numbers/words_to_numbers.dart';

part 'shopping_item_name_parser.freezed.dart';
part 'shopping_item_name_parser.g.dart';

@freezed
abstract class ParsedShoppingItem with _$ParsedShoppingItem {
  const ParsedShoppingItem._();

  const factory ParsedShoppingItem({
    required String product,
    required String quantity,
  }) = _ParsedShoppingItem;
}

@riverpod
ShoppingItemNameParser shoppingItemNameParser(Ref ref) {
  return ShoppingItemNameParser();
}

class ShoppingItemNameParser {
  /// Parse the product name and quantity from a shopping list item
  ///
  /// For example:
  /// ```dart
  /// parse('A loaf of white bread') == ParsedShoppingItem(product: 'white bread', quantity: 'A loaf of');
  /// parse('2 small brown onions, finely chopped') = ParsedShoppingItem(product: 'brown onions, finely chopped', quantity: '2');
  /// parse('500g mince beef') == ParsedShoppingItem(product: 'mince beef', quantity: '500g');
  /// ```
  ParsedShoppingItem parse(String item) {
    final tokens = item.split(' ');
    final quantityTokens = <String>[];
    final productTokens = <String>[];
    for (int i = 0; i < tokens.length; i++) {
      final token = tokens[i];
      if (_isQuantityOrFiller(token)) {
        quantityTokens.add(token);
        continue;
      } else {
        productTokens.addAll(tokens.sublist(i));
        break;
      }
    }
    return ParsedShoppingItem(
      product: productTokens.join(' ').trim(),
      quantity: quantityTokens.join(' ').trim(),
    );
  }

  bool _isQuantityOrFiller(String word) {
    final standardWord = _standardiseWord(word);
    return _isNumeric(standardWord) ||
        _isFraction(standardWord) ||
        _isTimesQuantity(standardWord) ||
        _isNumericWithUnit(standardWord) ||
        quantityTerms.contains(standardWord) ||
        units.contains(standardWord) ||
        containers.contains(standardWord) ||
        fillerWords.contains(standardWord);
  }

  bool _isNumeric(String word) {
    return double.tryParse(word) != null || double.tryParse(wordsToNumbers(word)) != null;
  }

  bool _isFraction(String word) {
    return _fraction.hasMatch(word);
  }

  bool _isTimesQuantity(String word) {
    return word.toLowerCase().endsWith('x') && double.tryParse(word.substring(0, word.length - 1)) != null;
  }

  bool _isNumericWithUnit(String word) {
    final numericPart = word.replaceAll(_nonNumericCharacters, '');
    final unitPart = word.replaceAll(_numericCharacters, '');
    return _isNumeric(numericPart) && (unitPart.isEmpty || units.contains(unitPart));
  }

  String _standardiseWord(String word) {
    return word
        .toLowerCase()
        .replaceFirst(_trailingS, '')
        .replaceFirst(_leadingParen, '')
        .replaceFirst(_trailingParen, '');
  }

  final RegExp _trailingS = RegExp(r's$');
  final RegExp _leadingParen = RegExp(r'^\(');
  final RegExp _trailingParen = RegExp(r'\)$');
  final RegExp _nonNumericCharacters = RegExp(r'[^\d.]');
  final RegExp _numericCharacters = RegExp(r'[\d.]');
  final RegExp _fraction = RegExp(r'^\d+/\d+$');
}

const Set<String> units = {
  'g',
  'gram',
  'gm',
  'kg',
  'kilo',
  'kilogram',
  'ml',
  'millilitre',
  'milliliter',
  'l',
  'liter',
  'litre',
  'tsp',
  'teaspoon',
  'tb',
  'tablespoon',
  'tbsp',
  'cup',
  'oz',
  'ounce',
};

const Set<String> containers = {
  'bag',
  'btl',
  'bottle',
  'box',
  'boxes',
  'can',
  'carton',
  'container',
  'jar',
  'loaf',
  'loaves',
  'pack',
  'packet',
  'sachet',
  'tin',
  'tub',
  'tube',
};

const Set<String> quantityTerms = {
  'a',
  'an',
  'some',
  'few',
  'x',
  'times',
  'several',
  'many',
  'couple',
  'dozen',
  'half dozen',
  'lots',
  'heaps',
  'half',
  'third',
  'quarter',
  'fifth',
  'sixth',
  'seventh',
  'eighth',
  'ninth',
};

const Set<String> fillerWords = {
  'of',
  'and',
  'with',
  'without',
};
