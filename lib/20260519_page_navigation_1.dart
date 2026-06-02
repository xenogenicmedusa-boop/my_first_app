import 'package:flutter/material.dart';
import 'package:my_first_app/20260519_page_navigation_2.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Page Navigation Demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage());
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  void _openSecondPage(BuildContext context){
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => const SecondPage()),);
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Change Page')),
      body: Center(
        child: Padding(padding: const EdgeInsets.all(30),
        child: ElevatedButton(onPressed: () => _openSecondPage(context), child: const Text('Open Second Page', style: TextStyle(fontSize: 18)),),),
      ),
    );
  }
}
