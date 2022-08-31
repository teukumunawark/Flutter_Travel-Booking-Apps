import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    required this.borderRadius,
  }) : super(key: key);

  final String title;
  final Color color;
  final double width;
  final Function() onPressed;
  final EdgeInsets margin;
  final Color textColor;
  final BorderRadius borderRadius;

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
            borderRadius: borderRadius,
          ),
        ),
        child: Text(
          title,
          style: defaultStyle.copyWith(
            fontSize: 16.sm,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
