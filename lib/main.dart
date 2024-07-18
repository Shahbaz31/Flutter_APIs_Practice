import 'package:apis/ServerUploadImage.dart';
import 'package:apis/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:apis/exampletwo.dart';
import 'package:apis/examplethree.dart';
import 'package:apis/examplefour.dart';
import 'package:apis/Examplefive_Last.dart';
import 'package:apis/signup UI.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UploadImage(),
    );
  }
}
