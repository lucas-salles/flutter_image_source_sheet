import 'dart:io';

import 'package:example/widgets/image_view.dart';
import 'package:flutter/material.dart';
import 'package:image_source_sheet/image_source_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _imageFile;
  bool isLoading = false;

  void _getImage(File imageFile) async {
    setState(() {
      isLoading = true;
    });
    Navigator.of(context).pop();
    if (mounted) {
      setState(() {
        _imageFile = imageFile;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Camera"),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _imageFile != null
              ? ImageView(imageFile: _imageFile!)
              : Center(
                  child: Text("Escolha a imagem"),
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showImageSourceSheet(
            context: context,
            onImageSelected: _getImage,
          );
        },
        tooltip: "Escolha a imagem",
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
