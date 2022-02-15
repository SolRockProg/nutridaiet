import 'package:flutter/material.dart';
import 'package:nutridaiet/iu/recetaspage.dart';
import 'package:nutridaiet/iu/valoraciones_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  late PageController controller;
  @override
  void initState() {
    controller = PageController(initialPage: 0);
    _muevePage();
    super.initState();
  }

  void _muevePage() async {
    final prefs = await SharedPreferences.getInstance();
    String? nombre = prefs.getString("nombre");
    if (nombre != null) {
      controller.animateToPage(
        1,
        curve: Curves.bounceIn,
        duration: const Duration(
          milliseconds: 500,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: [
          ValoracionesPage(
            controller: controller,
          ),
          const RecetasPage()
        ],
      ),
    );
  }
}
