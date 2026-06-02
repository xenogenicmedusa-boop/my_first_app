import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AnimatedList Demo",
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
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<String> _items = ['1','2','3'];
  int _itemLastNum = 3;
  
    void _addItem(){
    final newNum = (++_itemLastNum).toString();
    _items.add(newNum);
    _listKey.currentState?.insertItem(_items.length -1, duration: const Duration(milliseconds: 300),);
  }

  void _removeItem(int index){
final removedItem = _items[index];
_items.removeAt(index);
_listKey.currentState?.removeItem(index, (context, animation){
  return SizeTransition(sizeFactor: animation, child: Card(child: ListTile(title: Text(removedItem, style: const TextStyle(fontSize: 20)),),),);
}, duration: const Duration(milliseconds: 300));}
Widget _buildItem(BuildContext context, int index, Animation<double> animation){
  return SizeTransition(sizeFactor: animation, child: Card(margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  child: ListTile(
    title: Text(_items[index], style: const TextStyle(fontSize: 20)),
    onTap: _addItem,
    onLongPress: () => _removeItem(index),
  ),),);
}
  @override
  Widget build(BuildContext context){
    final appBar= AppBar(title: const Text('AnimatedList Demo'),
    centerTitle: true,);
     final animatedList = AnimatedList(
      key: _listKey,
      initialItemCount: _items.length,
      itemBuilder: _buildItem,);
      return Scaffold(appBar: AppBar(), body: animatedList);
  }
}