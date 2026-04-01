import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppBody extends StatelessWidget {
  const AppBody({super.key});

  void _showToast(){
    Fluttertoast.showToast(
      msg: "2026 ARIRANG",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: const Color.fromARGB(255, 187, 162, 73),
      textColor: const Color.fromARGB(255, 23, 9, 223),
      fontSize: 50.0,
    );  
  }

  void _showSnackBar(BuildContext context, String message){
    final snackBar = SnackBar(content: Text(message),
    duration: const Duration(seconds: 3),
    backgroundColor: Colors.greenAccent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    action: SnackBarAction(label: "ARIRANG", textColor: Colors.deepOrange, onPressed: _showToast,
    ),
    );
    ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 10.0,
      child: PopupMenuButton<int>(
        color: Colors.blueAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(5.0),),
        offset: const Offset(30, 30), onSelected: (value) => _showSnackBar(context, "曲目$value個按鈕),
        onCanceled: () =>_showSnackBar(context, "取消選擇"),
        itemBuilder: (context) => const [
          PopupMenuItem<int>(value: 1, child: Text("Body to Body", style: TextStyle(fontSize: 30.0)),),
          PopupMenuDivider(),

          PopupMenuItem<int>(value: 2, child: Text("Hooligan", style: TextStyle(fontSize: 30.0)),),
          PopupMenuDivider(),

          PopupMenuItem<int>(value: 3, child: Text("Aliens", style: TextStyle(fontSize: 30.0)),),
          PopupMenuDivider(),

          PopupMenuItem<int>(value: 4, child: Text("FYA", style: TextStyle(fontSize: 30.0)),),
          PopupMenuDivider(),

          PopupMenuItem<int>(value: 5, child: Text("2.0", style: TextStyle(fontSize: 30.0)),),
          PopupMenuDivider(),

          PopupMenuItem<int>(value: 6, child: Text("No. 29", style: TextStyle(fontSize: 30.0)),),
          PopupMenuDivider(),

          PopupMenuItem<int>(value: 7, child: Text("SWIM", style: TextStyle(fontSize: 30.0)),),
          PopupMenuDivider(),

          PopupMenuItem<int>(value: 8, child: Text("Merry Go Round", style: TextStyle(fontSize: 30.0)),),
          PopupMenuDivider(),

          PopupMenuItem<int>(value: 9, child: Text("NORMAL", style: TextStyle(fontSize: 30.0)),),
          PopupMenuDivider(),

          PopupMenuItem<int>(value: 10, child: Text("they don't know 'bout us", style: TextStyle(fontSize: 30.0)),),
          PopupMenuDivider(),

          PopupMenuItem<int>(value: 11, child: Text("One More Night", style: TextStyle(fontSize: 30.0)),),
          PopupMenuDivider(),

          PopupMenuItem<int>(value: 12, child: Text("Please", style: TextStyle(fontSize: 30.0)),),
          PopupMenuDivider(),

          PopupMenuItem<int>(value: 13, child: Text("Into the Sun", style: TextStyle(fontSize: 30.0)),),
          PopupMenuDivider(),
        ],),
           ),
        );
    
  }
}