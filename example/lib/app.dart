import 'package:flutter/material.dart';
import 'package:stadata_example/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Stadata Example',
        home: HomePage(),
      );
}
