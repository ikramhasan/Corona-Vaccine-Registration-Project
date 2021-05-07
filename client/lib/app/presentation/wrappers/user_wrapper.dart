import 'package:covid_vaccination/app/presentation/components/loading_widget.dart';
import 'package:covid_vaccination/app/presentation/user_home_page.dart';
import 'package:covid_vaccination/application/data/cubit/application_cubit.dart';
import 'package:covid_vaccination/authentication/data/cubit/user_auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userState = context.read<UserAuthCubit>().state;
    final applicationState = context.read<ApplicationCubit>().state;

    if (userState is UserAuthLoaded && applicationState is ApplicationLoaded) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => UserHomePage(
            // userState.user,
            // applicationState.application,
          ),
        ),
        (route) => false,
      );
    }
    return LoadingWidget();
  }
}
