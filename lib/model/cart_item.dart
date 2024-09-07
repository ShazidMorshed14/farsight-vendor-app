class CartItem {
  final String productId;
  final String name;
  final String? brand;
  final int quantity;
  final double price;
  final double? discountAmount;
  final double totalPrice;
  final String variantId;
  final String? color;

  CartItem({
    required this.productId,
    required this.name,
    this.brand,
    required this.quantity,
    required this.price,
    this.discountAmount,
    required this.totalPrice,
    required this.variantId,
    this.color,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'name': name,
      'brand': brand,
      'quantity': quantity,
      'price': price,
      'discountAmount': discountAmount,
      'totalPrice': totalPrice,
      'variantId': variantId,
      'color': color,
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
      totalPrice: map['totalPrice'],
      variantId: map['variantId'],
      color: map['color'],
    );
  }
}
