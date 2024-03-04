import 'package:flutter/material.dart';
import 'package:prosignal/pages/channels/channel.dart';

class SubscribedChannel extends StatelessWidget {
  const SubscribedChannel(
      {super.key,
      required this.lastsignal,
      required this.channelname,
      required this.channelicon,
      required this.channelid});

  final String lastsignal;
  final String channelname;
  final String channelicon;
  final String channelid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Channel(
              channelid: channelid,
            );
          }));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(channelicon),
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
                    channelname,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(lastsignal),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
