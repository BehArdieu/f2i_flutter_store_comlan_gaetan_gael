import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:f2i_flutter_store_comlan_gaetan_gael/providers/cart_provider.dart';
import 'package:f2i_flutter_store_comlan_gaetan_gael/models/product.dart';
import 'package:f2i_flutter_store_comlan_gaetan_gael/providers/product_provider.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class ProductDetailsWidget extends StatefulWidget {
  const ProductDetailsWidget({super.key});

  @override
  State<ProductDetailsWidget> createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    Product? product = context.watch<ProductProvider>().product;
    CartProvider cartProvider = context.read<CartProvider>();

    bool isProductInCart = cartProvider.products.contains(product);

    return Column(
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage(
                product!.image,
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          product.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        Text(
          '${product.price.toStringAsFixed(2)}€',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        RatingStars(
          value: product.rating['rate'],
        ),
        const SizedBox(height: 15),
        isProductInCart
            ? const Text(
                'Ce produit est déjà dans votre panier.',
                style: TextStyle(color: Colors.red),
              )
            : OutlinedButton(
                onPressed: () {
                  if (!isProductInCart) {
                    cartProvider.addProduct(product);
                    setState(() {
                      isProductInCart = true;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${product.title} a été ajouté au panier.'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  side: BorderSide.none,
                  shape: const BeveledRectangleBorder(),
                ),
                child: const Text('Ajouter au panier'),
              ),
      ],
    );
  }
}
