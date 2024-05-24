import 'dart:convert';

import 'package:f2i_flutter_store_comlan_gaetan_gael/config/config.dart';
import 'package:f2i_flutter_store_comlan_gaetan_gael/models/product.dart';
import 'package:http/http.dart' as http;


class ProductsService {
  /*
    récupérer tous les produits
    Future équivalent d'une Promise en JS
  */
  Future<List<Product>> getProducts() async {
    // réquête en GET
    Uri uri = Uri.parse('${Config.API_URL}/products');
    http.Response response = await http.get(uri);

    // récupérer la réponse
    if (response.statusCode == 200) {
      // convertir les données en JSON
      List data = jsonDecode(response.body);

      // renvoyer une liste d'objet
      return data
          .map(
            (dynamic value) => Product(
                id: value['id'],
                title: value['title'],
                price: value['price'],
                description: value['description'],
                category: value['category'],
                image: value['image'],
                rating: value['rating']),
          )
          .toList();
    }
    // renvoyer une erreur
    else {
      throw Error();
    }
  }
}
