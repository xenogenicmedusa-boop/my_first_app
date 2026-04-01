import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppBody extends StatelessWidget {
  const AppBody({super.key});

  void _showToast(){
    Fluttertoast.showToast(
      msg: "你按了SnackBar",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: const Color.fromARGB(255, 187, 162, 73),
      textColor: const Color.fromARGB(255, 36, 27, 1),
      fontSize: 20.0,
    );  
  }

  void _showSnackBar(BuildContext context, String message){
    final snackBar = SnackBar(content: Text(message),
    duration: const Duration(seconds: 3),
    backgroundColor: Colors.greenAccent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    action: SnackBarAction(label: "Toast", textColor: Colors.deepOrange, onPressed: _showToast,
    ),
    );
    ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: ElevatedButton(
            onPressed: () => _showSnackBar(context, "你按了ElevatedButton"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellowAccent,
              foregroundColor: Colors.redAccent, elevation: 10.0,
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0,), 
            ), 
            child: const Text("第一顆按鈕", style: TextStyle(
              fontSize: 20.0,
              color: Colors.red,
            ),
            ),
            ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextButton(
            onPressed: () => _showSnackBar(context, "你按了TextButton"),
            style: ElevatedButton.styleFrom(              
              foregroundColor: const Color.fromARGB(255, 13, 55, 170), elevation: 10.0,
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0,),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ), 
            child: Text("第二顆按鈕", style: TextStyle(
              fontSize: 20.0,
              color: const Color.fromARGB(255, 28, 37, 2),
            ),
            ),
            ),),

        Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: OutlinedButton(
          onPressed: () => _showSnackBar(context, "你按了OutlinedButton"),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 30.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            side: const BorderSide(
              color: Colors.teal,
              width: 2.0,
              style: BorderStyle.solid,
            ),
          ),
          child: Text("第三顆按鈕", style: TextStyle(fontSize: 20.0, color: Colors.brown,),
          ),
          ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: IconButton(onPressed: () => _showSnackBar(context, "你按了IconButton"), icon: const Icon(Icons.phone_callback),
            iconSize: 40.0, color: Colors.red, padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0,),),
          ),

          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: FloatingActionButton(onPressed: () => _showSnackBar(context, "你按了FloatingActionButton"), 
            shape: const CircleBorder(),
            elevation: 10.0, child: const Icon(Icons.phone_forwarded),),
          ),

          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: ElevatedButton.icon(onPressed: () => _showSnackBar(context, "你按了ElevatedButton.icon"),
            style: ElevatedButton.styleFrom(
              elevation: 10.0,
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0,),
            ), 
            icon: const Icon(Icons.ac_unit_sharp),label: const Text("我是第六顆按鈕", style: TextStyle(fontSize: 20.0, color: Color.fromARGB(255, 27, 21, 1),),),
            ),
          ),
        ],),
           );
        
    
  }
}