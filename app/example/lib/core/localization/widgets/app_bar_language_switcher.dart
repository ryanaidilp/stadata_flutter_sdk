import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/core/localization/localization_cubit.dart';
import 'package:stadata_example/core/localization/localization_state.dart';

class AppBarLanguageSwitcher extends StatelessWidget {
  const AppBarLanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationCubit, LocalizationState>(
      builder: (context, state) {
        final cubit = context.read<LocalizationCubit>();

        return PopupMenuButton<void>(
          onSelected: (_) {},
          icon:
              state.isLoading
                  ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                  : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        cubit.currentLanguageFlag,
                        style: const TextStyle(fontSize: 20),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                        size: 16,
                      ),
                    ],
                  ),
          tooltip: 'Change Language',
          itemBuilder:
              (context) => [
                PopupMenuItem<void>(
                  onTap:
                      state.isLoading
                          ? null
                          : () => cubit.changeLanguage(
                            state.currentLocale == AppLocale.en
                                ? AppLocale.id
                                : AppLocale.en,
                          ),
                  child: Row(
                    children: [
                      Text(
                        state.currentLocale == AppLocale.en ? '🇮🇩' : '🇺🇸',
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        state.currentLocale == AppLocale.en
                            ? 'Bahasa Indonesia'
                            : 'English',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
        );
      },
    );
  }
}
