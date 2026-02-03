import 'package:equatable/equatable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';

class LocalizationState extends Equatable {
  const LocalizationState({
    this.currentLocale = AppLocale.en,
    this.isLoading = false,
    this.error,
  });

  final AppLocale currentLocale;
  final bool isLoading;
  final String? error;

  LocalizationState copyWith({
    AppLocale? currentLocale,
    bool? isLoading,
    String? error,
  }) {
    return LocalizationState(
      currentLocale: currentLocale ?? this.currentLocale,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [currentLocale, isLoading, error];
}
