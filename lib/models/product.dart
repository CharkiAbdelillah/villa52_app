class Product {
  int id;
  String name;
  String description;
  String shortDescription;
  String sku;
  String stockStatus;

  List<Images> images;
  List<Categories> categories;

  Product({
    this.id,
    this.name,
    this.description,
    this.shortDescription,
    this.sku,
    this.stockStatus,
  });
  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    shortDescription = json['short_description'];
    sku = json['sku'];
    stockStatus = json['stock_status'];
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
  }
}

class Categories {
  int id;
  String name;
  Categories({this.id, this.name});
  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Images {
  String src;

  Images({
    this.src,
  });
  Images.fromJson(Map<String, dynamic> json) {
    src = json['src'];
  }
}
