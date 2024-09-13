import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
//import 'home.dart';
import 'home.dart'; // Ensure the correct import path

class Otp extends StatefulWidget {
  final String phone;
  final String countryCode;

  const Otp({super.key, required this.countryCode, required this.phone});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 60,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Colors.black,
    ),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.purple.shade200),
      boxShadow: const [
        BoxShadow(
          color: Color(0xffd9d9d9),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3),
        ),
      ],
    ),
  );

  bool isPinComplete = false;
  String pin = "";

  String formatPhoneNumber(String phone, String countryCode) {
    if (phone.length < 3) {
      return '$countryCode $phone';
    }
    String maskedNumber =
        '*' * (phone.length - 2) + phone.substring(phone.length - 2);
    return '$countryCode $maskedNumber';
  }

  @override
  Widget build(BuildContext context) {
    String formattedPhoneNumber =
        formatPhoneNumber(widget.phone, widget.countryCode);

    return Scaffold(
      backgroundColor: Colors.white,
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
                  'Quick * Affordable * Trusted',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                const Text(
                  'Verification Code',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 80, 79, 79),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  'Please type the verification code \n sent to $formattedPhoneNumber',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, color: Colors.grey.shade700),
                ),
                const SizedBox(
                  height: 18,
                ),
                Pinput(
                  length: 4,
                  obscureText: true,
                  obscuringCharacter: '*',
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(
                          color: const Color.fromARGB(255, 65, 19, 87)),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      pin = value;
                      isPinComplete = value.length == 4;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: isPinComplete
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Home()),
                          );
                        }
                      : null,
                  child: Container(
                    height: 47,
                    width: 350,
                    decoration: BoxDecoration(
                      color: isPinComplete
                          ? Colors.purple.shade900
                          : Colors.grey.shade400,
                    ),
                    child: const Center(
                      child: Text(
                        'Verify',
                        style: TextStyle(fontSize: 19, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
