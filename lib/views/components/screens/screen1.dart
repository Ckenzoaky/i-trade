import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Espace entre le haut de l'ecran et l'image
        SizedBox(height: 45.h),
        //Mise en page de l'image et les modifications
        Image.asset(
          "assets/images/image1.png",
          // mise en place du boxfit cover pour l'image et des dimensions
          fit: BoxFit.cover,
          height: 320.h,
          width: 360.w,
          // cache des images pour optimiser le rendu
        ),
        //Espace entre l'image et le texte
        SizedBox(height: 10.h),
        //Mise en page du texte
        Text(
          "Explorez une large selection \nd'appareils",
          textAlign: TextAlign.center,
          style: GoogleFonts.rubik(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        //Espace entre le texte et le paragraphe
        SizedBox(height: 10.h),
        //Mise en page du paragraphe
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            "Decouvrez des appareils de haute qualité \nprêts à être échangés ou achetés  \nselon vos besoins ",
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSans(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black54,
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
