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

  //Supprimer un produit du panier
  void removeProduct(Product product) {
    _products.remove(product);
    notifyListeners();
  }

  //Vider le panier
  void clear() {
    _products.clear();
    notifyListeners();
  }

  //Calculer le total du panier
  double getTotal() {
    double total = 0;
    for (var product in _products) {
      total += product.price;
    }
    return total;
  }

}