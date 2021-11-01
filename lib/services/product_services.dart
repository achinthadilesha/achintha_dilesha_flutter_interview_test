import 'dart:convert';

import 'package:http/http.dart' as http;
import '/models/models.dart';

import '/config/constants.dart';

class ProductService {
  /// fetching multiple products
  static Future<List<Product>?> getProducts() async {
    final url = Uri.parse(Constants.productsUrl);

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return json
            .decode(response.body)
            .map<Product>((product) => Product.fromJson(product))
            .toList();
      }
    } catch (error) {
      rethrow;
    }
  }

  /// fethcing single featured product
  static Future<Product?> getSingleProduct() async {
    final url = Uri.parse(Constants.productDetailUrl);

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return Product.fromJson(jsonDecode(response.body));
      }
    } catch (error) {
      rethrow;
    }
  }
}
