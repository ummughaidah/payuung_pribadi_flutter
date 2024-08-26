import 'package:flutter/material.dart';
import 'package:payung_pribadi/app/theme/colors_theme.dart';

class ButtonCustom extends StatelessWidget {
  final String title;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? colorText;
  final Function()? onTap;

  const ButtonCustom(
      {super.key,
      required this.title,
      this.backgroundColor,
      this.onTap,
      this.borderRadius,
      this.colorText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
            backgroundColor ?? ColorsTheme.primaryColor),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          color: colorText ?? Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
