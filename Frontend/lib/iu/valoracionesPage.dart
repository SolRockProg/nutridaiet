import 'package:flutter/material.dart';
import 'package:nutridaiet/iu/customWidgets/ButtonApp.dart';

import 'customWidgets/GridViewScrollWidget.dart';
import 'customWidgets/logo.dart';

class ValoracionesPage extends StatefulWidget {
  const ValoracionesPage({Key? key}) : super(key: key);

  @override
  _ValoracionesPageState createState() => _ValoracionesPageState();
}

class _ValoracionesPageState extends State<ValoracionesPage> {
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
                    logo(),
                    _buildListContainer(const GridViewScrollWidget(),
                        "Valora las recetas", false),
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
