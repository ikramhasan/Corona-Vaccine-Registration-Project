// To parse this JSON data, do
//
//     final admin = adminFromJson(jsonString);

import 'dart:convert';

Admin adminFromJson(String str) => Admin.fromJson(json.decode(str));

String adminToJson(Admin data) => json.encode(data.toJson());

class Admin {
  Admin({
    this.adminId,
    this.name,
    this.email,
    this.password,
  });

  int adminId;
  String name;
  String email;
  String password;

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        adminId: json["admin_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "admin_id": adminId,
        "name": name,
        "email": email,
        "password": password,
      };

  @override
  String toString() {
    return 'Admin(admin_id: $adminId, name: $name, email: $email, password: $password)';
  }
}
