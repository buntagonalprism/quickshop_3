import 'package:flutter_test/flutter_test.dart';
import 'package:quickshop/models/user_sortable.dart';

void main() {
  test(
      'GIVEN a primary gap of more than one'
      'THEN between uses an available primary', () {
    const a = UserSortKey(primary: 1, secondary: '');
    const b = UserSortKey(primary: 3, secondary: '');
    final result = UserSortKey.between(a, b);
    expect(result.primary, 2);
    expect(result.secondary, '');
  });

  test(
      'GIVEN a primary gap of one'
      'THEN between uses the same primary', () {
    const a = UserSortKey(primary: 1, secondary: '');
    const b = UserSortKey(primary: 2, secondary: '');
    final result = UserSortKey.between(a, b);
    expect(result.primary, 1);
    expect(result.secondary, '5555');
  });
}
