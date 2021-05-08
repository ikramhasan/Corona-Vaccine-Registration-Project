import 'package:covid_vaccination/app/presentation/components/loading_widget.dart';
import 'package:covid_vaccination/application/data/models/application.dart';
import 'package:covid_vaccination/authentication/data/models/user.dart';
import 'package:covid_vaccination/authentication/presentation/components/header.dart';
import 'package:covid_vaccination/dose/data/repository/dose_repository.dart';
import 'package:covid_vaccination/dose/presentation/dose_form.dart';
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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 244, vertical: 60),
        // padding:
        //     EdgeInsets.symmetric(horizontal: size.width * 0, vertical: 5.55),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildApplicationForm(),
                DoseForm(),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  buildApplicationForm() {
    final defaultTextStyle = TextStyle(
      fontSize: 18,
    );

    return Card(
      child: Container(
        height: 740,
        width: 600,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 34),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildFormHeader(),
              SizedBox(height: 32),
              Text(
                'Application For',
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(height: 5),
              Text(
                'Ikramul Hasan',
                style: defaultTextStyle,
              ),
              Text(
                'Banasree, Dhaka',
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(height: 32),
              Text(
                'Personal Identification',
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(height: 16),
              Text(
                'NID',
                style: TextStyle(color: Colors.grey[600]),
              ),
              Text(
                'XXXXXXXXX',
                style: defaultTextStyle,
              ),
              SizedBox(height: 5),
              Text(
                'Email',
                style: TextStyle(color: Colors.grey[600]),
              ),
              Text(
                'ikramhasan.dev@gmail.com',
                style: defaultTextStyle,
              ),
              SizedBox(height: 5),
              Text(
                'Phone no',
                style: TextStyle(color: Colors.grey[600]),
              ),
              Text(
                '01867967951',
                style: defaultTextStyle,
              ),
              SizedBox(height: 5),
              Text(
                'Age',
                style: TextStyle(color: Colors.grey[600]),
              ),
              Text(
                '22',
                style: defaultTextStyle,
              ),
              SizedBox(height: 5),
              Text(
                'Occupation',
                style: TextStyle(color: Colors.grey[600]),
              ),
              Text(
                'Student',
                style: defaultTextStyle,
              ),
              SizedBox(height: 16),
              buildIssuedRow(),
              SizedBox(height: 32),
              Text(
                'Administrator Comment',
                style: TextStyle(color: Colors.grey[600]),
              ),
              Text(
                'comment',
                style: defaultTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildIssuedRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Issued On',
              style: TextStyle(color: Colors.grey[600]),
            ),
            Text('7th May, 2021'),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Issued for',
              style: TextStyle(color: Colors.grey[600]),
            ),
            Text('Banasree Vaccination Centre'),
          ],
        ),
      ],
    );
  }

  buildFormHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '#',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  '1',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                  ),
                ),
              ],
            ),
            Text(
              'APPLICATION NO',
              style: TextStyle(
                color: Colors.grey[600],
                letterSpacing: 0.5,
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Let\'s fight corona,'),
            Text('Together'),
            Image.asset(
              'assets/png/underline.png',
              width: 120,
            ),
          ],
        ),
      ],
    );
  }
}
