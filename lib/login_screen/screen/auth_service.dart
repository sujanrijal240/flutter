// import 'dart:html';

import 'package:bpls/login_screen/screen/home_screen.dart';
import 'package:bpls/login_screen/screen/signin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';



class AuthService{
  //determine if the user is authenticated.
  handleAuthState(){
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
      if (snapshot.hasData){
        return HomeScreen();

      }
      else{
        return SignUpPage();
      }
    });
  }

  signInWithGoogle() async {
    final GoogleSignInAccount ? googleUser = await GoogleSignIn(scopes: <String>["email"]).signIn();


    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;


    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut(){
    FirebaseAuth.instance.signOut();
  }
}