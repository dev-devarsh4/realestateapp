import 'package:logger/logger.dart';
import 'dart:developer';
class AppLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) => true;
}