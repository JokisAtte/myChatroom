import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Inputarea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: TextField()),
        const SizedBox(width: 8.0),
        FloatingActionButton(onPressed: () => {}, child: Text("sendaa se")),
      ],
    );
  }
}
