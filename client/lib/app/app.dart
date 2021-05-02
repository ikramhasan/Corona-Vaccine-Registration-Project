import 'package:covid_vaccination/authentication/presentation/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid Vaccination',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Color(0xFF0078E7),
        canvasColor: Color(0xFFEEEEEE),
        disabledColor: Color(0xFF8F909A),
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: LandingPage(),
    );
  }
}
