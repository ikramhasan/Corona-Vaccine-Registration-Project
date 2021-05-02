import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BackButton(
          color: Theme.of(context).accentColor,
        ),
        const SizedBox(width: 32),
        Text(
          'Covid Vaccine Registration',
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
