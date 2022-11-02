import 'package:flutter/material.dart';


class MyCourse extends StatefulWidget {
  const MyCourse({key});

  @override
  State<MyCourse> createState() => _MyCourseState();
}

class _MyCourseState extends State<MyCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        "My Course"
      )),
    );
  }
}