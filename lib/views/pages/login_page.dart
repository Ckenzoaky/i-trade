import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_trade/views/components/screens/navigation/page_admin/espace_admi.dart';
import 'package:i_trade/views/pages/home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  // Exemple d'instance SupabaseClient
  final supabase = Supabase.instance.client;
  // Exemple de méthode pour vérifier l'authentification
  final _formKey = GlobalKey<FormState>();
  // Contrôleurs pour les champs de texte
  // controleur pour le champ email
  final _emailController = TextEditingController();
  // controleur pour le champ mot de passe
  final _passwordController = TextEditingController();
  // Méthode pour gérer la connexion
  bool _isLoading = false;
  bool _obescurePassword = true;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _singIn() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _isLoading = true;
    });
    // Tentative de connexion avec Supabase
    try {
      final reponse = await supabase.auth.signInWithPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
      if (reponse.session != null && mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MyEspaceAdmi()),
        );
      }
    } on Exception catch (e)
    // Gestion des erreurs de connexion
    // Affichage d'un message d'erreur
    {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Erreur de connexion : Verifiez vos identifiants ${e.toString()}',
            ),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
    // Toujours arrêter le chargement après la tentative de connexion
    finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // CustomScrollView pour avoir un scroll avec une image flexible
      // c'est pour etablir une image qui s'etend en haut de la page
      body: CustomScrollView(
        // liste des elements a defiler
        // mise en place des slivers pour remplacer les widgets classiques comme children
        slivers: [
          //MISE EN PLACE DE L'IMAGE POUR LA PAGE ADMIN
          //dans le sliverappbar on peut mettre une image flexible
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 300.h, // hauteur image + appbar
            pinned: true, // l'appbar reste visible en scroll
            // mise en place de l'image flexible
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/google-pixel-9-pro-xl_9ny4.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // fin de la syliverappbar
          // separation entre l'image et le texte
          SliverToBoxAdapter(child: SizedBox(height: 10.h)),
          //MISE EN PLACE DU TEXTE POUR LA PAGE ADMIN
          SliverToBoxAdapter(
            child: Column(
              //alignement a gauche du texte
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  // mise en place du texte administration
                  child: Text(
                    'Administration !',
                    style: GoogleFonts.rubik(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                // du texte administration
                // espace entre le texte administration et le texte d'information
                SizedBox(height: 10.h),
                // mise en place du texte d'information pour la page admin et le contact
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    "Si vous voulez un compte administrateur, \nveuillez contacter le développeur.",
                    style: GoogleFonts.notoSans(
                      fontSize: 14.sp,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // espace entre le texte d'information et le formulaire
          SliverToBoxAdapter(child: SizedBox(height: 40.h)),
          // mise en place du formulaire de connexion pour la page admin
          // mise en place du conteneur pour le formulaire
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // champ pour l'email
                    // mise en place du text form field pour l'email
                    //decoration du champ email
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        //lorsque le champ est selectionne
                        focusedBorder: OutlineInputBorder(
                          // bordure du champ email
                          borderSide: BorderSide(
                            color: Colors.deepPurple,
                            width: 1.w,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.tertiary,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        labelText: 'Email',
                        hintText: 'Entrez votre email',
                        prefixIcon: Icon(
                          Icons.email,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer votre email';
                        }
                        if (!value.contains('@')) {
                          return 'Veuillez entrer un email valide';
                        }
                        return null;
                      },
                    ),
                    // espace entre le champ email et le champ mot de passe
                    SizedBox(height: 10.h),
                    // champ pour le mot de passe
                    // mise en place du text form field pour le mot de passe
                    //decoration du champ mot de passe
                    TextFormField(
                      //controleur pour le mot de passe
                      controller: _passwordController,
                      // obscurer le mot de passe
                      obscureText: _obescurePassword,
                      // decoration du champ mot de passe
                      decoration: InputDecoration(
                        //lorsque le champ est selectionne
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepPurple,
                            width: 1.w,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.tertiary,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        labelText: 'Mot de passe',
                        hintText: 'Entrez votre mot de passe',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obescurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          onPressed: () {
                            setState(() {
                              _obescurePassword = !_obescurePassword;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer votre mot de passe';
                        }
                        if (value.length < 6) {
                          return 'Le mot de passe doit contenir au moins 6 caractères';
                        }
                        return null;
                      },
                    ),
                    // espace entre le champ mot de passe et le bouton se connecter
                    SizedBox(height: 40.h),

                    // bouton se connecter
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _singIn,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: EdgeInsets.symmetric(
                            horizontal: 90.w,
                            vertical: 12.h,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),

                        child:
                            _isLoading
                                ? SizedBox(
                                  height: 24.h,
                                  width: 24.h,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2.w,
                                  ),
                                )
                                : Text(
                                  'Se Connecter',
                                  style: GoogleFonts.rubik(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                      ),
                    ),
                    // mise en place du bouton se connecter
                    //BOUTON DE CONNEXION
                    /*ElevatedButton(
                      onPressed: (
                        
                      ) {
                        // Action à effectuer lors du clic sur le bouton
                        // PUSH VERS LA PAGE ESPACE ADMINISTRATEUR
                        // materialpageroute pour avoir une animation de transition
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyEspaceAdmi(),
                          ),
                        );
                      },
                      // MISE EN PLACE DU CONTENEUR DU BOUTON ET STYLE SE CONNECTER
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        padding: EdgeInsets.symmetric(
                          horizontal: 90.w,
                          vertical: 12.h,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: Text(
                        'Se Connecter',
                        style: GoogleFonts.rubik(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),*/
                    // espacement
                    SizedBox(height: 15.h),
                    // MISE EN PLACE DU BOUTON ET STYLE RETOUR A LA BOUTIQUE
                    TextButton(
                      // Action à effectuer lors du clic sur le bouton
                      // PUSH VERS LA PAGE PRINCIPALE BOUTIQUE
                      // materialpageroute pour avoir une animation de transition
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                      // mise en place du texte retour a la boutique
                      child: Text(
                        'Retour à la Boutique',
                        style: GoogleFonts.rubik(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
