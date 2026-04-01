import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  void showToast(){
    Fluttertoast.showToast(
      msg: "ARIRANG",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: const Color.fromARGB(255, 187, 162, 73),
      textColor: const Color.fromARGB(255, 36, 27, 1),
      fontSize: 20.0,
    );  
  }

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
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: ElevatedButton(
            onPressed: showToast,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlueAccent, elevation: 10.0, 
            ), 
            child: const Text("ARMY", style: TextStyle(
              fontSize: 20.0,
              color: Colors.red,
            ),
            ),
            ),
        ),
        ),
             );
           }
           }