import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/alimentos_controller.dart';
import 'drop_zone_widget.dart';

class PruebaDialog extends ConsumerStatefulWidget {
  const PruebaDialog({Key? key}) : super(key: key);

  @override
  ConsumerState<PruebaDialog> createState() => _PruebaDialogState();
}

class _PruebaDialogState extends ConsumerState<PruebaDialog> {
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
          onDroppedFile: (file) =>
              {() => ref.read(alimentosState.notifier).sendTicket(file)},
        ),
      ),
    );
  }
}
