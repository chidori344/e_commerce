import 'package:e_commerce/domain/entity/category_respons_or_brand_entity.dart';

class Metadata {
  num? currentPage;
  num? numberOfPages;
  num? limit;

  Metadata({
    this.currentPage, this.numberOfPages, this.limit
  });

  Metadata copyWith({
    num? currentPage, num? numberOfPages, num? limit
  }) =>
      Metadata(currentPage: currentPage ?? this.currentPage,
          numberOfPages: numberOfPages ?? this.numberOfPages,
          limit: limit ?? this.limit);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
    };
    map["currentPage"] = currentPage;
    map["numberOfPages"] = numberOfPages;
    map["limit"] = limit;
    return map;
  }

  Metadata.fromJson(dynamic json) {
    currentPage = json["currentPage"] ?? 0;
    numberOfPages = json["numberOfPages"] ?? 0;
    limit = json["limit"] ?? 0;
  }
}

class CategoryOrBrandDto extends CategoryOrBrandEntity {


  CategoryOrBrandDto({
    super.id, super.name, super.slug, super.image, super.createdAt, super.updatedAt
  });

  CategoryOrBrandDto copyWith({
    String? id, String? name, String? slug, String? image, String? createdAt, String? updatedAt
  }) =>
      CategoryOrBrandDto(id: id ?? this.id,
          name: name ?? this.name,
          slug: slug ?? this.slug,
          image: image ?? this.image,
          createdAt: createdAt ?? this.createdAt,
          updatedAt: updatedAt ?? this.updatedAt);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
    };
    map["_id"] = id;
    map["name"] = name;
    map["slug"] = slug;
    map["image"] = image;
    map["createdAt"] = createdAt;
    map["updatedAt"] = updatedAt;
    return map;
  }

  CategoryOrBrandDto.fromJson(dynamic json) {
    id = json["_id"] ?? "";
    name = json["name"] ?? "";
    slug = json["slug"] ?? "";
    image = json["image"] ?? "";
    createdAt = json["createdAt"] ?? "";
    updatedAt = json["updatedAt"] ?? "";
  }
}

class CategoryOrBrandResponseDto extends CategoryOrBrandResponseEntity {
  String? message;

  Metadata? metadata;

  String? statusMsg;


  CategoryOrBrandResponseDto({
    super.results, this.metadata, super.dataList,this.message,this.statusMsg
  });

  CategoryOrBrandResponseDto copyWith({
    num? results, Metadata? metadata, List<CategoryOrBrandEntity>? dataList
  }) =>
      CategoryOrBrandResponseDto(results: results ?? this.results,
          metadata: metadata ?? this.metadata,
          dataList: dataList ?? super.dataList);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
    };
    map["results"] = results;
    if (metadata != null) {
      map["metadata"] = metadata?.toJson();
    }
    if (dataList != null) {
      map["data"] = dataList?.map((v) {
        if (v is CategoryOrBrandDto) return v.toJson() ;
        return<String, dynamic>{
          "_id": v.id,
          "name": v.name,
          "slug": v.slug,
          "image": v.image,
          "createdAt": v.createdAt,
          "updatedAt": v.updatedAt,
        };
      }).toList();
    }
    map["message"] = message;
    map["statusMsg"] = statusMsg;
    return map;
  }


  CategoryOrBrandResponseDto.fromJson(dynamic json) {
    results = json["results"] ?? 0;
    metadata =
    json["metadata"] != null ? Metadata.fromJson(json["metadata"]) : null;
    if (json["data"] != null) {
      dataList = [];
      json["data"].forEach((v) {
        dataList?.add(CategoryOrBrandDto.fromJson(v));
      }
      );
      message = json["message"] ?? "";
      statusMsg = json["statusMsg"] ?? "";
    }
  }
  CategoryOrBrandResponseEntity toCategoryEntity(){
    return CategoryOrBrandResponseEntity(
        results: results!,
        dataList: dataList?.map((dataDto)=>CategoryOrBrandEntity(
          id: dataDto.id,
          name: dataDto.name,
          slug: dataDto.slug,
          image: dataDto.image,

        )).toList()
    );
  }
}
