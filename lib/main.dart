import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_trade/controllers/callpage.dart';
import 'package:i_trade/controllers/my_produit_profil.dart';
import 'package:i_trade/controllers/scaffold_main.dart';
import 'package:i_trade/controllers/whatsapppage.dart';
import 'package:i_trade/views/components/screens/pagedetailsproduits/detailsproduits/list_product_page.dart';
import 'package:i_trade/views/pages/get_started_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true),
          home: GetStartedPage(),
          routes: {
            '/scaffold_main': (context) => ScaffoldMain(),
            '/my_produit_profil': (context) {
              final product =
                  ModalRoute.of(context)!.settings.arguments as Product;
              return MyProduitProfil(product: product);
            },
            '/whatsapp_page': (context) => WhatsappPage(),
            '/call_page': (context) => CallPage(),
          },
        );
      },
    );
  }
}
