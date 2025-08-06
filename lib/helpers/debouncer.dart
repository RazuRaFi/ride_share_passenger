
import 'dart:async';
import 'dart:ui';

class CustomDeBouncer {
  final Duration delay;
  Timer? _timer;

  CustomDeBouncer({required this.delay});

  void run(VoidCallback action) {
    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer(delay, action); // Start a new timer
  }

  void dispose() {
    _timer?.cancel();
  }
}
