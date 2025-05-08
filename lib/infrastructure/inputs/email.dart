import 'package:formz/formz.dart';

enum EmailInputError { empty, format }

class Email extends FormzInput<String, EmailInputError> {
  static final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  const Email.pure() : super.pure('');

  const Email.dirty(super.value) : super.dirty();


  String? get errorMessage {
    if(isValid || isPure) return null;

    if (displayError == EmailInputError.empty) return 'Email is required';
    if (displayError == EmailInputError.format) return 'Invalid email';

    return null;
  }

  @override
  EmailInputError? validator(String value) {

    if (value.isEmpty || value.trim().isEmpty) return EmailInputError.empty;
    if (!emailRegExp.hasMatch(value)) return  EmailInputError.format;
    
    return null;
  }
}