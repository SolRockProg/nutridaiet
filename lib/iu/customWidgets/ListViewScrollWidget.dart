import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutridaiet/controllers/recetas_controller.dart';

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
    ref.read(recetasState.notifier).getDespensa();
  }

  @override
  Widget build(BuildContext context) {
    final recetasListState = ref.watch(recetasState);
    return SizedBox(
        height: 200,
        width: double.infinity,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },
          ),
          child: recetasListState.when(
              data: (data) => _buildList(),
              error: (err, _) => Text("Error: " + err.toString()),
              loading: () => const Center(child: CircularProgressIndicator())),
        ));
  }

  ListView _buildList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemBuilder: (context, index) {
        return Container(
          width: 200,
          child: Card(
            color: Colors.blue,
            child: Center(
              child: Text(numbers[index].toString()),
            ),
          ),
        );
      },
      itemCount: numbers.length,
    );
  }
}
