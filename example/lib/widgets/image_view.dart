import 'dart:io';

import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final File imageFile;

  const ImageView({Key? key, required this.imageFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 2,
          child: Container(
            constraints: BoxConstraints.expand(),
            child: Image.file(
              imageFile,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Text("Your photo"),
        ),
      ],
    );
  }
}
