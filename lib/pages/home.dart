import 'package:flutter/material.dart';
import 'package:prosignal/pages/auth/login.dart';
import 'package:prosignal/pages/channels/channelinfo.dart';
import 'package:prosignal/pages/earnings/earnings.dart';
import 'package:prosignal/pages/vip/vip.dart';
import 'package:prosignal/widgets/listIems/allchannels.dart';
import 'package:prosignal/widgets/listIems/subscribedchannel.dart';
import 'package:prosignal/widgets/listIems/update.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                const UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.blueGrey),
                    accountName: Text("Elvin Kakomo"),
                    accountEmail: Text("elvinkako17@gmail.com")),
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
                      return const ChannelInfo();
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
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Login();
                    }));
                  },
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            subscribedChannels(),
            allChannels(),
            updates(),
          ]),
        ));
  }
}

subscribedChannels() {
  return (ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return const SubscribedChannel();
      }));
}

updates() {
  return (ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return const Update();
      }));
}

allChannels() {
  return (ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return const AllChannels();
      }));
}
