import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation')),
      body: const Center(child: AnimationWrapper()),
    );
  }
}
class AnimationWrapper extends StatefulWidget {
  const AnimationWrapper({super.key});
  @override
  State<AnimationWrapper> createState() => _AnimationWrapperState();
}
class _AnimationWrapperState extends State<AnimationWrapper>
with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _rotateAnimation;
  late final Animation<double> _translateAnimation;
  @override
  void initState(){
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3),);
    _rotateAnimation = Tween<double>(begin: 0.0, end: 2 * pi).animate(_animationController);
    _translateAnimation = Tween<double>(begin: 200.0, end: -200.0).animate(_animationController);
    _animationController.addStatusListener((status){
      if (status == AnimationStatus.completed) {_animationController.reverse();} else if (status == AnimationStatus.dismissed) {_animationController.forward();}
    });
    _animationController.forward();
  }
  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: _animationController, builder: (context, child){
      final rotateMatrix = Matrix4.identity()
      ..rotateZ(_rotateAnimation.value);
      final translateMatrix = Matrix4.identity()
      ..translate(0.0, _translateAnimation.value, 0.0);
      final combineMatrix = translateMatrix * rotateMatrix;
      return Transform(alignment: Alignment.center, transform: combineMatrix, child: child,);
    },
    child: const Text('Flutter Animation', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),);
  }
}