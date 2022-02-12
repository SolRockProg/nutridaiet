import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutridaiet/controllers/recetas_controller.dart';
import 'package:nutridaiet/model/receta.dart';
import 'package:nutridaiet/utils/capitalize.dart';

class GridViewScrollWidget extends ConsumerStatefulWidget {
  const GridViewScrollWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<GridViewScrollWidget> createState() =>
      _GridViewScrollWidgetState();
}

class _GridViewScrollWidgetState extends ConsumerState<GridViewScrollWidget> {
  final List<int> numbers = List<int>.generate(10, (i) => i + 1);

  @override
  void initState() {
    super.initState();
    ref.read(recetasState.notifier).getRecetas();
  }

  @override
  Widget build(BuildContext context) {
    final recetasListState = ref.watch(recetasState);
    return SizedBox(
        height: 500,
        width: double.infinity,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },
          ),
          child: recetasListState.when(
              data: (recetas) => _buildGrid(recetas),
              error: (error, _) => Center(child: Text(error.toString())),
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  )),
        ));
  }

  GridView _buildGrid(List<Receta> recetas) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemBuilder: (context, index) {
        return _buildCard(recetas, index);
      },
      itemCount: recetas.length,
    );
  }

  Card _buildCard(List<Receta> recetas, int index) {
    return Card(
        color: const Color(0xff007a79),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextCustom(
                text: recetas[index].name,
                fontSize: 18,
                fontfamily: 'Arvo',
                textAlign: TextAlign.center,
              ),
              TextCustom(
                text: recetas[index].descripcion,
                maxLines: 6,
                textAlign: TextAlign.justify,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time_outlined,
                        color: Colors.white,
                      ),
                      const Padding(padding: EdgeInsets.only(right: 3)),
                      TextCustom(
                          text: recetas[index].tiempo.toString() + " min"),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.local_fire_department_outlined,
                        color: Colors.white,
                      ),
                      const Padding(padding: EdgeInsets.only(right: 3)),
                      TextCustom(
                          text: recetas[index].calorias.toString() + " cal."),
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

class TextCustom extends StatelessWidget {
  final String text;
  final int? maxLines;
  final double? fontSize;
  final TextAlign? textAlign;
  final String? fontfamily;
  const TextCustom({
    Key? key,
    required this.text,
    this.maxLines,
    this.fontSize,
    this.textAlign,
    this.fontfamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.capitalize(),
      style: TextStyle(
          color: Colors.white, fontSize: fontSize, fontFamily: fontfamily),
      textAlign: textAlign,
      maxLines: maxLines ?? 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
