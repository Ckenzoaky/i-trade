import 'package:supabase_flutter/supabase_flutter.dart';

// Service d'authentification utilisant Supabase
// mise en place des methodes d'authentification
class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  // Methode pour se connecter avec email et mot de passe
  // mise en place de la methode signIn/ se connecter
  Future<User> signInWithEmailPassword(String email, String password) async {
    final response = await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.user == null) {
      throw Exception("Connexion échouée");
    }

    return response.user!;
  }

  // Methode pour s'inscrire avec email et mot de passe
  // mise en place de la methode signUp/ s'inscrire
  Future<AuthResponse> signUpWithEmailPassword(
    String email,
    String password,
  ) async {
    return await _supabase.auth.signUp(email: email, password: password);
  }

  // Methode pour se deconnecter
  // mise en place de la methode signOut/ se deconnecter
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  // Methode pour recuperer l'utilisateur actuel
  // mise en place de la methode getCurrentUser/ recuperer utilisateur actuel et l'afficher sur la page profil
  String? getCurrentUserEmail() {
    final session = _supabase.auth.currentSession;
    // recupere l'utilisateur actuel
    final user = session?.user;
    return user?.email;
  }
}
