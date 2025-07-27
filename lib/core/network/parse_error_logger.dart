import 'package:dio/dio.dart';

abstract class ParseErrorLogger {
  void logError(Object error, StackTrace stackTrace, RequestOptions options);
}


class ConsoleErrorLogger implements ParseErrorLogger {
  @override
  void logError(Object error, StackTrace stackTrace, RequestOptions options) {
    print('Error: $error');
    print('StackTrace: $stackTrace');
    print('Request: ${options.uri}');
  }
}
