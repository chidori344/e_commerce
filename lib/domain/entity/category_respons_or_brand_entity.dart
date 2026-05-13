class CategoryOrBrandEntity {
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

  CategoryOrBrandEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  CategoryOrBrandEntity copyWith({
    String? id,
    String? name,
    String? slug,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) => CategoryOrBrandEntity(
    id: id ?? this.id,
    name: name ?? this.name,
    slug: slug ?? this.slug,
    image: image ?? this.image,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
}

class CategoryOrBrandResponseEntity {
  num? results;
  List<CategoryOrBrandEntity>? dataList;


  CategoryOrBrandResponseEntity({this.results, this.dataList});

  CategoryOrBrandResponseEntity copyWith({
    num? results,

    List<CategoryOrBrandEntity>? dataList,
  }) => CategoryOrBrandResponseEntity(
    results: results ?? this.results,

    dataList: dataList ?? this.dataList,
  );
}
