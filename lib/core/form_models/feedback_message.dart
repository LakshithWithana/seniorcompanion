import 'package:formz/formz.dart';

enum FeedbackMessageError { empty }

class FeedbackMessage extends FormzInput<String, FeedbackMessageError> {
  const FeedbackMessage.pure() : super.pure('');
  const FeedbackMessage.dirty([String value = '']) : super.dirty(value);

  @override
  FeedbackMessageError? validator(String? value) {
    return value?.isNotEmpty == true ? null : FeedbackMessageError.empty;
  }
}
