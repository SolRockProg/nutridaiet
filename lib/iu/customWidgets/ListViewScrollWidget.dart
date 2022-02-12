import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutridaiet/controllers/alimentos_controller.dart';
import 'package:nutridaiet/model/alimento.dart';
import 'package:nutridaiet/utils/capitalize.dart';

class ListViewScrollWidget extends ConsumerStatefulWidget {
  const ListViewScrollWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ListViewScrollWidget> createState() =>
      ListViewScrollWidgetState();
}

class ListViewScrollWidgetState extends ConsumerState<ListViewScrollWidget> {
  final List<int> numbers = List<int>.generate(10, (i) => i + 1);

  @override
  void initState() {
    super.initState();
    ref.read(alimentosState.notifier).getDespensa();
  }

  @override
  Widget build(BuildContext context) {
    final recetasListState = ref.watch(alimentosState);
    return SizedBox(
        height: 80,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },
          ),
          child: recetasListState.when(
              data: (data) => _buildList(data),
              error: (err, _) => Text("Error: " + err.toString()),
              loading: () => const Center(child: CircularProgressIndicator())),
        ));
  }

  ListView _buildList(List<Alimento> despensa) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemBuilder: (context, index) {
        int cantidad = despensa[index].cantidad;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Chip(
                padding: const EdgeInsets.all(16),
                label: Text(
                  despensa[index].nombre.capitalize(),
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                backgroundColor: const Color(0xff007a79),
              ),
              if (cantidad > 1)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.white)),
                    child: Center(
                        child: Text("x" + despensa[index].cantidad.toString())),
                  ),
                )
            ],
          ),
        );
      },
      itemCount: despensa.length,
    );
  }
}
