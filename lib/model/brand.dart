import 'dart:convert';

class BrandModel {
  String? id;
  String? name;
  String? slug;
  String? createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  BrandModel({
    this.id,
    this.name,
    this.slug,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory BrandModel.fromRawJson(String str) =>
      BrandModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        id: json["_id"],
        name: json["name"],
        slug: json["slug"],
        createdBy: json["createdBy"],
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
        "createdBy": createdBy,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
