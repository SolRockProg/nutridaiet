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
        height: 400,
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
          maxCrossAxisExtent: 300,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemBuilder: (context, index) {
        return Card(
            color: const Color(0xff007a79),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextCustom(text: recetas[index].name),
                  const Padding(padding: EdgeInsets.all(4)),
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
                          TextCustom(text: recetas[index].tiempo.toString()),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.countertops_outlined,
                            color: Colors.white,
                          ),
                          const Padding(padding: EdgeInsets.only(right: 3)),
                          TextCustom(
                              text: recetas[index].steps.length.toString()),
                        ],
                      )
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(4)),
                  TextCustom(
                    text: recetas[index].descripcion,
                    length: 3,
                  )
                ],
              ),
            ));
      },
      itemCount: recetas.length,
    );
  }
}

class TextCustom extends StatelessWidget {
  final String text;
  final int? length;
  const TextCustom({
    Key? key,
    required this.text,
    this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.capitalize(),
      style: TextStyle(color: Colors.white),
      maxLines: length,
      overflow: TextOverflow.ellipsis,
    );
  }
}
