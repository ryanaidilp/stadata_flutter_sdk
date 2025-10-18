import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/core/navigation/app_router.dart';

@RoutePage()
class PressReleasesPage extends StatelessWidget {
  const PressReleasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(context.router.replace(const PressReleasesParametersRoute()));
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Press Releases')),
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}

class PressReleaseDetailPage extends StatelessWidget {
  const PressReleaseDetailPage({required this.id, super.key});
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
