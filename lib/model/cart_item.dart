class CartItem {
  String productId;
  dynamic product_unit_price;
  dynamic product_discount;
  dynamic product_total_price;
  dynamic product_discounted_price;
  int quantity;
  String variant;
  String name;
  String? brand;
  String? color;
  String? productImage;
  int stock;

  CartItem(
      {required this.productId,
      required this.product_unit_price,
      required this.product_discount,
      required this.product_total_price,
      required this.product_discounted_price,
      required this.quantity,
      required this.variant,
      required this.name,
      this.brand,
      this.color,
      this.productImage,
      required this.stock});

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'product_unit_price': product_unit_price,
      'product_discount': product_discount,
      'product_total_price': product_total_price,
      'product_discounted_price': product_discounted_price,
      'quantity': quantity,
      'variant': variant,
      'name': name,
      'brand': brand,
      'color': color,
      'productImage': productImage,
      'stock': stock
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      productId: map['productId'],
      product_unit_price: map['product_unit_price'],
      product_discount: map['product_discount'],
      product_total_price: map['product_total_price'],
      product_discounted_price: map['product_discounted_price'],
      quantity: map['quantity'],
      variant: map['variant'],
      name: map['name'],
      brand: map['brand'],
      color: map['color'],
      productImage: map['productImage'],
      stock: map['stock'],
    );
  }
}
