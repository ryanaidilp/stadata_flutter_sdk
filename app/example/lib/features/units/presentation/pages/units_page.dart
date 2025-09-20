import 'package:flutter/material.dart';
import 'package:stadata_example/core/generated/strings.g.dart';

class UnitsPage extends StatelessWidget {
  const UnitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.t.units.title)),
      body: Center(child: Text(context.t.units.comingSoon)),
    );
  }
}
