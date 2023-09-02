import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rentals_app/services/graphql/schema/payment_schema.dart';
import 'package:rentals_app/services/validation/amount_formz.dart';
import 'package:rentals_app/services/validation/phone_number_formz.dart';
import 'package:rentals_app/src/features/payments/model/payments_model.dart';
import 'package:rentals_app/src/features/payments/view/mpesa/payment_state.dart';

import '../../../../services/graphql/graphql.dart';

// connecting the controller with the payment_state class for validation
class PaymentController extends StateNotifier<PaymentState> {
  PaymentController() : super(const PaymentState());
  void updatePhoneNumber(String value) {
    final phoneNumber = PhoneNumberFormz.dirty(value);
    state = state.copyWith(phoneNumberFormz: phoneNumber);
  }

  // amount validation
  void updateAmount(String value) {
    final amount = AmountFormz.dirty(value);
    state = state.copyWith(amountFormz: amount);
  }

  final paymentNotifierProvider =
      StateNotifierProvider<PaymentController, PaymentState>(
    (ref) => PaymentController(),
  );

  final paymentMethod = "Mpesa";

  PaymentSchema paymentSchema = PaymentSchema();
  GraphqlConfiguration graphQlConfig = GraphqlConfiguration();

  Future<String> makePayment(Map<String, Object?> payment) async {
    GraphQLClient client = graphQlConfig.clientToQuery();
    print({
      "phoneNo": payment['phoneNo'],
      "amount": payment['amount'],
    });
    QueryResult result = await client.mutate(
      MutationOptions(
          document: gql(
            paymentSchema.pushSdk(),
          ),
          variables: {
            "mpesaPayment": {
              "phoneNo": payment['phoneNo'],
              "amount": payment['amount'],
            }
          }),
    );
    //Check for errors
    if (result.hasException) {
      throw Exception(result.exception);
    }

    final res = result.data!['pushSdk'][0];
    print(res);
    //No errors
    return '';
  }

  Future<List<PaymentModel>> getPayments() async {
    return [];
  }
}
