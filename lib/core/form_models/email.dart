import 'package:formz/formz.dart';
import 'package:email_validator/email_validator.dart';

enum EmailValidationError { empty, notValid }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([String value = '']) : super.dirty(value);

  @override
  EmailValidationError? validator(String? value) {
    if (value?.isNotEmpty == true) {
      if (EmailValidator.validate(value!) == true) {
        return null;
      } else {
        return EmailValidationError.notValid;
      }
    } else {
      return EmailValidationError.empty;
    }
  }
}
