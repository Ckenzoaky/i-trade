import 'package:fade_animation_delayed/fade_animation_delayed.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_trade/views/components/screens/screen1.dart';
import 'package:i_trade/views/components/screens/screen2.dart';
import 'package:i_trade/views/components/screens/screen3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  String buttonText = "Skip";
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: FadeAnimationDelayed(
          child: Text(
            'I-Trade',
            style: GoogleFonts.asap(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Stack(
        children: [
          FadeAnimationDelayed(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                if (index == 2) {
                  buttonText = "Get Started";
                } else {
                  buttonText = "Skip";
                }
                setState(() {});
              },
              children: const [Screen1(), Screen2(), Screen3()],
            ),
          ),
          //mise en place de la barre de navigation en base
          Container(
            alignment: const Alignment(0, 0.85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(),
                //AFFICHAGE DU DEFILEMENT
                //mise en place de la dependence smooth page indicator
                SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    dotColor: Color.fromARGB(255, 146, 128, 197),
                    activeDotColor: Colors.deepPurple,
                    dotHeight: 7,
                    dotWidth: 9,
                    spacing: 10,
                    expansionFactor: 3,
                  ),
                ),
                GestureDetector(
                  onTap:
                      () => Navigator.pushReplacementNamed(
                        context,
                        '/scaffold_main',
                      ),
                  child: Text(
                    buttonText,
                    style: GoogleFonts.asap(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
