import 'package:flutter/foundation.dart';

import 'api/api_service.dart';
import 'api/product_list_response.dart';

class MainViewModel {

  final apiService = ApiService();
  final ValueNotifier<List<Product>> allProductList = ValueNotifier([]);
  final ValueNotifier<List<Product>> womenProductList = ValueNotifier([]);
  final ValueNotifier<List<Product>> menProductList = ValueNotifier([]);
  final ValueNotifier<List<Product>> accessoriesProductList = ValueNotifier([]);
  final ValueNotifier<List<String>> imageList = ValueNotifier([]);

  Future<void> getWomenProductList() async {
    final response = apiService.getProductList('women');
    response.then((value) {
      womenProductList.value = value.data;
    });
  }

  Future<void> getMenProductList() async {
    final response = apiService.getProductList('men');
    response.then((value) {
      menProductList.value = value.data;

    });
  }
  Future<void> getAccessoriesProductList() async {
    final response = apiService.getProductList('accessories');
    response.then((value) {
      accessoriesProductList.value = value.data;
      _setAllProducts();
    });
  }

  void _setAllProducts() {
    List<Product> productList = [];
    List<String> tempImageList = [];
    if (womenProductList.value.isNotEmpty) {
      productList.add(Product('女裝'));
      for (final product in womenProductList.value) {
        productList.add(product);
        tempImageList.add(product.mainImage);
      }
    }
    if (menProductList.value.isNotEmpty) {
      productList.add(Product('男裝'));
      for (final product in menProductList.value) {
        productList.add(product);
        tempImageList.add(product.mainImage);
      }
    }
    if (accessoriesProductList.value.isNotEmpty) {
      productList.add(Product('配件'));
      for (final product in accessoriesProductList.value) {
        productList.add(product);
        tempImageList.add(product.mainImage);
      }
    }
    allProductList.value = productList;
    imageList.value = tempImageList;
  }

  Future<void> getAllProductList() async {
    await getWomenProductList();
    await getMenProductList();
    await getAccessoriesProductList();
  }
}