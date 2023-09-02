import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rentals_app/services/validation/amount_formz.dart';
import 'package:rentals_app/services/validation/phone_number_formz.dart';

part 'payment_state.freezed.dart';

// payment state class
@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState({
    @Default(AmountFormz.pure()) AmountFormz amountFormz,
    @Default(PhoneNumberFormz.pure()) PhoneNumberFormz phoneNumberFormz,
  }) = _PaymentState;
}
