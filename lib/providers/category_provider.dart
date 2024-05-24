import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  // stocker un produit
  String? _category;

  // getter / setter
  String? get category => _category;

  set category(String? value) {
    _category = value;
    // notifyListeners : permet de mettre à jour les écouteurs du provider
    notifyListeners();
  }
}