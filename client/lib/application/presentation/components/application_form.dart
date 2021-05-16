import 'package:covid_vaccination/application/data/cubit/application_cubit.dart';
import 'package:covid_vaccination/application/data/models/application.dart';
import 'package:covid_vaccination/authentication/data/cubit/user_auth_cubit.dart';
import 'package:covid_vaccination/authentication/presentation/components/authentication_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationForm extends StatefulWidget {
  @override
  _ApplicationFormState createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  String center = 'Select Vaccination Center';

  @override
  Widget build(BuildContext context) {
    final userState = context.select((UserAuthCubit cubit) => cubit.state);
    return Container(
      //height: isLogin ? 500 : 600,
      height: 400,
      width: 642,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          Text(
            'Center',
            style: TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.bold,
              height: 1.1,
              letterSpacing: -2.5,
            ),
          ),
          const Spacer(),
          DropdownButton<String>(
            hint: Text(center),
            isExpanded: true,
            items: <String>[
              'Banasree',
              'Mirpur',
              'Dhanmondi',
              'Gulshan',
            ].map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                center = value;
              });
            },
          ),
          const Spacer(),
          AuthenticationButton(
            text: 'Select',
            onTap: () {
              if (userState is UserAuthLoaded) {
                ApplicationEntity application = ApplicationEntity(
                  userId: userState.user.userId,
                  submissionDate: DateTime.now(),
                  vaccinationCenter: center,
                  adminComment: '',
                );

                context.read<ApplicationCubit>().createApplication(application);
                // context
                //     .read<ApplicationCubit>()
                //     .getApplication(userState.user.userId);
              }
            },
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
