import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());// 啟動整個 App
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Drawer範例',
      debugShowCheckedModeBanner: false,      // 隱藏螢幕右上角的「DEBUG」紅色標籤      
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState()=> _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage>{
  // 宣告一個輕量級監聽器，用來記錄畫面中央要顯示的文字（初始值為 '請選擇Drawer選單'）
  final ValueNotifier<String> _messageNotifier=ValueNotifier<String>('請選擇Drawer選單',);
  @override
  void dispose(){
    _messageNotifier.dispose();// 當頁面銷毀時，釋放監聽器資源，避免記憶體洩漏
    super.dispose();
  }
  // 處理選單點擊的邏輯函式
  void _selectMenu(String menu){
    _messageNotifier.value=menu;// 1. 將選取到的項目名稱傳給監聽器，觸發主畫面文字更新
    Navigator.pop(context);// 2. 自動將側邊欄抽屜選單關閉（收回）
  }
  // 封裝 Drawer 選項的市場函式
  Widget _buildDrawerItem(String title){
    return ListTile(title: Text(title, style: const TextStyle(fontSize: 20)),
    onTap: ()=> _selectMenu(title),);// 點擊時，呼叫處理函式並傳入項目名稱
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Drawer Demo'),),
      // 定義側邊欄抽屜選單
      drawer: Drawer(
        child: ListView(children: [
          // 抽屜的標頭區塊（通常用來放使用者大頭貼或系統名稱）
          const DrawerHeader(
            // 注意：原程式碼缺少背景色，通常會加上以利區隔
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Drawer Title', style: TextStyle(fontSize: 20, color: Colors.white),),),
            // 呼叫自訂函式產生三個選項
          _buildDrawerItem('Option One'),
          _buildDrawerItem('Option Two'),
          _buildDrawerItem('Option Three'),
        ],),
      ),
      body: Center(
        child: ValueListenableBuilder<String>(valueListenable: _messageNotifier, // 監聽 _messageNotifier 的變化
        builder: ((context, value, child){
          // 當 _messageNotifier.value 改變時，只有這裡的 Text 會被重繪
          return Text(value, style: const TextStyle(fontSize: 24));
        })),
      ),
    );
  }
}
