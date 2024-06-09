import 'package:flutter/material.dart';
import 'package:test1/controllers/login/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const Key('loginForm_passwordInput_textField'),
      decoration: const InputDecoration(
        labelText: 'Password',
      ),
      obscureText: true, // Hide password characters
      onChanged: (value) => context.read<LoginBloc>().add(LoginPasswordChanged(value)),
      validator: (value) {
       //  if (value == null || value.isEmpty) {
       //    return 'Please enter your password';
       //  }
        return null; // No error
      },
     //  onSaved: (value) => _password = value!, // Save password
    );
  }
}
