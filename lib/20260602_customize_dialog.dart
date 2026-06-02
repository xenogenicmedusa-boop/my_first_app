import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());// 啟動整個 App
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Customize Dialog Demo',
            theme: ThemeData(primarySwatch: Colors.blue),// 設定 App 主題為藍色
      home: const MyHomePage(),// 指定首頁為 MyHomePage
    );
  }
}
class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState()=> _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage>{
  // 1. 定義單選清單的資料來源
  static const List<String> _cities = ['倫敦','東京','舊金山'];
  // 2. 監聽器 A：記錄「最後確認」並要顯示在主畫面上的城市名稱
  final ValueNotifier<String> _dialogResult= ValueNotifier<String>('');
  // 3. 監聽器 B：記錄目前「在對話盒裡」被勾選的選項索引（0:倫敦, 1:東京, 2:舊金山，null 代表沒選）
  final ValueNotifier<int?> _selectedCity=ValueNotifier<int?>(null);
  @override
  void dispose(){
    // 4. 當頁面關閉時，必須手動銷毀監聽器，釋放記憶體避免洩漏（Memory Leak）
    _dialogResult.dispose();
    _selectedCity.dispose();
    super.dispose();
  }
  Future<void> _openDialog() async{
    // 等待對話盒關閉，並接收它回傳的結果（result）
    final result=await _showCityDialog();
    if (result !=null){
_dialogResult.value=result;// 更新主畫面的文字
    }   
  }
Future<String?> _showCityDialog(){
  return showDialog<String>(
    context: context,
    barrierDismissible: false,// 強制規定：使用者不能點擊對話盒外部空白處來關閉它
    builder: (dialogContext){
      return AlertDialog(
        title: const Text('請選擇城市'),
        // 當 _selectedCity 改變時，只會重新渲染這裡面的單選清單
        content:ValueListenableBuilder(valueListenable: _selectedCity, builder: _cityOptionsBuilder,),
        actions:[
          // 取消按鈕
TextButton(onPressed: (){
  Navigator.pop(dialogContext, '');
}, child: const Text('取消'),),
// 確定按鈕
ElevatedButton(onPressed: (){
  // 點擊確定時，防呆判斷：若沒選就回傳空字串，有選就回傳城市名稱
  Navigator.pop(dialogContext,
  _selectedCity.value==null
  ? ''
  : _cities[_selectedCity.value!],);
}, child: const Text('確定'),),
        ],);
      
    },);
}
// 建立對話盒內的單選項目清單
Widget _cityOptionsBuilder(BuildContext context, int? selectedItem, Widget? child,){
  return Column(
    mainAxisSize: MainAxisSize.min,
    // 讓高度剛好符合內容，不要擴展到整個螢幕
    children: List.generate(_cities.length, (index){
      return RadioListTile<int>(
        value: index, // 這個單選格代表的編號（0, 1, 2）
        groupValue: selectedItem, // 目前畫面上真正被點選的編號
        title: Text(_cities[index]), // 顯示城市名稱
        onChanged: (value){
        _selectedCity.value=value;// 點擊時更新數值，觸發重新渲染
      },);
    }),
  );
}

// 建立主畫面上顯示結果的文字
Widget _dialogResultBuilder(BuildContext context, String result, Widget? child,){
  return Text(result, style: const TextStyle(fontSize: 20));
}
  @override
  Widget build(BuildContext context){
    final appBar=AppBar(title: const Text('對話盒範例'));
      final showDialogButton=            ElevatedButton(onPressed: _openDialog, // 點擊按鈕，打開對話盒
      child: const Text('顯示對話盒',style: TextStyle(fontSize: 20)),
    );
    final body=Center(
      child: Column(
        children: [
          // 區塊 1：放置按鈕
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: showDialogButton,
          ),
          // 區塊 2：監聽 _dialogResult，當有新結果時，只更新這裡的文字
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ValueListenableBuilder(valueListenable: _dialogResult, builder: _dialogResultBuilder,
            ),
          ),
        ],
      ),
    );
    return Scaffold(appBar: appBar, body: body,);// 組合頁面結構
  }
}