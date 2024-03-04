import 'package:flutter/material.dart';
import 'package:prosignal/pages/channels/createchannel.dart';

class MyChannel extends StatefulWidget {
  const MyChannel({super.key, required this.haschannel});
  final bool haschannel;

  @override
  State<MyChannel> createState() => _MyChannelState();
}

class _MyChannelState extends State<MyChannel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.haschannel
          ? const SingleChildScrollView(
              child: Center(child: Text("has a channel")),
            )
          : Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  const Text("You have not created a signals channel yet"),
                  TextButton(
                      onPressed: () => {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const CreateChannel();
                            })),
                          },
                      child: const Text("Create Channel"))
                ],
              ),
            ),
    );
  }
}
