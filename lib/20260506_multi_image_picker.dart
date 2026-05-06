import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_first_app/20260505_browser_image_1.dart';

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
  final ValueNotifier<List<XFile>> _imageFiles = ValueNotifier([]);
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void dispose() {
    _imageFiles.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final btnCameraImage = ElevatedButton(
      onPressed: _takePicture,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: const Text(
        '相機拍照',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
    final btnGalleryImage = ElevatedButton(
      onPressed: _selectImages,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pink,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: const Text(
        '挑選相簿照片',
        style: TextStyle(fontSize: 20, color: Colors.yellow),
      ),
    );
    return Scaffold(
      appBar: AppBar(title: const Text('挑選照片')),
      body: Column(
        children: [
          const SizedBox(height: 10),
          btnCameraImage,
          const SizedBox(height: 10),
          btnGalleryImage,
          const SizedBox(height: 10),
          Expanded(
            child: ValueListenableBuilder<List<XFile>>(
              valueListenable: _imageFiles,
              builder: _imageBuilder,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _takePicture() async {
    final XFile? photo = await _imagePicker.pickImage(
      source: ImageSource.camera,
    );
    if (photo != null) {
      _imageFiles.value = [photo];
    }
  }

  Future<void> _selectImages() async {
    final List<XFile> images = await _imagePicker.pickMultiImage();
    if (images.isNotEmpty) {
      _imageFiles.value = images;
    }
  }

  Widget _imageBuilder(
    BuildContext context,
    List<XFile> imageFiles,
    Widget? child,
  ) {
    if (imageFiles.isEmpty) {
      return const Center(child: Text('沒有照片', style: TextStyle(fontSize: 20)));
    }
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: imageFiles.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.file(File(imageFiles[index].path), fit: BoxFit.cover),
        );
      },
    );
  }
}
