import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stadata_example/core/navigation/app_router.dart';

@RoutePage()
class DerivedVariablesPage extends StatelessWidget {
  const DerivedVariablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(
        context.router.replace(const DerivedVariablesParametersRoute()),
      );
    });

    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
