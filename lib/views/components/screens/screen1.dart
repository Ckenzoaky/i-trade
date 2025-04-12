import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Espace entre le haut de l'ecran et l'image
        SizedBox(height: 45.h),
        //Mise en page de l'image et les modifications
        Image.asset(
          "assets/images/image1.png",
          fit: BoxFit.cover,
          height: 320.h,
          width: 360.w,
        ),
        //Espace entre l'image et le texte
        SizedBox(height: 10.h),
        //Mise en page du texte
        Text(
          "Explorez une large selection \nd'appareils",
          textAlign: TextAlign.center,
          style: GoogleFonts.asap(
            fontSize: 18.w,
            fontWeight: FontWeight.w700,
            color: Colors.deepPurple,
          ),
        ),
        //Espace entre le texte et le paragraphe
        SizedBox(height: 10.h),
        //Mise en page du paragraphe
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            "Decouvrez des appareils de haute qualite \nprets a etre echanges ou achetes  \nbesoins ",
            textAlign: TextAlign.center,
            style: GoogleFonts.asap(
              fontSize: 14.w,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
