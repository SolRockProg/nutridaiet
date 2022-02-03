import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:nutridaiet/model/file.dart';

class DropZoneWidget extends StatefulWidget {
  final ValueChanged<File> onDroppedFile;

  const DropZoneWidget({
    Key? key,
    required this.onDroppedFile,
  }) : super(key: key);

  @override
  State<DropZoneWidget> createState() => _DropZoneWidgetState();
}

class _DropZoneWidgetState extends State<DropZoneWidget> {
  late DropzoneViewController controller;
  bool isFileAbove = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isFileAbove ? Colors.blue : Colors.blue.shade300,
      child: Stack(
        children: [
          DropzoneView(
            onDrop: getFile,
            onCreated: (controller) => {this.controller = controller},
            onHover: () => setState(() {
              isFileAbove = true;
            }),
            onLeave: () => setState(() {
              isFileAbove = false;
            }),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.cloud_upload, size: 80, color: Colors.white),
                const Text(
                  'Suelta imagenes aquí',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                const Padding(padding: EdgeInsets.all(16)),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      final events = await controller.pickFiles();
                      if (events.isEmpty) return;
                      getFile(events.first);
                    },
                    icon: const Icon(
                      Icons.search,
                      size: 32,
                    ),
                    label: const Text('Buscar imagenes')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future getFile(event) async {
    final url = await controller.createFileUrl(event);
    final name = await controller.getFilename(event);

    final file = File(url: url, name: name);

    widget.onDroppedFile(file);
  }
}
