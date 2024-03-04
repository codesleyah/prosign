import 'package:flutter/material.dart';
import 'package:prosignal/pages/channels/channelinfo.dart';

class AllChannels extends StatelessWidget {
  const AllChannels(
      {super.key,
      required this.channelname,
      required this.adminusername,
      required this.channelicon,
      required this.channelid});
  final String channelname;
  final String adminusername;
  final String channelicon;
  final String channelid;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ChannelInfo(
            channelid: channelicon,
          );
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
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
                  Text(adminusername)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
