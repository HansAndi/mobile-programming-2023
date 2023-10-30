import 'package:flutter/material.dart';
import 'package:uts/SplashScreen.dart';
import 'constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          fillColor: const Color(0xFFFBFBFB),
          filled: true,
          border: defaultOutlineInputBorder,
          enabledBorder: defaultOutlineInputBorder,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFF2994A)),
          ),
        ),
      ),
      // initialRoute: "/",
      // routes: {
      //   "/": (context) => const SplashScreen(),
      //   "/login": (context) => const LoginScreen(),
      // },
      home: const SplashScreen(),
    );
  }
}
