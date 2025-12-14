import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_trade/views/components/screens/pagedetailsproduits/detailsproduits/list_product_page.dart';

class MyProduitSlider extends StatefulWidget {
  const MyProduitSlider(String image, {super.key, required Product product});

  @override
  State<MyProduitSlider> createState() => _MyProduitSliderState();
}

class _MyProduitSliderState extends State<MyProduitSlider> {
  final myitems = [
    Image.asset("assets/images/casquehyperx.png", fit: BoxFit.cover),
    Image.asset("assets/images/playstation5.png", fit: BoxFit.cover),
    Image.asset("assets/images/playstation5.png", fit: BoxFit.cover),
  ];

  int myCurrentIndex1 = 0;
  //  ClipRRect buildmyitems(int myCurrentIndex1) =>
  //  ClipRRect(borderRadius: BorderRadius.circular(50));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                height: 250.h,
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
