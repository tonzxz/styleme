import 'package:flutter/material.dart';
import 'package:styleme_thesis/styles.dart';
import 'package:styleme_thesis/pages/home.dart';
import 'package:styleme_thesis/pages/mode.dart';
import 'package:styleme_thesis/pages/camera.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [
                gradient1Color,
                gradient2Color,
              ],
            ),
          ),
          child: MyHome(),
        ),
      ),
    );
  }
}
