import 'package:flutter/material.dart';
import 'package:nutridaiet/controllers/alimentos_controller.dart';
import 'package:nutridaiet/iu/customWidgets/ListViewScrollWidget.dart';
import 'package:nutridaiet/iu/customWidgets/FileUploadDialog.dart';
import 'customWidgets/ButtonApp.dart';
import 'customWidgets/GridViewScrollWidget.dart';

class RecetasPage extends StatefulWidget {
  const RecetasPage({Key? key}) : super(key: key);

  @override
  _RecetasPageState createState() => _RecetasPageState();
}

class _RecetasPageState extends State<RecetasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                    _logo(),
                    _buildListContainer(
                        const GridViewScrollWidget(), "Recetas", false),
                    _buildListContainer(
                        const ListViewScrollWidget(), "Despensa", true)
                  ],
                ),
              ),
            )),
      ),
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
                        style: TextStyle(fontSize: 22, fontFamily: 'Arvo'),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: list,
                ),
              ],
            )),
      ),
    );
  }
}

Widget _logo() {
  const style = TextStyle(fontSize: 60, fontFamily: 'Arvo');
  return Padding(
    padding: const EdgeInsets.only(top: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'lib/iu/images/nu.png',
          width: 80,
          height: 80,
        ),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 16)),
        const Text(
          "Nutrid",
          style: style,
        ),
        const Text(
          "AI",
          style: TextStyle(
              fontSize: 60, fontFamily: 'Arvo', color: Color(0xFF007a79)),
        ),
        const Text(
          "et",
          style: style,
        )
      ],
    ),
  );
}
