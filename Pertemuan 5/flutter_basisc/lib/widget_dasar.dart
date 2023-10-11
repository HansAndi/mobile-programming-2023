import 'package:flutter/material.dart';

class BasicWidget extends StatelessWidget {
  
  const BasicWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Basic Widget'),
        ),
        body: Center(
          child: Image.asset('assets/images/899807.png'),
          // child: Text('Hello World'),
        ),
      ),
    );
  }
}