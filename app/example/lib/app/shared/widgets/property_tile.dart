import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';

class PropertyTile extends StatelessWidget {
  const PropertyTile({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 8.w,
    children: [
      Text(
        label,
        style: context.textTheme.bodySmall?.copyWith(color: Colors.blueGrey),
      ),
      Flexible(
        child: FittedBox(
          child: Text(value, style: context.textTheme.bodySmall),
        ),
      ),
    ],
  );
}
