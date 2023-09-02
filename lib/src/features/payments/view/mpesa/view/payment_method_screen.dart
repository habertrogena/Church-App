import 'package:flutter/material.dart';
import 'package:rentals_app/src/constants/colors.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
                // function that will take in the amount and push mpesa sdk to enter the phone numbe to make the payments.
              },
              child: const Text(
                'Mpesa',
                style: TextStyle(
                    color: tWhiteColor,
                    backgroundColor: tPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Mpesa',
                style: TextStyle(
                    color: tWhiteColor,
                    backgroundColor: tPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Mpesa',
                style: TextStyle(
                    color: tWhiteColor,
                    backgroundColor: tPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Mpesa',
                style: TextStyle(
                    color: tWhiteColor,
                    backgroundColor: tPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Mpesa',
                style: TextStyle(
                    color: tWhiteColor,
                    backgroundColor: tPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
