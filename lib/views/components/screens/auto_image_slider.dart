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
    Image.asset("assets/images/redmi.png", fit: BoxFit.cover),
    Image.asset("assets/images/montre_connecter.png", fit: BoxFit.cover),
  ];

  int myCurrentIndex1 = 0;
  @override
  void initState() {
    super.initState();
  }

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
            // ajouter un espace entre le caroussel et les dots
            // la taille de l'espace
            SizedBox(height: 10.h),
            // Indicateur de défilement (dots) — padding vertical et SafeArea
            // mise en place des dots pour le caroussel
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              // mise en place de la safe area pour eviter les problemes avec les differentes tailles d'ecran et pour les bords arrondis
              child: SafeArea(
                top: false,
                bottom: true,
                child: Center(
                  // mise en place des dots avec animated container
                  // row pour aligner les dots horizontalement
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    // mise en place des dots avec la generation dynamique des dots selon le nombre d'items dans le caroussel
                    children: List.generate(
                      myitems.length,
                      // animated container pour animer les dots
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        //taille des dots
                        height: 8.h,
                        //longueur des dots
                        width: myCurrentIndex1 == index ? 24.w : 8.w,
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color:
                              myCurrentIndex1 == index
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.grey.shade300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
