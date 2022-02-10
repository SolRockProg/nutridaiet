import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutridaiet/controllers/recetas_controller.dart';

class ListViewScrollWidget extends StatelessWidget {
  final List<int> numbers = List<int>.generate(10, (i) => i + 1);
  ListViewScrollWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child: Consumer(
            builder: (context, ref, child) {
              final recetasListState = ref.watch(recetasState);
              return recetasListState.when(
                  data: (data) => _buildList(),
                  error: (err, _) => Text("Error: " + err.toString()),
                  loading: () => const CircularProgressIndicator());
            },
          ),
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
