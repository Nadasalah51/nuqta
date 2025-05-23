import 'package:flutter/material.dart';
import 'package:nuqta/constant.dart';

class Textformfeild extends StatelessWidget {
  const Textformfeild(
      {super.key,
      required this.text,
      this.obscure = false,
      this.height = 17,
      this.readonly = false,
      this.minlines = 1,
      this.maxlines = 1,
      this.controller,
      this.icon,
      this.ontap,
      this.items,
      this.onItemTap,
      this.validator});
  final String text;
  final bool obscure;
  final double height;
  final bool readonly;
  final TextEditingController? controller;
  final Icon? icon;
  final VoidCallback? ontap;
  final List<String>? items;
  final Function(String)? onItemTap;
  final int minlines;
  final int maxlines;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      controller: controller,
      readOnly: readonly,
      validator: validator,
      minLines: obscure ? 1 : minlines,
      maxLines: obscure ? 1 : maxlines,
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
          labelStyle: TextStyle(fontSize: 16, color: Colors.black),
          contentPadding: EdgeInsets.fromLTRB(10, 5, 5, height),
          suffixIcon: icon),
      style: TextStyle(fontSize: 16),
      textAlignVertical: TextAlignVertical.top,
      onTap: () {
        if (items != null && onItemTap != null) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Select $text'),
                content: SingleChildScrollView(
                  child: Column(
                    children: items!
                        .map(
                          (item) => ListTile(
                            title: Text(item),
                            onTap: () {
                              onItemTap!(item);
                              Navigator.of(context).pop();
                            },
                          ),
                        )
                        .toList(),
                  ),
                ),
              );
            },
          );
        } else {
          ontap?.call();
        }
      },
    );
  }
}
