import 'package:flutter/material.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/domains/presentation/pages/domains_page.dart';
import 'package:stadata_example/features/home/presentation/pages/home_page.dart';

class SimpleRouter {
  static const String home = '/';
  static const String domains = '/domains';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case domains:
        return MaterialPageRoute(builder: (_) => const DomainsPage());
      default:
        return MaterialPageRoute(
          builder:
              (context) => Scaffold(
                appBar: AppBar(title: Text(context.t.navigation.pageNotFound)),
                body: Center(
                  child: Text(context.t.navigation.pageNotFoundMessage),
                ),
              ),
        );
    }
  }
}
