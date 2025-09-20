import 'package:flutter/material.dart';
import 'package:stadata_example/core/generated/strings.g.dart';

class VariablesPage extends StatelessWidget {
  const VariablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.t.variables.title)),
      body: Center(child: Text(context.t.variables.comingSoon)),
    );
  }
}
