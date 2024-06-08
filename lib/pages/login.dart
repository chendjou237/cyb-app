import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:test1/controllers/login/login_bloc.dart';
import 'package:test1/repositories/auth_repo.dart';
import 'package:test1/utils/toast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
/*   final _formKey = GlobalKey<FormState>(); // Key for form validation
  final String _username = '';
  String _password = '';
 */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocProvider(
        create: (context) => LoginBloc(authenticationRepository: AuthenticationRepository()),
      
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
               if (state.status.isFailure) {
                 errorToast('Authentication Failed successfully');
               }
              if(state.status.isSuccess){
                successToast('authentication failed to failed');
                context.go('/');
              }
            
              // TODO: implement listener
            },
            child: 
              
            

             const LoginForm(),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EmailField(),
        SizedBox(height: 16.0), // Add spacing between fields
        PasswordField(),
        SizedBox(height: 24.0), // Add spacing before button
        SubmitButton(),
      ],
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
  });

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
                            context.read<LoginBloc>().add(const LoginSubmitted());
                          }
                        : (){
                          warningToast('Please enter valid email and password');
                        },
          child:  Text(state.status.isInProgress ? 'Loading...' :'Login'),
        );
      }
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) => TextFormField(
        key: const Key('loginForm_emailInput_textField'),

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
