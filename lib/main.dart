import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test1/config/observers/bloc_observer.dart';
import 'package:test1/config/router.dart';
import 'package:test1/controllers/auth/auth_cubit.dart';
import 'package:test1/controllers/scan/cubit/scan_cubit.dart';
import 'package:test1/repositories/auth_repo.dart';

import 'firebase_options.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
await Hive.initFlutter();
 await Hive.openBox('settings', );
  Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
         BlocProvider(create: (context) => AuthCubit(AuthenticationRepository())),
         BlocProvider(create: (context) => ScanCubit()..getScanHistory()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Hf-Secure',
        routerConfig: router,
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
         ),
    );
  }
}

