import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutridaiet/controllers/recetas_controller.dart';
import 'package:nutridaiet/model/receta.dart';

class GridViewScrollWidget extends ConsumerStatefulWidget {
  GridViewScrollWidget({
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
            color: Color(0xff007a79),
            child: Center(
              child: Column(
                children: [
                  Text(recetas[index].name),
                  //TODO: Hacer diseño
                ],
              ),
            ));
      },
      itemCount: recetas.length,
    );
  }
}
