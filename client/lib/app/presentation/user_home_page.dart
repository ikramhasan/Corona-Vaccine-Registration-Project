import 'package:covid_vaccination/app/presentation/components/loading_widget.dart';
import 'package:covid_vaccination/application/data/models/application.dart';
import 'package:covid_vaccination/authentication/data/models/user.dart';
import 'package:covid_vaccination/authentication/presentation/components/header.dart';
import 'package:flutter/material.dart';

class UserHomePage extends StatelessWidget {
  // final User user;
  // final Application application;

  // const UserHomePage(
  //   this.user,
  //   this.application,
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 244, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            const Spacer(),
            Card(
              child: Container(
                height: 800,
                width: 600,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
