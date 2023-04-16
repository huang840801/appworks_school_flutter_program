import 'api/api_service.dart';
import 'api/product_list_response.dart';

class MainViewModel {
  final _apiService = ApiService();
  List<Product> allProductList = [];
  List<String> imageList = [];
  List<Product> _womenProductList = [];
  List<Product> _menProductList = [];
  List<Product> _accessoriesProductList = [];

  MainViewModel(this.allProductList, this.imageList);

  Future<void> getWomenProductList() async {
    final response = _apiService.getProductList('women');
    await response.then((value) {
      _womenProductList = value.data;
    });
  }

  Future<void> getMenProductList() async {
    final response = _apiService.getProductList('men');
    await response.then((value) {
      _menProductList = value.data;
    });
  }

  Future<void> getAccessoriesProductList() async {
    final response = _apiService.getProductList('accessories');
    await response.then((value) {
      _accessoriesProductList = value.data;
      _setAllProducts();
    });
  }

  void _setAllProducts() {
    List<Product> productList = [];
    List<String> tempImageList = [];
    if (_womenProductList.isNotEmpty) {
      productList.add(Product('女裝'));
      for (final product in _womenProductList) {
        productList.add(product);
        tempImageList.add(product.mainImage);
      }
    }
    if (_menProductList.isNotEmpty) {
      productList.add(Product('男裝'));
      for (final product in _menProductList) {
        productList.add(product);
        tempImageList.add(product.mainImage);
      }
    }
    if (_accessoriesProductList.isNotEmpty) {
      productList.add(Product('配件'));
      for (final product in _accessoriesProductList) {
        productList.add(product);
        tempImageList.add(product.mainImage);
      }
    }
    allProductList = productList;
    imageList = tempImageList;
  }

  Future<MainViewModel> getAllProductList() async {
    await getWomenProductList();
    await getMenProductList();
    await getAccessoriesProductList();

    return MainViewModel(allProductList, imageList);
  }
}
