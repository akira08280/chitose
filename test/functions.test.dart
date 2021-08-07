import 'dart:math';
import 'package:test/test.dart';
import 'package:onawave/functions.dart';
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
      expect(eq(orig, ['hoge', 2, 1]), false);
      expect(eq(orig, [1, 2, 'hoge']), true);
      expect(deepEq(actualSubs, expectRightSubs), true);
      expect(deepEq(actualSubs, expectDifferentSubs), false);
    });
  });
}
