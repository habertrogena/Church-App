import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';
import 'login_form_widget.dart';
import 'login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Image(
                  image: AssetImage('assets/images/login.png'),
                ),
                const SizedBox(
                  height: 40,
                ),
                LoginHeaderWiget(size: size),
                const LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
