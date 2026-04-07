import 'package:flutter/material.dart';

class AppBody extends StatefulWidget {
  const AppBody({super.key});
  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  final TextEditingController _controller = 
  TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 200.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0),

            child: TextField(
              controller: _controller,
              style: const TextStyle(
                fontSize: 20.0, color: Colors.purpleAccent),
                decoration: const InputDecoration(
                  labelText: "Type something",
                  labelStyle: TextStyle(fontSize: 20.0, color: Colors.deepPurple),
                ),
            ),
          ),

          ElevatedButton(
            onPressed: () => _showSnackBar(context, _controller.text),
           child: const Text("Enter"),),
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context, String msg) {
    final snackBar = SnackBar(content: Text(msg.isEmpty ? "Type something" : msg));
    ScaffoldMessenger.of(context)
      ..hideCurrentMaterialBanner()
      ..showSnackBar(snackBar);
  }
}