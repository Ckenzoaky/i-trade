import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const MyElevatedButton({
    super.key,
    required this.text,
    required this.onTap,
    required Null Function() onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 130.w,
        height: 35.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red.shade500,
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.lato(
              fontSize: 14.w,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
