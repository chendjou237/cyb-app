import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class GenerateKeyView extends StatelessWidget {
const GenerateKeyView({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Key'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
             SizedBox(
                  
                      child: Lottie.asset(
                          'assets/animations/key.json',
                         height: 300,
                          width: 300,
                          fit: BoxFit.fill)),
            const SizedBox(height: 32,),
            const Text('Generate your key to access the app', style: TextStyle(fontSize: 16),),
                        const SizedBox(height: 8,),

            ElevatedButton(onPressed: (){
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  String generatedKey = generateRandomKey();
                  return AlertDialog(
                    title: const Text('Generated Key'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(generatedKey),
                        ElevatedButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: generatedKey));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Key copied to clipboard')),
                            );
                          },
                          child: const Text('Copy to Clipboard'),
                        ),
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
              child: const Text('Generate Key'),
            ),
          ],
      ),
    ));
  }
  
  String generateRandomKey() {

    const String chars = '0123456789abcdefghijklmnopqrstuvwxyz';
    final Random rnd = Random.secure();
    final key = List.generate(16, (index) => chars[rnd.nextInt(chars.length)]).join();
    return key;
  }
}