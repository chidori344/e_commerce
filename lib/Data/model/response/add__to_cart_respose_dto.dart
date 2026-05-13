import '../../../domain/entity/add__to_cart_respose_entity.dart';

class AddProductToCartDto extends AddProductToCartEntity {


  AddProductToCartDto({
    super.count, super.id, super.product, super.price
  });



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
    };
    map["count"] = count;
    map["_id"] = id;
    map["product"] = product;
    map["price"] = price;
    return map;
  }

  AddProductToCartDto.fromJson(dynamic json) {
    count = json["count"] ?? 0;
    id = json["_id"] ?? "";
    product = json["product"] ?? "";
    price = json["price"] ?? 0;
  }
}

class AddToCartResposeDto extends AddToCartResposeEntity {


  AddToCartResposeDto({
    super.status, super.message, super.numOfCartItems, super.cartId, super.data
  });





  AddToCartResposeDto.fromJson(dynamic json) {
    status = json["status"] ?? "";
    message = json["message"] ?? "";
    numOfCartItems = json["numOfCartItems"] ?? 0;
    cartId = json["cartId"] ?? "";
    data = json["data"] != null ? AddDataCartDto.fromJson(json["data"]) : null;
  }
}

class AddDataCartDto extends AddDataCartEntity {


  AddDataCartDto({
    super.id, super.cartOwner, super.productsList, super.createdAt, super.updatedAt, super.v, super.totalCartPrice
  });




  AddDataCartDto.fromJson(dynamic json) {
    id = json["_id"] ?? "";
    cartOwner = json["cartOwner"] ?? "";
    if (json["products"] != null) {
      productsList = [];
      json["products"].forEach((v) {
        productsList?.add(AddProductToCartDto.fromJson(v));
      });
    }
    createdAt = json["createdAt"] ?? "";
    updatedAt = json["updatedAt"] ?? "";
    v = json["__v"] ?? 0;
    totalCartPrice = json["totalCartPrice"] ?? 0;
  }
}
