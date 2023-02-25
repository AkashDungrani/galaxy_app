import 'dart:math';

import 'package:flutter/material.dart';

class ImplicitAnimationPage extends StatefulWidget {
  const ImplicitAnimationPage({super.key});

  @override
  State<ImplicitAnimationPage> createState() => _ImplicitAnimationPageState();
}

class _ImplicitAnimationPageState extends State<ImplicitAnimationPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> planet =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(title: Text(planet["name"]),backgroundColor: Colors.black,),
      body: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://media.tenor.com/VuQPPwDkIbsAAAAM/galaxy-space.gif"),fit: BoxFit.fill)),
          child: Column(
        children: [
          Hero(
            tag: planet["tag"],
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 2 * pi),
              duration: Duration(seconds: 100),
              curve: Curves.bounceOut,
              builder: (context, value, child) {
                return Transform.rotate(
                  angle: value,
                  
                  // origin: Offset(20,10),
                  child: Image.asset(
                    planet["image"],
                    height: 400,
                    width: 400,
                  ),
                );
              },
            ),
            
          ),
          SizedBox(height: 20,),
         
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 100, end: 0),
            duration: Duration(seconds: 2),
            curve: Curves.linearToEaseOut,
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(value, 0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black),
                  child: Text(
                  "About ${planet["name"]}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 30,),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: Duration(seconds: 2),
            builder: (context, value, child) {
              return Transform.scale(
                scale: value,
                origin: Offset(50,50),
                child: Text(
                  planet["details"],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              );
            },
          )
        ],
      )),
    );
  }
}
