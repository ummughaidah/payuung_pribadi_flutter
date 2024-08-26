import 'package:flutter/material.dart';
import 'package:payung_pribadi/app/theme/colors_theme.dart';

class FormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? starText;
  final String? hintText;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final double? borderRadius;
  final double? fieldHeight;
  final int? maxLines;
  final bool? readOnly;

  const FormFieldWidget({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.textInputType,
    this.textInputAction,
    this.obscureText,
    this.suffixIcon,
    this.validator,
    this.onTap,
    this.borderRadius,
    this.fieldHeight,
    this.maxLines,
    this.readOnly,
    this.starText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              starText ?? '',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.red,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              labelText ?? '',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const SizedBox(height: 3),
        Container(
          alignment: Alignment.centerLeft,
          height: fieldHeight,
          child: TextFormField(
            maxLines: maxLines,
            controller: controller,
            onTap: onTap,
            obscureText: obscureText ?? false,
            keyboardType: textInputType,
            textInputAction: textInputAction,
            validator: validator,
            readOnly: readOnly ?? false,
            decoration: InputDecoration(
              filled: false,
              hintText: hintText,
              suffixIcon: suffixIcon,
              alignLabelWithHint: true,
              hintStyle: TextStyle(
                fontSize: 15,
                color: ColorsTheme.unselectedText,
                fontWeight: FontWeight.w400,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 5),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 5),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
