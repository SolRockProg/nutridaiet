import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutridaiet/controllers/recetas_controller.dart';
import 'package:nutridaiet/iu/customWidgets/list_view_scroll_widget.dart';
import 'package:nutridaiet/iu/customWidgets/file_upload_dialog.dart';
import 'customWidgets/button_app.dart';
import 'customWidgets/grid_view_scroll_widget.dart';
import 'customWidgets/logo.dart';

class RecetasPage extends ConsumerStatefulWidget {
  const RecetasPage({Key? key}) : super(key: key);

  @override
  _RecetasPageState createState() => _RecetasPageState();
}

class _RecetasPageState extends ConsumerState<RecetasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 1200,
              color: const Color(0xFFc7cedf),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Logo(),
                  Expanded(
                    flex: 8,
                    child: _buildListContainer(
                        const GridViewScrollWidget(height: 500),
                        "Recetas",
                        false),
                  ),
                  Expanded(
                    flex: 2,
                    child: _buildListContainer(
                        const ListViewScrollWidget(), "Despensa", true),
                  )
                ],
              ),
            ),
          )),
    );
  }

  Widget _buildListContainer(Widget list, String title, bool showButton) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
            width: 1100,
            color: Colors.white.withAlpha(100),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style:
                            const TextStyle(fontSize: 22, fontFamily: 'Arvo'),
                      ),
                      if (showButton)
                        ButtonApp(
                          text: "Subir ticket",
                          icon: const Icon(Icons.cloud_upload),
                          onPressed: () => {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    const PruebaDialog())
                          },
                        )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: list,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
