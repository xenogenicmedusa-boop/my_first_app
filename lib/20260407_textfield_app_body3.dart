import 'package:flutter/material.dart';

class AppBody extends StatefulWidget {
  const AppBody({super.key});
  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  final ValueNotifier<String> _inputName = ValueNotifier<String>("");
  final TextEditingController _namecontroller = 
  TextEditingController();

 
  @override
  void dispose() {
    _inputName.dispose();
    _namecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 200.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0),

            child: TextField(
              controller: _namecontroller,
              style: const TextStyle(
                fontSize: 20.0, color: Color.fromARGB(255, 7, 10, 185)),
                decoration: const InputDecoration(
                  labelText: "Type your name",
                  labelStyle: TextStyle(fontSize: 20.0, color: Colors.deepPurple),
                ),
            ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: ElevatedButton(
              child: const Text("Enter"),
              onPressed: () {
                setState(() {
                  _inputName.value = _namecontroller.text;
                });
              },
            ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: ValueListenableBuilder<String>(
                valueListenable: _inputName,
                builder: _inputNameWidgetBuilder,
              ),
            ),
        ],
      ),
    );
     }
      Widget _inputNameWidgetBuilder(
      BuildContext context,
      String inputName,
      Widget? child,
    ){
      return Text(inputName, style: const TextStyle(fontSize: 20.0, color: Colors.brown),);
    }
}