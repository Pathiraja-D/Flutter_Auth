import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    return await auth.currentUser;
  }

  signInWithGoogle(BuildContext context) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAuthentication!.
    final AuthCredential results =await firebaseAuth.signInWithCredential(credential);


    UserCredential result = await firebaseAuth.signInWithCredential(credential);
    User? userDetils = result.user;

    if(result!=null){
      Map<String,dynamic>userInfoMap={
        "email":userDetils!.email,
      };
    }

  }
}
