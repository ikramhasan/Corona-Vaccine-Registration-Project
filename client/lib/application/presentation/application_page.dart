import 'package:covid_vaccination/application/data/repository/application_repository.dart';
import 'package:covid_vaccination/authentication/presentation/components/header.dart';
import 'package:flutter/material.dart';

class ApplicationPage extends StatelessWidget {
  ApplicationRepository repository = ApplicationRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 244, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            Center(
              child: TextButton(
                child: Text('press'),
                onPressed: () {
                  repository.getApplicationById(4);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
