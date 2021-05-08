import 'dart:convert';

import 'package:covid_vaccination/core/constants/constants.dart';
import 'package:covid_vaccination/core/errors/custom_exception.dart';
import 'package:covid_vaccination/dose/data/models/dose.dart';
import 'package:http/http.dart' as http;

class DoseRepository {
  getDoseForUser(int userId) async {
    Uri uri = Uri.parse('$BASE_URL/doses/$userId');

    try {
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        if (data.isNotEmpty) {
          Dose dose = Dose.fromJson(data);
          return dose;
        } else {
          throw CustomException('Could not get dose!');
        }
      }
    } catch (e) {
      throw CustomException('Server Error!');
    }
  }
}
