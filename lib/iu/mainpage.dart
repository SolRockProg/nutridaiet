import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:nutridaiet/model/file.dart';

import 'customWidgets/DropZoneWidget.dart';
import 'customWidgets/DroppedFileWidget.dart';
import 'customWidgets/ListViewScrollWidget.dart';

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
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 1200,
              width: 800,
              color: const Color(0xFFc7cedf),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListViewScrollWidget(),
                  DroppedFileWidget(file: file),
                  const Padding(padding: EdgeInsets.all(16)),
                  SizedBox(
                    height: 300,
                    width: 700,
                    child: DropZoneWidget(
                      onDroppedFile: (file) =>
                          {setState(() => this.file = file)},
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
