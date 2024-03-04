import 'package:flutter/material.dart';

class ButtonOutline extends StatelessWidget {
  const ButtonOutline({Key? key, required this.text, this.onTap})
      : super(key: key);
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return (InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 40,
          padding: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
        )));
  }
}
