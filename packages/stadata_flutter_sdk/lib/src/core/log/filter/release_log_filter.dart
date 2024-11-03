import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class ReleaseLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) => kDebugMode;
}
