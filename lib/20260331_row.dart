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
        title: const Text("BTS!!"),titleTextStyle: TextStyle(
          fontSize: 30,
          color: Color(0xFF4D12AD),
                             
        ), 
               
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        color: const Color.fromARGB(255, 149, 207, 41),
        height: 300.0,
        width: 300.0,
             

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
             
              child: const Text(
                "SWIM",
                style: TextStyle(
                  fontSize:20,
                  color: Color.fromARGB(255, 199, 10, 216),
                  backgroundColor: Colors.blue,  
                                  
                ),
              ),
            ),Expanded(
              
              child: const Text(
                "Hooligan",
                style: TextStyle(
                  fontSize:20,
                  color: Color.fromARGB(255, 199, 10, 216),
                  backgroundColor: Colors.blue,  
                                  
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Image.asset('assets/images/images.jpg'),
              ),              
            ),
            Expanded(
             
             child: Container(
                child: const Text(
                "FYA",
                style: TextStyle(
                  fontSize:20,
                  color: Color.fromARGB(255, 199, 10, 216),  
                  backgroundColor: Colors.yellow,                
                ),
              ),
             ),
              
            ),
          ],
        ),

      )
    );
  }
}