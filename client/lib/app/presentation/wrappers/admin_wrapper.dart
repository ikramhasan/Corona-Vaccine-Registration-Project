import 'package:covid_vaccination/app/presentation/admin_home_page.dart';
import 'package:covid_vaccination/app/presentation/components/loading_widget.dart';
import 'package:covid_vaccination/application/data/cubit/application_cubit.dart';
import 'package:covid_vaccination/authentication/data/cubit/admin_auth_cubit.dart';
import 'package:covid_vaccination/authentication/presentation/components/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminWrapper extends StatelessWidget {
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
            BlocBuilder<AdminAuthCubit, AdminAuthState>(
              builder: (context, state) {
                if (state is AdminAuthLoaded) {
                  
                  SchedulerBinding.instance.addPostFrameCallback((_) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => AdminHomePage(state.admin),
                      ),
                      (route) => false,
                    );
                  });
                }
                return LoadingWidget();
              },
            ),
          ],
        ),
      ),
    );
  }
}
