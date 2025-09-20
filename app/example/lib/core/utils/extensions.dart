import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  /// Get the current theme
  ThemeData get theme => Theme.of(this);

  /// Get the current color scheme
  ColorScheme get colorScheme => theme.colorScheme;

  /// Get the current text theme
  TextTheme get textTheme => theme.textTheme;

  /// Get the media query data
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Get the screen size
  Size get screenSize => mediaQuery.size;

  /// Get the screen width
  double get width => screenSize.width;

  /// Get the screen height
  double get height => screenSize.height;

  /// Check if the screen is considered small
  bool get isSmallScreen => width < 600;

  /// Check if the screen is considered medium
  bool get isMediumScreen => width >= 600 && width < 840;

  /// Check if the screen is considered large
  bool get isLargeScreen => width >= 840;

  /// Show a snackbar with the given message
  void showSnackBar(
    String message, {
    Color? backgroundColor,
    Duration? duration,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        duration: duration ?? const Duration(seconds: 4),
      ),
    );
  }

  /// Show an error snackbar
  void showErrorSnackBar(String message) {
    showSnackBar(message, backgroundColor: colorScheme.error);
  }

  /// Show a success snackbar
  void showSuccessSnackBar(String message) {
    showSnackBar(message, backgroundColor: Colors.green);
  }
}

extension StringExtensions on String {
  /// Capitalize the first letter of the string
  String get capitalize {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  /// Capitalize all words in the string
  String get capitalizeWords {
    if (isEmpty) return this;
    return split(' ').map((word) => word.capitalize).join(' ');
  }

  /// Check if the string is a valid email
  bool get isValidEmail {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  }

  /// Check if the string is a valid URL
  bool get isValidUrl {
    return RegExp(r'^https?://').hasMatch(this);
  }

  /// Truncate the string to the given length
  String truncate(int length, {String suffix = '...'}) {
    if (this.length <= length) return this;
    return '${substring(0, length)}$suffix';
  }

  /// Remove HTML tags from the string
  String get removeHtmlTags {
    return replaceAll(RegExp(r'<[^>]*>'), '');
  }
}

extension ListExtensions<T> on List<T> {
  /// Check if the list is null or empty
  bool get isNullOrEmpty => isEmpty;

  /// Check if the list is not null or empty
  bool get isNotNullOrEmpty => isNotEmpty;

  /// Get a safe element at the given index
  T? safeElementAt(int index) {
    if (index < 0 || index >= length) return null;
    return this[index];
  }

  /// Add an element if it's not null
  void addIfNotNull(T? element) {
    if (element != null) add(element);
  }

  /// Remove duplicates from the list
  List<T> get unique {
    return toSet().toList();
  }
}

extension DateTimeExtensions on DateTime {
  /// Check if the date is today
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Check if the date is yesterday
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  /// Check if the date is tomorrow
  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return year == tomorrow.year &&
        month == tomorrow.month &&
        day == tomorrow.day;
  }

  /// Get the start of the day
  DateTime get startOfDay {
    return DateTime(year, month, day);
  }

  /// Get the end of the day
  DateTime get endOfDay {
    return DateTime(year, month, day, 23, 59, 59, 999);
  }
}
