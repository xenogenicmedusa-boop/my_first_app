// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:my_first_app/20260519_page_navigation_with_animation_2.dart';

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
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Change Page')),
      body: Center(
        child: Padding(padding: const EdgeInsets.all(30),
        child: ElevatedButton(onPressed: () {
          Navigator.push(context, PageRouteBuilder(
            transitionDuration:  const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation){
              return const SecondPage();
            },
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              final offsetAnimation = Tween<Offset>(begin: const Offset(1, 0),
              end: Offset.zero,).animate(animation);
              return SlideTransition(position: offsetAnimation, child: child,);
            },),);
        },
        child: const Text('Open Second Page'),),),),
      );
    }
}
