import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: size.height * 0.11),
        Image.asset(
          "assets/images/image2.png",
          fit: BoxFit.cover,
          height: size.height * 0.47,
          width: size.width * 1,
        ),
        SizedBox(height: size.height * 0.03),
        Text(
          "Une plateforme simple et \naccessible",
          textAlign: TextAlign.center,
          style: GoogleFonts.asap(
            fontSize: size.width * 0.05,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        SizedBox(height: size.height * 0.02),
        Container(
          padding: EdgeInsets.symmetric(horizontal: size.width *0.08),
          child: Text(
            "Contactez facilement les vendeurs -- \ndiscutez ou appelez directement via \nWhatsApp pour finaliser l'affaire.",
            textAlign: TextAlign.center,
            style: GoogleFonts.asap(
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
