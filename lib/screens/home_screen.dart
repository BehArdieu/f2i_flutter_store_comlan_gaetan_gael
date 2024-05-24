import 'package:f2i_flutter_store_comlan_gaetan_gael/widgets/common/appbar_widget.dart';
import 'package:f2i_flutter_store_comlan_gaetan_gael/widgets/common/drawer_widget.dart';
import 'package:f2i_flutter_store_comlan_gaetan_gael/widgets/home/ads_widget.dart';
import 'package:f2i_flutter_store_comlan_gaetan_gael/widgets/home/products_grid_widget.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /*
      Scaffold permet d'architecturer l'application
        body : définir le contenu principal de l'écran
        AppBar : barre de navigation
        Drawer : menu coulissant
        FloatingButton : bouton flottant…
    */
    return Scaffold(
      appBar: const AppbarWidget(),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AdsWidget(),
            ProductsGridWidget(),
          ],
        ),
      ),
    );
  }
}
