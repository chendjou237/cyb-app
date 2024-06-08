import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ripple_wave/ripple_wave.dart';
import 'package:test1/utils/logger.dart';
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
 List<String> messages = [
  'Scanning device...',
  'analysing all device folders',
  'scanning for threats',
  'detecting threats',
  'removing threats',
  'scan complete',
 ];

String currentMessage = 'Launch scan';

                int counter = 0;



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
            GestureDetector(
              onTap: () {
                setState(() {
                  _controller.repeat();
                Timer.periodic(const Duration(seconds: 1), (timer) {
                    if(timer.tick >= 14){
                    logI(timer.tick);
                  _controller.reset();
                  currentMessage = 'Launch scan';
  successToast('Scan Complete ✅');
                  timer.cancel();
                    }
                    counter++;
                              currentMessage = messages[counter];
                 });
                });
  context.go('/result');
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
                          messages[counter],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
              ),
            ),
                  const SizedBox(height: 20),
                  const Text('Scan to detect threats', style: TextStyle(fontSize: 16),)
                ],
              ),
      ),
          
        
      
    );
  }
}