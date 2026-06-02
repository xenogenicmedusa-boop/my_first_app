import 'package:flutter/material.dart';
import 'package:my_first_app/20260526_order_data.dart';
final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
class SelectMainCourse extends StatelessWidget{
  SelectMainCourse({super.key});
  final List<String> _mainCourses = ['牛肉麵','排骨飯', '魚排飯'];
  final ValueNotifier<int?> _selectedItem=ValueNotifier<int?>(Data.mainCourseItem,);
  @override
  Widget build(BuildContext context){
    return WillPopScope(
      onWillPop: ()=>_backToHomePage(context),
      child: Scaffold(
      appBar: AppBar(title: const Text('選擇主餐')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ValueListenableBuilder<int?>(valueListenable: _selectedItem, 
              builder: (BuildContext context, int? selectedItem, Widget? child){
                return Column(
                  children:List.generate(_mainCourses.length, (index){
return RadioListTile<int>(
                  value: index,
                  groupValue: selectedItem,
                  title: Text(_mainCourses[index],
                  style: const TextStyle(fontSize: 20),),
                  onChanged: (value){
                    _selectedItem.value=value;
                  }, 
                  );
                  } ),
                );
                
                  }),
                ),
            ElevatedButton(onPressed: ()=> _backToHomePage(context), child: const Text('確定'),),
          ],
        ),
      ),
    ), 
    );
  }
  Future<bool> _backToHomePage(BuildContext context) async{
    Data.mainCourseItem=_selectedItem.value;
    final String? mainCourse=Data.mainCourseItem !=null
    ? _mainCourses[Data.mainCourseItem!]:null;
    Navigator.pop(context, mainCourse);
    return true;
  }
}
final List<String> _items=['1','2','3'];
int _itemLastNum =3;
void _addItem(){
  final newItem = (++_itemLastNum).toString();
  _items.add(newItem);
  _listKey.currentState?.insertItem(
    _items.length-1,
    duration:const Duration(milliseconds: 300),
  );
}
void _removeItem(int index){
  final removeItem=_items[index];
  _items.removeAt(index);
  _listKey.currentState?.removeItem(index, (context, animation){
    return SizeTransition(sizeFactor: animation,
    child: Card(
      child: ListTile(
        title: Text(removeItem, style: const TextStyle(fontSize: 20)),
      ),
    ),);
  },duration: const Duration(milliseconds: 300));
}
Widget _buildItem(BuildContext context,
int index, Animation<double> animation,){
  return SizeTransition(sizeFactor: animation, child: Card(
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    child: ListTile(
      title: Text(_items[index], style: const TextStyle(fontSize: 20)),
      onTap: _addItem,
      onLongPress: ()=>_removeItem(index),
    ),
  ),);
}
@override
Widget build(BuildContext context){
  final appBar=AppBar(
    title: const Text('AnimatedList範例'), centerTitle: true,
  );
  final animatedList=AnimatedList(initialItemCount: _items.length, key: _listKey, itemBuilder: _buildItem,);
  return Scaffold(appBar: appBar, body: animatedList);
}
