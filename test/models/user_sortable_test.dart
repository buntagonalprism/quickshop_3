import 'package:flutter_test/flutter_test.dart';
import 'package:quickshop/models/user_sortable.dart';

/// The following sites were useful in performing base36 calculations:
/// - http://www.unitconversion.org/numbers/base-10-to-base-36-conversion.html - converts between
///   base 10 and base 36
/// - https://www.mathsisfun.com/calculator-precision.html - used to calculate the median between
///   large numbers, as other calculators would convert to an exponent and truncate the precision
void main() {
  test(
      'GIVEN two identical sort keys'
      'THEN between throws an ArgumentError', () {
    const a = UserSortKey(primary: 1, secondary: '1234');
    const b = UserSortKey(primary: 1, secondary: '1234');
    expect(() => UserSortKey.between(a, b), throwsArgumentError);
  });

  test(
      'GIVEN a primary gap of more than two '
      'THEN between returns the next primary with no secondary', () {
    const a = UserSortKey(primary: 3, secondary: '1234');
    const b = UserSortKey(primary: 7, secondary: '1dk1');
    final result = UserSortKey.between(a, b);
    expect(result.primary, 4);
    expect(result.secondary, '');
  });

  test(
      'GIVEN a primary gap of two '
      'THEN between returns the intermediate primary with no secondary', () {
    const a = UserSortKey(primary: 1, secondary: '1234');
    const b = UserSortKey(primary: 3, secondary: '1dk1');
    final result = UserSortKey.between(a, b);
    expect(result.primary, 2);
    expect(result.secondary, '');
  });

  test(
      'GIVEN a primary gap of one '
      'AND no secondary values '
      'THEN between returns the first primary and the median secondary segment value', () {
    const a = UserSortKey(primary: 1, secondary: '');
    const b = UserSortKey(primary: 2, secondary: '');
    final result = UserSortKey.between(a, b);
    expect(result.primary, 1);
    // In base 36 notation, hzzz is the median between 0000 and zzzz, equivalent to 4999 being the
    // median between 0000 and 9999 in base 10.
    expect(result.secondary, 'hzzz');
  });

  test(
      'GIVEN a primary gap of one '
      'AND first has a single-segment secondary value '
      'THEN between returns the median between the first secondary and max for the segment', () {
    const a = UserSortKey(primary: 1, secondary: '1234'); // 49,360 in base 10
    const b = UserSortKey(primary: 2, secondary: 'abcd'); // 481,261 in base 10
    final result = UserSortKey.between(a, b);
    expect(result.primary, 1);
    // In base 36, the median between 1234 and zzzz is ij1j, equivalent to 864,487 in base 10.
    // zzzz in base 10 is 1,679,615.
    expect(result.secondary, 'ij1j');
  });

  test(
      'GIVEN a primary gap of one '
      'AND first has a single secondary segment of max value '
      'THEN between returns an additional segment with the median segment value', () {
    const a = UserSortKey(primary: 1, secondary: 'zzzz');
    const b = UserSortKey(primary: 2, secondary: '0000');
    final result = UserSortKey.between(a, b);
    expect(result.primary, 1);
    expect(result.secondary, 'zzzz-hzzz');
  });

  test(
      'GIVEN a primary gap of one '
      'AND first has a multiple-segment secondary value '
      'THEN between returns the median between the first secondary and max for the segment length',
      () {
    const a = UserSortKey(primary: 1, secondary: '1234-abcd');
    const b = UserSortKey(primary: 2, secondary: 'abcd'); // This secondary value is not used
    final result = UserSortKey.between(a, b);
    expect(result.primary, 1);
    // In base 36:
    // - 1234abcd is 82,906,327,021 in base 10
    // - zzzzzzzz is 2,821,109,907,455 in base 10
    // - ij1k55o6 is 1,452,008,117,238 in base 10, the median of the two numbers above
    expect(result.secondary, 'ij1k-55o6');
  });

  test(
      'GIVEN a primary gap of one '
      'AND first has a single secondary segment of max value '
      'THEN between returns an additional segment with the median segment value', () {
    const a = UserSortKey(primary: 1, secondary: 'zzzz');
    const b = UserSortKey(primary: 2, secondary: '0000');
    final result = UserSortKey.between(a, b);
    expect(result.primary, 1);
    expect(result.secondary, 'zzzz-hzzz');
  });

  test(
      'GIVEN no primary gap '
      'AND secondary values of equal segment length '
      'THEN between returns the median secondary', () {
    const a = UserSortKey(primary: 1, secondary: '1234');
    const b = UserSortKey(primary: 1, secondary: 'abcd');
    final result = UserSortKey.between(a, b);
    expect(result.primary, 1);
    // In base 36:
    // - 1234 is 49,360 in base 10
    // - abcd is 481,261 in base 10
    // - 5opq is 265,310 in base 10, the median of the two numbers above
    expect(result.secondary, '5opq');
  });

  test(
      'GIVEN no primary gap '
      'AND second has a longer secondary '
      'THEN between returns the median secondary as though the first was zero-padded', () {
    const a = UserSortKey(primary: 1, secondary: '1234');
    const b = UserSortKey(primary: 1, secondary: 'abcd-efgh');
    final result = UserSortKey.between(a, b);
    expect(result.primary, 1);
    // In base 36:
    // - 12340000 is 82,905,845,760 in base 10
    // - abcdefgh is 808,334,348,993 in base 10
    // - 5opqp7q8 is 445,620,097,376 in base 10, the median of the two numbers above
    expect(result.secondary, '5opq-p7q8');
  });

  test(
      'GIVEN no primary gap '
      'AND first has a longer secondary '
      'THEN between returns the median secondary as though the second was z-padded', () {
    const a = UserSortKey(primary: 1, secondary: '1234-5678');
    const b = UserSortKey(primary: 1, secondary: 'abcd');
    final result = UserSortKey.between(a, b);
    expect(result.primary, 1);
    // In base 36:
    // - 12345678 is 82,906,087,076 in base 10
    // - abcdzzzz is 808,335,355,391 in base 10
    // - 5opr2l3l is 445,620,721,233 in base 10, the median of the two numbers above
    expect(result.secondary, '5opr-2l3l');
  });

  test(
      'GIVEN no primary gap '
      'AND a secondary gap of two '
      'THEN between returns the intermediate secondary', () {
    const a = UserSortKey(primary: 1, secondary: '1234');
    const b = UserSortKey(primary: 1, secondary: '1236');
    final result = UserSortKey.between(a, b);
    expect(result.primary, 1);
    expect(result.secondary, '1235');
  });

  test(
      'GIVEN no primary gap '
      'AND a secondary gap of one '
      'THEN between returns an additional segment with the median segment value', () {
    const a = UserSortKey(primary: 1, secondary: '1234');
    const b = UserSortKey(primary: 1, secondary: '1235');
    final result = UserSortKey.between(a, b);
    expect(result.primary, 1);
    expect(result.secondary, '1234-hzzz');
  });
}
