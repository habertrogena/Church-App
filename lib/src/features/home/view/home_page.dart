import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentals_app/src/features/default_home/view/default_home_screen.dart';
import 'package:rentals_app/src/features/dashboard/screens/dashboard_screen.dart';

import '../../../constants/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          padding: const EdgeInsets.all(8.0),
          color: textColor,
          onPressed: () {
            Get.to(
              const DefaultHome(),
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 24,
          ),
        ),
        leadingWidth: 20,
        title: const Text('My-Caretaker',
            style: TextStyle(
                color: textColor, fontSize: 24.0, fontWeight: FontWeight.bold)),
        backgroundColor: tWhiteColor,
      ),
      body: const Dashboard(),
    );
  }
}
