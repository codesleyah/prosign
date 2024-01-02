import 'package:flutter/material.dart';
import 'package:prosignal/pages/channels/channelinfo.dart';
import 'package:prosignal/widgets/listIems/signal.dart';

class Channel extends StatelessWidget {
  const Channel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ChannelInfo();
                }));
              },
              icon: const Icon(Icons.info))
        ],
        title: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ChannelInfo();
              }));
            },
            child: const Text("ProSignal")),
      ),
      body: signals(),
    );
  }
}

signals() {
  return (ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return const Padding(padding: EdgeInsets.all(5), child: Signal());
      }));
}
