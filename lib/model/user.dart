class User {
  String id;
  String name;
  String username;
  String email;
  String phone;
  String image;
  String role;
  dynamic designation;
  String status;
  int userWeight;
  bool isPassResetReq;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.image,
    required this.role,
    required this.designation,
    required this.status,
    required this.userWeight,
    required this.isPassResetReq,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      role: json['role'],
      designation: json['designation'],
      status: json['status'],
      userWeight: json['userWeight'],
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
