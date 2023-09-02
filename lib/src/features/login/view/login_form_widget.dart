import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rentals_app/src/features/forgotpassword/view/show_modal_bottom_sheet.dart';
import 'package:rentals_app/src/features/login/controller/login_controller.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../../../constants/text_string.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final LoginController loginController = LoginController();

  ///Sign In the user
  void signUserIn() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await loginController.signInUser(
          emailController.text, passwordController.text);
      if (context.mounted) Navigator.of(context).pop();
    } on FirebaseException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      //WRONG EMAIL
      if (e.code == 'user-not-found') {
        // show error to user
        wrongEmailMassage();
      }
      // WRONG PASSWORD

      else if (e.code == 'wrong-password') {
        // show error to the user
        wrongpasswordMassage();
      }
    }
    // try sign in
  }

  // wrong email massange
  void wrongEmailMassage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title:
                Text('The email you have entered is incorrect or doesnt exist'),
          );
        });
  }

  // wrong passsword massange
  void wrongpasswordMassage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Incorrect password'),
          );
        });
  }

  // password
  //boolean value to track password view enable disable.
  bool passenabled = true;

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(LoginController());
    final formKey = GlobalKey<FormState>();
    return Form(
      // key: controller.loginFormKey,
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: emailController,
              onSaved: (value) {
                //  controller.email = value!;
              },
              validator: (value) {
                return null;

                // return controller.validateEmail(value!);
              },
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.mail),
                labelText: tEmail,
                hintText: tEmailHint,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: tFormHeight,
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              controller: passwordController,
              onSaved: (value) {
                // controller.password = value!;
              },
              validator: (value) {
                return null;

                // return controller.validatePassword(value!);
              },
              obscureText: passenabled,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.vpn_key),
                labelText: tPassword,
                hintText: tPassword,
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() => {passenabled = !passenabled});
                  },
                  icon: Icon(
                      passenabled ? Icons.visibility : Icons.visibility_off),
                ),
              ),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            // --FORGET PASSWORD BTN
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ForgotPasswordScreen.ShowModalBottomSheet(context);
                },
                child: const Text(
                  tForgetPassword,
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //--LOGIN BUTTON
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: tPrimaryColor,
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                signUserIn();
              },
              child: const Text(
                'Login',
              ),
            ),

            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
