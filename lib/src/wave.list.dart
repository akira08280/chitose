extension WaveList<T> on List<T> {

  /// TODO Comment
  List<List<T>> subs() {
    return this._subs([...this]);
  }

  /// TODO Comment
  List<List<T>> _subs(List<T> xss) {
    if(xss.length == 0) {
      return [[]];
    }
    T x = xss.removeAt(0);
    final List<List<T>> yss = _subs(xss);
    final List<List<T>> copied = _copy(yss);
    yss.forEach((e) => e.insert(0, x));
    return [...copied, ...yss];
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
    T y = yss[0];
    List<T> ys = yss.sublist(1);
    List<List<T>> left = _interleave(x, ys);
    left.forEach((e) => e.insert(0, y));
    yss.insert(0, x);
    return [...[yss], ...left];
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
    return _perms(xs).map((e) => e.interleave(x)).expand((e) => e).toList().cast<List<T>>();
  }

  /// TODO Comment
  List<List<T>> _copy(List<List<T>> original) {
    return original
      .map((e) => List.from(e).cast<T>())
      .toList()
      .cast<List<T>>();
  }
}
