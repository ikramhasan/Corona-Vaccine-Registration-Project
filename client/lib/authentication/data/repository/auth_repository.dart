import 'package:covid_vaccination/authentication/data/models/user.dart';
import 'package:covid_vaccination/core/constants/constants.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  Future<void> registerUser(User user) async {
    Uri uri = Uri.parse('$BASE_URL/users');

    var response = await http.post(uri, body: user.toJson());

    if (response.statusCode == 200) {
      print('Created new user successfully');
    }
  }

  Future<void> loginUser(String email, String password) async {
    Uri uri = Uri.parse('$BASE_URL/user?email=$email&password=$password');

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      print('Created new user successfully');
      print(response.body);
    }
  }
}
