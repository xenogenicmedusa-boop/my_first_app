import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),    );  }}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();}

class _MyHomePageState extends State<MyHomePage> {
  final ValueNotifier<bool> _showText = ValueNotifier(true);
  @override
  void dispose() {
    _showText.dispose();
    super.dispose();  }
  void _toggleView() {
    _showText.value = !_showText.value;  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Animation')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder<bool>(
              valueListenable: _showText,
              builder: (context, showText, child) {
                return AnimatedCrossFade(
                  duration: const Duration(seconds: 1),
                  crossFadeState: showText ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                  firstChild: Container(width: 300,height: 120,alignment: Alignment.center,
                  child: const Text('Flutter Animation',style: TextStyle(fontSize: 30),),),
                  secondChild: SizedBox(width: 300,height: 120,child: const Icon(Icons.mood, size: 100,color: Colors.orange,),),);  },   ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _toggleView,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30,),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),                ),              ),
              child: const Text('Toggle',style: TextStyle(fontSize: 18, color: Colors.white),              ),            ),          ],        ),      ),    );  }}
