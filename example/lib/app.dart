import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:month_year_picker/month_year_picker.dart';

import 'app/routes/app_pages.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MediaQuery(
        data: MediaQueryData.fromView(View.of(context)),
        child: LayoutBuilder(
          builder: (context, constraints) {
            ScreenUtil.init(
              context,
              designSize: Size(
                constraints.maxWidth,
                constraints.maxHeight,
              ),
            );

            return GetMaterialApp(
              title: 'Stadata Example',
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
              localizationsDelegates: const [
                MonthYearPickerLocalizations.delegate,
              ],
            );
          },
        ),
      );
}
