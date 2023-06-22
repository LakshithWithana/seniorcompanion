import 'package:formz/formz.dart';

enum DateFieldValidationError { empty }

class DateField extends FormzInput<String, DateFieldValidationError> {
  const DateField.pure() : super.pure('');
  const DateField.dirty([String value = '']) : super.dirty(value);

  @override
  DateFieldValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : DateFieldValidationError.empty;
  }
}
