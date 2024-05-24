import 'package:f2i_flutter_store_comlan_gaetan_gael/models/product.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  // stocker un produit
  Product? _product;

  // getter / setter
  Product? get product => _product;

  set product(Product? value) {
    _product = value;
    // notifyListeners : permet de mettre à jour les écouteurs du provider
    notifyListeners();
  }
}
