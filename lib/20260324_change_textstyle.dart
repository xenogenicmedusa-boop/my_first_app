import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "MY_FIRST_APP",
      home: const myHomePage(),
    );
  }
}

class myHomePage extends StatelessWidget {
  const myHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 228, 210),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 131, 224, 184),
        title: const Text("Hello Scaffold!!",
        style: TextStyle(color: Color.fromARGB(168, 53, 7, 128),
        fontWeight: FontWeight.w500),),
      ),
      body: const Center(
        child: Text("StatelessWidget", 
        style: TextStyle(
          fontSize: 30,
          decoration: TextDecoration.underline,
          fontWeight: FontWeight(900),
          color: Color.fromARGB(206, 235, 9, 178)),
          textAlign: TextAlign.left,
          maxLines: 1,
          ),
    ),
    );
  }
}