import 'package:covid_vaccination/app/presentation/components/loading_widget.dart';
import 'package:covid_vaccination/application/data/cubit/application_cubit.dart';
import 'package:covid_vaccination/application/presentation/components/application_grid.dart';
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
            BlocBuilder<ApplicationCubit, ApplicationState>(
              builder: (context, state) {
                if (state is ApplicationListLoaded) {
                  return ApplicationGrid(state.applicationList);
                }
                return LoadingWidget();
              },
            ),
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
