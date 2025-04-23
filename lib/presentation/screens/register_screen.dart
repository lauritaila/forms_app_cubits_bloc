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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: "Username",
            onChanged: (value) {
              if (value == null) return;
              registerCubit.onUsernameChanged(value);
              _formKey.currentState?.validate();
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Username is required';
              }
              if (value.length < 6) {
                return 'Username must be at least 6 characters';
              }
              if (value.trim().isEmpty) {
                return 'Username must not contain only spaces';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          CustomTextFormField(
            label: "Email",
            onChanged: (value) {
              if (value == null) return;
              registerCubit.onEmailChanged(value);
              _formKey.currentState?.validate();
            },
            validator: (value) {
              final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (value == null || value.isEmpty) {
                return 'Email is required';
              }
              if (value.trim().isEmpty) {
                return 'Email must not contain only spaces';
              }
              if (!emailRegExp.hasMatch(value)) {
                return 'Email is not valid';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          CustomTextFormField(
            label: "Password",
            obscureText: true,
            onChanged: (value) {
              if (value == null) return;
              registerCubit.onPasswordChanged(value);
              _formKey.currentState?.validate();
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              if (value.trim().isEmpty) {
                return 'Password must not contain only spaces';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                registerCubit.onSubmit();
              }
            },
            icon: const Icon(Icons.save_rounded),
            label: const Text("Register"),
          ),
        ],
      ),
    );
  }
}
