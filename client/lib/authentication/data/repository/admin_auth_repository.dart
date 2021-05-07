import 'dart:convert';
import 'package:covid_vaccination/authentication/data/models/admin.dart';
import 'package:covid_vaccination/core/constants/constants.dart';
import 'package:covid_vaccination/core/errors/custom_exception.dart';
import 'package:http/http.dart' as http;

class AdminAuthRepository {
  registerAdmin(Admin admin) async {
    Uri uri = Uri.parse('$BASE_URL/admins');

    try {
      var response = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json; charset=utf-8",
        },
        body: jsonEncode(admin.toJson()),
      );

      var data = jsonDecode(response.body);
      if (data['message'] == 'admin has been added succesfully') {
        print('Admin created successfully');
      } else {
        throw CustomException('Error creating admin!');
      }
    } catch (e) {
      throw CustomException('Server Error!');
    }
  }

  loginAdmin(String email, String password) async {
    Uri uri = Uri.parse('$BASE_URL/admins?email=$email&password=$password');

    try {
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data.isNotEmpty) {
          print(data[0]);
          Admin admin = Admin.fromJson(data[0]);
          print(admin);
          return admin;
        } else {
          throw CustomException('No admin found. Double check your spelling!');
        }
      }
    } catch (e) {
      throw CustomException('Server Error!');
    }
  }
}
