import 'package:flutter/material.dart';
import 'package:my_first_app/20260407_dropdown_button_menu_app_body.dart';
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
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 218, 235, 173),
        title: const Text("BTS!!"),titleTextStyle: TextStyle(
          fontSize: 30,
          color: Color(0xFF4D12AD),
                             
        ), 
               
      ),
      body: const AppBody(
        ),    
             );
           }
           }