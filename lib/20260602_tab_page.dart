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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,// 啟用新一代的 Material 3 設計規範
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 1. 宣告狀態監聽器：記錄畫面上要顯示的提示字串
  final ValueNotifier<String> _msg = ValueNotifier<String>('請從左側選單選擇項目');
  // 2. 使用字串列表（List）統一管理選單項目名稱
  final List<String> _menuItems = const [
    'Option one',
    'Option two',
    'Option three',
  ];
  @override
  void dispose() {
    _msg.dispose(); // 3. 當頁面銷毀時，釋放監聽器資源，避免記憶體洩漏
    super.dispose();
  }

  void _selectMenuItem(String item) {
    _msg.value = item;// 1. 更新監聽器的數值，這會觸發主畫面文字重新渲染
    Navigator.pop(context);// 2. 自動關閉（收回）側邊欄抽屜選單
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drawer Demo')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,// 清除頂部的預設安全區留白（讓藍色背景能填滿到螢幕最上方）
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Drawer Title',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            // 使用 Dart 的 Collection For 語法，動態走訪清單並產生相對應數量的 ListTile
           for (final item in _menuItems)
           ListTile(
            title: Text(item, style: const TextStyle(fontSize: 20)),
            onTap: ()=> _selectMenuItem(item),// 傳入當前的項目名稱
           ),
          ],
        ),
      ),
      body: Center(
        child: ValueListenableBuilder<String>(
          valueListenable: _msg, // 綁定監聽器
          builder: ((context, msg, child) {
            // 當 _msg.value 被改變時，只有這裡會重新 rebuild
                       return Text(msg, style: const TextStyle(fontSize: 24));
          }),
        ),
      ),
    );
  }
}

