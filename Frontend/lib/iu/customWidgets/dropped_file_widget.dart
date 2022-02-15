import 'package:flutter/material.dart';
import 'package:nutridaiet/model/file.dart';

class DroppedFileWidget extends StatelessWidget {
  final File? file;
  const DroppedFileWidget({Key? key, this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildImage(),
        if (file != null)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(file!.name),
          )
      ],
    );
  }

  Widget buildImage() {
    if (file == null) return buildEmptyFile('Sin imagen');

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        file!.url,
        width: 120,
        height: 120,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            buildEmptyFile('El formato no es el correcto'),
      ),
    );
  }

  Widget buildEmptyFile(String s) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 120,
          height: 120,
          color: const Color(0xFF007a79),
          child: Center(
            child: Text(
              s,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      );
}
