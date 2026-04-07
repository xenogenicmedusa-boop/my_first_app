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
                  labelText: "Search for BTS",
                  labelStyle: TextStyle(fontSize: 20.0, color: Colors.deepPurple),
                  filled: true,
                  fillColor: Colors.tealAccent,
                  helperText: "2026 ARIRANG",
                  prefixIcon: Icon(Icons.ac_unit),
                  suffixIcon: Icon(Icons.cabin_rounded),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.amber, 
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                      width: 1,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.limeAccent,
                      width: 1,
                    ),
                  ),
                ),
            ),
          ),
        ],
      ),
    );
  }
}