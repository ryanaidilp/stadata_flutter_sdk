import 'package:flutter/material.dart';
import 'package:stadata_example/core/generated/strings.g.dart';

class PublicationsPage extends StatelessWidget {
  const PublicationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.t.publications.title)),
      body: Center(child: Text(context.t.publications.comingSoon)),
    );
  }
}

class PublicationDetailPage extends StatelessWidget {
  const PublicationDetailPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.t.publications.detail.title)),
      body: Center(
        child: Text('${context.t.publications.detail.title} for ID: $id'),
      ),
    );
  }
}
