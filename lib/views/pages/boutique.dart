import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_trade/views/components/screens/menu_item_model.dart';
import 'package:i_trade/views/components/screens/pageshop/catalog_card.dart';
import 'package:i_trade/views/components/screens/pageshop/demo_data.dart';

class Boutique extends StatefulWidget {
  const Boutique({super.key});

  @override
  State<Boutique> createState() => _BoutiqueState();
}

class _BoutiqueState extends State<Boutique>
        // mise en place provider pour afficher une tabsbarr dynamique
        // mise en place du tabcontroller
        with
        SingleTickerProviderStateMixin {
  late TabController _tabController;
  // mise en place du string pour pouvoir rendre la barre de navigation manipulable
  String searchText = "";
  // mise en place du widget TextEditingController pour activer la recherche et controler la barre de recherche
  final TextEditingController _searchController = TextEditingController();

  // Liste des categories des produits
  // mise en place de la liste des produits du selon la categorie pour le filtre
  final List<String> categories = [
    "Tous",
    "Android",
    "Iphone",
    "Pc",
    "Console",
    "Casque",
    "Montre",
    "Autres",
  ];
  // mise en place de la fonction void initState pour mettre a jour la page des nouveaux changement.
  @override
  void initState() {
    super.initState();
    //ici on affiche le nombre d'onglets en fonction des categories des produits
    // mise en place du TabController
    _tabController = TabController(length: categories.length, vsync: this);

    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // mise en place du filtre des categories des produits en fonction des items
  // ici on demande au code d'afficher les produits selon la categorie
  // ici on demande au code de faire la recherche selon la description du produit
  List<MenuItemModel> get filteredItems {
    final selectedcategorie = categories[_tabController.index];

    return demoData.where((item) {
      final matchCategorie =
          selectedcategorie == "Tous" ||
          item.categorie.toLowerCase() == selectedcategorie.toLowerCase();

      final matchSearch = item.description.toLowerCase().contains(
        searchText.toLowerCase(),
      );

      return matchCategorie && matchSearch;
    }).toList();
  }

  // debut du code SHOP
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //barre de navigation AppBarr mise en place
      appBar: AppBar(
        // c'est pour eviter que la fleche de retour ne s'affiche
        automaticallyImplyLeading: false,
        // mise en place du conteneur pour la barre de recherche
        // mise en place conteneur et modification du decor
        title: Padding(
          padding: EdgeInsets.only(left: 5.w, right: 5.w),
          child: Container(
            // taille du conteneur
            height: 40.h,
            //positionnement du texte dans la barre
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            // decoration du conteneur de la barre de recherche
            decoration: BoxDecoration(
              // couleur de la barre de recherche
              color: Theme.of(context).colorScheme.tertiary,
              borderRadius: BorderRadius.circular(25.r),
            ),
            // mise en place du texte field
            child: Container(
              padding: EdgeInsets.only(bottom: 11.h),
              // espacement du texte à l'interieur de la barre
              child: TextField(
                // controller pour rendre la barre cliquage et dynamique,
                controller: _searchController,
                autofocus: false,
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
                style: GoogleFonts.notoSans(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                // mise en place du l'icone recherche
                decoration: InputDecoration(
                  icon: Container(
                    // espacement de l'icone dans la barre recherche
                    padding: EdgeInsets.only(top: 10.h, left: 5.w),
                    child: Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  // texte à l'interieur de la barre de recherche
                  hintText: "Vous cherchez...",
                  hintStyle: GoogleFonts.notoSans(
                    fontSize: 14.sp,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  // pour afficher la croix de supression de la recherche
                  // mise en place de supression
                  border: InputBorder.none,
                  suffixIcon:
                      searchText.isNotEmpty
                          ? IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              setState(() {
                                searchText = "";
                                // supression de la recherche
                                _searchController.clear();
                              });
                            },
                          )
                          : null,
                ),
              ),
            ),
          ),
        ),
        //Debut du tabBarr pour afficher les differents onglets
        bottom: TabBar(
          // controller pour naviger dynamiquement sur les onglets
          controller: _tabController,
          // ligne de separation entre la grille et la tabbarre
          dividerColor: Theme.of(context).colorScheme.secondary,
          // pour permettre de scroller vers la gauche ou la droite
          isScrollable: true,
          //couleur pour l'indicateur
          indicatorColor: Theme.of(context).colorScheme.primary,
          // taille de l'indicateur
          indicatorWeight: 5.sp,
          labelColor: Theme.of(context).colorScheme.primary,
          // couleur pour les onglets non selectionné
          unselectedLabelColor: Theme.of(context).colorScheme.secondary,
          tabs: categories.map((cat) => Tab(text: cat)).toList(),
        ),
      ),
      //CORPS DE CODE AVEC LE WIDGET GRIDVIEW POUR AFFICHER LES ELEMENTS DANS UNE GRILLE
      body:
          filteredItems.isEmpty
              ? const Center(child: Text("Aucun produit trouvé"))
              : Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: GridView(
                  //MISE EN PLACE DE LA GRILLE ET DES ELEMENTS
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 5.h,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.w,
                    mainAxisSpacing: 15.h,
                    childAspectRatio: 0.65.w,
                  ),
                  // APPELLE DE LA CLASS CATALOGCARD POUR AFFICHER LES ELEMENTS DANS LA GRILLE
                  // POUR MODIFIER LES ELEMENTS DANS LA GRILLE, ON VA CHANGER LES PARAMETRES DANS DEMO_DATA, CATALOG_CARD ET MENU_ITEM
                  children:
                      filteredItems
                          .map((item) => CatalogCard(catalogItem: item))
                          .toList(),
                ),
              ),
    );
  }
}
