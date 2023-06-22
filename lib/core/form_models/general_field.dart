import 'package:formz/formz.dart';

enum GeneralFieldValidationError { empty }

class GeneralField extends FormzInput<String, GeneralFieldValidationError> {
  const GeneralField.pure() : super.pure('');
  const GeneralField.dirty([String value = '']) : super.dirty(value);

  @override
  GeneralFieldValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : GeneralFieldValidationError.empty;
  }
}
