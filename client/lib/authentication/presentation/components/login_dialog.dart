import 'package:covid_vaccination/authentication/presentation/landing_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showLoginDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Signup Successful',
            style: TextStyle(
              color: Colors.greenAccent,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),
          Text('Please login to continue'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => LandingPage(),
                ),
                (route) => false);
          },
          child: Text('Close'),
        ),
      ],
    ),
  );
}
