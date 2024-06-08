// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:test1/utils/toast.dart';

class ResultView extends StatelessWidget {
const ResultView({ super.key });

  @override
  Widget build(BuildContext context){
  final random = Random().nextInt(100);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Result'),
      ),
      body: SizedBox(
        width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 128,
                width: 128,
                child: Lottie.asset('assets/animations/error_animation.json', height: 128, width: 128, fit: BoxFit.fill)),
              const SizedBox(height: 16),
              Text('$random error detected', style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.redAccent),),
              const SizedBox(height: 32),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ResultButton(onTap: (){
        warningToast('lol not yet implemented');
      },color: Colors.green, title: 'Clear Treat'),
            const SizedBox(width: 16),
                  ResultButton(onTap: (){
        warningToast('lol not yet implemented');
      },color: Colors.amber, title: 'Quarantine'),
                ],
              )

            ],
          ),
      ),
    );
  }
}

class ResultButton extends StatelessWidget {
  final Color color;
  final String title;
  final void Function() onTap;
  const ResultButton({
    super.key,
    required this.color,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child:  Text(title, style: TextStyle(color: Colors.white))
      ),
    );
  }
}
