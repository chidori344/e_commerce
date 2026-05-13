import 'package:e_commerce/domain/entity/category_respons_or_brand_entity.dart';
import 'package:e_commerce/domain/entity/product_response_entity.dart';

class Subcategory {
  String? id;
  String? name;
  String? slug;
  String? category;

  Subcategory({
    this.id, this.name, this.slug, this.category
  });

  Subcategory copyWith({
    String? id, String? name, String? slug, String? category
  }) =>
      Subcategory(id: id ?? this.id,
          name: name ?? this.name,
          slug: slug ?? this.slug,
          category: category ?? this.category);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
    };
    map["_id"] = id;
    map["name"] = name;
    map["slug"] = slug;
    map["category"] = category;
    return map;
  }

  Subcategory.fromJson(dynamic json) {
    id = json["_id"] ?? "";
    name = json["name"] ?? "";
    slug = json["slug"] ?? "";
    category = json["category"] ?? "";
  }
}

class Category {
  String? id;
  String? name;
  String? slug;
  String? image;

  Category({
    this.id, this.name, this.slug, this.image
  });

  Category copyWith({
    String? id, String? name, String? slug, String? image
  }) =>
      Category(id: id ?? this.id,
          name: name ?? this.name,
          slug: slug ?? this.slug,
          image: image ?? this.image);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
    };
    map["_id"] = id;
    map["name"] = name;
    map["slug"] = slug;
    map["image"] = image;
    return map;
  }

  Category.fromJson(dynamic json) {
    id = json["_id"] ?? "";
    name = json["name"] ?? "";
    slug = json["slug"] ?? "";
    image = json["image"] ?? "";
  }
}

class Brand {
  String? id;
  String? name;
  String? slug;
  String? image;

  Brand({
    this.id, this.name, this.slug, this.image
  });

  Brand copyWith({
    String? id, String? name, String? slug, String? image
  }) =>
      Brand(id: id ?? this.id,
          name: name ?? this.name,
          slug: slug ?? this.slug,
          image: image ?? this.image);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
    };
    map["_id"] = id;
    map["name"] = name;
    map["slug"] = slug;
    map["image"] = image;
    return map;
  }

  Brand.fromJson(dynamic json) {
    id = json["_id"] ?? "";
    name = json["name"] ?? "";
    slug = json["slug"] ?? "";
    image = json["image"] ?? "";
  }
}

class GetProductEntity {
  List<SubcategoryEntity>? subcategoryList;
  String? id;
  String? title;
  num? quantity;
  String? imageCover;
  CategoryOrBrandEntity? category;
  CategoryOrBrandEntity? brand;
  num? ratingsAverage;

  GetProductEntity({
    this.subcategoryList, this.id, this.title, this.quantity,
    this.imageCover, this.category, this.brand, this.ratingsAverage,
  });


}

class GetProductsCartEntity {
  num? count;
  String? id;
  GetProductEntity? product;
  num? price;

  GetProductsCartEntity({
    this.count, this.id, this.product, this.price
  });


}

class GetDataCartEntity {
  String? id;
  String? cartOwner;
  List<GetProductsCartEntity>? productsList;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;

  GetDataCartEntity({
    this.id, this.cartOwner, this.productsList, this.createdAt, this.updatedAt, this.v, this.totalCartPrice
  });

}

class GetCartResponseEntity {
  String? status;
  num? numOfCartItems;
  String? cartId;
  GetDataCartEntity? data;

  GetCartResponseEntity({
    this.status, this.numOfCartItems, this.cartId, this.data
  });


}