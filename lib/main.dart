import 'package:animation/views/screens/homepage.dart';
import 'package:animation/views/screens/implicitanimation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
     debugShowCheckedModeBanner: false,
     routes: {
       "/":(context) => HomePage(),
       "implicit":(context) => ImplicitAnimationPage(),
     },
  ));
}
