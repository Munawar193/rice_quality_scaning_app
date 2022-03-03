import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rice_quality_scaning_app/screens/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/signUp-page', (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimeColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            margin: const EdgeInsets.only(bottom: 15),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splash.png'),
              ),
            ),
          ),
          Text(
            'RICE',
            style: GoogleFonts.poppins(
                fontSize: 40,
                fontWeight: FontWeight.w800,
                letterSpacing: 10,
                color: kWhiteColor),
          ),
          Text(
            'Quality Scanning',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: kWhiteColor,
            ),
          ),
        ],
      )),
    );
  }
}
