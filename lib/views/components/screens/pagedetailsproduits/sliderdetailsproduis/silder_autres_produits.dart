import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AutresProduitSlider extends StatefulWidget {
  const AutresProduitSlider({super.key});

  @override
  State<AutresProduitSlider> createState() => _AutresProduitSliderState();
}

class _AutresProduitSliderState extends State<AutresProduitSlider> {
  final myitems = [
    Image.asset("assets/images/casquesteel.png", fit: BoxFit.cover),
    Image.asset("assets/images/playstation5.png", fit: BoxFit.cover),
    Image.asset("assets/images/playstation5.png", fit: BoxFit.cover),
  ];

  int myCurrentIndex1 = 0;
  //  ClipRRect buildmyitems(int myCurrentIndex1) =>
  //      ClipRRect(borderRadius: BorderRadius.circular(50));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                height: 150.h,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: const Duration(seconds: 2),
                autoPlayInterval: const Duration(seconds: 2),
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                viewportFraction: 0.85,
                onPageChanged: (index, reason) {
                  setState(() {
                    myCurrentIndex1 = index;
                  });
                },
              ),
              items:
                  myitems
                      .map(
                        (item) => ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Container(child: item),
                        ),
                      )
                      .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
