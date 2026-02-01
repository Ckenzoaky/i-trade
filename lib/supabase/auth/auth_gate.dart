/*

Auth gate c'est pour gerer l'authentification
mise en place de la page d'authentification
Mise en de place de la logique d'authentification avec supabase


AhthGate est un widget qui determine si l'utilisateur est authentifie ou non
et affiche la page appropriee en fonction de son etat d'authentification

Non Auhentifie -> page de connexion
Authentifie -> page de profil ou page d'accueil de l'utilisateur


*/
import 'package:flutter/material.dart';
import 'package:i_trade/views/components/screens/navigation/page_admin/espace_admi.dart';
import 'package:i_trade/views/pages/admin_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      // ecoute les changements d'etat d'authentification
      // on verifie si l'utilisateur est connecte ou non
      stream: Supabase.instance.client.auth.onAuthStateChange,

      // construction du widget en fonction de l'etat d'authentification
      // changement de la page en fonction de l'etat d'authentification
      builder: (context, snapshot) {
        // recupere l'utilisateur actuel
        // chargement de l'utilisateur actuel
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // verifie si l'utilisateur est connecte actuellement
        // si l'utilisateur est connecte, on affiche la page d'accueil
        final session = snapshot.hasData ? snapshot.data!.session : null;
        // si l'utilisateur est connecte, on affiche la page de profil
        if (session != null) {
          // on affiche la page de profil (l'espace utilisateur)
          return MyEspaceAdmi();
        } else {
          // si l'utilisateur n'est pas connecte, on affiche la page de connexion
          return AdminPage();
        }
      },
    );
  }
}
