import 'package:ecommerce_app/models/product_models.dart';
import 'package:ecommerce_app/utils/my_string.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce_app/utils/my_string.dart';

class ProductServices {
  static Future<List<ProductModels>> getProduct() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception('Failed to load product.');
    }
  }
}
