import 'package:e_commerce/domain/entity/category_respons_or_brand_entity.dart';



class SubcategoryEntity {
  String? id;
  String? name;
  String? slug;
  String? category;

  SubcategoryEntity({
    this.id, this.name, this.slug, this.category
  });

  SubcategoryEntity copyWith({
    String? id, String? name, String? slug, String? category
  }) =>
      SubcategoryEntity(id: id ?? this.id,
          name: name ?? this.name,
          slug: slug ?? this.slug,
          category: category ?? this.category);

}


class ProductEntity {
  num? sold;
  List<String>? imagesList;
  List<SubcategoryEntity>? subcategoryList;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  num? priceAfterDiscount;
  List<dynamic>? availableColorsList;
  String? imageCover;
  CategoryOrBrandEntity? category;
  CategoryOrBrandEntity? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;


  ProductEntity({
    this.sold, this.imagesList, this.subcategoryList, this.ratingsQuantity, this.title, this.slug, this.description, this.quantity, this.price, this.priceAfterDiscount, this.availableColorsList, this.imageCover, this.category, this.brand, this.ratingsAverage, this.createdAt, this.updatedAt, this.id
  });

  ProductEntity copyWith({
    num? sold, List<String>? imagesList, List<
        SubcategoryEntity>? subcategoryList, num? ratingsQuantity, String? id, String? title, String? slug, String? description, num? quantity, num? price, num? priceAfterDiscount, List<
        dynamic>? availableColorsList, String? imageCover, CategoryOrBrandEntity? category, CategoryOrBrandEntity? brand, num? ratingsAverage, String? createdAt, String? updatedAt,
  }) =>
      ProductEntity(sold: sold ?? this.sold,
          imagesList: imagesList ?? this.imagesList,
          subcategoryList: subcategoryList ?? this.subcategoryList,
          ratingsQuantity: ratingsQuantity ?? this.ratingsQuantity,
          id: id ?? this.id,
          title: title ?? this.title,
          slug: slug ?? this.slug,
          description: description ?? this.description,
          quantity: quantity ?? this.quantity,
          price: price ?? this.price,
          priceAfterDiscount: priceAfterDiscount ?? this.priceAfterDiscount,
          availableColorsList: availableColorsList ?? this.availableColorsList,
          imageCover: imageCover ?? this.imageCover,
          category: category ?? this.category,
          brand: brand ?? this.brand,
          ratingsAverage: ratingsAverage ?? this.ratingsAverage,
          createdAt: createdAt ?? this.createdAt,
          updatedAt: updatedAt ?? this.updatedAt,
          );

}

class ProductResponseEntity {
  num? results;
  List<ProductEntity>? dataList;

  ProductResponseEntity({
    this.results, this.dataList
  });

  ProductResponseEntity copyWith({
    num? results,  List<ProductEntity>? dataList
  }) =>
      ProductResponseEntity(results: results ?? this.results,
          dataList: dataList ?? this.dataList);

}