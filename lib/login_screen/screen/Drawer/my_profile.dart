import 'package:flutter/material.dart';


class Myprofile extends StatefulWidget {
  const Myprofile({key});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        "My Profile"
      )),
    );
  }
}