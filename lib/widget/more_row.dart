import 'package:flutter/material.dart';

import '../constant.dart';

class MoreRow extends StatelessWidget {
  const MoreRow(
      {super.key, required this.icon, required this.text, required this.value});
  final IconData icon;
  final String text;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: roz,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: roz,
            child: Icon(
              icon,
              color: red,
            ),
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Text(value),
      ],
    );
  }
}
