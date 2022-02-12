import 'package:flutter/material.dart';
import 'package:nutridaiet/model/file.dart';

import 'DropZoneWidget.dart';

class PruebaDialog extends StatefulWidget {
  const PruebaDialog({Key? key}) : super(key: key);

  @override
  State<PruebaDialog> createState() => _PruebaDialogState();
}

class _PruebaDialogState extends State<PruebaDialog> {
  File? file;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: SizedBox(
        height: 300,
        width: 700,
        child: DropZoneWidget(
          onDroppedFile: (file) => {setState(() => this.file = file)},
        ),
      ),
    );
  }
}
