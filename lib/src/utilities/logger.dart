import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(
    methodCount: 2, // number of method calls to be displayed
    errorMethodCount: 8, // number of method calls if stacktrace is provided
    lineLength: 120, // width of the output
    colors: true, // Colorful log messages
    printEmojis: true, // Print an emoji for each log message
    printTime: false, // Should each log print contain a timestamp
  ),
);
showInfoMessage(String message) {
  logger.i(message);
}

showWarningMessage(String message) {
  logger.w(message);
}

showErrorMessage(String message) {
  logger.e(message);
}

showTerribleMessage(String message) {
  logger.wtf(message);
}
