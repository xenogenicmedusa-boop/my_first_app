import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ValueNotifier<int> _imageIndex = ValueNotifier(0);
  static const List<String> _images = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
  ];

  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _imageIndex.value);
  }

  @override
  void dispose() {
    _imageIndex.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Browse Image'), centerTitle: true),
      body: ValueListenableBuilder<int>(
        valueListenable: _imageIndex,
        builder: _imageBuilder,
      ),
    );
  }

  Widget _imageBuilder(BuildContext context, int index, Widget? child) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        PhotoViewGallery.builder(
          itemCount: _images.length,
          builder: _buildItem,
          pageController: _pageController,
          onPageChanged: _onPageChanged,
          scrollDirection: Axis.horizontal,
          scrollPhysics: const BouncingScrollPhysics(),
          backgroundDecoration: const BoxDecoration(color: Colors.black),
        ),
        Positioned(
          top: 40,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '${index + 1} / ${_images.length}',
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
  return PhotoViewGalleryPageOptions(imageProvider: AssetImage(_images[index]),
  initialScale: PhotoViewComputedScale.contained,
  minScale: PhotoViewComputedScale.contained * 0.6,
  maxScale: PhotoViewComputedScale.covered * 2,
  );
}

void _onPageChanged(int index) {
  _imageIndex.value = index;
}
}
