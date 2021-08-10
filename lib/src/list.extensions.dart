extension ListExtensions<T> on List<T> {

  /// TODO Comment
  List<List<T>> subs() {
    return this._subs([...this]);
  }

  /// TODO Comment
  List<List<T>> _subs(List<T> xss) {
    if(xss.length == 0) {
      return [[]];
    }
    final T x = xss.removeAt(0);
    final List<List<T>> yss = _subs(xss);
    final List<List<T>> inserted = yss.map((e) => [...[x], ...e]).toList();
    return [...yss, ...inserted];
  }

  /// TODO Comment
  List<List<T>> interleave(T x) {
    return this._interleave(x, [...this]);
  }

  /// TODO Comment
  List<List<T>> _interleave(T x, List<T> yss) {
    if(yss.length == 0) {
      return [[x]];
    }
    final T y = yss[0];
    final List<List<T>> zss = _interleave(x, yss.sublist(1));
    final List<List<T>> inserted = zss.map((e) => [...[y], ...e]).toList();
    yss.insert(0, x);
    return [...[yss], ...inserted];
  }

  /// TODO Comment
  List<List<T>> perms() {
    return this._perms([...this]);
  }

  /// TODO Comment
  List<List<T>> _perms(List<T> xss) {
    if(xss.length == 0) {
      return [[]];
    }
    T x = xss[0];
    List<T> xs = xss.sublist(1);
    return _perms(xs).map((e) => e.interleave(x)).expand((e) => e).toList();
  }

  /// TODO Comment
  List<List<T>> product(int repeat) {
    return _product([...this], repeat);
  }

  /// TODO Comment
  List<List<T>> _product(List<T> xss, int repeat) {
    if (repeat <= 0) {
      return [[]];
    }
    return _product(xss, repeat - 1).map((e1) => xss.map((e2) => [...e1, ...[e2]])).expand((e) => e).toList();
  }
}
