// amount error handling
import 'package:formz/formz.dart';
import 'package:rentals_app/services/validation/form_validation.dart';

enum AmountValidationError {
  empty,
  invalid,
  ;

  String getMessage() {
    switch (this) {
      case empty:
        return 'amount  can\'t be empty';

      case invalid:
        return 'Amount must be a number';
    }
  }
}

class AmountFormz extends FormzInput<String, AmountValidationError> {
  const AmountFormz.pure() : super.pure('');
  // call super.dirty to represent a modified form input.
  const AmountFormz.dirty(String value) : super.dirty(value);

  @override
  AmountValidationError? validator(String value) {
    if (!NonEmptyStringValidator().isValid(value)) {
      return AmountValidationError.empty;
    }

    if (!PasswordSubmitRegexValidator().isValid(value)) {
      return AmountValidationError.invalid;
    }

    return null;
  }
}
