import 'package:flutter/material.dart';

class ChannelInfo extends StatefulWidget {
  const ChannelInfo({super.key, required this.channelid});
  final String channelid;

  @override
  State<ChannelInfo> createState() => _ChannelInfoState();
}

class _ChannelInfoState extends State<ChannelInfo> {
  late String channelname;
  late String adminusername;
  late String channeldescription;
  late List<Map<Object, dynamic>> _updates;
  late int followers;

  @override
  void initState() {
    super.initState();
    fetchChannelData(widget.channelid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
            ),
            padding: const EdgeInsets.all(20),
            height: 200.0,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  channelname,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "@$adminusername",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Channel Description",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  textAlign: TextAlign.start,
                ),
                Text(channeldescription)
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1),
                  ),
                  child: Center(
                    child: Text("$followers Followers"),
                  ),
                )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1),
                  ),
                  child: const Center(
                    child: Text("Follow"),
                  ),
                ))
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              child: const Text("Updates")),
          Expanded(
            child: showUpdates(_updates),
          )
        ],
      ),
    );
  }

  void fetchChannelData(selectedchannelid) {
    var channels = [
      {
        "channelname": "Prosignals",
        "adminusername": "Kax01",
        "channelid": "x123",
        "adminid": "2xy",
        "description": "Hoyoo!",
        "lastsignal": "Buy boom500",
        "channelicon": "images/logo.png",
        "followers": 45,
        "updates": [
          {
            "update": "images/update.jpg",
            "caption": "Hoyo",
            "time": "23 Jul 2024",
          },
          {
            "update": "images/update.jpg",
            "caption": "Hoyo",
            "time": "23 Jul 2024",
          },
          {
            "update": "images/update.jpg",
            "caption": "Hoyo",
            "time": "23 Jul 2024",
          },
        ],
        "signals": [
          {
            "signal": "buy",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom500"
          },
          {
            "signal": "sell",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom300"
          },
          {
            "signal": "buy",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom1000"
          },
          {
            "signal": "sell",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom500"
          },
        ]
      },
      {
        "channelname": "Volatility Plus",
        "adminusername": "Munyawacho",
        "description": "Hoyoo!",
        "channelid": "x124",
        "followers": 100,
        "adminid": "1xy",
        "lastsignal": "Sell V75 (1s)",
        "channelicon": "images/logo.png",
        "updates": [
          {
            "update": "images/update.jpg",
            "caption": "Hoyo",
            "time": "23 Jul 2024",
          },
          {
            "update": "images/update.jpg",
            "caption": "Hoyo",
            "time": "23 Jul 2024",
          },
        ],
        "signals": [
          {
            "signal": "buy",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom1000"
          },
          {
            "signal": "sell",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom500"
          },
          {
            "signal": "buy",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom500"
          },
          {
            "signal": "sell",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom300"
          },
          {
            "signal": "buy",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom1000"
          },
          {
            "signal": "sell",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom500"
          },
        ]
      },
      {
        "channelname": "ATG Traders",
        "adminusername": "Niccyril",
        "description": "Hoyoo!",
        "channelid": "x125",
        "followers": 100,
        "lastsignal": "Buy XAUUSD",
        "adminid": "3xy",
        "channelicon": "images/logo.png",
        "updates": [
          {
            "update": "images/update.jpg",
            "caption": "Hoyo",
            "time": "23 Jul 2024",
          },
          {
            "update": "images/update.jpg",
            "caption": "Hoyo",
            "time": "23 Jul 2024",
          },
          {
            "update": "images/update.jpg",
            "caption": "Hoyo",
            "time": "23 Jul 2024",
          },
        ],
        "signals": [
          {
            "signal": "buy",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom1000"
          },
          {
            "signal": "sell",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom500"
          },
          {
            "signal": "buy",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom1000"
          },
          {
            "signal": "sell",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom500"
          },
          {
            "signal": "buy",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom1000"
          },
          {
            "signal": "sell",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom500"
          },
          {
            "signal": "buy",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom1000"
          },
          {
            "signal": "sell",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom500"
          },
          {
            "signal": "buy",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom500"
          },
          {
            "signal": "sell",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom300"
          },
          {
            "signal": "buy",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom1000"
          },
          {
            "signal": "sell",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom500"
          },
        ]
      },
      {
        "channelname": "Zhou Forex Accademy",
        "adminusername": "MrFocused",
        "channelid": "x126",
        "description": "Hoyoo!",
        "adminid": "4xy",
        "lastsignal": "Sell V100",
        "followers": 600,
        "channelicon": "images/logo.png",
        "updates": [
          {
            "update": "images/update.jpg",
            "caption": "Hoyo",
            "time": "23 Jul 2024",
          },
          {
            "update": "images/update.jpg",
            "caption": "Hoyo",
            "time": "23 Jul 2024",
          },
          {
            "update": "images/update.jpg",
            "caption": "Hoyo",
            "time": "23 Jul 2024",
          },
        ],
        "signals": [
          {
            "signal": "buy",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom1000"
          },
          {
            "signal": "sell",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom500"
          },
          {
            "signal": "buy",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom1000"
          },
          {
            "signal": "sell",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom500"
          },
          {
            "signal": "buy",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom500"
          },
          {
            "signal": "sell",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom300"
          },
          {
            "signal": "buy",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom1000"
          },
          {
            "signal": "sell",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom500"
          },
        ]
      },
      {
        "channelname": "Munya FX",
        "adminusername": "Sante",
        "description": "Hoyoo!",
        "channelid": "x127",
        "followers": 140,
        "adminid": "5xy",
        "lastsignal": "Buy boom1000",
        "channelicon": "images/logo.png",
        "updates": [
          {
            "update": "images/update.jpg",
            "caption": "Hoyo",
            "time": "23 Jul 2024",
          },
          {
            "update": "images/update.jpg",
            "caption": "Hoyo",
            "time": "23 Jul 2024",
          },
          {
            "update": "images/update.jpg",
            "caption": "Hoyo",
            "time": "23 Jul 2024",
          },
        ],
        "signals": [
          {
            "signal": "buy",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom500"
          },
          {
            "signal": "sell",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom300"
          },
          {
            "signal": "buy",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom1000"
          },
          {
            "signal": "sell",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom500"
          },
          {
            "signal": "buy",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom1000"
          },
          {
            "signal": "sell",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom500"
          },
          {
            "signal": "buy",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom1000"
          },
          {
            "signal": "sell",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom500"
          },
          {
            "signal": "buy",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom1000"
          },
          {
            "signal": "sell",
            "time": "20:00",
            "tp": "87.908",
            "sl": "97.908",
            "asset": "Boom500"
          },
        ]
      },
    ];

    var channel = channels.firstWhere(
        (selectedchanel) => selectedchanel["channelid"] == selectedchannelid);

    setState(() {
      channelname = channel["channelname"].toString();
      adminusername = channel["adminusername"].toString();
      _updates = channel["updates"] as List<Map<Object, dynamic>>;
      channeldescription = channel["description"].toString();
      followers = channel["followers"] as int;
    });
  }

  showUpdates(updates) {
    return updates.length > 0
        ? GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              return Container(
                decoration: const BoxDecoration(color: Colors.grey),
                child: Image.asset("images/update.jpg"),
              );
            })
        : const Center(
            child: Text("No updates found"),
          );
  }
}
