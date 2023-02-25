import 'package:animation/models/globals.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Planets"),
          backgroundColor: Colors.black,
          elevation: 1,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          // color: Colors.white,
          decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://i.pinimg.com/originals/9b/03/98/9b039807ebb43f0e7efd2aea15f9b110.gif"),fit: BoxFit.fill)),
          child: SingleChildScrollView(
            child: Column(children: [
              ...galaxy
                  .map((e) => Container(
                        margin: EdgeInsets.all(5),
                        height: 200,
                        decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                blurStyle: BlurStyle.inner,
                                offset: Offset(0, 1), blurRadius: 2,
                                spreadRadius: 2,
                                 color: Colors.transparent
                              )
                            ],
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey, width: 3)),
                        width: double.infinity,
                        child: Row(children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "implicit",arguments: e);
                            },
                            child: Hero(
                              tag: e["tag"],
                              child: Container(
                                  height: 200,
                                  width: 200,
                                  child: Image.asset(e["image"])),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Text(
                            e["name"],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ]),
                      ))
                  .toList(),
            ]),
          ),
        ));
  }
}
