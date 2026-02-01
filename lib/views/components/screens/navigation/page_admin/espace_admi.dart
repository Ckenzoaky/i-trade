import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_trade/controllers/useradmi.dart';
import 'package:i_trade/views/components/button/my_elevated_button.dart';
import 'package:i_trade/views/components/screens/navigation/page_admin/add_product.dart';
import 'package:i_trade/views/components/screens/navigation/page_admin/edit_delette/edit_delette_page.dart';
import 'package:i_trade/views/pages/login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyEspaceAdmi extends StatefulWidget {
  const MyEspaceAdmi({super.key});

  @override
  State<MyEspaceAdmi> createState() => _MyEspaceAdmiState();
}

class _MyEspaceAdmiState extends State<MyEspaceAdmi> {
  // Exemple d'instance SupabaseClient
  final supabase = Supabase.instance.client;
  // mise en place des variables pour afficher le nom de l'utilisateur
  // recuperation du nom de l'utilisateur actuel
  String? _userEmail;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _getUserInfo();
  }

  // methode pour recuperer les informations de l'utilisateur actuel
  void _getUserInfo() {
    final user = supabase.auth.currentUser;
    if (user != null) {
      setState(() {
        _userEmail = user.email;
      });
    }
  }

  // mise en place de la deconnexion
  Future<void> _singOut() async {
    setState(() {
      _isLoading = true;
    });
    // essayer de se deconnecter
    try {
      await supabase.auth.signOut();
      // une fois deconnecte, naviguer vers la page admin
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MyLoginPage()),
        );
      }
    } on Exception catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  /*
  // variable pour stocker le nom de l'utilisateur
  String? userName;
  // variable pour indiquer si les donnees sont en cours de chargement
  bool isLoading = true;

  // obtenir l'etat de l'utilisateur actuel
  final authService = AuthService();
  @override
  void initState() {
    super.initState();
    // charger les donnees de l'utilisateur actuel
    fetchUserName();
  }

  Future<void> fetchUserName() async {
    try {
      final user = Supabase.instance.client.auth.currentUser;

      if (user == null) {
        setState(() {
          isLoading = false;
          userName = null;
        });
        return;
      }

      final data =
          await Supabase.instance.client
              .from('profiles')
              .select('name')
              .eq('id', user.id)
              .maybeSingle(); // 👈 au lieu de single()

      setState(() {
        userName = data?['name'];
        isLoading = false;
      });
    } catch (e) {
      debugPrint("Erreur fetchUserName: $e");
      if (mounted) {
        setState(() {
          isLoading = false;
          userName = null;
        });
      }
    }
  }

  Widget buildWelcome() {
    if (isLoading) {
      return const CircularProgressIndicator();
    }

    final user = Supabase.instance.client.auth.currentUser;
    final name = user?.userMetadata?['name'] ?? user?.email ?? 'Admin';

    return Text(
      "Bienvenue $name",
      style: GoogleFonts.rubik(
        color: Theme.of(context).colorScheme.secondary,
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // mise ne place du body ou corps de la page
      // pour utiliser deux couleurs dans le body pour deux effets background on utilise une colonne et une le widget Expanded
      body: Column(
        children: [
          //On met le widget Expanded pour pouvoir deviser
          // le body en deux parties ou plusieurs
          // la propriete flex pour donner la longueur de la partie
          // A l'interieur on met le widget child pour pouvoir mettre le widget Container
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.r),
                  bottomRight: Radius.circular(25.r),
                ),
                color: Theme.of(context).colorScheme.primary,
              ),
              //mise place de la premiere partie
              //mise en place du user
              //appel de la classe userinfo
              child: Column(
                children: [
                  //espacement entre les deux parties
                  SizedBox(height: 50.h),
                  //classe userinfo
                  UserInfo(),
                  //espacement entre les deux parties
                  SizedBox(height: 20.h),
                  //espacement entre les deux parties
                  //mise en place du contenu mon espace
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            'Bienvenue sur votre espace',
                            style: GoogleFonts.rubik(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        _userEmail ?? 'No Email',
                        style: GoogleFonts.rubik(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white60,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
          //mise en place de la deuxiement partie
          // la couleur du theme
          SizedBox(height: 20.h),
          // deuxieme partie
          Expanded(
            flex: 2,
            child: Column(
              children: [
                //mise en place de la phrase
                Text(
                  'Que voulez vous faire ?',
                  style: GoogleFonts.rubik(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                // espacement entre le texte et les boutons
                SizedBox(height: 30.h),
                // mise en place des boutons
                Container(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // mise en place du 1er bouton et son style
                      // premier boutons
                      MyElevatedButton(
                        // ajout de texte au bouton
                        text: 'Ajouter un Produit',
                        onTap: () {
                          // navigation vers la page ajouter un produit
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddProduct(),
                            ),
                          );
                        },
                        onPressed: () {},
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      //mise en place du 2eme bouton et son style
                      //mise en place du deuxeme bouton
                      MyElevatedButton(
                        // ajout de texte au bouton
                        text: 'Modif / Supprimer',
                        onTap: () {
                          // navigation vers la page modifier ou supprimer un produit
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditDelettePage(),
                            ),
                          );
                        },
                        onPressed: () {},
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                // mise en place du bouton deconnexion
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _singOut,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
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
                              'Se Deconnecter',
                              style: GoogleFonts.rubik(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                  ),
                ),

                // mise en place du bouton deconnexion
                /*ElevatedButton(
                  onPressed: () {
                    // Action à effectuer lors du clic sur le bouton
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AdminPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    padding: EdgeInsets.symmetric(
                      horizontal: 80.w,
                      vertical: 12.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    'Se Deconnecter',
                    style: GoogleFonts.rubik(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),*/
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
