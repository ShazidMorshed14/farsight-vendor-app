import 'dart:convert';

class CategoryModel {
  String? id;
  String? name;
  String? slug;
  dynamic categoryImage;
  String? categoryAppImage;
  CreatedBy? createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  CategoryModel({
    this.id,
    this.name,
    this.slug,
    this.categoryImage,
    this.categoryAppImage,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CategoryModel.fromRawJson(String str) =>
      CategoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["_id"],
        name: json["name"],
        slug: json["slug"],
        categoryImage: json["categoryImage"],
        categoryAppImage: json["categoryAppImage"],
        createdBy: json["createdBy"] == null
            ? null
            : CreatedBy.fromJson(json["createdBy"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "slug": slug,
        "categoryImage": categoryImage,
        "categoryAppImage": categoryAppImage,
        "createdBy": createdBy?.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class CreatedBy {
  String? id;
  String? name;
  String? role;

  CreatedBy({
    this.id,
    this.name,
    this.role,
  });

  factory CreatedBy.fromRawJson(String str) =>
      CreatedBy.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json["_id"],
        name: json["name"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "role": role,
      };
}
