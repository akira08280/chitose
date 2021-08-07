extension OnAWaveList<T> on List<T> {

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

  /*
  /// TODO Comment
  List<List<T>> interleave(T x) {
    this._interleave(x)
  }

  /// TODO Comment
  List<List<T>> _interleave(T x, List<T> yss) {
    
  }
  */

  /// TODO Comment
  List<List<T>> _copy(List<List<T>> original) {
    return original
      .map((e) => List.from(e).cast<T>())
      .toList()
      .cast<List<T>>();
  }
}
