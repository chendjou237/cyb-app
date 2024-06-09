import 'package:hive_flutter/hive_flutter.dart';

bool isFirstRun(){
  var box = Hive.box('settings');
 final result =  box.get('first_run', defaultValue: false) as bool;
 if (result == false){
   box.put('isFirstRun', true);
   return false;
 }
  return true;

}