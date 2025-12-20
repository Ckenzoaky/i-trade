import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Espace entre le haut de l'ecran et l'image
        SizedBox(height: 45.h),
        //Mise en page de l'image et les modifications
        Image.asset(
          "assets/images/image2.png",
          fit: BoxFit.cover,
          height: 320.h,
          width: 360.w,
        ),
        //Espace entre l'image et le texte
        SizedBox(height: 10.h),
        //Mise en page du texte
        Text(
          "Une plateforme simple et \naccessible",
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
            "Contactez facilement les vendeurs discutez \nou appelez directement via WhatsApp \npour finaliser l'affaire.",
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
