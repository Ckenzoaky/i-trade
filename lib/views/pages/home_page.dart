import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_trade/views/components/screens/auto_image_slider.dart';
import 'package:i_trade/views/components/screens/page/produit_vitrine.dart';

/*class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myitems = [
    Image.asset(
      "assets/images/Xiaomi-14-series.png",
      fit: BoxFit.fill,
      width: double.infinity,
    ),
    Image.asset(
      "assets/images/xiaomi-13-pro.png",
      fit: BoxFit.cover,
      width: double.infinity,
    ),
    Image.asset(
      "assets/images/iphone1.png",
      fit: BoxFit.cover,
      width: double.infinity,
    ),
    Image.asset("assets/images/xiaomi-13-pro.png"),
    Image.asset("assets/images/xiaomi-13-pro.png"),
  ];

  int myCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    //double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.fromLTRB(10, 0, 10, 10),
        title: Text(
          'I-Trade',
          style: GoogleFonts.asap(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 5,
        actions: [
          Container(
            padding: const EdgeInsets.all(0),
            margin: const EdgeInsets.all(0),
            child: Padding(
              padding: EdgeInsets.all(0),
              child: IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.circleExclamation,
                  size: 25,
                  color: Colors.black87,
                ),
                onPressed: () {
                  // Ajoutez ici la logique de recherche
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(0),
            margin: const EdgeInsets.all(0),
            /*            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                  offset: Offset(0, 4),
                ),
              ],
            ),*/
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.circleUser,
                  size: 25,
                  color: Colors.black,
                ),
                onPressed: () {
                  // Ajoutez ici la logique de recherche
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.fromLTRB(10, 0, 10, 10),
        title: Text(
          'I-Trade',
          style: GoogleFonts.asap(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 5,
        actions: [
          Container(
            padding: const EdgeInsets.all(0),
            margin: const EdgeInsets.all(0),
            child: Padding(
              padding: EdgeInsets.all(0),
              child: IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.circleExclamation,
                  size: 25,
                  color: Colors.black87,
                ),
                onPressed: () {
                  // Ajoutez ici la logique de recherche
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(0),
            margin: const EdgeInsets.all(0),
            /*            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                  offset: Offset(0, 4),
                ),
              ],
            ),*/
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.circleUser,
                  size: 25,
                  color: Colors.black,
                ),
                onPressed: () {
                  // Ajoutez ici la logique de recherche
                },
              ),
            ),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 10,
            ), // Ajoutez le padding ici(10),// Ajoutez le padding ici(10),
            child: MyImageSlider(),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              'Derniers produits',
              style: GoogleFonts.oswald(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ),
          Container(padding: EdgeInsets.only(top: 10), child: ProduitVitrine()),
        ],
      ),
    );
  }
}
