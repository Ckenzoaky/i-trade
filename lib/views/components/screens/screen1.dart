import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: size.height * 0.11),
        //const Spacer(),
        Image.asset(
          "assets/images/image1.png",
          fit: BoxFit.cover,
          height: size.height * 0.47,
          width: size.width * 1,
        ),
        SizedBox(height: size.height * 0.03),
        //const Spacer(),
        Text(
          "Explorez une large selection \nd'appareils",
          textAlign: TextAlign.center,
          style: GoogleFonts.asap(
            fontSize: size.width * 0.05,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        SizedBox(height: size.height * 0.02),
        Container(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
          child: Text(
            "Decouvrez des appareils de haute qualite \nprets a etre echanges ou achetes  \nbesoins ",
            textAlign: TextAlign.center,
            style: GoogleFonts.asap(
              fontSize: size.width *0.04,
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
