import 'dart:ui';
import 'package:flutter/material.dart';

class GridViewScrollWidget extends StatelessWidget {
  final List<int> numbers = List<int>.generate(10, (i) => i + 1);
  GridViewScrollWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            itemBuilder: (context, index) {
              return Card(
                color: Colors.blue,
                child: Center(
                  child: Text(numbers[index].toString()),
                ),
              );
            },
            itemCount: numbers.length,
          ),
        ));
  }
}
