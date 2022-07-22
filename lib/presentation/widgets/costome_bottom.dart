import 'package:flutter/material.dart';
import 'package:travel_app/common/constants.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({
    Key? key,
    required this.title,
    this.color = kPrimeryColor,
    this.width = double.infinity,
    required this.onPressed,
    this.margin = EdgeInsets.zero,
    this.textColor = kPrimeryColor,
  }) : super(key: key);

  final String title;
  final Color color;
  final double width;
  final Function() onPressed;
  final EdgeInsets margin;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 55,
      margin: margin,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
        ),
        child: Text(
          title,
          style: defaultStyle.copyWith(
            fontSize: 14,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
