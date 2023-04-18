import 'package:flutter/foundation.dart';

import 'api/api_service.dart';
import 'api/product_detail_response.dart';

class DetailViewModel {

  final apiService = ApiService();
  final ValueNotifier<ProductDetailData?> productDetailResponse = ValueNotifier(null);

  Future<void> getProductDetail(String productId) async {
    final response = apiService.getProductDetail(productId);
    response.then((value) {
      productDetailResponse.value = value.productDetailData;
      productDetailResponse.notifyListeners();
    });
  }
}