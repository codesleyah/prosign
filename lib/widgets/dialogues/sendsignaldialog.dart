import 'package:flutter/material.dart';

class SendSignalDialogue {
  static displaySignalDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text("Send Signal"),
            actions: <Widget>[Text("close")],
          );
        });
  }
}
