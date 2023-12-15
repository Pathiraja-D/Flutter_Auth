import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ImagePicker _picker = ImagePicker();
  final List<XFile>? _imageFileList = [];

  void selectImage() async {
    final List<XFile>? selectedImages = await _picker.pickMultiImage();
    if (selectedImages != null) {
      setState(() {
        _imageFileList!.addAll(selectedImages);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ElevatedButton(
          onPressed: selectImage,
          child: const Text(
            'Select Image',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Expanded(
          child: _imageFileList == null || _imageFileList!.isEmpty
              ? const Text('No image selected.')
              : _buildImageList(),
        ),
      ],
    ));
  }

  Widget _buildImageList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _imageFileList?.length ?? 0,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.file(
            File(_imageFileList![index].path),
            width: 100.0, // Adjust the width as needed
            height: 100.0, // Adjust the height as needed
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
