import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:nutridaiet/iu/customWidgets/button_app.dart';
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
    return buildDecoration(
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
                ButtonApp(
                    text: 'Buscar imagenes',
                    icon: const Icon(
                      Icons.search,
                      size: 32,
                    ),
                    onPressed: () => {})
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

  Widget buildDecoration({required Stack child}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: isFileAbove ? const Color(0xFF007a79) : const Color(0xFF007A7A),
        padding: const EdgeInsets.all(10),
        child: DottedBorder(
            borderType: BorderType.RRect,
            color: Colors.white,
            padding: EdgeInsets.zero,
            radius: const Radius.circular(10),
            dashPattern: const [8, 4],
            strokeWidth: 3,
            child: child),
      ),
    );
  }
}
