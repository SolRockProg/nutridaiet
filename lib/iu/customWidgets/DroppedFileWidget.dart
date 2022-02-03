import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nutridaiet/model/file.dart';

class DroppedFileWidget extends StatelessWidget {
  final File? file;
  const DroppedFileWidget({Key? key, this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildImage();
  }

  Widget buildImage() {
    if (file == null) return buildEmptyFile('Sin imagen');

    return Image.network(
      file!.url,
      width: 120,
      height: 120,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) =>
          buildEmptyFile('El formato no es el correcto'),
    );
  }

  Widget buildEmptyFile(String s) => Container(
        width: 120,
        height: 120,
        color: Colors.blue.shade300,
        child: Center(
          child: Text(
            s,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
}
