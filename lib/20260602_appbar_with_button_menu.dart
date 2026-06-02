import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());// 啟動整個 App
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'AppBar範例',
            theme: ThemeData(primarySwatch: Colors.blue),// 設定 App 主題為藍色
      home: MyHomePage(),// 指定首頁為 MyHomePage
    );
  }
}
class MyHomePage extends StatelessWidget{
  MyHomePage({super.key});
  // 宣告一個輕量級的監聽器，用來記錄目前要顯示在畫面中央的字串（初始為空字串）
  final ValueNotifier<String> _msg=ValueNotifier('');

  @override
Widget build(BuildContext context){
  // 右側按鈕 A：手機圖示按鈕
  final phoneButton=IconButton(icon: const Icon(Icons.phone_android, color: Colors.white),
  onPressed: (){
    _msg.value='你按下手機按鈕';// 點擊時更新文字
  },);
  // 右側按鈕 B：彈出式選單按鈕（三個點的選單）
final popupMenu=PopupMenuButton<int>(itemBuilder: (context)=>const[
  PopupMenuItem<int>(
    value: 1, child: Text('第一項',style: TextStyle(fontSize: 20)),
  ),
  PopupMenuDivider(),// 選單中間的分隔線
  PopupMenuItem<int>(
    value: 2,
    child: Text('第二項', style: TextStyle(fontSize: 20)),),
],
onSelected: (value){
  // 當使用者點選選單中的項目時觸發
  switch(value){
    case 1: _msg.value='第一項';
    break;
    case 2: _msg.value='第二項';
    break;
  }
},
);
// 建構 AppBar 導覽列
    final appBar=AppBar(title: const Text('AppBar範例'),// 中間標題
    automaticallyImplyLeading: false,// 禁用預設的返回按鈕（避免系統自動產生）
    // 左側區塊：自訂選單按鈕
    leading: InkWell(onTap: (){
      _msg.value='你按下選單按鈕';
    },
    child: const Icon(Icons.menu),// 顯示「三條線」的選單圖示
    ),
    // 右側區塊：放置剛剛定義好的手機按鈕與彈出式選單
    actions: [phoneButton, popupMenu],
    );
    // 回傳整個頁面結構
    return Scaffold(appBar: appBar, 
    // 畫面主體：監聽 _msg 的數值，一改變就自動呼叫 _showMsg 函式更新畫面
    body: ValueListenableBuilder<String>(valueListenable: _msg, builder: _showMsg,),);
  }
  // 畫面中央文字的產生器
  Widget _showMsg(BuildContext context, String msg, Widget? child){
return Center(child: Text(msg, style: const TextStyle(fontSize: 20)));
  }
}