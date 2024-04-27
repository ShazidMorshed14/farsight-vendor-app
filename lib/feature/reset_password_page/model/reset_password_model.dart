import 'dart:convert';

ResetPasswordModel resetPasswordModelFromJson(String str) =>
    ResetPasswordModel.fromJson(json.decode(str));

String resetPasswordModelToJson(ResetPasswordModel data) =>
    json.encode(data.toJson());

class ResetPasswordModel {
  String password;
  String confirmPassword;

  ResetPasswordModel({
    required this.password,
    required this.confirmPassword,
  });

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) =>
      ResetPasswordModel(
        password: json["password"],
        confirmPassword: json["confirmPassword"],
      );

  Map<String, dynamic> toJson() => {
        "password": password,
        "confirmPassword": confirmPassword,
      };
}
