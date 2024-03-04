import 'package:flutter/material.dart';

class CommentButton extends StatelessWidget {
  const CommentButton({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          const Icon(Icons.chat_bubble_outline),
          Text(count.toString()),
        ],
      ),
    );
  }
}
