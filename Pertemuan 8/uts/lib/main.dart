import 'package:flutter/material.dart';
import 'package:uts/SplashScreen.dart';
import 'constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black54,
          selectionColor: Colors.black54,
          selectionHandleColor: Colors.black54,
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: const Color(0xFFFBFBFB),
          filled: true,
          border: defaultOutlineInputBorder,
          enabledBorder: defaultOutlineInputBorder,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          floatingLabelStyle: TextStyle(
            color: Colors.grey[800],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      // initialRoute: "/",
      // routes: {
      //   "/": (context) => const SplashScreen(),
      //   "/login": (context) => const LoginScreen(),
      //   "/register": (context) => const RegisterScreen(),
      // },
      home: const SplashScreen(),
    );
  }
}
