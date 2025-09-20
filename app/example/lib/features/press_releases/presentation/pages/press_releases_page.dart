import 'package:flutter/material.dart';
import 'package:stadata_example/core/generated/strings.g.dart';

class PressReleasesPage extends StatelessWidget {
  const PressReleasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.t.pressReleases.title)),
      body: Center(child: Text(context.t.pressReleases.comingSoon)),
    );
  }
}

class PressReleaseDetailPage extends StatelessWidget {
  const PressReleaseDetailPage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.t.pressReleases.detail.title)),
      body: Center(
        child: Text('${context.t.pressReleases.detail.title} for ID: $id'),
      ),
    );
  }
}
