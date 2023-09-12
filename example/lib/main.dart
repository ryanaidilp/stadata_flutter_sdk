import 'package:flutter/material.dart';
import 'package:stadata_example/app.dart';
import 'package:stadata_example/config/env.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StadataFlutter.instance.init(
    apiKey: Env.apiKey,
  );

  runApp(const App());
}
