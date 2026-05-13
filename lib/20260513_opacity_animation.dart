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
  final ValueNotifier<double> _opacity = ValueNotifier(1.0);
  @override
  void dispose() {
    _opacity.dispose();
    super.dispose();  }
  void _changeOpacity() {
    _opacity.value = 0.0;  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Animation')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder<double>(
              valueListenable: _opacity,
              builder: (context, opacity, child) {
                return AnimatedOpacity(
                  opacity: opacity,
                  duration: const Duration(seconds: 1),
                  onEnd: () {
                    if (_opacity.value == 0.0) {
                      _opacity.value = 1.0;                    }                  },
                  child: const Text(
                    'Flutter Animation',
                    style: TextStyle(fontSize: 30),                  ),                );              },            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeOpacity,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20,),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),                ),              ),
              child: const Text('Opacity',style: TextStyle(fontSize: 18, color: Colors.white),              ),            ),          ],        ),      ),    );  }}
