import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutridaiet/controllers/alimentos_controller.dart';
import 'package:nutridaiet/model/alimento.dart';

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
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Chip(
            padding: const EdgeInsets.all(16),
            label: Text(
              despensa[index].nombre,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            backgroundColor: Color(0xff007a79),
          ),
        );
      },
      itemCount: despensa.length,
    );
  }
}
