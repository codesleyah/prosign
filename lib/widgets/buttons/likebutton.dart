import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          const Icon(Icons.favorite_outline),
          Text(count.toString()),
        ],
      ),
    );
  }
}
