import 'package:covid_vaccination/authentication/presentation/user_login_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'admin_login_page.dart';
import 'components/hover_text_button.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 244, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Covid Vaccine Registration',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                HoverTextButton(
                  text: 'Login',
                  fontSize: 22,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserLoginPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 64),
                HoverTextButton(
                  text: 'Admin panel',
                  fontSize: 22,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminLoginPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                buildLeftPanel(context),
                const Spacer(),
                Lottie.asset(
                  'assets/lottie/prevent_epidemic.json',
                  frameRate: FrameRate(60),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Column buildLeftPanel(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'APPLY FOR VACCINATION',
          style: TextStyle(
            color: Theme.of(context).disabledColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.9,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          'Let’s fight corona,\nTogether!',
          style: TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.bold,
            height: 1.1,
            letterSpacing: -2.5,
          ),
        ),
        Image.asset(
          'assets/png/underline.png',
          filterQuality: FilterQuality.high,
        ),
        const SizedBox(height: 94),
        InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserLoginPage(),
              ),
            );
          },
          child: Ink(
            height: 82,
            width: 342,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 36, vertical: 16),
              child: Center(
                child: Row(
                  children: [
                    Image.asset('assets/png/injection.png'),
                    const SizedBox(width: 32),
                    Text(
                      'APPLY NOW!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        letterSpacing: 1.5,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
