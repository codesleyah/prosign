import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference channelsCollection =
      FirebaseFirestore.instance.collection("channles");

  Future<bool> isUsernameTaken(String username) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .where('username', isEqualTo: username)
              .get();
      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  Future addUserToDatabase(String username, String email, String uid) async {
    return await usersCollection.doc(uid).set({
      "uid": uid,
      "username": username,
      "channelid": "",
      "email": email,
      "subscribedchannels": [],
      "earnings": 0.00,
      "viplevel": 1,
      "haschannel": false,
      "viplevelexpirydate": Timestamp.now()
    });
  }

  Future createNewChannel(String uid, String adminusername, String channelname,
      String channeldescription) async {
    return await channelsCollection.doc(uid).set({
      "adminid": uid,
      "adminusername": adminusername,
      "channelname": channelname,
      "followers": 0,
      "lastsignal": {},
      "channelicon": "",
      "channeldescription": channeldescription,
      "signals": []
    }).then((value) async {
      await usersCollection.doc(uid).update({
        "haschannel": true,
      });
    });
  }

  //get a specific user from the database
  Future getUserdata(String email) async {
    QuerySnapshot snapshot =
        await usersCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  Future getAllChannels() async {
    return channelsCollection.doc().snapshots();
  }
}
