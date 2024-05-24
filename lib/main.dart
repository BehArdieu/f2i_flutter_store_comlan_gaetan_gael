// import des packages
// bibliothèque material : bibliothèque de design de google
import 'package:f2i_flutter_store_comlan_gaetan_gael/providers/cart_provider.dart';
import 'package:f2i_flutter_store_comlan_gaetan_gael/providers/product_provider.dart';
import 'package:f2i_flutter_store_comlan_gaetan_gael/services/router_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:store/screens/home_screen.dart';

// fonction main : point d'entrée de l'application
void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ProductProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => CartProvider(),
          ),
        ],
        child: const Store(),
      ),
    );

// widget (composant) Store : représente l'application
class Store extends StatelessWidget {
  const Store({super.key});

  // méthode build permet de définir l'interface visuelle du widget
  /*
    architecture :
      MaterialApp : représente l'application
        > Scaffold : permet d'architecturer l'application
          > premier écran
    
    principaux widgets :
      - SingleChildScrollView : créer un ascenseur
      - Row : alignement horizontal de plusieurs widgets
      - Column : alignement vertical de plusieurs widgets
      - Text : afficher un texte
      - Icon : afficher une icône
      - Image : afficher une image
      - OutlinedButton : bouton
      - Container : créer un bloc avec des padding, margin, image de fond…
  */
  @override
  Widget build(BuildContext context) {
    // la méthode router est associée à l'extension go_router
    return MaterialApp.router(
      title: "Store",
      // la propriété home n'est plus utilisée lorsque l'extension go_router est installée
      // home: const HomeScreen(),
      // déléguer le routage de l'application au service dédié
      routerConfig: RouterService.getRouter(),
    );
  }
}
