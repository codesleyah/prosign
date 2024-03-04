import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String username;
  final String email;
  final String channelid;
  final List<Map<Object, dynamic>> subscribedchannels;
  final double earnings;
  final int viplevel;
  final bool haschannel;
  final Timestamp viplevelexpirydate;

  User(
      {required this.uid,
      required this.username,
      required this.channelid,
      required this.email,
      required this.subscribedchannels,
      required this.earnings,
      required this.viplevel,
      required this.haschannel,
      required this.viplevelexpirydate});
}
