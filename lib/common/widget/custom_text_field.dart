import 'package:astro/app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final bool canRequestFocus;
  const CustomTextField({
    super.key,
    required this.title,
    required this.canRequestFocus,
    required this.controller,
    this.onTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      canRequestFocus: canRequestFocus,
      controller: controller,
      cursorColor: hightlightColor,
      cursorHeight: 15.h,
      cursorOpacityAnimates: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: surfaceColor,
        labelText: title,
        labelStyle: const TextStyle(color: hightlightColor),
        border: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: br10,
        ),
      ),
      onTap: onTap,
      onChanged: onChanged,
    );
  }
}
