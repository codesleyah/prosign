import 'package:firebase_auth/firebase_auth.dart';
import 'package:prosignal/service/databaseservice.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future createNewUser(
      String username, String useremail, String password) async {
    bool isusernametaken = await DatabaseService().isUsernameTaken(username);
    if (!isusernametaken) {
      try {
        User user = (await firebaseAuth.createUserWithEmailAndPassword(
                email: useremail, password: password))
            .user!;
        await DatabaseService()
            .addUserToDatabase(username, useremail, user.uid);

        return true;
      } on FirebaseAuthException catch (e) {
        return (e.message);
      }
    }
  }

  Future loginUser(String useremail, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: useremail, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
