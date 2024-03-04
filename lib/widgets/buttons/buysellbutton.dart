import 'package:flutter/material.dart';

class BuySellButton extends StatelessWidget {
  const BuySellButton(
      {Key? key, required this.text, this.onTap, required this.buy})
      : super(key: key);
  final String text;
  final VoidCallback? onTap;
  final bool buy;

  @override
  Widget build(BuildContext context) {
    return (InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 55,
          decoration: BoxDecoration(
              color: buy
                  ? const Color.fromARGB(255, 3, 18, 224)
                  : const Color.fromARGB(255, 201, 1, 1),
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 7)
              ]),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        )));
  }
}
