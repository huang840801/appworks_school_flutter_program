import 'package:appworks_school_flutter_program/api/product_list_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {

  final baseUrl = 'https://api.appworks-school.tw/api/1.0/products/';

  Future<ProductListResponse> getProductList(String productName) async {
    var uri = Uri.parse('$baseUrl$productName');
    var response = await http.get(uri);
    return ProductListResponse.fromMap(jsonDecode(response.body));
  }
}
