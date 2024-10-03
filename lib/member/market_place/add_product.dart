import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:first_app/member/market_place/marketplace_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:first_app/services/api.dart';
import 'package:http/http.dart' as http;

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  File? _image;
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descController = TextEditingController();
  XFile? image2;
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    image2 = await _picker.pickImage(source: ImageSource.camera);
    if (image2 != null) {
      File imgFile = File(image2!.path);
      setState(() {
        _image = File(image2!.path);
      });
      // Now you can send imgFile to your backend
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 150,
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
            SizedBox(height: 16),
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
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_image != null &&
                    _nameController.text.isNotEmpty &&
                    _priceController.text.isNotEmpty) {
                  Api().uploadproduct({
                    "name": _nameController.text,
                    "price": _priceController.text.toString(),
                    "desc": _descController.text,
                    "filename": _nameController.text,
                  }, image2!);
                  Api().getProducts().then((res) => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MarketplacePage(
                              response: res,
                            ),
                          ),
                        )
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