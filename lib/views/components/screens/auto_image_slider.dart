import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyImageSlider extends StatefulWidget {
  const MyImageSlider({super.key});

  @override
  State<MyImageSlider> createState() => _MyImageSliderState();
}

class _MyImageSliderState extends State<MyImageSlider> {
  final myitems = [
    Image.asset("assets/images/xiaomi-12pro.png", fit: BoxFit.cover),
    Image.asset("assets/images/samsung1.png", fit: BoxFit.cover),
    Image.asset("assets/images/casquehyperx.png", fit: BoxFit.cover),
    Image.asset("assets/images/Samsung-Galaxy-S24.png", fit: BoxFit.cover),
    Image.asset("assets/images/iphone15rpomax.png", fit: BoxFit.cover),
  ];

  int myCurrentIndex1 = 0;
  //  ClipRRect buildmyitems(int myCurrentIndex1) =>
  //      ClipRRect(borderRadius: BorderRadius.circular(50));

  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                height: height * 0.24,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: const Duration(seconds: 2),
                autoPlayInterval: const Duration(seconds: 2),
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                viewportFraction: 1.0,
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
                          borderRadius: BorderRadius.circular(15.0.r),
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
