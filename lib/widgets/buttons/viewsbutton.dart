import 'package:flutter/material.dart';

class ViewsButton extends StatelessWidget {
  const ViewsButton({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          const Icon(Icons.remove_red_eye_outlined),
          Text(count.toString()),
        ],
      ),
    );
  }
}
