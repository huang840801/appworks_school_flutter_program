class ProductListResponse {
  late List<DataBean> data;
  late int nextPaging;

  static ProductListResponse fromMap(Map<String, dynamic> map) {
    ProductListResponse productListResponseBean = ProductListResponse();
    productListResponseBean.data = [...(map['data'] as List).map((o) => DataBean.fromMap(o))];
    productListResponseBean.nextPaging = map['next_paging'];
    return productListResponseBean;
  }

  Map toJson() => {
        "data": data,
        "next_paging": nextPaging,
      };
}

class DataBean {
  late int id;
  late String category;
  late String title;
  late String description;
  late int price;
  late String texture;
  late String wash;
  late String place;
  late String note;
  late String story;
  late String mainImage;
  late List<String> images;
  late List<VariantsBean> variants;
  late List<ColorsBean> colors;
  late List<String> sizes;

  static DataBean fromMap(Map<String, dynamic> map) {
    DataBean dataBean = DataBean();
    dataBean.id = map['id'];
    dataBean.category = map['category'];
    dataBean.title = map['title'];
    dataBean.description = map['description'];
    dataBean.price = map['price'];
    dataBean.texture = map['texture'];
    dataBean.wash = map['wash'];
    dataBean.place = map['place'];
    dataBean.note = map['note'];
    dataBean.story = map['story'];
    dataBean.mainImage = map['main_image'];
    dataBean.images = [...(map['images'] as List).map((o) => o.toString())];
    dataBean.variants = [...(map['variants'] as List).map((o) => VariantsBean.fromMap(o))];
    dataBean.colors = [...(map['colors'] as List).map((o) => ColorsBean.fromMap(o))];
    dataBean.sizes = [...(map['sizes'] as List).map((o) => o.toString())];
    return dataBean;
  }

  Map toJson() => {
        "id": id,
        "category": category,
        "title": title,
        "description": description,
        "price": price,
        "texture": texture,
        "wash": wash,
        "place": place,
        "note": note,
        "story": story,
        "main_image": mainImage,
        "images": images,
        "variants": variants,
        "colors": colors,
        "sizes": sizes,
      };
}

class ColorsBean {
  late String code;
  late String name;

  static ColorsBean fromMap(Map<String, dynamic> map) {
    ColorsBean colorsBean = ColorsBean();
    colorsBean.code = map['code'];
    colorsBean.name = map['name'];
    return colorsBean;
  }

  Map toJson() => {
        "code": code,
        "name": name,
      };
}

class VariantsBean {
  late String colorCode;
  late String size;
  late int stock;

  static VariantsBean fromMap(Map<String, dynamic> map) {
    VariantsBean variantsBean = VariantsBean();
    variantsBean.colorCode = map['color_code'];
    variantsBean.size = map['size'];
    variantsBean.stock = map['stock'];
    return variantsBean;
  }

  Map toJson() => {
        "color_code": colorCode,
        "size": size,
        "stock": stock,
      };
}
