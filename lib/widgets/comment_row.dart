import 'package:bhavesh_lingopanda/utils/app_color.dart';
import 'package:flutter/material.dart';

Widget buildCommentRow(String label, String value) {
  return Row(
    children: [
      Text(
        label,
        style: const TextStyle(
          fontStyle: FontStyle.italic,
          color: AppColor.componentColor,
        ),
      ),
      Expanded(
        child: Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w800),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}
