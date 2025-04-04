import 'package:flutter/material.dart';

class Buttomicon extends StatelessWidget {
  const Buttomicon(
      {super.key,
      required this.ontap,
      required this.text,
      required this.icon,
      required this.color});
  final VoidCallback ontap;
  final String text;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(250, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      label: Text(
        text,
        style: TextStyle(color: color, fontSize: 20),
      ),
      icon: Icon(icon, color: color),
    );
  }
}
