import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Page1(),
    );
  }
}
// --- 第一頁：縮放圖片 + 切換按鈕 ---
class Page1 extends StatefulWidget {
  const Page1({super.key});
  @override
  State<Page1> createState() => _Page1State();}
  class _Page1State extends State<Page1> {
   // 1. 定義縮放倍率變數
  double _currentScale = 1.0;
 // 2. 切換縮放大小的函式
 void _toggleScale(){
  setState(() {
    // 如果目前是 1.0 就變 1.8，反之則變回 1.0
    _currentScale = (_currentScale == 1.0) ? 1.8 : 1.0;
  });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 1')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// 3. 使用 GestureDetector 讓圖片點擊也能縮放
           GestureDetector(
             onTap: _toggleScale,
             child: AnimatedScale(scale: _currentScale, duration: const Duration(milliseconds: 500),
             curve: Curves.bounceOut,// 帶有一點超越邊界後回彈的效果
              child: Image.network(
                'https://picsum.photos/100', // 隨機範例圖片
                width: 100,
              ),
            ),),
            const SizedBox(height: 50),
            // 4. 新增一個專門控制縮放的按鈕
            ElevatedButton.icon(
              onPressed: _toggleScale,
              icon: const Icon(Icons.zoom_in),
              label: const Text('Zoom In/Out'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent),
            ),
            const SizedBox(height: 20),
            // 5. 原有的切換頁面按鈕
            ElevatedButton(onPressed: () => Navigator.of(context).push(_createRoute()), child: const Text('Go to Page2'),),
          ],
        ),
      ),
    );
  }

  // 自定義頁面轉場：從底部滑入
Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}}
// --- 第二頁：星星飛行動畫 ---
class Page2 extends StatefulWidget {
  const Page2({super.key});
  @override
 State<Page2> createState() => _Page2State();}
 class _Page2State extends State<Page2> {
  // 使用 ValueNotifier 監控星星位置
  final ValueNotifier<Alignment> _alignment = ValueNotifier(Alignment.bottomCenter);
  @override
  void dispose(){
    _alignment.dispose();
    super.dispose();
  }
  void _startFlying(){
    _alignment.value = Alignment.topCenter;// 點擊時移向頂端
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Page 2')),
      body: Center(
        child: SizedBox(height: 500,child: Column(mainAxisAlignment: MainAxisAlignment.end,
        children: [Expanded(child: ValueListenableBuilder<Alignment>(valueListenable: _alignment, builder: (context, align, child){
          return AnimatedContainer(duration: const Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          alignment: align,onEnd: (){
            // 動畫結束後自動重置回底部
            if (_alignment.value == Alignment.topCenter){
              _alignment.value = Alignment.bottomCenter;
            }
          },
          child: const Icon(Icons.star, color: Colors.orange, size: 60),);
        },),),
        const SizedBox(height: 20),
        ElevatedButton(onPressed: _startFlying, child: const Text('Fly'),),
        const SizedBox(height: 50),],),),
      ),
    );
  }
 }
