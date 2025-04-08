import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //const Spacer(),
        const SizedBox(height: 87),
        Image.asset(
          "assets/images/image2.png",
          fit: BoxFit.cover,
          height: 500,
          width: double.infinity,
        ),
        const SizedBox(height: 10),
        //        const Spacer(),
        Text(
          "Une plateforme simple et \naccessible",
          textAlign: TextAlign.center,
          style: GoogleFonts.asap(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Contactez facilement les vendeurs -- \ndiscutez ou appelez directement via \nWhatsApp pour finaliser l'affaire.",
            textAlign: TextAlign.center,
            style: GoogleFonts.asap(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
