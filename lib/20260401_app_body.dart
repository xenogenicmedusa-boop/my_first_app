import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppBody extends StatelessWidget {
  const AppBody({super.key});

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

  void showSnackBar(BuildContext context){
    final snackBar = SnackBar(content: const Text("ARMY"),
    duration: const Duration(seconds: 3),
    backgroundColor: Colors.greenAccent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    action: SnackBarAction(label: "ARIRANG", textColor: Colors.deepOrange, onPressed: showToast,
    ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.all(30.0),
          child: ElevatedButton(
            onPressed: () => showSnackBar(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellowAccent,
              foregroundColor: Colors.redAccent, elevation: 10.0,
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0,), 
            ), 
            child: const Text("ARMY", style: TextStyle(
              fontSize: 20.0,
              color: Colors.red,
            ),
            ),
            ),
        );
    
  }
}