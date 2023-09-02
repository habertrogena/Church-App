import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  //TextField controller to get data from TextFields

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();

  // call this function from the design and it will do the rest
  void registerUser(String email, String password) {
    // AuthenticationRepository.instance
    //     .createUserWithEmailAndPassword(email, password);
  }
}
