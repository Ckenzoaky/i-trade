import 'package:fade_animation_delayed/fade_animation_delayed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      backgroundColor: Color(0xffF5F6F9),
      appBar: AppBar(
        centerTitle: true,
        title: FadeAnimationDelayed(
          child: Text(
            'iTrade',
            style: GoogleFonts.anton(
              fontSize: 24.w,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              letterSpacing: 1,
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
          Positioned(
            bottom: 40.h,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
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
                      dotHeight: 8,
                      dotWidth: 10,
                      spacing: 10,
                      expansionFactor: 2.5,
                    ),
                  ),
                  //Boutton skip et Get Started
                  Container(
                    height: 30.w,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade500,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: GestureDetector(
                      onTap:
                          () => Navigator.pushReplacementNamed(
                            context,
                            '/scaffold_main',
                          ),
                      child: Text(
                        buttonText,
                        style: GoogleFonts.asap(
                          fontSize: 16.w,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
