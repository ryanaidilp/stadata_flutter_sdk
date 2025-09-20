import 'dart:async';

/// A reusable debouncer class that delays function execution
/// until after a specified duration has passed since the last call.
class Debouncer {
  Debouncer({this.delay = const Duration(milliseconds: 500)});

  /// The delay duration before executing the callback
  final Duration delay;

  Timer? _timer;

  /// Runs the given callback after [delay] duration.
  /// If called again before the delay has passed, the previous call is cancelled.
  void run(void Function() callback) {
    cancel();
    _timer = Timer(delay, callback);
  }

  /// Cancels any pending callback execution
  void cancel() {
    _timer?.cancel();
  }

  /// Disposes the debouncer and cancels any pending callbacks
  void dispose() {
    cancel();
  }
}

/// Extension method to easily debounce any function
extension DebouncerExtension on void Function() {
  void Function() debounce([
    Duration delay = const Duration(milliseconds: 500),
  ]) {
    Timer? debounceTimer;
    return () {
      debounceTimer?.cancel();
      debounceTimer = Timer(delay, this);
    };
  }
}
