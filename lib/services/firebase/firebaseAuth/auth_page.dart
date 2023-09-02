import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rentals_app/src/features/home/view/home_page.dart';
import 'package:rentals_app/src/features/login/view/login_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, AsyncSnapshot snapshot) {
            // is the user logged in
            if (snapshot.hasData) {
              //Update the graphqlClient to contain a valid token.
              //Get the current user from the Insatance.
              return const HomePage();
            }

            //is the user not logged inr
            else {
              return const LoginScreen();
            }
          }),
    );
  }
}
