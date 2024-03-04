import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prosignal/helper/helperfunctions.dart';
import 'package:prosignal/pages/auth/login.dart';
import 'package:prosignal/pages/channels/mychannel.dart';
import 'package:prosignal/pages/earnings/earnings.dart';
import 'package:prosignal/pages/vip/vip.dart';
import 'package:prosignal/service/databaseservice.dart';
import 'package:prosignal/widgets/listIems/allchannels.dart';
import 'package:prosignal/widgets/listIems/update.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const allchhannels = [
    {
      "channelname": "Prosignals",
      "channelid": "x123",
      "adminid": "2xy",
      "adminusername": "niccyril",
      "channelicon": "images/logo.png",
    },
    {
      "channelname": "FX Guru",
      "channelid": "x124",
      "adminid": "1xy",
      "adminusername": "Kax01",
      "channelicon": "images/logo.png",
    },
    {
      "channelname": "Volatility Plus",
      "adminid": "x123",
      "channelid": "x125",
      "adminusername": "santekax",
      "channelicon": "images/logo.png",
    },
    {
      "channelname": "Rusape traders",
      "channelid": "x126",
      "adminid": "x124",
      "adminusername": "sainta",
      "channelicon": "images/logo.png",
    },
    {
      "channelname": "ATG Traders",
      "adminid": "x125",
      "channelid": "x127",
      "adminusername": "sundayman",
      "channelicon": "images/logo.png",
    },
    {
      "channelname": "Gold Trades",
      "adminid": "x126",
      "channelid": "x128",
      "adminusername": "goldtrader",
      "channelicon": "images/logo.png",
    },
    {
      "channelname": "Zhou Forex Accademy",
      "adminid": "x127",
      "channelid": "x129",
      "adminusername": "fxabraham",
      "channelicon": "images/logo.png",
    },
  ];
  static const updateslist = [
    {
      "channelname": "Prosignals",
      "adminid": "x121",
      "caption": "Forex trading is an art",
      "views": 1000,
      "likes": 1000,
      "comments": 1000,
      "dateposted": "Today 13:45",
      "channelicon": "images/logo.png",
      "update": "images/update.jpg",
    },
    {
      "channelname": "FX Guru",
      "adminid": "x122",
      "caption": "",
      "views": 10000,
      "likes": 10000,
      "comments": 10000,
      "dateposted": "Yesterday 13:45",
      "channelicon": "images/logo.png",
      "update": "images/update.jpg",
    },
    {
      "channelname": "Volatility Plus",
      "adminid": "x123",
      "caption": "Boom :)",
      "views": 50,
      "likes": 13,
      "comments": 0,
      "dateposted": "25 Jun 2022",
      "channelicon": "images/logo.png",
      "update": "images/update.jpg",
    },
    {
      "channelname": "Rusape traders",
      "adminid": "x124",
      "caption": "",
      "views": 0,
      "likes": 0,
      "comments": 0,
      "dateposted": "13 Jan 2023",
      "channelicon": "images/logo.png",
      "update": "images/update.jpg",
    },
    {
      "channelname": "ATG Traders",
      "adminid": "x125",
      "caption": "matraders manyama",
      "views": 40,
      "likes": 31,
      "comments": 2,
      "dateposted": "Today 13:45",
      "channelicon": "images/logo.png",
      "update": "images/update.jpg",
    },
    {
      "channelname": "Gold Trades",
      "adminid": "x126",
      "caption":
          "Come join the big league. lets make money together, join my signals now to enjoy free signals",
      "views": 440,
      "likes": 73,
      "comments": 20,
      "dateposted": "31 dec 2024",
      "channelicon": "images/logo.png",
      "update": "images/update.jpg",
    },
    {
      "channelname": "Zhou Forex Accademy",
      "adminid": "x127",
      "caption": "",
      "views": 20,
      "likes": 0,
      "comments": 0,
      "dateposted": "Today 14:45",
      "channelicon": "images/logo.png",
      "update": "images/update.jpg",
    },
    {
      "channelname": "Deriv Masters",
      "adminid": "x128",
      "caption": "",
      "views": 90,
      "likes": 73,
      "comments": 0,
      "dateposted": "Today 09:45",
      "channelicon": "images/logo.png",
      "update": "images/update.jpg",
    },
    {
      "channelname": "Munya FX",
      "adminid": "x129",
      "caption": "",
      "views": 1000000,
      "likes": 38786,
      "comments": 908765,
      "dateposted": "Today 10:45",
      "channelicon": "images/logo.png",
      "update": "images/update.jpg",
    },
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String mychannelid;
  String username = "";
  String useremail = "";
  bool haschannel = false;
  List subscribedchannels = [];
  Stream? _allchannels;

  @override
  void initState() {
    super.initState();
    getUserData();
    getAllChannels();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("ProSignal"),
            bottom: const TabBar(
                indicatorColor: Colors.blueGrey,
                labelColor: Colors.blueGrey,
                tabs: [
                  Tab(
                    text: "Signals",
                  ),
                  Tab(
                    text: "Channels",
                  ),
                  Tab(
                    text: "Updates",
                  ),
                ]),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                    decoration: const BoxDecoration(color: Colors.blueGrey),
                    accountName: Text(username),
                    accountEmail: Text(useremail)),
                ListTile(
                  leading: const Icon(Icons.diamond),
                  title: const Text('ProSignal VIP'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Vip();
                    }));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.broadcast_on_home),
                  title: const Text('My Channel'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MyChannel(haschannel: haschannel);
                    }));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.account_balance_wallet_sharp),
                  title: const Text('Earnings'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Earnings();
                    }));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Log out'),
                  onTap: () async {
                    await FirebaseAuth.instance.signOut().then((value) async {
                      await HelperFunctions.setUserLoggedInStatus(false);
                      await HelperFunctions.setUserEmailSF("");
                      await HelperFunctions.setUsernameSF("");
                      await HelperFunctions.setUserIdSF("");

                      // ignore: use_build_context_synchronously
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const Login();
                      }));
                    });
                  },
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            subscribedChannels(""),
            allChannels(),
            Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
              body: updates(HomePage.updateslist),
            )
          ]),
        ));
  }

  void getUserData() async {
    await HelperFunctions.getUserEmail().then((value) {
      setState(() {
        useremail = value!;
      });
    });
    await HelperFunctions.getUserName().then((value) {
      setState(() {
        username = value!;
      });
    });
    //get the user data
    QuerySnapshot userdata = await DatabaseService().getUserdata(useremail);

    setState(() {
      haschannel = userdata.docs[0]["haschannel"] as bool;
      // subscribedchannels = userdata.docs[0][subscribedchannels];
    });
  }

  getAllChannels() async {
    await DatabaseService().getAllChannels().then((value) {
      setState(() {
        _allchannels = value;
      });
    });
  }

  allChannels() {
    return StreamBuilder(
        stream: _allchannels,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<DocumentSnapshot> channels = snapshot.data!.docs;
            return (ListView.builder(
                itemCount: channels.length,
                itemBuilder: (context, index) {
                  return (AllChannels(
                      channelname: channels[index]["channelname"],
                      adminusername: channels[index]["adminusername"],
                      channelicon: channels[index]["channelicon"],
                      channelid: channels[index]["adminid"]));
                }));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

subscribedChannels(channels) {
  return channels != null && channels.length > 0
      ? ListView.builder(
          itemCount: channels.length,
          itemBuilder: (context, index) {
            return const Text("channel");
          })
      : const Center(
          child: Text(
            "Go to the channels tab and follow channels to start receiving signals",
            textAlign: TextAlign.center,
          ),
        );
}

updates(updatelist) {
  return (ListView.builder(
      itemCount: updatelist.length,
      itemBuilder: (context, index) {
        return Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Update(
              channelname: updatelist[index]["channelname"],
              caption: updatelist[index]["caption"],
              likes: updatelist[index]["likes"],
              comments: updatelist[index]["comments"],
              views: updatelist[index]["views"],
              dateposted: updatelist[index]["dateposted"],
              channelicon: updatelist[index]["channelicon"],
              update: updatelist[index]["update"],
            ));
      }));
}
