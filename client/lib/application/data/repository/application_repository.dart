import 'dart:convert';

import 'package:covid_vaccination/application/data/models/application.dart';
import 'package:covid_vaccination/core/constants/constants.dart';
import 'package:covid_vaccination/core/errors/custom_exception.dart';
import 'package:http/http.dart' as http;

class ApplicationRepository {
  getApplicationById(int id) async {
    Uri uri = Uri.parse('$BASE_URL/applications/$id');

    try {
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data.isNotEmpty) {
          Application application = Application.fromJson(data['data']);
          return application;
        } else {
          throw CustomException('No application found. Please try again!');
        }
      }
    } catch (e) {
      throw CustomException('Server Error!');
    }
  }
}
