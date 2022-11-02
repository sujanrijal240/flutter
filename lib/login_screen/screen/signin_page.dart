// import 'package:flutter/src/foundation/key.dart';

import 'package:bpls/login_screen/screen/auth_service.dart';
import 'package:bpls/login_screen/screen/signup_screen.dart';
import 'package:bpls/login_screen/utils/color_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

import '../resuable_widget/reusable.dart';
import 'home_screen.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'dart:collection' show ListMixin;
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();

  handleAuthState() {}
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _passwordTextController = TextEditingController();

  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("CB2B93"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.1, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget('assets/images/splash1.jpg'),
                SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter Username", Icons.person_outline, false,
                    _emailTextController),
                SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, true, () {
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text)
                  .then((value) {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                      }).onError((error, stackTrace) {
                      print("error ${error.toString()}");
                      });
                }),
                signUpOption(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 40,
                  width: 240,

                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                   children: [
                    Text(
                      "Sign up with google",
                      style: TextStyle(color: Colors.white70),
                    ),
                     ElevatedButton(
      onPressed: (() {
        
        AuthService().signInWithGoogle();
      }),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'G'  ,
        style:  TextStyle(
            color: Colors.indigo[900], fontWeight: FontWeight.bold, fontSize: 16),
            ),
            TextSpan(
              text: 'o'  ,
        style:  TextStyle(
            color: Color.fromARGB(255, 155, 11, 1), fontWeight: FontWeight.bold, fontSize: 16),
            ),
            TextSpan(
              text: 'o'  ,
        style:  TextStyle(
            color: Color.fromARGB(255, 168, 152, 4), fontWeight: FontWeight.bold, fontSize: 16),
            ),
            TextSpan(
              text: 'g'  ,
        style:  TextStyle(
            color: Colors.indigo[900], fontWeight: FontWeight.bold, fontSize: 16),
            ),
            TextSpan(
              text: 'l'  ,
        style:  TextStyle(
            color: Color.fromARGB(255, 2, 70, 4), fontWeight: FontWeight.bold, fontSize: 16),
            ),
            TextSpan(
              text: 'e'  ,
        style:  TextStyle(
            color: Color.fromARGB(255, 155, 11, 1), fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ]
        )
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.black26;
          }
          return Colors.white;
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    ),
                   ],
                 ),
                  ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have account? ",
          style: TextStyle(color: Colors.white70),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}


// class AuthService{
//   //determine if the user is authenticated.
//   handleAuthState(){
//     return StreamBuilder(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (BuildContext context, snapshot) {
//       if (snapshot.hasData){
//         return HomeScreen();

//       }
//       else{
//         return SignUpPage();
//       }
//     });
//   }

//   signInWithGoogle() async {
//     final GoogleSignInAccount ? googleUser = await GoogleSignIn(scopes: <String>["email"]).signIn();


//     final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;


//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );

//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   }

//   signOut(){
//     FirebaseAuth.instance.signOut();
//   }
// }