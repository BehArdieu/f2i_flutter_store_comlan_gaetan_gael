import 'package:f2i_flutter_store_comlan_gaetan_gael/models/product.dart';
import 'package:f2i_flutter_store_comlan_gaetan_gael/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


class ProductItemGrid extends StatelessWidget {
  // récupérer le produit envoyé par la grille
  Product product;

  ProductItemGrid({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.network(
          product.image,
          height: 130,
          fit: BoxFit.contain,
        ),
        SizedBox(
          height: 35,
          child: Text(
            product.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text('${product.price}€'),
        OutlinedButton(
          onPressed: () {
            // read : écrire (setter) / mettre à jour la propriété product de ProductProvider
            context.read<ProductProvider>().product = product;

            /*
              naviguer vers un écran
                context : écran en cours d'affichage
            */
            context.pushNamed('product-details');
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            side: BorderSide.none,
            shape: const BeveledRectangleBorder(),
          ),
          child: const Text('View'),
        ),
      ],
    );
  }
}
