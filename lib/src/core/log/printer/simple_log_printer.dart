// ignore_for_file: public_member_api_docs

import 'package:logger/logger.dart';

class SimpleLogPrinter extends LogPrinter {
  SimpleLogPrinter();

  @override
  List<String> log(LogEvent event) {
    final emoji = PrettyPrinter.defaultLevelEmojis[event.level];
    return ['$emoji ${event.message}'];
  }
}
