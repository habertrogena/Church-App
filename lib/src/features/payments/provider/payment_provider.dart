//

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentals_app/src/features/payments/controllers/payments_controller.dart';

// connect with thw controller
final paymentNotifierProvider = Provider<PaymentController>(
  (ref) => PaymentController(),
);
// not neccesary.
final amountSet = FutureProvider((ref) {
  return ref.watch(paymentNotifierProvider);
});

final phoneNumberSet = FutureProvider((ref) {
  return ref.watch(paymentNotifierProvider);
});
