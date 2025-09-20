import 'package:flutter/material.dart';
import 'package:stadata_example/core/generated/strings.g.dart';

class StaticTablesPage extends StatelessWidget {
  const StaticTablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.t.staticTables.title)),
      body: Center(child: Text(context.t.staticTables.comingSoon)),
    );
  }
}

class StaticTableDetailPage extends StatelessWidget {
  const StaticTableDetailPage({required this.id, super.key});
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.t.staticTables.detail.title)),
      body: Center(
        child: Text('${context.t.staticTables.detail.title} for ID: $id'),
      ),
    );
  }
}
