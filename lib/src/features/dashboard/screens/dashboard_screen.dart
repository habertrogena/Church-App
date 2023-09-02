import 'package:flutter/material.dart';
import 'package:rentals_app/src/constants/colors.dart';
import 'package:rentals_app/src/features/chat/view/chat_screen.dart';
import 'package:rentals_app/src/features/default_home/view/default_home_screen.dart';
import 'package:rentals_app/src/features/payments/view/payment_screen.dart';
import 'package:rentals_app/src/features/statement/view/statement_screen.dart';
import 'package:rentals_app/src/features/userprofile/view/user_profile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // create a variable to enable selection of the tabs.
  int index = 2;
  final screens = [
    const Statement(),
    const PaymentScreen(),
    const DefaultHome(),
    const ChatScreen(),
    const UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // acces the screens
        body: screens[index],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: tPrimaryColor,
            labelTextStyle: MaterialStateProperty.all(
              const TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w400, color: textColor),
            ),
          ),
          child: NavigationBar(
            height: 60,
            backgroundColor: tWhiteColor,
            selectedIndex: index,
            //set state to enable hovering between tabs
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.mail_outline_outlined), label: 'Statement'),
              NavigationDestination(
                  icon: Icon(Icons.payment_rounded), label: 'Payment'),
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.airplane_ticket_rounded), label: ' Chats'),
              NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
