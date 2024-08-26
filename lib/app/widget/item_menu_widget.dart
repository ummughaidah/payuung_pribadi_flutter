import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemMenuWidget extends StatelessWidget {
  final String title;
  final String iconAsset;
  final Function() onTap;
  final Color? colorIcon;
  const ItemMenuWidget(
      {super.key,
      required this.title,
      required this.iconAsset,
      required this.onTap, this.colorIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(
              iconAsset,
              width: 30,
              height: 30,
              color: colorIcon,
            ),
          ),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
