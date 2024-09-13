import 'dart:async';

import 'package:dish_washer/pages/login.dart';
import 'package:flutter/material.dart';
// import 'package:test2/pages/home.dart';
// import 'package:test2/pages/login.dart';
// import 'package:test2/pages/user.dart';

// import 'package:test1/pages/home_page.dart';
// import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage())),
      //  Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) =>HomePage()))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/splash.jpg"),
                    fit: BoxFit.cover,
                  ),
                  // backgroundColor: Color.fromARGB(255, 67, 64, 251),
                  // body: Container(
                  //   height: double.infinity,
                  //   width: double.infinity,
                  //   alignment: Alignment.center,
                  //   child: Text(
                  //     "New App",
                  //     style: GoogleFonts.pacifico(
                  //       fontSize: 42,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                ))));
  }
}
