import 'dart:developer' as dev;

class GameLogger {
  static void log(String message) {
    dev.log(message, name: 'HopyGame');
  }
}
