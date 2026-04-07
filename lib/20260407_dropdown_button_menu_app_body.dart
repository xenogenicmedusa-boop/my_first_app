import 'package:flutter/material.dart';

class AppBody extends StatelessWidget {
  const AppBody({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Center(
      heightFactor: 2.0,
      child: _DropdownWidget());
  }
}

class _DropdownWidget extends StatefulWidget {
  const _DropdownWidget();

  @override 
  State<_DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends
State<_DropdownWidget> {
  int? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      hint: const Text(
        "Select an option" ,
        style:TextStyle(fontSize: 20, color: Colors.pink, fontWeight: FontWeight(900))
        ),

        value: selectedValue,

        items: const <DropdownMenuItem<int>>[
          DropdownMenuItem<int>(
          value: 1,
          child: Text(
            "RM",
            style: TextStyle(fontSize: 20, color: Colors.blue) ),
          ),

          DropdownMenuItem<int>(
          value: 2,
          child: Text(
            "Jin",
            style: TextStyle(fontSize: 20, color: Colors.brown)),
          ),

          DropdownMenuItem<int>(
          value: 3,
          child: Text(
            "SUGA",
            style: TextStyle(fontSize: 20, color: Colors.cyan)),
          ),

          DropdownMenuItem<int>(
          value: 4,
          child: Text(
            "j-hope",
            style: TextStyle(fontSize: 20, color: Colors.deepOrange)),
          ),

          DropdownMenuItem<int>(
          value: 5,
          child: Text(
            "Jimin",
            style: TextStyle(fontSize: 20, color: Colors.green)),
          ),

          DropdownMenuItem<int>(
          value: 6,
          child: Text(
            "V",
            style: TextStyle(fontSize: 20, color: Colors.deepPurple)),
          ),

          DropdownMenuItem<int>(
          value: 7,
          child: Text(
            "Jung Kook",
            style: TextStyle(fontSize: 20, color: Colors.indigo)),
          ),

        ],

        onChanged: (int? value) {
          setState(() {
            selectedValue = value;
          });
        },
      );
  }
}