import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ripple_wave/ripple_wave.dart';
import 'package:test1/controllers/scan/cubit/scan_cubit.dart';
import 'package:test1/utils/toast.dart';


class ScanView extends StatefulWidget {
const ScanView({ super.key });

  @override
  State<ScanView> createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView> with SingleTickerProviderStateMixin{
@override
void initState() {
  super.initState();
  _controller = AnimationController(  duration: const Duration(seconds: 3), vsync: this);
}
 late AnimationController _controller ;




  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Full system scan of your device'),
      ),
      body:  SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocConsumer<ScanCubit, ScanState>(
              listener: (context, state) {
                // TODO: implement listener
                if(state is ScanInProgress){
                  _controller.repeat();
                }
                if (state is ScanComplete) {
                  successToast('scan completed successfully');
                  context.go('/result');
                }
                
              },
              builder: (context, state) {
                return  GestureDetector(
                onTap: () {
                  context.read<ScanCubit>().startScan();
                },
                child: RippleWave(
                  childTween: Tween(begin: 0.01, end: 1.0),
              color: Colors.blueAccent,
              repeat: false,
              animationController: _controller,
                  child:  CircleAvatar(
                          backgroundColor: Colors.blueAccent,
                          radius: 100,
                          child: Text(
                             state is ScanInProgress ? state.message : 'Launch scan',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                ),
              );
        }),
                  const SizedBox(height: 20),
                  const Text('Scan to detect threats', style: TextStyle(fontSize: 16),)
                ],
              ),
      ),
          
        
      
    );
  }

  void _handleStartScan(BuildContext context) {
     setState(() {
      _controller.repeat();
    Timer.periodic(const Duration(seconds: 14), (timer) {
      timer.cancel();
      _controller.reset();
      successToast('Scan Complete ✅');
      context.go('/result');
        
     });
    });
  }
}