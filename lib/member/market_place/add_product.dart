import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:first_app/services/api.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  File? _image;
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descController = TextEditingController();
  final _phController = TextEditingController();
  XFile? image2;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    image2 = await _picker.pickImage(source: ImageSource.camera);
    if (image2 != null) {
      setState(() {
        _image = File(image2!.path);
      });
    }
  }

  Future<Uint8List> _getImageBytes(XFile image) async {
    return await image.readAsBytes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 100,
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: _image == null
                    ? Icon(Icons.camera_alt, size: 50, color: Colors.grey)
                    : Image.file(_image!, fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Price'),
            ),
            TextField(
              controller: _descController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              style: const TextStyle(color: Colors.grey, fontSize: 16),
              controller: _phController,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: const InputDecoration(
                  prefix: Text('+91 ',
                      style: TextStyle(color: Colors.grey, fontSize: 16)),
                  border: UnderlineInputBorder(),
                  hintText: 'Enter Member Phone No',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16)),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if (_image != null &&
                    _nameController.text.isNotEmpty &&
                    _priceController.text.isNotEmpty) {
                  Uint8List imageBytes = await _getImageBytes(image2!);
                  await Api().uploadproduct({
                    "name": _nameController.text,
                    "price": _priceController.text,
                    "desc": _descController.text,
                    "filename": _nameController.text,
                    "ph": _phController.text
                  }, image2!); // Pass the Uint8List instead of XFile

                  Navigator.pop(context, {
                    'name': _nameController.text,
                    "image": imageBytes,
                    "price": _priceController.text,
                    "desc": _descController.text
                  });
                }
              },
              child: Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }
}
