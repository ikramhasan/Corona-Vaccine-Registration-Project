import 'dart:convert';

import 'package:covid_vaccination/authentication/data/models/user.dart';
import 'package:covid_vaccination/core/constants/constants.dart';
import 'package:covid_vaccination/core/errors/custom_exception.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  registerUser(User user) async {
    print(user.toJson());
    Uri uri = Uri.parse('$BASE_URL/users');

    try {
      var response = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json; charset=utf-8",
        },
        body: jsonEncode(user.toJson()),
      );

      var data = jsonDecode(response.body);
      if (data['message'] == 'User has been added succesfully') {
        print('User created successfully');
      } else {
        throw CustomException('Error creating user!');
      }
    } catch (e) {
      throw CustomException('Server Error!');
    }
  }

  loginUser(String email, String password) async {
    Uri uri = Uri.parse('$BASE_URL/users?email=$email&password=$password');

    try {
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data.isNotEmpty) {
          User user = User.fromJson(data[0]);
          return user;
        } else {
          throw CustomException('No user found. Double check your spelling!');
        }
      }
    } catch (e) {
      throw CustomException('Server Error!');
    }
  }
}
