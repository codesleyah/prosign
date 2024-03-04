import 'package:flutter/material.dart';
import 'package:prosignal/helper/helperfunctions.dart';
import 'package:prosignal/pages/auth/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:prosignal/pages/home.dart';
import 'firebase_options.dart';

void main() async {
  runApp(const MainApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool isloggedin = false;

  @override
  void initState() {
    super.initState();
    isUserLoggedin();
  }

  isUserLoggedin() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          isloggedin = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFEFEFEF),
        ),
        debugShowCheckedModeBanner: false,
        home: isloggedin ? const HomePage() : const Login());
  }
}
