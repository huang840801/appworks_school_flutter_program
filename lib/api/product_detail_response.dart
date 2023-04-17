class ProductDetailResponse {
  late ProductDetailData productDetailData;

  static ProductDetailResponse fromMap(Map<String, dynamic> map) {
    ProductDetailResponse response = ProductDetailResponse();
    response.productDetailData = ProductDetailData.fromMap(map['data']);
    return response;
  }
}

class ProductDetailData {
  late String title;

  static ProductDetailData fromMap(Map<String, dynamic> map) {
    ProductDetailData response = ProductDetailData();
    response.title = map['title'];
    return response;
  }
}
