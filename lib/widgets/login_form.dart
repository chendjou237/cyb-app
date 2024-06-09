
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test1/controllers/login/login_bloc.dart';
import 'package:test1/widgets/widgets.dart';

class AuthForm extends StatelessWidget {
   final SubmitType type;

  const AuthForm({
    super.key, required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const EmailField(),
        const SizedBox(height: 16.0), // Add spacing between fields
        const PasswordField(),
        const SizedBox(height: 24.0), // Add spacing before button
        SubmitButton(type:type,),
        const SizedBox(height: 16.0), // Add spacing before button
        TextButton(onPressed: (){
          context.go(type == SubmitType.login ? '/signup' : '/login');
        }, child: Text(type == SubmitType.login ? 'Sign Up' : 'Login'))
      ],
    );
  }
}
