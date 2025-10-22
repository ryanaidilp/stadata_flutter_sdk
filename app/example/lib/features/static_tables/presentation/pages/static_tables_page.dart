import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stadata_example/core/navigation/app_router.dart';

@RoutePage()
class StaticTablesPage extends StatelessWidget {
  const StaticTablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Redirect to parameters page
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.router.replace(const StaticTablesParametersRoute());
    });

    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
