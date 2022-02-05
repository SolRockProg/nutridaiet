import 'dart:ui';
import 'package:flutter/material.dart';

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
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
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
          ),
        ));
  }
}
