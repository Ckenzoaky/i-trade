import 'package:flutter/material.dart';
import 'package:i_trade/views/components/screens/navigation/page_admin/espace_admi.dart';
import 'package:i_trade/views/pages/login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  // Exemple d'instance SupabaseClient
  final supabase = Supabase.instance.client;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAuth();
    });
    // Ici, vous pouvez ajouter la logique pour vérifier l'état d'authentification
    // et naviguer vers la page appropriée
  }

  // Exemple de méthode pour vérifier l'authentification
  Future<void> _checkAuth() async {
    final session = supabase.auth.currentSession;
    if (mounted) {
      if (session != null) {
        // si l'utilisateur est authentifié, naviguer vers la page d'accueil
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => MyEspaceAdmi(),
          ), // Remplacez par votre page d'accueil
        );
      } else {
        // si l'utilisateur n'est pas authentifié, naviguer vers la page de connexion
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder:
                (context) =>
                    MyLoginPage(), // Remplacez par votre page de connexion
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
