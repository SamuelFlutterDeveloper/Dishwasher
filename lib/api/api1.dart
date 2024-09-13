import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as htpp;

class Api1 extends StatefulWidget {
  const Api1({super.key});

  @override
  State<Api1> createState() => _Api1State();
}

class _Api1State extends State<Api1> {
  // Future<UserCredential> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;

  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );

  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final url =
      "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyA7V4aAEuzuM_JGJdChBKkAUhj00ToLV3Y";

  //signup
  Future<void> SignUp() async {
    final email = _email.text;
    final pass = _password;
    print(email);

    final res = await htpp.post(Uri.parse(url),
        body: jsonEncode({
          'email': email,
          'password': pass,
          'returnSecureToken': true,
        }));
    print(res.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 180,
          ),
          const Text(
            'Sign in',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _email,
              decoration: const InputDecoration(labelText: 'email'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _password,
              decoration: const InputDecoration(labelText: 'password'),
              obscureText: true,
            ),
          ),
          ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.black)),
            onPressed: SignUp,
            child: const Text(
              'submit',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 43,
            width: 370,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 233, 17, 1)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.google,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Sign with Google',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
