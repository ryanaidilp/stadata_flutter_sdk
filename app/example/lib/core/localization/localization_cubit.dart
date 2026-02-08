import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stadata_example/core/generated/strings.g.dart';

import 'package:stadata_example/core/localization/localization_state.dart';

@singleton
class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(const LocalizationState());

  static const String _localePreferenceKey = 'selected_locale';

  /// Initialize the cubit with the saved locale or device locale
  Future<void> initialize() async {
    emit(state.copyWith(isLoading: true));

    try {
      final prefs = await SharedPreferences.getInstance();
      final savedLocale = prefs.getString(_localePreferenceKey);

      AppLocale locale;
      if (savedLocale != null) {
        // Use saved locale
        try {
          locale = AppLocaleUtils.parse(savedLocale);
        } catch (e) {
          // If saved locale is invalid, fall back to device locale
          locale = AppLocaleUtils.findDeviceLocale();
        }
      } else {
        // Use device locale
        locale = AppLocaleUtils.findDeviceLocale();
      }

      // Set the locale in LocaleSettings
      await LocaleSettings.setLocale(locale);

      emit(state.copyWith(currentLocale: locale, isLoading: false));
    } catch (e) {
      // Fallback to English if something goes wrong
      await LocaleSettings.setLocale(AppLocale.en);
      emit(
        state.copyWith(
          currentLocale: AppLocale.en,
          isLoading: false,
          error: 'Failed to initialize localization: $e',
        ),
      );
    }
  }

  /// Change the app language
  Future<void> changeLanguage(AppLocale locale) async {
    if (state.currentLocale == locale) return;

    emit(state.copyWith(isLoading: true));

    try {
      // Save locale preference
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_localePreferenceKey, locale.languageCode);

      // Set the locale in LocaleSettings
      await LocaleSettings.setLocale(locale);

      emit(state.copyWith(currentLocale: locale, isLoading: false));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: 'Failed to change language: $e',
        ),
      );
    }
  }

  /// Toggle between Indonesian and English
  Future<void> toggleLanguage() async {
    final newLocale =
        state.currentLocale == AppLocale.en ? AppLocale.id : AppLocale.en;
    await changeLanguage(newLocale);
  }

  /// Get the display name for the current locale
  String get currentLanguageDisplayName {
    switch (state.currentLocale) {
      case AppLocale.en:
        return 'English';
      case AppLocale.id:
        return 'Bahasa Indonesia';
    }
  }

  /// Get the flag emoji for the current locale
  String get currentLanguageFlag {
    switch (state.currentLocale) {
      case AppLocale.en:
        return '🇺🇸';
      case AppLocale.id:
        return '🇮🇩';
    }
  }

  /// Clear any error state
  void clearError() {
    if (state.error != null) {
      emit(state.copyWith());
    }
  }
}
