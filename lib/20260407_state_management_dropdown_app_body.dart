import 'package:flutter/material.dart';

const List<String> trans = ["RM", "Jin", "j-hope", "SUGA", "Jimin", "V", "Jung Kook"];
class AppBody extends StatefulWidget {
  const AppBody({super.key});
  
  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  final ValueNotifier<String> _itemName = ValueNotifier<String>("");
  final ValueNotifier<int> _selectedItem = ValueNotifier<int>(-1);

  @override 
  void dispose(){
    _itemName.dispose();
    _selectedItem.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: ValueListenableBuilder<int>(
              valueListenable: _selectedItem, 
              builder: _dropdownButtonBuilder,
              ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical:10.0),
            child: ElevatedButton(child: const Text("Enter"),
            onPressed: (){
              _itemName.value = _selectedItem.value < 0
              ? ""
              : trans[_selectedItem.value];
            },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: ValueListenableBuilder<String>(
              valueListenable: _itemName,
              builder: _itemNameWidgetBuilder,
              ),
          ),
        ],
        ),
    );
  }
Widget _itemNameWidgetBuilder(BuildContext context, 
String itemName,
Widget? child,
){
  return Text(
    itemName, 
    style: const TextStyle(fontSize: 20.0),
  );
}

Widget _dropdownButtonBuilder(
  BuildContext context,
  int selectedItem,
  Widget? child,
){
  return DropdownButton<int>(
    hint: const Text("Who you love", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900, color: Colors.pinkAccent)),
    value: selectedItem < 0 ? null: selectedItem,

    items: const <DropdownMenuItem<int>>[

      DropdownMenuItem<int>(
        value: 0,
        child: Text("RM", style: TextStyle(fontSize: 20.0, color: Colors.blue),
        ),
      ),

      DropdownMenuItem<int>(
        value: 1,
        child: Text("Jin", style: TextStyle(fontSize: 20.0, color: Colors.brown),
        ),
      ),

      DropdownMenuItem<int>(
        value: 2,
        child: Text("j-hope", style: TextStyle(fontSize: 20.0, color: Colors.cyanAccent),
        ),
      ),

      DropdownMenuItem<int>(
        value: 3,
        child: Text("SUGA", style: TextStyle(fontSize: 20.0, color: Colors.deepOrange),
        ),
      ),

      DropdownMenuItem<int>(
        value: 4,
        child: Text("Jimin", style: TextStyle(fontSize: 20.0, color: Colors.green),
        ),
      ),

      DropdownMenuItem<int>(
        value: 5,
        child: Text("V", style: TextStyle(fontSize: 20.0, color: Colors.deepPurple),
        ),
      ),

      DropdownMenuItem<int>(
        value: 6,
        child: Text("Jung Kook", style: TextStyle(fontSize: 20.0, color: Colors.indigo),
        ),
      ),
    ],

    onChanged: (int? value){
      if (value != null){
        _selectedItem.value = value;
      }
    }
    );
}


}