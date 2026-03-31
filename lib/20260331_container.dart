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
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 218, 235, 173),
        title: const Text("Arirang!!"),titleTextStyle: TextStyle(
          fontSize: 20,
          color: Color(0xFF4D12AD),
          backgroundColor: Color.fromARGB(255, 236, 200, 200),                    
        ),        
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          color: Colors.cyan,
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(10.0),
          
          child: const Text(
            "BTS\nSWIM",
            style: TextStyle(
              fontSize: 50,
              color: Color.fromARGB(255, 212, 148, 8),
              decoration: TextDecoration.underline,
              fontWeight: FontWeight(500),
            ),
            textAlign: TextAlign.center,  
                    
          ),
        )
      ),
    );
  }
}