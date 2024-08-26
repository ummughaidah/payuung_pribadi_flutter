import 'package:flutter/material.dart';

class ItemWellnessWidget extends StatelessWidget {
  final Function()? onTap;
  final String image;
  final String title;
  final String price;
  const ItemWellnessWidget(
      {super.key,
      this.onTap,
      required this.title,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(image),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 15),
          ),
          const SizedBox(height: 8),
          Text(
            price,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
