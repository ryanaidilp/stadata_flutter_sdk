/// An enum representing different data languages.
enum DataLanguage {
  /// Indonesian language.
  id,

  /// English language.
  en;

  /// Gets the string representation of the enum value.
  ///
  /// Returns 'ind' for [DataLanguage.id] and 'eng' for [DataLanguage.en].
  String get value => switch (this) {
    id => 'ind',
    en => 'eng',
  };
}
