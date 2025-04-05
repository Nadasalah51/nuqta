import 'package:flutter/material.dart';
import 'package:nuqta/constant.dart';

class Textformfeild extends StatelessWidget {
  const Textformfeild(
      {super.key,
      required this.text,
      this.obscure = false,
      this.height = 17,
      this.readonly = false,
      this.controller,
      this.icon,
      this.ontap});
  final String text;
  final bool obscure;
  final double height;
  final bool readonly;
  final TextEditingController? controller;
  final Icon? icon;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      controller: controller,
      readOnly: readonly,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(width: 1, color: Colors.black)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(width: 2, color: Colors.black)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(width: 1, color: red)),
          labelText: text,
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.fromLTRB(10, 10, 5, height),
          suffixIcon: icon),
      style: TextStyle(fontSize: 16),
      onTap: ontap,
    );
  }
}
