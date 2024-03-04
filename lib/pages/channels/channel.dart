import 'package:flutter/material.dart';
import 'package:prosignal/pages/channels/channelinfo.dart';
import 'package:prosignal/widgets/buttons/button.dart';
import 'package:prosignal/widgets/buttons/buttonoutline.dart';
import 'package:prosignal/widgets/buttons/buysellbutton.dart';
import 'package:prosignal/widgets/dialogues/sendsignaldialog.dart';
import 'package:prosignal/widgets/inputs/textbox.dart';
import 'package:prosignal/widgets/listIems/signal.dart';

class Channel extends StatefulWidget {
  const Channel({super.key, required this.channelid});

  final String channelid;

  @override
  State<Channel> createState() => _ChannelState();
}

class _ChannelState extends State<Channel> {
  late String channelname;
  late List<Map<Object, dynamic>> _signals;
  late String adminid;
  late String channelid;
  String userid = "3xy";
  late bool isadmin;
  TextEditingController signalController = TextEditingController();
  TextEditingController tpController = TextEditingController();
  TextEditingController slController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchChannelData(widget.channelid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ChannelInfo(
                    channelid: channelid,
                  );
                }));
              },
              icon: const Icon(Icons.info))
        ],
        title: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ChannelInfo(
                  channelid: channelid,
                );
              }));
            },
            child: Text(channelname)),
      ),
      body: Column(
        children: [
          Expanded(child: signals(_signals)),
          adPostSignalbar(isadmin),
        ],
      ),
    );
  }

  void fetchChannelData(selectedchannelid) {
    var channels = [
      {
        "channelname": "Prosignals",
        "channelid": "x123",
        "adminid": "2xy",
        "lastsignal": "Buy boom500",
        "channelicon": "images/logo.png",
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
        "channelid": "x124",
        "adminid": "1xy",
        "lastsignal": "Sell V75 (1s)",
        "channelicon": "images/logo.png",
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
        "channelid": "x125",
        "lastsignal": "Buy XAUUSD",
        "adminid": "3xy",
        "channelicon": "images/logo.png",
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
        "channelid": "x126",
        "adminid": "4xy",
        "lastsignal": "Sell V100",
        "channelicon": "images/logo.png",
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
        "channelid": "x127",
        "adminid": "5xy",
        "lastsignal": "Buy boom1000",
        "channelicon": "images/logo.png",
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
      channelid = channel["channelid"].toString();
      channelname = channel["channelname"].toString();
      _signals = channel["signals"] as List<Map<Object, dynamic>>;
      isadmin = channel["adminid"].toString() == userid;
    });
  }

  adPostSignalbar(isadmin) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: isadmin
          ? Row(
              children: [
                Expanded(
                    child: ButtonOutline(
                  text: "Send Signal",
                  onTap: _showPostSignalDialog,
                )),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: ButtonOutline(
                  text: "Send Msg",
                  onTap: _showPostMessageDialog,
                )),
              ],
            )
          : const Center(
              child: Text("show add"),
            ),
    );
  }

  void sendSignal() {
    SendSignalDialogue.displaySignalDialog(context);
  }

  Future<void> _showPostMessageDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Send Notification'),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextBox(
                    controller: signalController,
                    text: "messeage",
                    textInputType: TextInputType.text,
                    obscure: false,
                    icon: Icons.money),
              ],
            ),
          ),
          actions: <Widget>[
            ButtonGlobal(
              text: "Post",
              onTap: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  Future<void> _showPostSignalDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Send Signal'),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextBox(
                    controller: signalController,
                    text: "Asset",
                    textInputType: TextInputType.text,
                    obscure: false,
                    icon: Icons.money),
                const SizedBox(
                  height: 10,
                ),
                TextBox(
                    controller: tpController,
                    text: "Take Profit",
                    textInputType: TextInputType.text,
                    obscure: false,
                    icon: Icons.money),
                const SizedBox(
                  height: 10,
                ),
                TextBox(
                    controller: slController,
                    text: "Stop Loss",
                    textInputType: TextInputType.text,
                    obscure: false,
                    icon: Icons.money),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              children: [
                Expanded(
                  child: BuySellButton(
                    text: "BUY",
                    buy: true,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: BuySellButton(
                    text: "SELL",
                    buy: false,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                )
              ],
            )
          ],
        );
      },
    );
  }
}

signals(signalist) {
  return (ListView.builder(
      itemCount: signalist.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.all(5),
            child: Signal(
              signal: signalist[index]["signal"],
              datetime: signalist[index]["time"],
              asset: signalist[index]["asset"],
              tp: signalist[index]["tp"],
              sl: signalist[index]["sl"],
            ));
      }));
}
