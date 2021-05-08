import 'package:covid_vaccination/app/presentation/user_home_page.dart';
import 'package:covid_vaccination/application/data/cubit/application_cubit.dart';
import 'package:covid_vaccination/application/presentation/application_page.dart';
import 'package:covid_vaccination/authentication/data/cubit/admin_auth_cubit.dart';
import 'package:covid_vaccination/authentication/data/cubit/user_auth_cubit.dart';
import 'package:covid_vaccination/authentication/presentation/landing_page.dart';
import 'package:covid_vaccination/dose/data/cubit/dose_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserAuthCubit>(
          create: (context) => UserAuthCubit(),
        ),
        BlocProvider<AdminAuthCubit>(
          create: (context) => AdminAuthCubit(),
        ),
        BlocProvider<ApplicationCubit>(
          create: (context) => ApplicationCubit(),
        ),
        BlocProvider<DoseCubit>(
          create: (context) => DoseCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Covid Vaccination',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Color(0xFF0078E7),
          canvasColor: Color(0xFFEEEEEE),
          disabledColor: Color(0xFF8F909A),
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        home: UserHomePage(),
      ),
    );
  }
}
