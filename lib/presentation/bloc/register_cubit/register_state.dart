part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final String email;
  final String username;
  final String password;
  final FormStatus formStatus;

  const RegisterFormState({
    this.formStatus = FormStatus.invalid,
    this.email = '',
    this.username = '',
    this.password = '',
  });

  RegisterFormState copyWith({
    String? email,
    String? username,
    String? password,
    FormStatus? formStatus,
  }) {
    return RegisterFormState(
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }


  @override
  List<Object> get props => [email, username, password, formStatus];
}

