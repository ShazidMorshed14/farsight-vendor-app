import 'dart:convert';

class ProductModel {
  String id;
  String name;
  String? slug;
  String sku;
  int price;
  String? description;
  String? shape;
  List<Color>? colors;
  List<String>? supportedPowers;
  int quantity;
  List<ProductPicture>? productPictures;
  List<Category>? categories;
  List<Category>? subCategories;
  String? offerType;
  int? discountAmount;
  String? status;
  bool? isFeatured;
  CreatedBy? createdBy;
  List<dynamic>? reviews;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ProductModel({
    required this.id,
    required this.name,
    this.slug,
    required this.sku,
    required this.price,
    this.description,
    this.shape,
    this.colors,
    this.supportedPowers,
    required this.quantity,
    this.productPictures,
    this.categories,
    this.subCategories,
    this.offerType,
    this.discountAmount,
    this.status,
    this.isFeatured,
    this.createdBy,
    this.reviews,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ProductModel.fromRawJson(String str) =>
      ProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["_id"],
        name: json["name"],
        slug: json["slug"],
        sku: json["sku"],
        price: json["price"],
        description: json["description"],
        shape: json["shape"],
        colors: json["colors"] == null
            ? []
            : List<Color>.from(json["colors"]!.map((x) => Color.fromJson(x))),
        supportedPowers: json["supportedPowers"] == null
            ? []
            : List<String>.from(json["supportedPowers"]!.map((x) => x)),
        quantity: json["quantity"],
        productPictures: json["productPictures"] == null
            ? []
            : List<ProductPicture>.from(json["productPictures"]!
                .map((x) => ProductPicture.fromJson(x))),
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
        subCategories: json["subCategories"] == null
            ? []
            : List<Category>.from(
                json["subCategories"]!.map((x) => Category.fromJson(x))),
        offerType: json["offer_type"],
        discountAmount: json["discount_amount"],
        status: json["status"],
        isFeatured: json["isFeatured"],
        createdBy: json["createdBy"] == null
            ? null
            : CreatedBy.fromJson(json["createdBy"]),
        reviews: json["reviews"] == null
            ? []
            : List<dynamic>.from(json["reviews"]!.map((x) => x)),
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
        "sku": sku,
        "price": price,
        "description": description,
        "shape": shape,
        "colors": colors == null
            ? []
            : List<dynamic>.from(colors!.map((x) => x.toJson())),
        "supportedPowers": supportedPowers == null
            ? []
            : List<dynamic>.from(supportedPowers!.map((x) => x)),
        "quantity": quantity,
        "productPictures": productPictures == null
            ? []
            : List<dynamic>.from(productPictures!.map((x) => x.toJson())),
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "subCategories": subCategories == null
            ? []
            : List<dynamic>.from(subCategories!.map((x) => x.toJson())),
        "offer_type": offerType,
        "discount_amount": discountAmount,
        "status": status,
        "isFeatured": isFeatured,
        "createdBy": createdBy?.toJson(),
        "reviews":
            reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Category {
  String? id;
  String? name;

  Category({
    this.id,
    this.name,
  });

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}

class Color {
  int? addAmount;
  String? color;
  int? colorQuantity;
  String? id;

  Color({
    this.addAmount,
    this.color,
    this.colorQuantity,
    this.id,
  });

  factory Color.fromRawJson(String str) => Color.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        addAmount: json["add_amount"],
        color: json["color"],
        colorQuantity: json["color_quantity"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "add_amount": addAmount,
        "color": color,
        "color_quantity": colorQuantity,
        "_id": id,
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

class ProductPicture {
  String? id;
  String? img;
  bool? productPictureDefault;

  ProductPicture({
    this.id,
    this.img,
    this.productPictureDefault,
  });

  factory ProductPicture.fromRawJson(String str) =>
      ProductPicture.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductPicture.fromJson(Map<String, dynamic> json) => ProductPicture(
        id: json["_id"],
        img: json["img"],
        productPictureDefault: json["default"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "img": img,
        "default": productPictureDefault,
      };
}
