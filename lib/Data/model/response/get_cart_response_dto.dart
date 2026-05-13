import 'package:e_commerce/Data/model/response/category_response_dto.dart';
import 'package:e_commerce/Data/model/response/product_response_dto.dart';
import 'package:e_commerce/domain/entity/get_cart_response_entity.dart';

class GetCartResponseDto extends GetCartResponseEntity {
String? message;

  GetCartResponseDto({
    super.status, super.numOfCartItems, super.cartId, super.data,this.message
  });




  GetCartResponseDto.fromJson(dynamic json) {
    status = json["status"] ?? "";
    numOfCartItems = json["numOfCartItems"] ?? 0;
    cartId = json["cartId"] ?? "";
    data = json["data"] != null ? GetDataCartDto.fromJson(json["data"]) : null;
  }
}

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

class GetProductDto extends GetProductEntity {

  GetProductDto({
    super.subcategoryList, super.id, super.title, super.quantity,
    super.imageCover, super.category, super.brand, super.ratingsAverage,
  });




  GetProductDto.fromJson(dynamic json) {
    if (json["subcategory"] != null) {
      subcategoryList = [];
      json["subcategory"].forEach((v) {
        subcategoryList?.add(SubcategoryDto.fromJson(v));
      });
    }
    id = json["_id"] ?? "";
    title = json["title"] ?? "";
    quantity = json["quantity"] ?? 0;
    imageCover = json["imageCover"] ?? "";
    category =
    json["category"] != null ? CategoryOrBrandDto.fromJson(json["category"]) : null;
    brand = json["brand"] != null ? CategoryOrBrandDto.fromJson(json["brand"]) : null;
    ratingsAverage = json["ratingsAverage"] ?? 0;
    id = json["id"] ?? "";
  }
}

class GetProductsCartDto extends GetProductsCartEntity {


  GetProductsCartDto({
    super.count, super.id, super.product, super.price
  });




  GetProductsCartDto.fromJson(dynamic json) {
    count = json["count"] ?? 0;
    id = json["_id"] ?? "";
    product =
    json["product"] != null ? GetProductDto.fromJson(json["product"]) : null;
    price = json["price"] ?? 0;
  }
}

class GetDataCartDto extends GetDataCartEntity {


  GetDataCartDto({
    super.id, super.cartOwner, super.productsList,
    super.createdAt, super.updatedAt, super.v, super.totalCartPrice
  });




  GetDataCartDto.fromJson(dynamic json) {
    id = json["_id"] ?? "";
    cartOwner = json["cartOwner"] ?? "";
    if (json["products"] != null) {
      productsList = [];
      json["products"].forEach((v) {
        productsList?.add(GetProductsCartDto.fromJson(v));
      });
    }
    createdAt = json["createdAt"] ?? "";
    updatedAt = json["updatedAt"] ?? "";
    v = json["__v"] ?? 0;
    totalCartPrice = json["totalCartPrice"] ?? 0;
  }
}
