import 'package:flutter/material.dart';
import 'package:prosignal/widgets/buttons/buttonoutline.dart';
import 'package:prosignal/widgets/buttons/commentbutton.dart';
import 'package:prosignal/widgets/buttons/likebutton.dart';
import 'package:prosignal/widgets/buttons/viewsbutton.dart';

class Update extends StatelessWidget {
  const Update(
      {super.key,
      required this.caption,
      required this.channelname,
      required this.views,
      required this.likes,
      required this.comments,
      required this.dateposted,
      required this.channelicon,
      required this.update});

  final String caption;
  final String channelname;
  final int views;
  final int likes;
  final int comments;
  final String dateposted;
  final String channelicon;
  final String update;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 20, top: 5, bottom: 5, right: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Image.asset(channelicon),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        channelname,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      Text(
                        dateposted,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.share)
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 300,
            child: Image.asset(
              update,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Text(caption),
                Row(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        ViewsButton(count: views),
                        const SizedBox(
                          width: 5,
                        ),
                        LikeButton(count: likes),
                        const SizedBox(
                          width: 5,
                        ),
                        CommentButton(count: comments),
                      ],
                    )),
                    const ButtonOutline(text: "Follow"),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
