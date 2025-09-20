# Localization System

This package implements a complete localization system for the Flutter app with language switching capabilities.

## Features

- **LocalizationCubit**: State management for app language switching
- **Language Persistence**: Saves language preference using SharedPreferences
- **Multiple UI Components**: Various language switcher widgets
- **Smooth Transitions**: Language changes without app restart
- **Auto-initialization**: Loads saved or device language on app start

## Components

### LocalizationCubit
Manages the current locale state and provides methods for language switching:
- `initialize()`: Initialize with saved/device locale
- `changeLanguage(AppLocale locale)`: Change to specific language
- `toggleLanguage()`: Toggle between Indonesian and English
- `clearError()`: Clear error state

### Language Switcher Widgets

#### AppBarLanguageSwitcher
Simple popup menu button designed for app bar usage:
```dart
AppBar(
  actions: const [
    AppBarLanguageSwitcher(),
  ],
)
```

#### LanguageSwitcher
Flexible widget with multiple styles:
```dart
// Icon button style
LanguageSwitcher(style: LanguageSwitcherStyle.icon)

// Dropdown style
LanguageSwitcher(style: LanguageSwitcherStyle.dropdown)

// Toggle button style
LanguageSwitcher(style: LanguageSwitcherStyle.toggle)
```

## Usage

### 1. Setup (Already configured in App)
The LocalizationCubit is automatically provided at the app level and integrated with MaterialApp.

### 2. Using Translations in Widgets
```dart
// Use context.t to access translations
final t = context.t;
Text(t.app.title)
```

### 3. Adding Language Switcher
```dart
// In any widget
AppBarLanguageSwitcher() // For app bars
LanguageSwitcher() // For other locations
```

### 4. Listening to Language Changes
```dart
BlocBuilder<LocalizationCubit, LocalizationState>(
  builder: (context, state) {
    return Text('Current language: ${state.currentLocale}');
  },
)
```

## Supported Languages

- **English** (en) - 🇺🇸
- **Bahasa Indonesia** (id) - 🇮🇩

## Technical Details

- Uses Slang for translation management
- SharedPreferences for persistence
- BLoC pattern for state management
- Integrates with MaterialApp's locale system
- Supports both RTL and LTR layouts