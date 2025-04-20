import 'package:flutter/material.dart';

import '../constant.dart';

class CreateMore extends StatelessWidget {
  const CreateMore(
      {required this.icon, super.key, required this.text, this.ontap});

  final IconData icon;
  final String text;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
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
        Text(text),
        Spacer(),
        IconButton(onPressed: ontap, icon: Icon(Icons.arrow_forward_ios)),
      ],
    );
  }
}
