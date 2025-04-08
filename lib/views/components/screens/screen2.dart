import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 87),
        //const Spacer(),
        Image.asset(
          "assets/images/image4.png",
          fit: BoxFit.cover,
          height: 500,
          width: double.infinity,
        ),
        const SizedBox(height: 50),
        //        const Spacer(),
        Text(
          "Trouvez votre bonheur!",
          //          textAlign: TextAlign.center,
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
            "Parcourez notre large selection d'appareils \nmis en troc ou en achat a moindre cout !",
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
