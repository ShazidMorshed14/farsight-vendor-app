class CartItem {
  final String productId;
  final String name;
  final String? brand;
  final int quantity;
  final double price;
  final double? discountAmount;
  final String variantId;
  final String? color;
  final String? productImage;

  CartItem({
    required this.productId,
    required this.name,
    this.brand,
    required this.quantity,
    required this.price,
    this.discountAmount,
    required this.variantId,
    this.color,
    this.productImage,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'name': name,
      'brand': brand,
      'quantity': quantity,
      'price': price,
      'discountAmount': discountAmount,
      'variantId': variantId,
      'color': color,
      'productImage': productImage,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      productId: map['productId'],
      name: map['name'],
      brand: map['brand'],
      quantity: map['quantity'],
      price: map['price'],
      discountAmount: map['discountAmount'],
      variantId: map['variantId'],
      color: map['color'],
      productImage: map['productImage'],
    );
  }
}
