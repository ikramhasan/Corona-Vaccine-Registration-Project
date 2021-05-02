import 'package:covid_vaccination/authentication/data/cubit/user_auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserAuthCubit, UserAuthState>(
      builder: (context, state) {
        if (state is UserAuthLoaded) {
          return Center(
            child: Text(
              state.user.toString(),
            ),
          );
        }
        return Container();
      },
    );
  }
}
