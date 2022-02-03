import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:nutridaiet/model/file.dart';

import 'customWidgets/DropZoneWidget.dart';
import 'customWidgets/DroppedFileWidget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NutridAIlet'),
      ),
      body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DroppedFileWidget(file: file),
              Container(
                height: 300,
                child: DropZoneWidget(
                  onDroppedFile: (file) => {setState(() => this.file = file)},
                ),
              ),
            ],
          )),
    );
  }
}
