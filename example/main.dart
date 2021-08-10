import 'package:chitose/chitose.dart';

void main() {

  List<int> hoge = [1, 2, 3];

  // You can get the sublist of a list.
  // [[], [3], [2], [2, 3], [1], [1, 3], [1, 2], [1, 2, 3]]
  print(hoge.subs());

  // You can get all the ways that inserted a new element in a list.
  // [[], [3], [2], [2, 3], [1], [1, 3], [1, 2], [1, 2, 3]]
  print(hoge.interleave(4));

  // You can get the permutations of a list.
  // [[1, 2, 3], [2, 1, 3], [2, 3, 1], [1, 3, 2], [3, 1, 2], [3, 2, 1]] 
  print(hoge.perms());

  // You can get the Cartesian product of a list.
  // [[1, 1, 1], [1, 1, 2], [1, 1, 3], [1, 2, 1], [1, 2, 2], [1, 2, 3], [1, 3, 1], [1, 3, 2], [1, 3, 3], [2, 1, 1], [2, 1, 2], [2, 1, 3], [2, 2, 1], [2, 2, 2], [2, 2, 3], [2, 3, 1], [2, 3, 2], [2, 3, 3], [3, 1, 1], [3, 1, 2], [3, 1, 3], [3, 2, 1], [3, 2, 2], [3, 2, 3], [3, 3, 1], [3, 3, 2], [3, 3, 3]]
  print(hoge.product(3));
}
