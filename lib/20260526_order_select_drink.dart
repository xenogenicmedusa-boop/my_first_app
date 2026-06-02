import 'package:flutter/material.dart';
import 'package:my_first_app/20260526_order_data.dart';
class SelectDrink extends StatelessWidget{
  SelectDrink({super.key});
  final List<String> _drinkList=['紅茶','泡沫綠茶'];
  final ValueNotifier<int?> _selectedItem=ValueNotifier<int?>(Data.drinkItem);
  @override
  Widget build(BuildContext context){
    return WillPopScope(
      onWillPop: ()async{
    _backToHomePage(context);
    return false;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('選擇飲料')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 250,child: ValueListenableBuilder<int?>(valueListenable: _selectedItem, builder: (BuildContext context, int? selectedItem, Widget? child){
                return Column(
                  children: List.generate(_drinkList.length, (index){
                    return RadioListTile<int>(value: index,
                    groupValue: selectedItem, title: Text(_drinkList[index], style: const TextStyle(fontSize: 20),),
                    onChanged: (value) {
                      _selectedItem.value=value;
                    },);
                  }),
                );
              }),),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: ()=>_backToHomePage(context), child: const Text('確定'),),
            ],
          ),
        ),
      ),
    );
  }
  void _backToHomePage(BuildContext context){
    Data.drinkItem=_selectedItem.value;
    final String? drink=Data.drinkItem !=null
    ? _drinkList[Data.drinkItem!]
    :null;
    Navigator.pop(context, drink);
  }
}