import 'dart:ui';

import 'package:flutter/material.dart';

class ListViewScrollWidget extends StatelessWidget {
  final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];
  ListViewScrollWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150.0,
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
              return SizedBox(
                width: 150,
                height: 150,
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
