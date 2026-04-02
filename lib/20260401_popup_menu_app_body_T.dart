import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppBody extends StatelessWidget {
  const AppBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 2.0,
      child: PopupMenuButton(
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        offset: const Offset(100, 30),
        onSelected: (value) => _showSnackBar(context, "你選擇了第 $value 項"),
        onOpened: () => _showSnackBar(context, "你取消了選擇"),
        itemBuilder: (context) => <PopupMenuEntry<int>>[
          const PopupMenuItem<int>(
            value: 1,
            child: Text("第一項", style: TextStyle(fontSize: 20.0)),
          ),
          const PopupMenuDivider(),
          const PopupMenuItem<int>(
            value: 2,
            child: Text("第二項", style: TextStyle(fontSize: 20.0)),
          ),
          const PopupMenuDivider(),
          const PopupMenuItem<int>(
            value: 3,
            child: Text("第三項", style: TextStyle(fontSize: 20.0)),
          ),
          const PopupMenuDivider(),
          const PopupMenuItem<int>(
            value: 3,
            child: Text("第四項", style: TextStyle(fontSize: 20.0)),
          ),
          const PopupMenuDivider(),
          const PopupMenuItem<int>(
            value: 3,
            child: Text("第五項", style: TextStyle(fontSize: 20.0)),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
      backgroundColor: const Color.fromARGB(255, 36, 136, 89),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      action: SnackBarAction(
        label: "按我Toast",
        textColor: Colors.white,
        onPressed: _showToast,
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void _showToast() {
    Fluttertoast.showToast(
      msg: "你按了SnackBar",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: const Color.fromARGB(162, 112, 30, 243),
      textColor: Colors.white,
      fontSize: 20.0,
    );
  }
}