import 'package:flutter/material.dart';
import 'package:prosignal/helper/helperfunctions.dart';
import 'package:prosignal/pages/channels/mychannel.dart';
import 'package:prosignal/service/databaseservice.dart';
import 'package:prosignal/widgets/buttons/button.dart';
import 'package:prosignal/widgets/inputs/textbox.dart';

class CreateChannel extends StatefulWidget {
  const CreateChannel({super.key});

  @override
  State<CreateChannel> createState() => _CreateChannelState();
}

class _CreateChannelState extends State<CreateChannel> {
  late String username;
  late String uid;
  TextEditingController channelnameController = TextEditingController();
  TextEditingController channeldescriptionController = TextEditingController();
  bool isloading = false;

  @override
  void initState() {
    super.initState();
    getUserdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create New Channel"),
      ),
      body: SingleChildScrollView(
        child: isloading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    TextBox(
                        controller: channelnameController,
                        text: "Channel Name",
                        textInputType: TextInputType.text,
                        obscure: false,
                        icon: Icons.abc),
                    const SizedBox(
                      height: 10,
                    ),
                    TextBox(
                        controller: channeldescriptionController,
                        text: "Channel Description",
                        textInputType: TextInputType.text,
                        obscure: false,
                        icon: Icons.abc),
                    const SizedBox(
                      height: 10,
                    ),
                    ButtonGlobal(
                      text: "Create Channel",
                      onTap: createChannel,
                    )
                  ],
                ),
              ),
      ),
    );
  }

  createChannel() {
    if (channelnameController.text.isNotEmpty &&
        channeldescriptionController.text.isNotEmpty) {
      DatabaseService()
          .createNewChannel(uid, username, channelnameController.text,
              channeldescriptionController.text)
          .then((value) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const MyChannel(haschannel: true);
        }));
      });
    }
  }

  getUserdata() async {
    await HelperFunctions.getUserId().then((value) {
      setState(() {
        uid = value!;
      });
    });
    await HelperFunctions.getUserName().then((value) {
      setState(() {
        username = value!;
      });
    });
  }
}
