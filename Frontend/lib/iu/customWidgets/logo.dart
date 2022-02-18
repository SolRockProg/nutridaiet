import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(fontSize: 60, fontFamily: 'Arvo');
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/nu.png',
            width: 80,
            height: 80,
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 16)),
          Text(
            "Nutrid",
            style: style,
          ),
          const Text(
            "AI",
            style: TextStyle(
                fontSize: 60, fontFamily: 'Arvo', color: Color(0xFF007a79)),
          ),
          Text(
            "et",
            style: style,
          )
        ],
      ),
    );
  }
}
