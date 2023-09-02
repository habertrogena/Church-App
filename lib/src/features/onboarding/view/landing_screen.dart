import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentals_app/src/constants/text_string.dart';
import 'package:rentals_app/services/firebase/firebaseAuth/auth_page.dart';

import '../../../constants/colors.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage('assets/images/welcome.jpg'),
            ),
          ),
          Column(
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  tWelcomeTitle,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: textColor),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  tWelcomeSubTitle,
                  style: TextStyle(color: textColor),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: tPrimaryColor,
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                Get.to(
                  const AuthPage(),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    tWelcome.toUpperCase(),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  const Icon(
                    Icons.login,
                    size: 24.0,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
