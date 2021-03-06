import 'package:chitose/chitose.dart';
import 'package:collection/collection.dart';
import 'package:test/test.dart';
import 'dart:math';

void main() {
  final Function eq = const ListEquality().equals;
  final Function deepEq = const DeepCollectionEquality().equals;

  group('subs()', () {
    test('This test is for the subs function by an simple type list.', () {
      List<int> orig = [1, 2, 3];
      List<List<int>> expectRightSubs = [
        [],
        [3],
        [2],
        [2, 3],
        [1],
        [1, 3],
        [1, 2],
        [1, 2, 3]
      ];
      List<List<int>> expectDifferentSubs = [
        [],
        [3],
        [2],
        [2, 3],
        [1],
        [1, 3],
        [1, 2],
        [1, 2, 3],
        [999, 999]
      ];
      List<List<int>> actualSubs = orig.subs();

      expect(actualSubs.length == pow(2, orig.length).toInt(), true);
      expect(eq(orig, []), false);
      expect(eq(orig, null), false);
      expect(eq(orig, [3, 2, 1]), false);
      expect(eq(orig, [1, 2, 3]), true);
      expect(deepEq(actualSubs, expectRightSubs), true);
      expect(deepEq(actualSubs, expectDifferentSubs), false);
    });
    test('This test is for the subs function by an multiple type list.', () {
      List<dynamic> orig = [1, 2, 'hoge'];
      List<List<dynamic>> expectRightSubs = [
        [],
        ['hoge'],
        [2],
        [2, 'hoge'],
        [1],
        [1, 'hoge'],
        [1, 2],
        [1, 2, 'hoge']
      ];
      List<List<dynamic>> expectDifferentSubs = [
        [],
        ['hoge'],
        [2],
        [2, 'hoge'],
        [1],
        [1, 'hoge'],
        [1, 2],
        [1, 2, 'hoge'],
        [999, 'wave']
      ];
      List<List<dynamic>> actualSubs = orig.subs();

      expect(actualSubs.length == pow(2, orig.length).toInt(), true);
      expect(eq(orig, []), false);
      expect(eq(orig, null), false);
      expect(eq(orig, ['hoge', 2, 1]), false);
      expect(eq(orig, [1, 2, 'hoge']), true);
      expect(deepEq(actualSubs, expectRightSubs), true);
      expect(deepEq(actualSubs, expectDifferentSubs), false);
    });
  });

  group('interleave()', () {
    test('This test is for the interleave function by an simple type list.',
        () {
      List<int> orig = [2, 3, 4];
      List<List<int>> expectRightLeft = [
        [1, 2, 3, 4],
        [2, 1, 3, 4],
        [2, 3, 1, 4],
        [2, 3, 4, 1]
      ];
      List<List<int>> expectDifferentLeft = [
        [2, 1, 3, 4],
        [1, 2, 3, 4],
        [2, 3, 1, 4],
        [2, 3, 4, 1]
      ];
      List<List<int>> actualLeft = orig.interleave(1);

      expect(actualLeft.length == orig.length + 1, true);
      expect(eq(orig, []), false);
      expect(eq(orig, null), false);
      expect(eq(orig, [4, 3, 2]), false);
      expect(eq(orig, [2, 3, 4]), true);
      expect(deepEq(actualLeft, expectRightLeft), true);
      expect(deepEq(actualLeft, expectDifferentLeft), false);
    });
    test('This test is for the interleave function by an multiple type list.',
        () {
      List<dynamic> orig = [2, 3, 4];
      List<List<dynamic>> expectRightLeft = [
        ['a', 2, 3, 4],
        [2, 'a', 3, 4],
        [2, 3, 'a', 4],
        [2, 3, 4, 'a']
      ];
      List<List<dynamic>> expectDifferentLeft = [
        [2, 'a', 3, 4],
        ['a', 2, 3, 4],
        [2, 3, 'a', 4],
        [2, 3, 4, 'a']
      ];
      List<List<dynamic>> actualLeft = orig.interleave('a');

      expect(actualLeft.length == orig.length + 1, true);
      expect(eq(orig, []), false);
      expect(eq(orig, null), false);
      expect(eq(orig, [4, 3, 2]), false);
      expect(eq(orig, [2, 3, 4]), true);
      expect(deepEq(actualLeft, expectRightLeft), true);
      expect(deepEq(actualLeft, expectDifferentLeft), false);
    });
  });

  group('perms()', () {
    test('This test is for the perms function by an simple type list.', () {
      List<int> orig = [1, 2, 3];
      List<List<int>> expectRightPerms = [
        [1, 2, 3],
        [2, 1, 3],
        [2, 3, 1],
        [1, 3, 2],
        [3, 1, 2],
        [3, 2, 1]
      ];
      List<List<int>> expectDifferentPerms = [
        [1, 2, 3],
        [2, 1, 3],
        [2, 3, 1],
        [1, 3, 2],
        [3, 1, 2],
        [3, 1, 2]
      ];
      List<List<int>> actualPerms = orig.perms();

      expect(eq(orig, []), false);
      expect(eq(orig, null), false);
      expect(eq(orig, [3, 2, 1]), false);
      expect(eq(orig, [1, 2, 3]), true);
      expect(deepEq(actualPerms, expectRightPerms), true);
      expect(deepEq(actualPerms, expectDifferentPerms), false);
    });
    test('This test is for the perms function by an multiple type list.', () {
      List<dynamic> orig = [1, 2, 'a'];
      List<List<dynamic>> expectRightPerms = [
        [1, 2, 'a'],
        [2, 1, 'a'],
        [2, 'a', 1],
        [1, 'a', 2],
        ['a', 1, 2],
        ['a', 2, 1]
      ];
      List<List<dynamic>> expectDifferentPerms = [
        [1, 2, 'a'],
        [2, 1, 'a'],
        [2, 'a', 1],
        [1, 'a', 2],
        ['a', 1, 2],
        ['a', 1, 2]
      ];
      List<List<dynamic>> actualPerms = orig.perms();

      expect(eq(orig, []), false);
      expect(eq(orig, null), false);
      expect(eq(orig, ['a', 2, 1]), false);
      expect(eq(orig, [1, 2, 'a']), true);
      expect(deepEq(actualPerms, expectRightPerms), true);
      expect(deepEq(actualPerms, expectDifferentPerms), false);
    });
  });

  group('product()', () {
    test('This test is for the product function by an simple type list.', () {
      List<int> orig = [1, 2, 3];
      List<List<int>> expectRightProduct = [
        [1, 1],
        [1, 2],
        [1, 3],
        [2, 1],
        [2, 2],
        [2, 3],
        [3, 1],
        [3, 2],
        [3, 3]
      ];
      List<List<int>> expectDifferentProduct = [
        [1, 1],
        [1, 2],
        [1, 3],
        [2, 1],
        [2, 2],
        [2, 3],
        [3, 1],
        [3, 3],
        [3, 2]
      ];
      List<List<int>> actualProduct = orig.product(2);

      expect(eq(orig, []), false);
      expect(eq(orig, null), false);
      expect(eq(orig, [3, 2, 1]), false);
      expect(eq(orig, [1, 2, 3]), true);
      expect(deepEq(actualProduct, expectRightProduct), true);
      expect(deepEq(actualProduct, expectDifferentProduct), false);
    });
    test('This test is for the product function by an multiple type list.', () {
      List<dynamic> orig = [1, 2, 'a'];
      List<List<dynamic>> expectRightProduct = [
        [1, 1],
        [1, 2],
        [1, 'a'],
        [2, 1],
        [2, 2],
        [2, 'a'],
        ['a', 1],
        ['a', 2],
        ['a', 'a']
      ];
      List<List<dynamic>> expectDifferentProduct = [
        [1, 1],
        [1, 2],
        [1, 'a'],
        [2, 1],
        [2, 2],
        [2, 'a'],
        ['a', 1],
        ['a', 'a'],
        ['a', 2]
      ];
      List<List<dynamic>> actualProduct = orig.product(2);

      expect(eq(orig, []), false);
      expect(eq(orig, null), false);
      expect(eq(orig, ['a', 2, 1]), false);
      expect(eq(orig, [1, 2, 'a']), true);
      expect(deepEq(actualProduct, expectRightProduct), true);
      expect(deepEq(actualProduct, expectDifferentProduct), false);
    });
    test('This test is the check for when an argument is under 0.', () {
      expect(deepEq([1, 2, 3].product(0), [[]]), true);
      expect(deepEq([1, 2, 3].product(-1), [[]]), true);
      expect(deepEq([1, 2, 3].product(-9), [[]]), true);
      expect(deepEq([1, 2, 3].product(1), [[]]), false);
      expect(deepEq([1, 2, 3].product(9), [[]]), false);
    });
  });

  group('tails()', () {
    test('This test is for the tails function by an simple type list.', () {
      List<int> orig = [1, 2, 3, 4, 5];
      List<List<int>> expectRightTails = [
        [1, 2, 3, 4, 5],
        [2, 3, 4, 5],
        [3, 4, 5],
        [4, 5],
        [5],
        []
      ];
      List<List<int>> expectDifferentTails = [
        [1, 2, 3, 4, 5],
        [2, 3, 4, 5],
        [3, 4, 5],
        [4, 5],
        [6],
        []
      ];
      List<List<int>> actualTails = orig.tails();

      expect(eq(orig, []), false);
      expect(eq(orig, null), false);
      expect(eq(orig, [5, 4, 3, 2, 1]), false);
      expect(eq(orig, [1, 2, 3, 4, 5]), true);
      expect(deepEq(actualTails, expectRightTails), true);
      expect(deepEq(actualTails, expectDifferentTails), false);
    });
    test('This test is for the tails function by an multiple type list.', () {
      List<dynamic> orig = [1, 'a', 3, 'b', 5];
      List<List<dynamic>> expectRightTails = [
        [1, 'a', 3, 'b', 5],
        ['a', 3, 'b', 5],
        [3, 'b', 5],
        ['b', 5],
        [5],
        []
      ];
      List<List<dynamic>> expectDifferentTails = [
        [1, 'a', 3, 'b', 5],
        ['a', 3, 'b', 5],
        [3, 'b', 5],
        ['b', 5],
        [6],
        []
      ];
      List<List<dynamic>> actualTails = orig.tails();

      expect(eq(orig, []), false);
      expect(eq(orig, null), false);
      expect(eq(orig, [5, 'b', 3, 'a', 1]), false);
      expect(eq(orig, [1, 'a', 3, 'b', 5]), true);
      expect(deepEq(actualTails, expectRightTails), true);
      expect(deepEq(actualTails, expectDifferentTails), false);
    });
  });

  group('combs()', () {
    test('This test is for the combs function.', () {
      List<int> orig = [1, 2, 3, 4, 5];
      List<List<int>> expect1 = [
        [1],
        [2],
        [3],
        [4],
        [5]
      ];
      List<List<int>> expect2 = [
        [1, 2],
        [1, 3],
        [1, 4],
        [1, 5],
        [2, 3],
        [2, 4],
        [2, 5],
        [3, 4],
        [3, 5],
        [4, 5]
      ];
      List<List<int>> expect3 = [
        [1, 2, 3],
        [1, 2, 4],
        [1, 2, 5],
        [1, 3, 4],
        [1, 3, 5],
        [1, 4, 5],
        [2, 3, 4],
        [2, 3, 5],
        [2, 4, 5],
        [3, 4, 5]
      ];
      List<List<int>> expect4 = [
        [1, 2, 3, 4],
        [1, 2, 3, 5],
        [1, 2, 4, 5],
        [1, 3, 4, 5],
        [2, 3, 4, 5]
      ];
      List<List<int>> expect5 = [
        [1, 2, 3, 4, 5]
      ];
      List<List<int>> result1 = orig.combs(1);
      List<List<int>> result2 = orig.combs(2);
      List<List<int>> result3 = orig.combs(3);
      List<List<int>> result4 = orig.combs(4);
      List<List<int>> result5 = orig.combs(5);

      expect(eq(orig, []), false);
      expect(eq(orig, null), false);
      expect(eq(orig, [5, 4, 3, 2, 1]), false);
      expect(eq(orig, [1, 2, 3, 4, 5]), true);
      expect(deepEq(result1, expect1), true);
      expect(deepEq(result2, expect2), true);
      expect(deepEq(result3, expect3), true);
      expect(deepEq(result4, expect4), true);
      expect(deepEq(result5, expect5), true);
    });
    test('This test is the check for when an argument is under 0.', () {
      expect(deepEq([1, 2, 3].combs(0), [[]]), true);
      expect(deepEq([1, 2, 3].combs(-1), [[]]), true);
      expect(deepEq([1, 2, 3].combs(-9), [[]]), true);
      expect(deepEq([1, 2, 3].combs(1), [[]]), false);
      expect(deepEq([1, 2, 3].combs(3), [[]]), false);
    });
  });
}
