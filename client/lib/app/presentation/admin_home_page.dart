import 'package:covid_vaccination/application/data/repository/application_repository.dart';
import 'package:covid_vaccination/authentication/data/cubit/admin_auth_cubit.dart';
import 'package:covid_vaccination/authentication/data/models/admin.dart';
import 'package:covid_vaccination/authentication/presentation/components/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminHomePage extends StatelessWidget {
  final Admin admin;

  const AdminHomePage(this.admin);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 244, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            SizedBox(height: 32),
            buildListHeader(),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  buildListHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Applications',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'List of all applications',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('Change Status'),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(100, 60),
          ),
        ),
      ],
    );
  }
}
