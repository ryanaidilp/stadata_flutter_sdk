import 'package:flutter/material.dart';
import 'package:stadata_example/core/generated/strings.g.dart';

class SubjectsPage extends StatelessWidget {
  const SubjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.t.subjects.title)),
      body: Center(child: Text(context.t.subjects.comingSoon)),
    );
  }
}
