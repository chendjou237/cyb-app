import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test1/utils/toast.dart';

class UpdateView extends StatelessWidget {
const UpdateView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
                SizedBox(
                     
                      child: Lottie.asset(
                          'assets/animations/update.json',
                          height: 300,
                          width: 300,
                          fit: BoxFit.fill)),
            const SizedBox(height: 32,),
            const Text('Update your app to the latest version', style: TextStyle(fontSize: 16),),
            const SizedBox(height: 8,),
            
            
            
            ElevatedButton(onPressed: (){
              infoToast('Soon available');
            }, child: const Text('Update Now'),)
          ],
        ),),
    );
  }
}