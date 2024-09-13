// import 'package:dish_washer/pages/bottomsheet.dart';
// import 'package:dish_washer/api/api.dart';
// import 'package:dish_washer/api/api1.dart';
// import 'package:dish_washer/pages/bottomsheet.dart';
import 'package:dish_washer/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:dish_washer/pages/splash.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:test2/pages/splash.dart';

// import 'package:test2/pages/user.dart';
// import 'package:test1/pages/login1.dart';
// import 'package:test2/pages/splash.dart';
// import 'package:test1/pages/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
