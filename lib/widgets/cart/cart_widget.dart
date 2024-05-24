import 'dart:developer';

import 'package:f2i_flutter_store_comlan_gaetan_gael/models/product.dart';
import 'package:f2i_flutter_store_comlan_gaetan_gael/providers/cart_provider.dart';
import 'package:f2i_flutter_store_comlan_gaetan_gael/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Récupération des produits dans le panier
    List<Product> products = context.watch<CartProvider>().products;

    // Inspection des produits pour le débogage
    inspect(products);

    // Calcul du total du panier
    double total = context.watch<CartProvider>().getTotal();

    // Si le panier est vide, afficher un message approprié
    if (products.isEmpty) {
      return const Center(
        child: Text('Votre panier est vide.'),
      );
    }

    // Sinon, afficher les produits dans une ListView avec un bouton pour vider le panier
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.8, // Utiliser la hauteur de 80% de l'écran
          child: ListView(
            children: products.map((Product product) {
              return ListTile(
                onTap: () {
                  context.read<ProductProvider>().product = product;
                  context.pushReplacementNamed('product-details');
                },
                leading: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image);
                  },
                ),
                title: Text(product.title),
                subtitle: Text('${product.price.toStringAsFixed(2)}€'),
                trailing: IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    context.read<CartProvider>().removeProduct(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${product.title} a été supprimé du panier.'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Total: ${total.toStringAsFixed(2)}€',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  context.read<CartProvider>().clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Le panier a été vidé.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: const Text('Vider le panier'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
