class AddProductToCartEntity {
  num? count;
  String? id;
  String? product;
  num? price;

  AddProductToCartEntity({
    this.count, this.id, this.product, this.price
  });


}

class AddDataCartEntity {
  String? id;
  String? cartOwner;
  List<AddProductToCartEntity>? productsList;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;

  AddDataCartEntity({
    this.id, this.cartOwner, this.productsList, this.createdAt, this.updatedAt, this.v, this.totalCartPrice
  });


}

class AddToCartResposeEntity {
  String? status;
  String? message;
  num? numOfCartItems;
  String? cartId;
  AddDataCartEntity? data;

  AddToCartResposeEntity({
    this.status, this.message, this.numOfCartItems, this.cartId, this.data
  });

}