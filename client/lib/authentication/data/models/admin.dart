import 'dart:convert';

class Admin {
  final int adminId;
  final String name;
  final String email;
  final String password;

  Admin({
    this.adminId,
    this.name,
    this.email,
    this.password,
  });

  Admin copyWith({
    int adminId,
    String name,
    String email,
    String password,
  }) {
    return Admin(
      adminId: adminId ?? this.adminId,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'admin_id': adminId,
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory Admin.fromMap(Map<String, dynamic> map) {
    return Admin(
      adminId: map['admin_id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Admin.fromJson(String source) => Admin.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Admin &&
        other.adminId == adminId &&
        other.name == name &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return adminId.hashCode ^
        name.hashCode ^
        email.hashCode ^
        password.hashCode;
  }

  @override
  String toString() {
    return 'Admin(admin_id: $adminId, name: $name, email: $email, password: $password)';
  }
}
