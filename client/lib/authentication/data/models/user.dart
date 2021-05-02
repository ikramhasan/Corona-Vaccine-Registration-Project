// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.userId,
    this.name,
    this.email,
    this.password,
    this.phoneNo,
    this.nid,
    this.age,
    this.location,
    this.occupation,
  });

  int userId;
  String name;
  String email;
  String password;
  int phoneNo;
  String nid;
  int age;
  String location;
  String occupation;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        phoneNo: json["phone_no"],
        nid: json["nid"],
        age: json["age"],
        location: json["location"],
        occupation: json["occupation"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "email": email,
        "password": password,
        "phone_no": phoneNo,
        "nid": nid,
        "age": age,
        "location": location,
        "occupation": occupation,
      };

  @override
  String toString() =>
      'User(name: $name, email: $email, password: $password, age: $age, phone: $phoneNo, location: $location, occupation: $occupation, nid: $nid)';
}
