import 'package:flutter_test/flutter_test.dart';
import 'package:quickshop/models/user_sortable.dart';

/// The following sites were useful in performing base36 calculations:
/// - http://www.unitconversion.org/numbers/base-10-to-base-36-conversion.html - converts between
///   base 10 and base 36
/// - https://www.mathsisfun.com/calculator-precision.html - used to calculate the median between
///   large numbers, as other calculators would convert to an exponent and truncate the precision
void main() {
  group('UserSortKey.between ', () {
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
  });

  group('UserSortKey.subdivide ', () {
    test(
        'GIVEN an intervals count of 0 '
        'THEN an argument error is thrown', () {
      const key = UserSortKey(primary: 1, secondary: 'ab12');
      expect(() => key.subdivide(0), throwsArgumentError);
    });

    test(
        'GIVEN an intervals count of 1 '
        'THEN the key is returned unchanged', () {
      const key = UserSortKey(primary: 1, secondary: 'ab12');
      expect(key.subdivide(1), [key]);
    });

    test(
        'GIVEN an intervals count of 2 '
        'AND a secondary value present '
        'THEN two results are returned with a subdivided last segment appended', () {
      const key = UserSortKey(primary: 1, secondary: 'ab12');
      // The segment max value of zzzz is 1,679,615 in base 10
      expect(key.subdivide(2), [
        const UserSortKey(primary: 1, secondary: 'ab12-bzzz'), // Last segment = 559,871 in base10
        const UserSortKey(primary: 1, secondary: 'ab12-nzzy'), // Last segment = 1,119,742 in base10
      ]);
    });

    test(
        'GIVEN an intervals count of 3 '
        'AND no secondary value present '
        'THEN three results are returned with a subdivided last segment', () {
      const key = UserSortKey(primary: 4, secondary: '');
      // The segment max value of zzzz is 1,679,615 in base 10
      expect(key.subdivide(3), [
        const UserSortKey(primary: 4, secondary: '8zzz'), // Last segment = 419,903 in base10
        const UserSortKey(primary: 4, secondary: 'hzzy'), // Last segment = 839,806 in base10
        const UserSortKey(primary: 4, secondary: 'qzzx'), // Last segment = 1,259,709 in base10
      ]);
    });

    test(
        'GIVEN an intervals count of 5 '
        'THEN five results are returned with a subdivided last segment appended', () {
      const key = UserSortKey(primary: 1, secondary: 'ab12');
      // The segment max value of zzzz is 1,679,615 in base 10
      expect(key.subdivide(5), [
        const UserSortKey(primary: 1, secondary: 'ab12-5zzz'), // Last segment = 279,935 in base10
        const UserSortKey(primary: 1, secondary: 'ab12-bzzy'), // Last segment = 559,870 in base10
        const UserSortKey(primary: 1, secondary: 'ab12-hzzx'), // Last segment = 839,805 in base10
        const UserSortKey(primary: 1, secondary: 'ab12-nzzw'), // Last segment = 1,119,740 in base10
        const UserSortKey(primary: 1, secondary: 'ab12-tzzv'), // Last segment = 1,399,675 in base10
      ]);
    });
  });

  group('List<UserSortable>.userSort ', () {
    test(
        'GIVEN an empty list '
        'THEN the list is returned unchanged', () {
      final list = <UserSortable>[];
      list.userSort();
      expect(list, isEmpty);
    });

    test(
        'GIVEN a list of UserSortable objects '
        'AND no UserSortKey values are equal '
        'THEN the list is sorted by the UserSortKey', () {
      final list = List<UserSortable>.from(const [
        _Sortable(UserSortKey(primary: 1, secondary: '1234'), 'a'),
        _Sortable(UserSortKey(primary: 2, secondary: 'abcd'), 'b'),
        _Sortable(UserSortKey(primary: 1, secondary: '1235'), 'c'),
        _Sortable(UserSortKey(primary: 2, secondary: '1234'), 'd'),
        _Sortable(UserSortKey(primary: -4, secondary: ''), 'e'),
      ]);
      list.userSort();
      expect(list, const [
        _Sortable(UserSortKey(primary: -4, secondary: ''), 'e'),
        _Sortable(UserSortKey(primary: 1, secondary: '1234'), 'a'),
        _Sortable(UserSortKey(primary: 1, secondary: '1235'), 'c'),
        _Sortable(UserSortKey(primary: 2, secondary: '1234'), 'd'),
        _Sortable(UserSortKey(primary: 2, secondary: 'abcd'), 'b'),
      ]);
    });

    test(
        'GIVEN a list of UserSortable objects '
        'AND there are secondary sort keys of different length '
        'THEN longer secondary sort keys are sorted after equal segments of shorter length', () {
      final list = List<UserSortable>.from(const [
        _Sortable(UserSortKey(primary: 1, secondary: '1234'), 'a'),
        _Sortable(UserSortKey(primary: 1, secondary: ''), 'b'),
        _Sortable(UserSortKey(primary: 1, secondary: '1235'), 'c'),
        _Sortable(UserSortKey(primary: 1, secondary: '1234-5678-9abc'), 'd'),
        _Sortable(UserSortKey(primary: 1, secondary: '1234-5679'), 'e'),
        _Sortable(UserSortKey(primary: 1, secondary: '1234-5678'), 'f'),
      ]);

      list.userSort();
      expect(list, const [
        _Sortable(UserSortKey(primary: 1, secondary: ''), 'b'),
        _Sortable(UserSortKey(primary: 1, secondary: '1234'), 'a'),
        _Sortable(UserSortKey(primary: 1, secondary: '1234-5678'), 'f'),
        _Sortable(UserSortKey(primary: 1, secondary: '1234-5678-9abc'), 'd'),
        _Sortable(UserSortKey(primary: 1, secondary: '1234-5679'), 'e'),
        _Sortable(UserSortKey(primary: 1, secondary: '1235'), 'c'),
      ]);
    });

    test(
        'GIVEN a list of UserSortable objects '
        'AND some UserSortKey values are equal '
        'THEN those items are sorted by the sortFallback', () {
      final list = List<UserSortable>.from(const [
        _Sortable(UserSortKey(primary: 1, secondary: '1234'), 'e'),
        _Sortable(UserSortKey(primary: 2, secondary: '1234'), 'd'),
        _Sortable(UserSortKey(primary: 1, secondary: '1234'), 'c'),
        _Sortable(UserSortKey(primary: 3, secondary: '1234'), 'b'),
        _Sortable(UserSortKey(primary: 1, secondary: '1234'), 'a'),
      ]);
      list.userSort();
      expect(list, const [
        _Sortable(UserSortKey(primary: 1, secondary: '1234'), 'a'),
        _Sortable(UserSortKey(primary: 1, secondary: '1234'), 'c'),
        _Sortable(UserSortKey(primary: 1, secondary: '1234'), 'e'),
        _Sortable(UserSortKey(primary: 2, secondary: '1234'), 'd'),
        _Sortable(UserSortKey(primary: 3, secondary: '1234'), 'b'),
      ]);
    });
  });
}

class _Sortable implements UserSortable {
  const _Sortable(this.sortKey, this.name);
  @override
  final UserSortKey sortKey;
  final String name;

  @override
  String get sortFallback => name;

  @override
  String toString() => '$_Sortable($sortKey, $name)';
}
