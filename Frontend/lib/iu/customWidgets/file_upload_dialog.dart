import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutridaiet/iu/customWidgets/drop_zone_widget.dart';
import 'package:nutridaiet/iu/customWidgets/dropped_file_widget.dart';

import '../../controllers/alimentos_controller.dart';
import '../../model/file.dart';

class PruebaDialog extends ConsumerStatefulWidget {
  const PruebaDialog({Key? key}) : super(key: key);

  @override
  ConsumerState<PruebaDialog> createState() => _PruebaDialogState();
}

class _PruebaDialogState extends ConsumerState<PruebaDialog> {
  LocalFile? file;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Column(children: [
        DroppedFileWidget(file: file),
        SizedBox(
            height: 300,
            width: 700,
            child: DropZoneWidget(
                onDroppedFile: (file) => {
                      setState(() => this.file = file),
                      ref.read(alimentosState.notifier).sendTicket(file)
                    }))
      ]),
    );
  }
}
