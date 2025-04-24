part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final Email email;
  final Username username;
  final Password password;
  final FormStatus formStatus;
  final bool isValid;

  const RegisterFormState( {
    this.formStatus = FormStatus.invalid,
    this.email = const Email.pure(),
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.isValid = false
  });

  RegisterFormState copyWith({
    Email? email,
    Username? username,
    Password? password,
    FormStatus? formStatus,
    bool? isValid
  }) {
    return RegisterFormState(
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
      isValid: isValid ?? this.isValid
    );
  }


  @override
  List<Object> get props => [email, username, password, formStatus, isValid];
}

