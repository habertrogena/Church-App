import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentals_app/src/constants/colors.dart';
import 'package:rentals_app/src/features/payments/controllers/payments_controller.dart';
import 'package:rentals_app/src/features/payments/provider/payment_provider.dart';
import 'package:rentals_app/src/reusable_components/modal_sheet/modal_sheet.dart';

class PaymentScreen extends ConsumerStatefulWidget {
  const PaymentScreen({super.key});

  @override
  ConsumerState<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {
  @override
  void initState() {
    super.initState();
    // ref can be used in all life cycles of a stateful widget.
    ref.read(paymentNotifierProvider);
  }
  // add the providers

  // add the text editing controllers.
  final _phoneNumberController = TextEditingController();
  final _amountController = TextEditingController();

  //Get the payment controller
  final PaymentController paymentController = PaymentController();
  // modal sheet .
  ModalSheet modalSheet = ModalSheet();

  @override
  Widget build(BuildContext context) {
    //add the providers.
    final amount = ref.watch(paymentNotifierProvider).updateAmount;
    final phoneNumber = ref.watch(paymentNotifierProvider).updatePhoneNumber;
    return SafeArea(
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(children: [
              const SizedBox(
                child: Center(
                  child: Text(
                    'Make Payments',
                    style: TextStyle(
                        backgroundColor: tPrimaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: tWhiteColor),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _phoneNumberController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  ref.read(paymentNotifierProvider).updatePhoneNumber(value);
                },
                validator: (value) {},
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  ref.read(paymentNotifierProvider).updateAmount;
                },
                inputFormatters: [],
                controller: _amountController,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: tSecondaryColor),
                onPressed: () {
                  print('hello word');
                  // _makePayment();
                  // on click should take the amount from the amount textfield and show a modal bottomsheet.
                  // modalSheet.bottomSheet(
                  //   context,
                  //   (builder) => const PaymentMethodScreen(),
                  // );
                },
                child: const Text('Proceed to payment'),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void _makePayment() async {
    final String phoneNumber = _phoneNumberController.text;
    final String amount = _amountController.text;
    // perform validation on imput data
    // add payment api endpoint
    paymentController.makePayment({
      "phoneNo": phoneNumber,
      "amount": double.parse(amount) * 100,
    });
  }
}
