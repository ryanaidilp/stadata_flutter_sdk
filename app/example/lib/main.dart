import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:stadata_example/app.dart';
import 'package:stadata_example/config/env.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection
  configureDependencies();

  // Initialize date formatting
  await initializeDateFormatting('id');
  await initializeDateFormatting('en');

  // Initialize STADATA SDK
  await StadataFlutter.instance.init(apiKey: Env.apiKey);

  // Set preferred orientation
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const App());
}
