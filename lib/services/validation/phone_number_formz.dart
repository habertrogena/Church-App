// create an enum to represent the errors
import 'package:formz/formz.dart';
import 'package:rentals_app/services/validation/form_validation.dart';

enum PhoneNumberValidationError {
  empty,
  tooShort,
  invalid,
  ;

  String getMessage() {
    switch (this) {
      case empty:
        return 'phone number can\'t be empty';
      case tooShort:
        return 'phone number is too short';
      case invalid:
        return 'Must contain 10 digits';
    }
  }
}

// create a class that extends formz
class PhoneNumberFormz extends FormzInput<String, PhoneNumberValidationError> {
  const PhoneNumberFormz.pure() : super.pure('');
  // call super.dirty to represent a modified form input.
  const PhoneNumberFormz.dirty(String value) : super.dirty(value);

  @override
  PhoneNumberValidationError? validator(String value) {
    if (!NonEmptyStringValidator().isValid(value)) {
      return PhoneNumberValidationError.empty;
    }

    if (!MinLengthStringValidator(4).isValid(value)) {
      return PhoneNumberValidationError.tooShort;
    }

    if (!PasswordSubmitRegexValidator().isValid(value)) {
      return PhoneNumberValidationError.invalid;
    }

    return null;
  }
}
