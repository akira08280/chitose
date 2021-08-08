import 'dart:math';
import 'package:test/test.dart';
import 'package:onawave/onawave.dart';
import 'package:collection/collection.dart';

void main() {

  final Function eq = const ListEquality().equals;
  final Function deepEq = const DeepCollectionEquality().equals;

  group('subs()', () {
    test('This test is for the subs function by an simple type list.', () {
      List<int> orig = [1, 2, 3];
      List<List<int>> expectRightSubs = [[], [3], [2], [2, 3], [1], [1, 3], [1, 2], [1, 2, 3]];
      List<List<int>> expectDifferentSubs = [[], [3], [2], [2, 3], [1], [1, 3], [1, 2], [1, 2, 3], [999, 999]];
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
      List<List<dynamic>> expectRightSubs = [[], ['hoge'], [2], [2, 'hoge'], [1], [1, 'hoge'], [1, 2], [1, 2, 'hoge']];
      List<List<dynamic>> expectDifferentSubs = [[], ['hoge'], [2], [2, 'hoge'], [1], [1, 'hoge'], [1, 2], [1, 2, 'hoge'], [999, 'wave']];
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
    test('This test is for the interleave function by an simple type list.', () {
      List<int> orig = [2, 3, 4];
      List<List<int>> expectRightLeft = [[1, 2, 3, 4], [2, 1, 3, 4], [2, 3, 1, 4], [2, 3, 4, 1]];
      List<List<int>> expectDifferentLeft = [[2, 1, 3, 4], [1, 2, 3, 4], [2, 3, 1, 4], [2, 3, 4, 1]];
      List<List<int>> actualLeft = orig.interleave(1);

      expect(actualLeft.length == orig.length + 1, true);
      expect(eq(orig, []), false);
      expect(eq(orig, null), false);
      expect(eq(orig, [4, 3, 2]), false);
      expect(eq(orig, [2, 3, 4]), true);
      expect(deepEq(actualLeft, expectRightLeft), true);
      expect(deepEq(actualLeft, expectDifferentLeft), false);
    });
    test('This test is for the interleave function by an multiple type list.', () {
      List<dynamic> orig = [2, 3, 4];
      List<List<dynamic>> expectRightLeft = [['a', 2, 3, 4], [2, 'a', 3, 4], [2, 3, 'a', 4], [2, 3, 4, 'a']];
      List<List<dynamic>> expectDifferentLeft = [[2, 'a', 3, 4], ['a', 2, 3, 4], [2, 3, 'a', 4], [2, 3, 4, 'a']];
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
}
