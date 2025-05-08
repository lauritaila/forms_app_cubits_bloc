import 'package:formz/formz.dart';

enum PasswordInputError { empty, length }

class Password extends FormzInput<String, PasswordInputError> {
  // Call super.pure to represent an unmodified form input.
  const Password.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Password.dirty(super.value) : super.dirty();

    String? get errorMessage {
    if(isValid || isPure) return null;

    if (displayError == PasswordInputError.empty) return 'Username is required';
    if (displayError == PasswordInputError.length) return 'Username must be at least 6 characters long';

    return null;
  }

  @override
  PasswordInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PasswordInputError.empty;
    if (value.length < 6) return PasswordInputError.length;
    
    return null;
  }
}