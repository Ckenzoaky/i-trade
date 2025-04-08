import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Image.asset(
          "assets/images/image1.png",
          fit: BoxFit.cover,
          height: 500,
          width: double.infinity,
        ),
        const SizedBox(height: 40),
        //const Spacer(),
        Text(
          "Explorez une large selection \nd'appareils",
          textAlign: TextAlign.center,
          style: GoogleFonts.asap(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Decouvrez des appareils de haute qualite \nprets a etre echanges ou achetes  \nbesoins ",
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
