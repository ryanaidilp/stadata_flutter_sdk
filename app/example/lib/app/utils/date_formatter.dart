import 'package:intl/intl.dart';

class DateFormatter {
  const DateFormatter._();

  static String formatDate(
    String format,
    DateTime? date, {
    String placeholder = '',
    bool showTimezone = true,
  }) {
    if (date == null) {
      return placeholder;
    }

    if (format.contains('hh') ||
        format.contains('mm') ||
        format.contains('HH')) {
      return showTimezone
          ? '${DateFormat(format, 'id_ID').format(date)} ${date.timeZoneName}'
          : DateFormat(format, 'id_ID').format(date);
    }
    return DateFormat(format, 'id_ID').format(date);
  }

  static DateTime parseDate(String date) {
    return DateTime.parse(date);
  }
}
