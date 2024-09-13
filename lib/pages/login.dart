import 'package:dish_washer/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'otp.dart'; // Ensure the correct import path

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<UserCredential?> signInWithGoogle() async {
    await GoogleSignIn().signOut();
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>['email']).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user!.displayName);
    print(userCredential.user!.email);
    print(userCredential.user!.metadata);
    Navigator.push(context, MaterialPageRoute(builder: (contaxt) => const Home()));

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  String phoneNumber = ''; // Track phone number input
  String selectedCountryCode = 'IN'; // Default country code (India)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/mobile-bg.jpg'),
                fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Your Home Service Expert',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Quick * Attordable * Trusted',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Color(0xffd9d9d9),
                    //     spreadRadius: 5,
                    //     blurRadius: 7,
                    //     offset: Offset(0, 3),
                    //   ),
                    // ],
                  ),
                  child: SizedBox(
                    width: 350,
                    child: IntlPhoneField(
                      disableLengthCheck: true,
                      initialCountryCode: selectedCountryCode,
                      decoration: InputDecoration(
                        hintText: "Phone Number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            color: Colors
                                .grey.shade300, // Your desired background color
                            borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(
                                    20)), // Add rounded corners on the left
                          ),
                          // child: Row(
                          //   mainAxisSize: MainAxisSize.min,
                          //   children: [
                          //     // Image.asset(
                          //     //   'assets/flags/${selectedCountryCode.toLowerCase()}.png', // Your flag image path
                          //     //   width: 24,
                          //     // ),
                          //     SizedBox(
                          //         width:
                          //             8), // Add spacing between flag and country code
                          //     Text(
                          //       "+$selectedCountryCode", // Display the country code
                          //       style: TextStyle(color: Colors.black),
                          //     ),
                          //   ],
                          // ),
                        ),
                      ),
                      onChanged: (phone) {
                        setState(() {
                          phoneNumber = phone.completeNumber ??
                              ''; // Store the complete number
                          selectedCountryCode = phone.countryCode ??
                              ''; // Update selected country code
                        });
                      },
                    ),
                  ),

                  // child: SizedBox(
                  //   width: 350,
                  //   child: IntlPhoneField(
                  //     disableLengthCheck: true,
                  //     initialCountryCode: selectedCountryCode,
                  //     decoration: InputDecoration(
                  //       hintText: "Phone Number",
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(20)),
                  //     ),
                  //     onChanged: (phone) {
                  //       setState(() {
                  //         phoneNumber = phone.completeNumber ??
                  //             ''; // Store the complete number
                  //         selectedCountryCode = phone.countryCode ??
                  //             ''; // Update selected country code
                  //       });
                  //     },
                  //   ),
                  // ),
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    if (phoneNumber.length == 13) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Otp(
                            countryCode: selectedCountryCode,
                            phone: phoneNumber,
                          ),
                        ),
                      );
                    } else {
                      // Handle action when phone number is not entered correctly
                      print(
                          'Please enter a valid phone number for $selectedCountryCode');
                    }
                  },
                  child: Container(
                    height: 47,
                    width: 350,
                    decoration: BoxDecoration(
                      color: phoneNumber.length == 13
                          ? Colors
                              .purple // Change to purple when full phone number with country code entered
                          : Colors.grey.shade400, // Otherwise, grey color
                    ),
                    child: const Center(
                      child: Text(
                        'Get Verification Code',
                        style: TextStyle(fontSize: 19),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Or',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: signInWithGoogle,
                        child: Container(
                          height: 47,
                          width: 350,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors
                                    .blue), // optional: adds border for better visibility
                            // borderRadius: BorderRadius.circular(8), // optional: adds rounded corners
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/g1.png',
                                height:
                                    24, // adjust height according to your needs
                                width:
                                    24, // adjust width according to your needs
                              ),
                              const SizedBox(
                                  width: 10), // space between image and text
                              const Text(
                                'Login with Google',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
