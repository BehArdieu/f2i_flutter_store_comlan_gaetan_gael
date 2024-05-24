import 'package:f2i_flutter_store_comlan_gaetan_gael/models/product.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  
  //Liste des produits du panier
  final List<Product> _products = [];

  //Getter
  List<Product> get products => _products;

  //Ajoute un produit au panier
  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

}