import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app_cubits_bloc/presentation/bloc/register_cubit/register_cubit.dart';
import '../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New account")),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              const FlutterLogo(size: 100),
              SizedBox(height: 20),
              _RegisterForm(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;
  

    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: "Username",
            onChanged: (value) {
              if (value == null) return;
              registerCubit.onUsernameChanged(value);
            },
            errorMessage: username.errorMessage
          ),
          SizedBox(height: 10),
          CustomTextFormField(
            label: "Email",
            onChanged: (value) {
              if (value == null) return;
              registerCubit.onEmailChanged(value);
            },
            errorMessage: email.errorMessage
          ),
          SizedBox(height: 10),
          CustomTextFormField(
            label: "Password",
            obscureText: true,
            onChanged: (value) {
              if (value == null) return;
              registerCubit.onPasswordChanged(value);
            },
            errorMessage: password.errorMessage
          ),
          SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () {
                registerCubit.onSubmit();
            },
            icon: const Icon(Icons.save_rounded),
            label: const Text("Register"),
          ),
        ],
      ),
    );
  }
}
