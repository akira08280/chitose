extension ListExtensions<T> on List<T> {
  /// Returns the all partial list of the list.
  ///
  /// ```dart
  /// [].subs();
  /// [[]]
  /// ```
  /// ```dart
  /// [3].subs();
  /// [[], [3]]
  /// ```
  /// ```dart
  /// [2, 3].subs();
  /// [[], [3], [2], [2, 3]]
  /// ```
  /// ```dart
  /// [1, 2, 3].subs();
  /// [[], [3], [2], [2, 3], [1], [1, 3], [1, 2], [1, 2, 3]]
  /// ```
  List<List<T>> subs() {
    return this._subs([...this]);
  }

  List<List<T>> _subs(List<T> xss) {
    if (xss.length == 0) {
      return [[]];
    }
    final T x = xss.removeAt(0);
    final List<List<T>> yss = _subs(xss);
    final List<List<T>> inserted = yss
        .map((e) => [
              ...[x],
              ...e
            ])
        .toList();
    return [...yss, ...inserted];
  }

  /// Returns all the ways to insert a new element into a list.
  ///
  /// ```dart
  /// [].interleave(1);
  /// [[1]]
  /// ```
  /// ```dart
  /// [3].interleave(1);
  /// [[1, 4], [4, 1]]
  /// ```
  /// ```dart
  /// [3, 4].interleave(1);
  /// [[1, 3, 4], [3, 1, 4], [3, 4, 1]]
  /// ```
  /// ```dart
  /// [2, 3, 4].interleave(1);
  /// [[1, 2, 3, 4], [2, 1, 3, 4], [2, 3, 1, 4], [2, 3, 4, 1]]
  /// ```
  List<List<T>> interleave(T x) {
    return this._interleave(x, [...this]);
  }

  List<List<T>> _interleave(T x, List<T> yss) {
    if (yss.length == 0) {
      return [
        [x]
      ];
    }
    final T y = yss[0];
    final List<List<T>> zss = _interleave(x, yss.sublist(1));
    final List<List<T>> inserted = zss
        .map((e) => [
              ...[y],
              ...e
            ])
        .toList();
    yss.insert(0, x);
    return [
      ...[yss],
      ...inserted
    ];
  }

  /// Returns all the permutation of a list.
  ///
  /// ```dart
  /// [].perms();
  /// [[]]
  /// ```
  /// ```dart
  /// [3].perms();
  /// [[3]]
  /// ```
  /// ```dart
  /// [2, 3].perms();
  /// [[2, 3], [3, 2]]
  /// ```
  /// ```dart
  /// [1, 2, 3].perms();
  /// [[1, 2, 3], [2, 1, 3], [2, 3, 1], [1, 3, 2], [3, 1, 2], [3, 2, 1]]
  /// ```
  List<List<T>> perms() {
    return this._perms([...this]);
  }

  List<List<T>> _perms(List<T> xss) {
    if (xss.length == 0) {
      return [[]];
    }
    T x = xss[0];
    List<T> xs = xss.sublist(1);
    return _perms(xs).map((e) => e.interleave(x)).expand((e) => e).toList();
  }

  /// Returns all the Cartesian product of a list.
  ///
  /// Specify the number of repetitions as the argument. If specified the argument under the 0, returns the empty list of a list.
  ///
  /// ```dart
  /// [1, 2, 3].product(2);
  /// [[1, 1], [1, 2], [1, 3], [2, 1], [2, 2], [2, 3], [3, 1], [3, 2], [3, 3]]
  /// ```
  /// ```dart
  /// [1, 2, 3].product(-1);
  /// [[]]
  /// ```
  List<List<T>> product(int repeat) {
    return _product([...this], repeat);
  }

  List<List<T>> _product(List<T> xss, int repeat) {
    if (repeat <= 0) {
      return [[]];
    }
    return _product(xss, repeat - 1)
        .map((e1) => xss.map((e2) => [
              ...e1,
              ...[e2]
            ]))
        .expand((e) => e)
        .toList();
  }

  /// TODO Comment
  List<List<T>> tails() {
    return this._tails([...this]);
  }

  List<List<T>> _tails(List<T> xss) {
    if (xss.length == 0) {
      return [[]];
    }
    List<T> xs = xss.sublist(1);
    return [
      ...[xss],
      ..._tails(xs)
    ];
  }
}
