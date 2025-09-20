import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/core/localization/localization_cubit.dart';
import 'package:stadata_example/core/localization/localization_state.dart';
import 'package:stadata_example/core/navigation/app_router.dart';
import 'package:stadata_example/core/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return BlocProvider<LocalizationCubit>(
      create: (context) => getIt<LocalizationCubit>()..initialize(),
      child: MediaQuery(
        data: MediaQueryData.fromView(View.of(context)),
        child: LayoutBuilder(
          builder: (context, constraints) {
            ScreenUtil.init(
              context,
              designSize: Size(constraints.maxWidth, constraints.maxHeight),
            );

            return BlocBuilder<LocalizationCubit, LocalizationState>(
              builder: (context, state) {
                return TranslationProvider(
                  child: MaterialApp.router(
                    title: 'Stadata Example',
                    theme: AppTheme.lightTheme,
                    darkTheme: AppTheme.darkTheme,
                    themeMode: ThemeMode.system,
                    routerConfig: appRouter.config(),
                    locale: state.currentLocale.flutterLocale,
                    supportedLocales: AppLocale.values.map(
                      (e) => e.flutterLocale,
                    ),
                    localizationsDelegates:
                        GlobalMaterialLocalizations.delegates,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
