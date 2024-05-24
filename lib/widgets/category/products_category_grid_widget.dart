import 'package:f2i_flutter_store_comlan_gaetan_gael/models/product.dart';
import 'package:f2i_flutter_store_comlan_gaetan_gael/providers/category_provider.dart';
import 'package:f2i_flutter_store_comlan_gaetan_gael/services/products_service.dart';
import 'package:f2i_flutter_store_comlan_gaetan_gael/widgets/common/product_item_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsCategoryGridWidget extends StatelessWidget {
  ProductsCategoryGridWidget({super.key});

  // instancier le service
  final ProductsService _productsService = ProductsService();

  @override
  Widget build(BuildContext context) {
    String? category = context.watch<CategoryProvider>().category;
    // inspect(_productsService.getProducts());

    /*
      widget FutureBuilder : à utiliser obligatoirement avec une future
        future : cibler la future
        builder : permet de boucler sur les résultats renvoyés pas la future
          > paramètre snapshot contient les données de la future
    */
    if (category == null) {
      return const Text('vous n\'avez pas sélectionné de catégorie');
    }

    return FutureBuilder(
      future: _productsService.getProductsByCategory(category),
      builder: (context, snapshot) {
        // si les données sont accessibles
        if (snapshot.hasData) {
          // requireData : récupérer les données
          List<Product> data = snapshot.requireData;

          // inspect(data);
          /*
            définir une hauteur à la grille :
              shrinkWrap : imbriquer les éléments dans la grille
              itemCount :nombre d'éléments présents dans la boucle
            NeverScrollableScrollPhysics : désactiver l'ascenseur sur une grille
          */
          return Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Text(
                  category,
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.5,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    // transmettre le produit au widget enfant
                    return ProductItemGrid(
                      product: data[index],
                    );
                  },
                ),
              ],
            ),
          );
        }

        // si les données ne sont pas accessibles
        return const CircularProgressIndicator();
      },
    );
  }
}
