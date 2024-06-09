import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:test1/controllers/login/login_bloc.dart';
import 'package:test1/utils/toast.dart';


class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required SubmitType this.type,
  });

  final SubmitType type;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
          ),
                          key: const Key('loginForm_continue_raisedButton'),
        
          onPressed: state.isValid
                        ? () {
                            context.read<LoginBloc>().add( LoginSubmitted(type));
                          }
                        : (){
                          warningToast('Please enter valid email and password');
                        },
          child:  Text(state.status.isInProgress ? 'Loading...' :type == SubmitType.login ?'Login': 'Sign Up'),
        );
      }
    );
  }
}


