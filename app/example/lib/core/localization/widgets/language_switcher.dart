import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/core/localization/localization_cubit.dart';
import 'package:stadata_example/core/localization/localization_state.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({
    super.key,
    this.showText = false,
    this.iconSize = 24.0,
    this.style = LanguageSwitcherStyle.icon,
  });

  final bool showText;
  final double iconSize;
  final LanguageSwitcherStyle style;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationCubit, LocalizationState>(
      builder: (context, state) {
        switch (style) {
          case LanguageSwitcherStyle.icon:
            return _buildIconButton(context, state);
          case LanguageSwitcherStyle.dropdown:
            return _buildDropdown(context, state);
          case LanguageSwitcherStyle.toggle:
            return _buildToggleButton(context, state);
        }
      },
    );
  }

  Widget _buildIconButton(BuildContext context, LocalizationState state) {
    final cubit = context.read<LocalizationCubit>();

    return IconButton(
      onPressed: state.isLoading ? null : cubit.toggleLanguage,
      icon:
          state.isLoading
              ? SizedBox(
                width: iconSize,
                height: iconSize,
                child: const CircularProgressIndicator(strokeWidth: 2),
              )
              : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    cubit.currentLanguageFlag,
                    style: TextStyle(fontSize: iconSize),
                  ),
                  if (showText) ...[
                    const SizedBox(width: 4),
                    Text(
                      _getLanguageCode(state.currentLocale),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ],
              ),
      tooltip: 'Switch Language',
    );
  }

  Widget _buildDropdown(BuildContext context, LocalizationState state) {
    final cubit = context.read<LocalizationCubit>();

    return DropdownButtonHideUnderline(
      child: DropdownButton<AppLocale>(
        value: state.currentLocale,
        onChanged:
            state.isLoading
                ? null
                : (locale) {
                  if (locale != null) {
                    cubit.changeLanguage(locale);
                  }
                },
        items:
            AppLocale.values.map((locale) {
              return DropdownMenuItem<AppLocale>(
                value: locale,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(_getLanguageFlag(locale)),
                    const SizedBox(width: 8),
                    Text(_getLanguageName(locale)),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget _buildToggleButton(BuildContext context, LocalizationState state) {
    final cubit = context.read<LocalizationCubit>();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children:
            AppLocale.values.map((locale) {
              final isSelected = state.currentLocale == locale;

              return GestureDetector(
                onTap:
                    state.isLoading || isSelected
                        ? null
                        : () => cubit.changeLanguage(locale),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color:
                        isSelected
                            ? Theme.of(context).primaryColor
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(_getLanguageFlag(locale)),
                      const SizedBox(width: 4),
                      Text(
                        _getLanguageCode(locale),
                        style: TextStyle(
                          color:
                              isSelected
                                  ? Colors.white
                                  : Theme.of(
                                    context,
                                  ).textTheme.bodyMedium?.color,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }

  String _getLanguageCode(AppLocale locale) {
    switch (locale) {
      case AppLocale.en:
        return 'EN';
      case AppLocale.id:
        return 'ID';
    }
  }

  String _getLanguageName(AppLocale locale) {
    switch (locale) {
      case AppLocale.en:
        return 'English';
      case AppLocale.id:
        return 'Bahasa Indonesia';
    }
  }

  String _getLanguageFlag(AppLocale locale) {
    switch (locale) {
      case AppLocale.en:
        return '🇺🇸';
      case AppLocale.id:
        return '🇮🇩';
    }
  }
}

enum LanguageSwitcherStyle { icon, dropdown, toggle }
