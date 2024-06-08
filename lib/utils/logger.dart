import 'package:logger/logger.dart';

logE(Object message){
  var logger = Logger();

logger.e(message);
}

logI(Object message){
  var logger = Logger();
  logger.i(message);
}

logD(Object message){
  var logger = Logger();
  logger.d(message);
}

logW(Object message){
  var logger = Logger();
  logger.w(message);
}