import 'package:intl/intl.dart';

class DateFormatter {
  DateFormatter._();

  static const String _defaultDateFormat = 'dd MMM yyyy';
  static const String _shortDateFormat = 'dd/MM/yyyy';
  static const String _longDateFormat = 'EEEE, dd MMMM yyyy';
  static const String _timeFormat = 'HH:mm';
  static const String _dateTimeFormat = 'dd MMM yyyy HH:mm';

  /// Format date with default format (dd MMM yyyy)
  static String formatDate(DateTime date, [String? locale]) {
    return DateFormat(_defaultDateFormat, locale).format(date);
  }

  /// Format date with short format (dd/MM/yyyy)
  static String formatShortDate(DateTime date, [String? locale]) {
    return DateFormat(_shortDateFormat, locale).format(date);
  }

  /// Format date with long format (EEEE, dd MMMM yyyy)
  static String formatLongDate(DateTime date, [String? locale]) {
    return DateFormat(_longDateFormat, locale).format(date);
  }

  /// Format time (HH:mm)
  static String formatTime(DateTime date, [String? locale]) {
    return DateFormat(_timeFormat, locale).format(date);
  }

  /// Format date and time (dd MMM yyyy HH:mm)
  static String formatDateTime(DateTime date, [String? locale]) {
    return DateFormat(_dateTimeFormat, locale).format(date);
  }

  /// Format date with custom format
  static String formatCustom(DateTime date, String format, [String? locale]) {
    return DateFormat(format, locale).format(date);
  }

  /// Get relative time (e.g., "2 hours ago")
  static String getRelativeTime(DateTime date, [String? locale]) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 7) {
      return formatDate(date, locale);
    } else if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
  }

  /// Parse date from string
  static DateTime? parseDate(String dateString, [String? format]) {
    try {
      if (format != null) {
        return DateFormat(format).parse(dateString);
      }
      return DateTime.parse(dateString);
    } catch (e) {
      return null;
    }
  }

  /// Check if date is today
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  /// Check if date is yesterday
  static bool isYesterday(DateTime date) {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day;
  }
}
