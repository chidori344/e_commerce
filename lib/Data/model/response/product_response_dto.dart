import 'package:e_commerce/domain/entity/category_respons_or_brand_entity.dart';
import '../../../domain/entity/product_response_entity.dart';
import 'category_response_dto.dart';

class SubcategoryDto extends SubcategoryEntity {
  SubcategoryDto({
    super.id,
    super.name,
    super.slug,
    super.category,
  });

  Map<String, dynamic> toJson() => {
    '_id': id,
    'name': name,
    'slug': slug,
    'category': category,
  };

  factory SubcategoryDto.fromJson(Map<String, dynamic> json) => SubcategoryDto(
    id: json['_id'] ?? '',
    name: json['name'] ?? '',
    slug: json['slug'] ?? '',
    category: json['category'] ?? '',
  );
}

class ProductDto extends ProductEntity {
  ProductDto({
    super.sold,
    super.imagesList,
    super.subcategoryList,
    super.ratingsQuantity,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.priceAfterDiscount,
    super.availableColorsList,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    super.createdAt,
    super.updatedAt,
    super.id,
  });

  Map<String, dynamic> toJson() => {
    'sold': sold,
    'images': imagesList,
    'subcategory': subcategoryList
        ?.map((v) => SubcategoryDto(
      id: v.id,
      name: v.name,
      slug: v.slug,
      category: v.category,
    ).toJson())
        .toList(),
    'ratingsQuantity': ratingsQuantity,
    '_id': id,
    'title': title,
    'slug': slug,
    'description': description,
    'quantity': quantity,
    'price': price,
    'priceAfterDiscount': priceAfterDiscount,
    'availableColors': availableColorsList,
    'imageCover': imageCover,
    'category': category != null
        ? CategoryOrBrandDto(
      id: category!.id,
      name: category!.name,
      slug: category!.slug,
      image: category!.image,
    ).toJson()
        : null,
    'brand': brand != null
        ? CategoryOrBrandDto(
      id: brand!.id,
      name: brand!.name,
      slug: brand!.slug,
      image: brand!.image,
    ).toJson()
        : null,
    'ratingsAverage': ratingsAverage,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'id': id,
  };

  factory ProductDto.fromJson(Map<String, dynamic> json) => ProductDto(
    sold: json['sold'] ?? 0,
    imagesList: (json['images'] as List<dynamic>?)?.cast<String>() ?? [],
    subcategoryList: (json['subcategory'] as List<dynamic>?)
        ?.map((v) => SubcategoryDto.fromJson(v))
        .toList(),
    ratingsQuantity: json['ratingsQuantity'] ?? 0,
    id: json['_id'] ?? json['id'] ?? '',
    title: json['title'] ?? '',
    slug: json['slug'] ?? '',
    description: json['description'] ?? '',
    quantity: json['quantity'] ?? 0,
    price: json['price'] ?? 0,
    priceAfterDiscount: json['priceAfterDiscount'] ?? 0,
    availableColorsList: json['availableColors'] ?? [],
    imageCover: json['imageCover'] ?? '',
    category: json['category'] != null
        ? CategoryOrBrandDto.fromJson(json['category'])
        : null,
    brand: json['brand'] != null
        ? CategoryOrBrandDto.fromJson(json['brand'])
        : null,
    ratingsAverage: json['ratingsAverage'] ?? 0,
    createdAt: json['createdAt'] ?? '',
    updatedAt: json['updatedAt'] ?? '',
  );
}

class ProductResponseDto extends ProductResponseEntity {
  String? message;


  ProductResponseDto({
    super.results,
    super.dataList,
this.message,

  });

  Map<String, dynamic> toJson() => {
    'results': results,
    'data': dataList?.map((v) {
      if (v is ProductDto) return v.toJson();
      return ProductDto(
        sold: v.sold,
        imagesList: v.imagesList,
        subcategoryList: v.subcategoryList,
        ratingsQuantity: v.ratingsQuantity,
        title: v.title,
        slug: v.slug,
        description: v.description,
        quantity: v.quantity,
        price: v.price,
        priceAfterDiscount: v.priceAfterDiscount,
        availableColorsList: v.availableColorsList,
        imageCover: v.imageCover,
        category: v.category,
        brand: v.brand,
        ratingsAverage: v.ratingsAverage,
        createdAt: v.createdAt,
        updatedAt: v.updatedAt,
        id: v.id,
      ).toJson();
    }).toList(),
  };

  factory ProductResponseDto.fromJson(Map<String, dynamic> json) =>
      ProductResponseDto(
        results: json['results'] ?? 0,
        dataList: (json['data'] as List<dynamic>?)
            ?.map((v) => ProductDto.fromJson(v))
            .toList(),
      );
}
