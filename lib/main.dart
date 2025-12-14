import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_trade/controllers/callpage.dart';
import 'package:i_trade/controllers/my_produit_profil.dart';
import 'package:i_trade/controllers/scaffold_main.dart';
import 'package:i_trade/controllers/whatsapppage.dart';
import 'package:i_trade/views/components/screens/navigation/page_admin/add_product.dart';
import 'package:i_trade/views/components/screens/pagedetailsproduits/detailsproduits/list_product_page.dart';
import 'package:i_trade/views/pages/Admin_page.dart';
import 'package:i_trade/views/pages/get_started_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() /*pour mettre supabase*/ async {
  // fonction main async pour initialiser supabase
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://qpxltefomfdxdzijzlhy.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFweGx0ZWZvbWZkeGR6aWp6bGh5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjQ2NzA1NjksImV4cCI6MjA4MDI0NjU2OX0.JT2vjcnafuGBfYHnjgako_q9uoZWvQ_8PUgv-mR3iTU',
  );
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
          // Mode clair
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              brightness: Brightness.light,
              secondary: Colors.black,
              tertiaryContainer: Colors.grey,
              secondaryContainer: Colors.white,
              primary: Colors.deepPurple,
              tertiary: Colors.black12,
            ),
            useMaterial3: true,
          ),
          // theme mode system sombre
          // Mode sombre
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              brightness: Brightness.dark,
              primary: Colors.deepPurple,
              secondary: Colors.white,
              tertiaryContainer: Colors.white,
              secondaryContainer: Colors.black,
              tertiary: Colors.grey.shade900,
            ),
            useMaterial3: true,
          ),
          // debut du code avec la page get started
          home: GetStartedPage(),
          //definition des routes
          // mise en place des routes pour la navigation entre les pages
          routes: {
            '/scaffold_main': (context) => ScaffoldMain(),
            '/my_produit_profil': (context) {
              return MyProduitProfil(
                product: ModalRoute.of(context)!.settings.arguments as Product,
              );
            },
            '/whatsapp_page': (context) => WhatsappPage(),
            '/call_page': (context) => CallPage(),
            '/admin_page': (context) => AdminPage(),
            '/add_product': (context) => AddProduct(),
          },
        );
      },
    );
  }
}
