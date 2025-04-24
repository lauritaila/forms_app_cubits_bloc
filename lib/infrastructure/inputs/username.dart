import 'package:formz/formz.dart';

enum UsernameInputError { empty, length }

class Username extends FormzInput<String, UsernameInputError> {
  // Call super.pure to represent an unmodified form input.
  const Username.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Username.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if(isValid || isPure) return null;

    if (displayError == UsernameInputError.empty) return 'Username is required';
    if (displayError == UsernameInputError.length) return 'Username must be at least 6 characters long';

    return null;
  }

  @override
  UsernameInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty)  UsernameInputError.empty;
    if (value.length < 6)  UsernameInputError.length;
    
    return null;
  }
}