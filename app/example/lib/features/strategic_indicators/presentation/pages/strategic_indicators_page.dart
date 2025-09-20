import 'package:flutter/material.dart';
import 'package:stadata_example/core/generated/strings.g.dart';

class StrategicIndicatorsPage extends StatelessWidget {
  const StrategicIndicatorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.t.strategicIndicators.title)),
      body: Center(child: Text(context.t.strategicIndicators.comingSoon)),
    );
  }
}
