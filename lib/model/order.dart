import 'dart:convert';

class Order {
  DateTime? apxDeliveryDate;
  dynamic prescImage;
  String? id;
  String? orderNo;
  String? receiptNo;
  UserId? userId;
  dynamic totalBill;
  dynamic totalDiscountedBill;
  String? deliveryAddress;
  String? contactNo;
  List<OrderedProduct>? orderedProducts;
  String? paymentMethod;
  dynamic cardNo;
  dynamic onlineScourceType;
  dynamic trxNo;
  String? orderStatus;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  dynamic deliveryDate;
  List<OrderLifeHistory>? orderLifeHistory;
  String? returnCause;
  String? shippingInfo;
  String? shippingMedium;

  Order({
    this.apxDeliveryDate,
    this.prescImage,
    this.id,
    this.orderNo,
    this.receiptNo,
    this.userId,
    this.totalBill,
    this.totalDiscountedBill,
    this.deliveryAddress,
    this.contactNo,
    this.orderedProducts,
    this.paymentMethod,
    this.cardNo,
    this.onlineScourceType,
    this.trxNo,
    this.orderStatus,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.deliveryDate,
    this.orderLifeHistory,
    this.returnCause,
    this.shippingInfo,
    this.shippingMedium,
  });

  factory Order.fromRawJson(String str) => Order.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        apxDeliveryDate: json["apx_delivery_date"] == null
            ? null
            : DateTime.parse(json["apx_delivery_date"]),
        prescImage: json["presc_image"],
        id: json["_id"],
        orderNo: json["order_no"],
        receiptNo: json["receipt_no"],
        userId:
            json["user_id"] == null ? null : UserId.fromJson(json["user_id"]),
        totalBill: json["total_bill"],
        totalDiscountedBill: json["total_discounted_bill"],
        deliveryAddress: json["delivery_address"],
        contactNo: json["contact_no"],
        orderedProducts: json["ordered_products"] == null
            ? []
            : List<OrderedProduct>.from(json["ordered_products"]!
                .map((x) => OrderedProduct.fromJson(x))),
        paymentMethod: json["payment_method"],
        cardNo: json["card_no"],
        onlineScourceType: json["online_scource_type"],
        trxNo: json["trx_no"],
        orderStatus: json["order_status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        deliveryDate: json["delivery_date"],
        orderLifeHistory: json["order_life_history"] == null
            ? []
            : List<OrderLifeHistory>.from(json["order_life_history"]!
                .map((x) => OrderLifeHistory.fromJson(x))),
        returnCause: json["return_cause"],
        shippingInfo: json["shipping_info"],
        shippingMedium: json["shipping_medium"],
      );

  Map<String, dynamic> toJson() => {
        "apx_delivery_date": apxDeliveryDate?.toIso8601String(),
        "presc_image": prescImage,
        "_id": id,
        "order_no": orderNo,
        "receipt_no": receiptNo,
        "user_id": userId?.toJson(),
        "total_bill": totalBill,
        "total_discounted_bill": totalDiscountedBill,
        "delivery_address": deliveryAddress,
        "ordered_products": orderedProducts == null
            ? []
            : List<dynamic>.from(orderedProducts!.map((x) => x.toJson())),
        "payment_method": paymentMethod,
        "card_no": cardNo,
        "online_scource_type": onlineScourceType,
        "trx_no": trxNo,
        "order_status": orderStatus,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "delivery_date": deliveryDate,
        "order_life_history": orderLifeHistory == null
            ? []
            : List<dynamic>.from(orderLifeHistory!.map((x) => x.toJson())),
        "return_cause": returnCause,
        "shipping_info": shippingInfo,
        "shipping_medium": shippingMedium,
      };
}

class OrderLifeHistory {
  String? label;
  String? description;
  String? id;

  OrderLifeHistory({
    this.label,
    this.description,
    this.id,
  });

  factory OrderLifeHistory.fromRawJson(String str) =>
      OrderLifeHistory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderLifeHistory.fromJson(Map<String, dynamic> json) =>
      OrderLifeHistory(
        label: json["label"],
        description: json["description"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "description": description,
        "_id": id,
      };
}

class OrderedProduct {
  int? quantity;
  Variant? variant;
  int? productUnitPrice;
  int? productDiscount;
  int? productTotalPrice;
  int? productDiscountedPrice;
  ProductId? productId;
  String? id;

  OrderedProduct({
    this.quantity,
    this.variant,
    this.productUnitPrice,
    this.productDiscount,
    this.productTotalPrice,
    this.productDiscountedPrice,
    this.productId,
    this.id,
  });

  factory OrderedProduct.fromRawJson(String str) =>
      OrderedProduct.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderedProduct.fromJson(Map<String, dynamic> json) => OrderedProduct(
        quantity: json["quantity"],
        variant:
            json["variant"] == null ? null : Variant.fromJson(json["variant"]),
        productUnitPrice: json["product_unit_price"],
        productDiscount: json["product_discount"],
        productTotalPrice: json["product_total_price"],
        productDiscountedPrice: json["product_discounted_price"],
        productId: json["productId"] == null
            ? null
            : ProductId.fromJson(json["productId"]),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "variant": variant?.toJson(),
        "product_unit_price": productUnitPrice,
        "product_discount": productDiscount,
        "product_total_price": productTotalPrice,
        "product_discounted_price": productDiscountedPrice,
        "productId": productId?.toJson(),
        "_id": id,
      };
}

class ProductId {
  String? id;
  String? name;
  String? slug;
  String? sku;
  int? price;
  String? description;
  String? shape;
  String? brand;
  List<Color>? colors;
  List<String>? supportedPowers;
  int? quantity;
  List<ProductPicture>? productPictures;
  List<String>? categories;
  List<String>? subCategories;
  String? offerType;
  int? discountAmount;
  String? status;
  bool? isFeatured;
  String? createdBy;
  List<dynamic>? reviews;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ProductId({
    this.id,
    this.name,
    this.slug,
    this.sku,
    this.price,
    this.description,
    this.shape,
    this.brand,
    this.colors,
    this.supportedPowers,
    this.quantity,
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

  factory ProductId.fromRawJson(String str) =>
      ProductId.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductId.fromJson(Map<String, dynamic> json) => ProductId(
        id: json["_id"],
        name: json["name"],
        slug: json["slug"],
        sku: json["sku"],
        price: json["price"],
        description: json["description"],
        shape: json["shape"],
        brand: json["brand"],
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
            : List<String>.from(json["categories"]!.map((x) => x)),
        subCategories: json["subCategories"] == null
            ? []
            : List<String>.from(json["subCategories"]!.map((x) => x)),
        offerType: json["offer_type"],
        discountAmount: json["discount_amount"],
        status: json["status"],
        isFeatured: json["isFeatured"],
        createdBy: json["createdBy"],
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
        "brand": brand,
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
            : List<dynamic>.from(categories!.map((x) => x)),
        "subCategories": subCategories == null
            ? []
            : List<dynamic>.from(subCategories!.map((x) => x)),
        "offer_type": offerType,
        "discount_amount": discountAmount,
        "status": status,
        "isFeatured": isFeatured,
        "createdBy": createdBy,
        "reviews":
            reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
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

class Variant {
  String? id;
  String? name;
  String? slug;
  String? value;
  String? createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Variant({
    this.id,
    this.name,
    this.slug,
    this.value,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Variant.fromRawJson(String str) => Variant.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
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

class UserId {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? role;

  UserId({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.role,
  });

  factory UserId.fromRawJson(String str) => UserId.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "role": role,
      };
}
