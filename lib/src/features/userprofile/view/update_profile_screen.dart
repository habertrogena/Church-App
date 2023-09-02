import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentals_app/src/constants/sizes.dart';
import 'package:rentals_app/src/constants/text_string.dart';

import '../../../constants/colors.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: tWhiteColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          tEditProfile,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  return null;
                },
                decoration: InputDecoration(
                  label: const Text(tFullName),
                  prefixIcon: const Icon(Icons.person_outline_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  iconColor: tSecondaryColor,
                  labelStyle: const TextStyle(color: tSecondaryColor),
                ),
              ),
              const SizedBox(
                height: tFormHeight - 10,
              ),
              TextFormField(
                validator: (value) {
                  return null;
                },
                decoration: InputDecoration(
                  label: const Text(tPhone),
                  prefixIcon: const Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  iconColor: tSecondaryColor,
                  labelStyle: const TextStyle(color: tSecondaryColor),
                ),
              ),
              const SizedBox(
                height: tFormHeight - 10,
              ),
              TextFormField(
                validator: (value) {
                  return null;
                },
                decoration: InputDecoration(
                  label: const Text(tPassword),
                  prefixIcon: const Icon(Icons.fingerprint),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  iconColor: tSecondaryColor,
                  labelStyle: const TextStyle(color: tSecondaryColor),
                ),
              ),
              const SizedBox(
                height: tFormHeight - 5,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // send the updated details to the server.
                    print('hello world');
                  },
                  child: Text(tUpdate.toUpperCase()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
