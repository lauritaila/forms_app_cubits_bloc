import 'package:formz/formz.dart';

enum PasswordInputError { empty, length }

class Password extends FormzInput<String, PasswordInputError> {
  // Call super.pure to represent an unmodified form input.
  const Password.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Password.dirty(super.value) : super.dirty();

  @override
  PasswordInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty)  PasswordInputError.empty;
    if (value.length < 6)  PasswordInputError.length;
    
    return null;
  }
}