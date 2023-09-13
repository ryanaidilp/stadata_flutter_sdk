import 'package:flutter/material.dart';

class DomainCard extends StatelessWidget {
  const DomainCard({
    super.key,
    required this.id,
    required this.title,
    required this.url,
  });

  final String id;
  final String title;
  final String url;

  @override
  Widget build(BuildContext context) => ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text('$id - $title'),
        subtitle: SelectableText(url),
      );
}
