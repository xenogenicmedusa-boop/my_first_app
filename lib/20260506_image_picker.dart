import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Picker Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
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
  final ValueNotifier<XFile?> _imageFile = ValueNotifier(null);
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void dispose() {
    _imageFile.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final btnCameraImage = ElevatedButton(
      onPressed: () => _getImage(ImageSource.camera),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: const Text(
        '由相機拍照',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
    final btnGalleryImage = ElevatedButton(
      onPressed: () => _getImage(ImageSource.gallery),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: const Text(
        '挑選相簿照片',
        style: TextStyle(fontSize: 18, color: Colors.yellow),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('挑選照片'), centerTitle: true),
      body: Column(
        children: [
          const SizedBox(height: 10),
          btnCameraImage,
          const SizedBox(height: 10),
          btnGalleryImage,
          const SizedBox(height: 10),
          Expanded(
            child: Center(
              child: ValueListenableBuilder<XFile?>(
                valueListenable: _imageFile,
                builder: _imageBuilder,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _getImage(ImageSource source) async {
    final XFile? imageFile = await _imagePicker.pickImage(source: source);
    if (imageFile != null) {
      _imageFile.value = imageFile;
    }
  }

  Widget _imageBuilder(BuildContext context, XFile? _imageFile, Widget? child) {
    if (_imageFile == null) {
      return const Text('沒有照片', style: TextStyle(fontSize: 20));
    }
    return Image.file(File(_imageFile.path), fit: BoxFit.contain);
  }
}
