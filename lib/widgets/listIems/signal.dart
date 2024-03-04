import 'package:flutter/material.dart';

class Signal extends StatelessWidget {
  const Signal(
      {super.key,
      required this.asset,
      required this.tp,
      required this.sl,
      required this.signal,
      required this.datetime});

  final String asset;
  final String tp;
  final String sl;
  final String signal;
  final String datetime;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: signal == "sell" ? Colors.red : Colors.green,
              child: Icon(
                  signal == "sell" ? Icons.trending_down : Icons.trending_up),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    asset,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text("TP: $tp SL: $sl"),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: signal == "sell" ? Colors.red : Colors.green,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.only(
                      top: 2, bottom: 2, left: 10, right: 10),
                  child: Text(signal),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  datetime,
                  style: const TextStyle(fontSize: 9),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
