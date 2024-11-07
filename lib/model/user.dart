class User {
  String? id;
  String? name;
  String? username;
  String? email;
  String? phone;
  String? image;
  String? role;
  String? designation; // Make designation nullable
  String? status;
  int? userWeight;
  bool? isPassResetReq;

  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.image,
    this.role,
    this.designation, // Make designation optional
    this.status,
    this.userWeight,
    this.isPassResetReq,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'], // Provide default values if needed
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      role: json['role'],
      designation: json['designation'], // Keep nullable without default
      status: json['status'],
      userWeight: json['user_weight'] ?? 0,
      isPassResetReq: json['isPassResetReq'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'phone': phone,
      'image': image,
      'role': role,
      'designation': designation,
      'status': status,
      'userWeight': userWeight,
      'isPassResetReq': isPassResetReq,
    };
  }
}
