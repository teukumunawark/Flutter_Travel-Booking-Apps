import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/colors.dart';

class CustomeFormPassword extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final IconData icon;

  const CustomeFormPassword(
      {Key? key,
      required this.title,
      required this.controller,
      required this.icon})
      : super(key: key);

  @override
  State<CustomeFormPassword> createState() => _CustomeFormPasswordState();
}

class _CustomeFormPasswordState extends State<CustomeFormPassword> {
  bool isVisible = false;

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
          controller: widget.controller,
          obscureText: !isVisible,
          style: GoogleFonts.poppins(
            color: AppColors.kGreyColor,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.title,
            hintStyle: GoogleFonts.poppins(
              color: AppColors.kGreyColor,
            ),
            icon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              icon: isVisible
                  ? const Icon(
                      Icons.visibility,
                      color: Colors.blue,
                    )
                  : const Icon(
                      Icons.visibility_off,
                      color: Colors.black54,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
