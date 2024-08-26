import 'package:flutter/material.dart';
import 'package:payung_pribadi/app/theme/colors_theme.dart';

class DropDownButtondWidget extends StatelessWidget {
  final String? labelText;
  final String? starText;
  final String? hintText;
  final List<DropdownMenuItem<String>>? items;
  final String? value;
  final ValueChanged<String?>? onChanged;
  final double? borderRadius;
  final double? fieldHeight;

  const DropDownButtondWidget({
    super.key,
    this.labelText,
    this.hintText,
    this.items,
    this.value,
    this.onChanged,
    this.borderRadius,
    this.fieldHeight,
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
          child: DropdownButtonFormField<String>(
            value: value,
            items: items,
            onChanged: onChanged,
            decoration: InputDecoration(
              filled: false,
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 15,
                color: ColorsTheme.unselectedText,
                fontWeight: FontWeight.w400,
              ),
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
