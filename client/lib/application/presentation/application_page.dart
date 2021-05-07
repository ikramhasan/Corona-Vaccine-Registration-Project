import 'package:covid_vaccination/app/presentation/components/loading_widget.dart';
import 'package:covid_vaccination/application/data/cubit/application_cubit.dart';
import 'package:covid_vaccination/application/presentation/components/application_form.dart';
import 'package:covid_vaccination/authentication/presentation/components/authentication_button.dart';
import 'package:covid_vaccination/authentication/presentation/components/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ApplicationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<ApplicationCubit>().getApplication(1);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 244, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            Spacer(),
            BlocConsumer<ApplicationCubit, ApplicationState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is ApplicationLoading) {
                  return LoadingWidget();
                }

                if (state is ApplicationEmpty) {
                  return Row(
                    children: [
                      Lottie.asset(
                        'assets/lottie/corona_doctor.json',
                        height: 512,
                        width: 642,
                      ),
                      const Spacer(),
                      ApplicationForm(),
                    ],
                  );
                }

                if (state is ApplicationLoaded) {
                  return Text(state.application.toString());
                }

                return Center(
                  child: TextButton(
                    child: Text('press'),
                    onPressed: () {},
                  ),
                );
              },
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
