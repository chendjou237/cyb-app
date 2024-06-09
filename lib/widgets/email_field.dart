import 'package:flutter/material.dart';
import 'package:test1/controllers/login/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) => TextFormField(
        key: const Key('loginForm_usernameInput_textField'),

        decoration: const InputDecoration(
          labelText: 'email',
        ),
        validator: (value) {
      /*     if (value == null || value.isEmpty) {
            return 'Please enter your username';
          } */
          return null; // No error
        },
      onChanged: (value) => context.read<LoginBloc>().add(LoginEmailChanged( value)),
        // onSaved: (value) => _username = value!, // Save username
      ),
    );
  }
}
