import 'dart:convert';

import 'package:covid_vaccination/application/data/models/application.dart';
import 'package:covid_vaccination/application/data/models/application_list.dart';
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
        print(data);
        if (data['data'] != null) {
          ApplicationEntity application = ApplicationEntity.fromJson(data['data']);
          return application;
        } else {
          return null;
        }
      }
    } catch (e) {
      throw CustomException('Server Error!');
    }
  }

  createApplication(ApplicationEntity application) async {
    Uri uri = Uri.parse('$BASE_URL/applications');

    try {
      var response = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json; charset=utf-8",
        },
        body: jsonEncode(application.toJson()),
      );

      var data = jsonDecode(response.body);

      print(data);

      if (data['status'] == 'fail') {
        throw CustomException('Error creating application!');
      } else {
        print('Application created successfully');
      }
    } catch (e) {
      throw CustomException('Server Error!');
    }
  }

  getAllApplications() async {
    Uri uri = Uri.parse('$BASE_URL/applications');

    try {
      var response = await http.get(uri);

      var data = jsonDecode(response.body);

      print(data);

      if (data['status'] == 'fail') {
        throw CustomException('Error getting application!');
      } else {
        final ApplicationList applicationList = ApplicationList.fromJson(data);
        return applicationList;
      }
    } catch (e) {
      throw CustomException('Server Error!');
    }
  }
}
