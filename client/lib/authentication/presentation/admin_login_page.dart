import 'package:covid_vaccination/authentication/presentation/components/authentication_button.dart';
import 'package:covid_vaccination/authentication/presentation/components/header.dart';
import 'package:covid_vaccination/authentication/presentation/components/hover_text_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AdminLoginPage extends StatefulWidget {
  @override
  _AdminLoginPageState createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 244, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            const Spacer(),
            Row(
              children: [
                Lottie.asset(
                  'assets/lottie/admin_covid.json',
                  height: 512,
                  width: 642,
                ),
                const Spacer(),
                Container(
                  height: isLogin ? 500 : 600,
                  width: 642,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: EdgeInsets.all(16),
                  child: isLogin ? buildLoginColumn() : buildSignupColumn(),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  buildSignupColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        Text(
          'Signup',
          style: TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.bold,
            height: 1.1,
            letterSpacing: -2.5,
          ),
        ),
        const Spacer(),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Name',
            labelStyle: TextStyle(fontSize: 22),
            hintText: 'eg. Ikramul Hasan',
            hintStyle: TextStyle(fontSize: 22),
            prefixIcon: Icon(Icons.person),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        const SizedBox(height: 32),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(fontSize: 22),
            hintText: 'eg. ikramhasan.dev@gmail.com',
            hintStyle: TextStyle(fontSize: 22),
            prefixIcon: Icon(Icons.email),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        const SizedBox(height: 32),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: TextStyle(fontSize: 22),
            hintText: 'eg. 12345678',
            hintStyle: TextStyle(fontSize: 22),
            prefixIcon: Icon(Icons.lock),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        const SizedBox(height: 32),
        AuthenticationButton(
          text: 'Signup',
          onTap: () {},
        ),
        const Spacer(),
        Align(
          alignment: Alignment.center,
          child: HoverTextButton(
            text: 'Already have an account? Login!',
            onTap: () {
              setState(() {
                isLogin = true;
              });
            },
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  buildLoginColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        Text(
          'Login',
          style: TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.bold,
            height: 1.1,
            letterSpacing: -2.5,
          ),
        ),
        const Spacer(),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(fontSize: 22),
            hintText: 'eg. ikramhasan.dev@gmail.com',
            hintStyle: TextStyle(fontSize: 22),
            prefixIcon: Icon(Icons.email),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        const SizedBox(height: 32),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: TextStyle(fontSize: 22),
            hintText: 'eg. 12345678',
            hintStyle: TextStyle(fontSize: 22),
            prefixIcon: Icon(Icons.lock),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        const SizedBox(height: 32),
        AuthenticationButton(
          text: 'LOGIN',
          onTap: () {},
        ),
        const Spacer(),
        Align(
          alignment: Alignment.center,
          child: HoverTextButton(
            text: 'Don\'t have an account? Signup!',
            onTap: () {
              setState(() {
                isLogin = false;
              });
            },
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
