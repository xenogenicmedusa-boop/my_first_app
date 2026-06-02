import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // 啟動整個 App
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer範例',
            theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final ValueNotifier<String> _msg=ValueNotifier('');
  static const List<String> _menuItems =['Option one', 'Option two', 'Option three'];
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drawer Demo')),
      drawer: Drawer(
        child: ListView(
                    children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Drawer Title',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
           ...List.generate(_menuItems.length, (index)=>ListTile(
            title: Text(_menuItems[index],
            style: const TextStyle(fontSize: 20),),
           onTap: (){
            _msg.value=_menuItems[index];
            Navigator.pop(context);
           },
                ),
      ),],),),
      body: Center(
        child: ValueListenableBuilder<String>(
          valueListenable: _msg, // 綁定監聽器
          builder:_showMsg,
        ),
      ),
    );
  }
  Widget _showMsg(BuildContext context, String msg, Widget? child){
    return Text(msg, style: const TextStyle(fontSize: 20),);
  }
}

