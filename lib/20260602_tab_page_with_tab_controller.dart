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
            theme: ThemeData(primarySwatch: Colors.blue),// 設定傳統的 Material 2 藍色主題色系
      home: MyHomePage(),// 指向 MyHomePage
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  // 1. 在 StatelessWidget 中宣告監聽器
  final ValueNotifier<String> _msg=ValueNotifier('');
  // 2. 宣告靜態常數選單資料
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
            // 使用「...」擴展運算子搭配 List.generate 動態展開清單
           ...List.generate(_menuItems.length, (index)=>ListTile(
            title: Text(_menuItems[index],
            style: const TextStyle(fontSize: 20),),
           onTap: (){
            _msg.value=_menuItems[index];// 點擊時修改監聽器的值
            Navigator.pop(context);// 自動關閉 Drawer
           },
                ),
      ),],),),
      body: Center(
        child: ValueListenableBuilder<String>(
          valueListenable: _msg, // 綁定監聽器
          builder:_showMsg,// 當值改變時，直接呼叫上方的 _showMsg 函式
        ),
      ),
    );
  }
  Widget _showMsg(BuildContext context, String msg, Widget? child){
    return Text(msg, style: const TextStyle(fontSize: 20),);
  }
}

