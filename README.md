# chitose

Chitose is a package that makes it easy to handle the List of Dart Core, which is implemented inspired by Programming Haskell. It generates permutation, product, sublist of arrays. The origin of the name of Chitose is a surf point located in the south of Chiba prefecture in Japan, which is one of the author's favorite locations.

## USAGE

You can easily use the Chitose library by designated the following import statement.

```dart
import 'package:chitose/collection.dart';
```
## Examples

### How to generate all sublists of a list

If you want all sublists of your list, it is available to the subs function implemented in the list extension.

```dart
[1,2,3].subs();
```

The result is,

```dart
[[], [3], [2], [2, 3], [1], [1, 3], [1, 2], [1, 2, 3]]
```

### How to generate all permutations of a list

If you want all permutationss of your list, it is available to the perms function implemented in the list extension.

```dart
[1,2,3].perms();
```

The result is,

```dart
[[1, 2, 3], [2, 1, 3], [2, 3, 1], [1, 3, 2], [3, 1, 2], [3, 2, 1]]
```

### How to generate the Cartesian product of a list

If you want to get the Cartesian product of a list, you can use the product function. Specify the number of repetitions as the argument.

```dart
[1,2,3].product(4);
```

The result is,

```dart
[[1, 1, 1, 1], [1, 1, 1, 2], [1, 1, 1, 3], [1, 1, 2, 1], ... [3, 3, 2, 3], [3, 3, 3, 1], [3, 3, 3, 2], [3, 3, 3, 3]]
```

## Note

### Memory Footprint

As of August 2021, the generated result in the middle is expanded to the memory. The package should implement the generator of Dart the result and return it one by one, but it is not supported as of 2021 August. Because Programming Haskell inspires this library, Haskell supports lazy evaluation as a language specification. On the other hand, in Dart, it is necessary to change thinking to procedural to realize it with the generator.

### Performance

Due to the memory footprint described above, there are concerns that you can not get high performance for large arrays. It is supposed to be improved in the future.

## Release notes

Please see the CHANGELOG
