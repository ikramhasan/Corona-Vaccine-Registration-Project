import 'dart:convert';

import 'package:covid_vaccination/core/constants/constants.dart';
import 'package:covid_vaccination/core/errors/custom_exception.dart';
import 'package:covid_vaccination/dose/data/models/dose.dart';
import 'package:covid_vaccination/dose/data/models/dose_entity.dart';
import 'package:http/http.dart' as http;

class DoseRepository {
  getDoseForUser(int userId) async {
    Uri uri = Uri.parse('$BASE_URL/doses/$userId');

    try {
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
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

  createDose(DoseEntity dose) async {
    Uri uri = Uri.parse('$BASE_URL/doses');

    try {
      var response = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json; charset=utf-8",
        },
        body: jsonEncode(dose.toJson()),
      );

      var data = jsonDecode(response.body);

      if (data['status'] == 'fail') {
        throw CustomException('Error creating application!');
      } else {
        throw CustomException('Recheck all the fields');
      }
    } catch (e) {
      throw CustomException('Server Error!');
    }
  }
}
