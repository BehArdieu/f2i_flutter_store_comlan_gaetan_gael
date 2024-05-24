import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:f2i_flutter_store_comlan_gaetan_gael/config/config.dart';


class CategoriesService {
  Future<List<String>> getCategories() async {
    Uri uri = Uri.parse('${Config.API_URL}/categories');
    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      List data = djsonDecode(response.body);
      return data.map((dynamic value) => value.toString()).toList();
    } else {
      throw Error();
    }
  }
}