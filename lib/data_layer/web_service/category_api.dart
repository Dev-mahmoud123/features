import 'dart:convert';
import 'dart:developer';

import 'package:tasky/constants/strings.dart';
import 'package:http/http.dart' as http;
import 'package:tasky/data_layer/model/categories.dart';

class CategoryApi {
  Future<List<Categories>> getCategories() async {
    final url = Uri.parse(ConstantsApi.categories);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final decodeResponse = json.decode(response.body);
      final categories = (decodeResponse as List)
          .map((categories) => Categories.fromJson(categories))
          .toList();
      return categories;
    } else {
      log(response.statusCode.toString());
      return [];
    }
  }
}
