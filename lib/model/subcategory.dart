// To parse this JSON data, do
//
//     final subCategoryModel = subCategoryModelFromJson(jsonString);

import 'dart:convert';

List<SubCategoryModel> subCategoryModelFromJson(String str) =>
    List<SubCategoryModel>.from(
        json.decode(str).map((x) => SubCategoryModel.fromJson(x)));

String subCategoryModelToJson(List<SubCategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubCategoryModel {
  String id;
  String name;
  String slug;
  dynamic subCategoryImage;
  dynamic subCategoryAppImage;
  List<Category> categories;
  CreatedBy createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  SubCategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.subCategoryImage,
    required this.subCategoryAppImage,
    required this.categories,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      SubCategoryModel(
        id: json["_id"],
        name: json["name"],
        slug: json["slug"],
        subCategoryImage: json["subCategoryImage"],
        subCategoryAppImage: json["subCategoryAppImage"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        createdBy: CreatedBy.fromJson(json["createdBy"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "slug": slug,
        "subCategoryImage": subCategoryImage,
        "subCategoryAppImage": subCategoryAppImage,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "createdBy": createdBy.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Category {
  String id;
  String name;
  String slug;
  dynamic categoryImage;
  String categoryAppImage;
  String createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic v;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.categoryImage,
    required this.categoryAppImage,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        name: json["name"],
        slug: json["slug"],
        categoryImage: json["categoryImage"],
        categoryAppImage: json["categoryAppImage"],
        createdBy: json["createdBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "slug": slug,
        "categoryImage": categoryImage,
        "categoryAppImage": categoryAppImage,
        "createdBy": createdBy,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class CreatedBy {
  String id;
  String name;
  String role;

  CreatedBy({
    required this.id,
    required this.name,
    required this.role,
  });

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
