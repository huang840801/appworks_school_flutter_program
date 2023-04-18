class ProductDetailResponse {
  late ProductDetailData productDetailData;

  static ProductDetailResponse fromMap(Map<String, dynamic> map) {
    ProductDetailResponse response = ProductDetailResponse();
    response.productDetailData = ProductDetailData.fromMap(map['data']);
    return response;
  }
}

class ProductDetailData {
  late int id;
  late String title;
  late String category;
  late String description;
  late int price;
  late String texture;
  late String wash;
  late String place;
  late String note;
  late String story;
  late String mainImage;
  late List<Color> colors;
  late List<Variant> variants;
  late List<String> sizes;
  late List<String> images;

  static ProductDetailData fromMap(Map<String, dynamic> map) {
    ProductDetailData response = ProductDetailData();
    response.id = map['id'];
    response.title = map['title'];
    response.category = map['category'];
    response.description = map['description'];
    response.price = map['price'];
    response.texture = map['texture'];
    response.wash = map['wash'];
    response.place = map['place'];
    response.note = map['note'];
    response.story = map['story'];
    response.mainImage = map['main_image'];
    response.colors = [...(map['colors'] as List).map((o) => Color.fromMap(o))];
    response.variants = [...(map['variants'] as List).map((o) => Variant.fromMap(o))];
    response.sizes = [...(map['sizes'] as List).map((o) => o.toString())];
    response.images = [...(map['images'] as List).map((o) => o.toString())];
    return response;
  }
}

class Color {
  late String code;
  late String name;

  static Color fromMap(Map<String, dynamic> map) {
    Color response = Color();
    response.code = map['code'];
    response.name = map['name'];
    return response;
  }
}

class Variant {
  late String colorCode;
  late String size;
  late int stock;

  static Variant fromMap(Map<String, dynamic> map) {
    Variant response = Variant();
    response.colorCode = map['color_code'];
    response.size = map['size'];
    response.stock = map['stock'];
    return response;
  }
}
