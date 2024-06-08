import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test1/controllers/auth/auth_cubit.dart';

class Home extends StatelessWidget {
const Home({required this.child, super.key,  });

_onItemTapped(int index, BuildContext context) {
switch (index) {
  case 0:
    context.go('/');
        break;
  case 1:
    context.go('/update');
        break;
  case 2:
    context.go('/history');
        break;
  case 3:
    context.go('/generate-key');
        break;
  default:
    context.go('/');
}
}

  final Widget child;


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hf-Secure'),
        actions: [
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state){
              if(AuthState.unauthenticated() == state){
                context.go('/login');
              }
            },
            child: IconButton(
              onPressed: (){
                context.read<AuthCubit>().logout();
              },
              icon: const Icon(Icons.logout),
            ),
          ),
        ],
      ),
      body: child,
      bottomNavigationBar: CurvedNavigationBar(
        
    backgroundColor: Colors.blueAccent,
    
    items: const <Widget>[
      Icon(Icons.search, size: 30),
      Icon(Icons.upgrade, size: 30,),
      Icon(Icons.history, size: 30),
      Icon(Icons.vpn_key, size: 30),
    ],
    onTap: (index) {
      _onItemTapped(index, context);
    },
  ),
    );
  }
}