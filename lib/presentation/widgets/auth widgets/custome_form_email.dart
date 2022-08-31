import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/colors.dart';

class CustomeFormEmail extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final IconData icon;

  const CustomeFormEmail(
      {Key? key,
      required this.title,
      required this.controller,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      height: 55,
      padding: const EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
        color: Colors.white60.withOpacity(0.9),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          style: GoogleFonts.poppins(
            color: AppColors.kGreyColor,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: title,
            hintStyle: GoogleFonts.poppins(
              color: AppColors.kGreyColor,
            ),
            icon: Icon(
              icon,
            ),
          ),
        ),
      ),
    );
  }
}
