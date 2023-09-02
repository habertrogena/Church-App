// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:rentals_app/src/constants/colors.dart';
import 'package:rentals_app/src/features/chat/view/electrictity_screen.dart';
import 'package:rentals_app/src/features/chat/view/plumbing_screen.dart';
import 'package:rentals_app/src/reusable_components/button/selection_button.dart';
import 'package:rentals_app/src/reusable_components/modal_sheet/modal_sheet.dart';

import 'manager_support_screen.dart';
import 'other_tickets_screen.dart';

class SelectionPage extends StatelessWidget {
  const SelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    ModalSheet modalSheet = ModalSheet();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tPrimaryColor,
        centerTitle: true,
        title: const Text(
          'Select ticket type',
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 200,
              ),
              SelectionButton(
                  backgroundColor: tPrimaryColor,
                  icon: const Icon(Icons.power_input_outlined),
                  textColor: tWhiteColor,
                  textLabel: 'Electicity',
                  onpressed: () {
                    modalSheet.bottomSheet(
                      context,
                      (context) {
                        return const ElectricityScreen();
                      },
                    );
                  }),
              const SizedBox(
                height: 20,
              ),
              SelectionButton(
                  backgroundColor: tPrimaryColor,
                  icon: const Icon(Icons.power_input_outlined),
                  textColor: tWhiteColor,
                  textLabel: 'Manager Support',
                  onpressed: () {
                    modalSheet.bottomSheet(
                      context,
                      (context) {
                        return const ManagerSupportScreen();
                      },
                    );
                  }),
              const SizedBox(
                height: 20,
              ),
              SelectionButton(
                backgroundColor: tPrimaryColor,
                icon: const Icon(Icons.power_input_outlined),
                textColor: tWhiteColor,
                textLabel: 'plumbing',
                onpressed: () {
                  modalSheet.bottomSheet(
                    context,
                    (context) {
                      return const PlumbingScreen();
                    },
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              SelectionButton(
                backgroundColor: tPrimaryColor,
                icon: const Icon(Icons.power_input_outlined),
                textColor: tWhiteColor,
                textLabel: 'Other',
                onpressed: () {
                  modalSheet.bottomSheet(
                    context,
                    (context) {
                      return const OtherTicketsScreen();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // reusable bottom sheet method.
  // Future<dynamic> bottomSheet(
  //     BuildContext context, Widget Function(BuildContext builder) builder) {
  //   return showModalBottomSheet(
  //       context: context,
  //       shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(16),
  //           topRight: Radius.circular(16),
  //         ),
  //       ),
  //       isScrollControlled: true,
  //       constraints: BoxConstraints.tight(
  //         Size(MediaQuery.of(context).size.width,
  //             MediaQuery.of(context).size.height * .9),
  //       ),
  //       builder: builder);
  // }
}
