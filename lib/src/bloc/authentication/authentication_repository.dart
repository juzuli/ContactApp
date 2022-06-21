import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  loginWithEmailPassword(String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  registerWithEmailPassword(String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    //TODO Update phone number
    return userCredential;
  }

  signInWithGoogle(){

  }
}
