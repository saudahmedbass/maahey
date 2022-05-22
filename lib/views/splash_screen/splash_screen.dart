import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maahey/views/home_screen/home_screen.dart';
import 'package:maahey/views/signup_screen/sign_up.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    return firebaseUser == null ? Signup() : HomeScreen();
  }
}
