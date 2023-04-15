import 'package:appworks_school_flutter_program/api/product_list_response.dart';
import 'package:dio/dio.dart';

class ApiService {

  final baseUrl = 'https://api.appworks-school.tw/api/1.0/products/';
  final dio = Dio();

  Future<ProductListResponse> getProductList(String productName) async {
    final response = await dio.get('$baseUrl$productName');
    return ProductListResponse.fromMap(response.data);
  }
}
