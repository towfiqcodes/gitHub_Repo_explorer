class Debouncer {
  final Duration delay;
  Function(String)? _onValue;
  String _value = '';

  Debouncer(this.delay);

  void call(String value, void Function(String) onValue) {
    _onValue = onValue;
    _value = value;
    Future.delayed(delay, () {
      if (_value == value) _onValue?.call(value);
    });
  }
}
