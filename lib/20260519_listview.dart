import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter ListView Demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage());
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage>{
  final ValueNotifier<String> _selectedItem = ValueNotifier("");
  final List<Map<String, String>> _items = [
    {'title': '第一項', 'image': 'assets/images/4.png'},
    {'title': '第二項', 'image': 'assets/images/5.png'},
    {'title': '第三項', 'image': 'assets/images/6.png'},
  ];
  @override
  void dispose(){
    _selectedItem.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView Demo')),
      body: Padding(padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          ValueListenableBuilder<String>(valueListenable: _selectedItem, builder: (context, itemName, child){
            return Text(itemName, style: const TextStyle(fontSize: 20));
          },),
          Expanded(child: ListView.separated(
itemCount: _items.length,
itemBuilder: (context, index) {
  final item = _items[index];
  return ListTile(
    leading: Padding(padding: const EdgeInsets.symmetric(
      vertical: 8, horizontal: 5,
    ),
    child: CircleAvatar(
      backgroundImage: AssetImage(item['image']!),
    ),),
    title: Text(item['title']!,
    style: const TextStyle(fontSize: 20),),
    subtitle: const Text('items illustration', style: TextStyle(fontSize: 16),),
    trailing: const Icon(Icons.keyboard_arrow_right),
    onTap: (){
      _selectedItem.value = 'choose ${item['title']}';
    },
  );
},
separatorBuilder: (context, index) {
  return const Divider();
},
          ),),
        ],
      ),),
    );
  }
}
