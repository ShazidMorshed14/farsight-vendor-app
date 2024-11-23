import 'dart:convert';

class ColorModel {
  String? id;
  String? name;
  String? slug;
  String? value;
  String? createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ColorModel({
    this.id,
    this.name,
    this.slug,
    this.value,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ColorModel.fromRawJson(String str) =>
      ColorModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ColorModel.fromJson(Map<String, dynamic> json) => ColorModel(
        id: json["_id"],
        name: json["name"],
        slug: json["slug"],
        value: json["value"],
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
        "value": value,
        "createdBy": createdBy,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
