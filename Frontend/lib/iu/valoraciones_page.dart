import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutridaiet/controllers/recetas_controller.dart';

import 'package:nutridaiet/repositories/recetas_rep.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'customWidgets/grid_view_scroll_widget.dart';
import 'customWidgets/logo.dart';

class ValoracionesPage extends ConsumerStatefulWidget {
  final PageController controller;
  const ValoracionesPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _ValoracionesPageState createState() => _ValoracionesPageState();
}

class _ValoracionesPageState extends ConsumerState<ValoracionesPage> {
  String? nombre;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              constraints: const BoxConstraints(
                  minHeight: 400, minWidth: 600, maxWidth: 1200),
              padding: const EdgeInsets.all(10),
              color: const Color(0xFFc7cedf),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Logo(),
                  _username(),
                  Expanded(
                    child: _buildListContainer(const GridViewScrollWidget(),
                        "Necesitamos que valore las siguientes recetas", false),
                  ),
                  _creaPerfil()
                ],
              ),
            ),
          )),
    );
  }

  Widget _username() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            child: Container(
          width: 500,
          color: Colors.white.withAlpha(100),
          child: TextField(
            onChanged: (value) => nombre = value,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Inserta tu nombre",
            ),
          ),
        )),
      ],
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

  Widget _creaPerfil() {
    return ElevatedButton(
        onPressed: () async {
          if (nombre == null) {
            return;
          }
          setState(() {
            loading = true;
          });
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('nombre', nombre!);
          var recetas = ref.read(recetasState).value;
          var valoraRepo = ref.read(recetasRespositoryProvider);
          if (recetas != null) {
            for (var receta in recetas) {
              await valoraRepo.setValoracion(receta);
            }
          }
          widget.controller.jumpToPage(1);
        },
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(16),
            primary: const Color(0xFF976f4f),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: SizedBox(
          height: 30,
          width: 100,
          child: loading
              ? const Center(
                  child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator()))
              : const Center(child: Text("A recetear!")),
        ));
  }
}
