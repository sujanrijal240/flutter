// import 'package:flutter/src/foundation/key.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

import '../auth_service.dart';
import '../signup_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      
      child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Text(
              //   FirebaseAuth.instance.currentUser!.displayName!,

              //   style:  TextStyle(
              // color: Colors.indigo[900], fontWeight: FontWeight.bold, fontSize: 16),
              // ),
              SizedBox(
                height: 15,
              ),
              Text(
                FirebaseAuth.instance.currentUser!.email!,
                // "k",
                style:  TextStyle(
              color: Colors.indigo[900], fontWeight: FontWeight.bold, fontSize: 16),
              ),
              ElevatedButton(
                child: Text("log Out"),
                onPressed: (){
                  print("Signed Out");
                  AuthService().signOut();
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
                  });

                },
              ),
            ],
          ),
    );
  }
}