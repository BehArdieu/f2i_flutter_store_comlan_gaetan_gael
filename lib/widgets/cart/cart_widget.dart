import 'package:f2i_flutter_store_comlan_gaetan_gael/models/product.dart';
import 'package:f2i_flutter_store_comlan_gaetan_gael/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:provider/provider.dart';


class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // watch (getter) : accéder au product stocké dans ProductProvider
    Product? product = context.watch<ProductProvider>().product;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
        const SizedBox(
          height: 15,
        ),
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
      ],
    );
  }
}